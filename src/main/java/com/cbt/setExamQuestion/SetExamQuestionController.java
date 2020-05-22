package com.cbt.setExamQuestion;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.cbt.exam.ExamService;
import com.cbt.exam.ExamVO;
import com.cbt.manager.ManagerService;
import com.cbt.question.QuestionService;
import com.cbt.question.QuestionVO;

//  7/2 출제 컨트롤러 생성     -재용
@Controller
public class SetExamQuestionController {

	@Autowired
	SetExamQuestionService setExamQuestionService;
	@Autowired
	ExamService examService;
	@Autowired
	ManagerService managerService;
	@Autowired
	QuestionService questionService;
	
	@ModelAttribute("conditionMap")
	public Map<String, String> conditionMap() {
		Map<String, String> map = new HashMap<String, String>();
		map.put("examId", "examId");
		map.put("questionId", "questionId");
		map.put("setExamQuestionId", "setExamQuestionId");
		map.put("point", "point");
		return map;
	}

	//등록폼
	@RequestMapping(value = "insertSetExamQuestion.do", method = RequestMethod.GET)
	public String insertSetExamQuestionForm() {
		return "candidate/SetExamQuestionInsert";
	} 
	// 등록처리
	@RequestMapping(value = "insertSetExamQuestion.do", method = RequestMethod.POST)
	public String insertSetExamQuestion(SetExamQuestionVO vo) {
		setExamQuestionService.insertSetExamQuestion(vo);
		return "redirect:SetExamQuestionList.do";
	}
	@RequestMapping("/SetExamQuestionList.do")
	public ModelAndView SetExamQuestionList(ModelAndView mv) {
		SetExamQuestionVO vo = new SetExamQuestionVO();
		
		mv.addObject("result", setExamQuestionService.SetExamQuestionList(vo));
		mv.setViewName("candidate/SetExamQuestionList");
		return mv;
	}
	
	
	
	// 2019.07.16 성재민
	// 출제 하기 버튼을 누르면 연결
	// 이전에 출제된 문제를 삭제후 다시 출제
	@RequestMapping("/setQuestionList.do/{examId}")
	public String setQuestionList(@PathVariable("examId") int examId, SetExamQuestionVO vo, Model model) {
		

		SetExamQuestionVO deleteVO = new SetExamQuestionVO();
		deleteVO.setExamId(examId);
		setExamQuestionService.deleteSetExamQuestionForExamId(deleteVO);
		ExamVO examVo = new ExamVO();
		examVo.setExamId(examId);
		examVo = examService.getExam(examVo);
		List<Map<String, String>> tempMapList = setExamQuestionService.getQuestionList(examVo);
		List<SetExamQuestionVO> setExamvoList 	= new ArrayList<SetExamQuestionVO>();
		List<QuestionVO> 		questionVOList 	= new ArrayList<QuestionVO>();
		
		for (Map<String, String> item : tempMapList) {
			SetExamQuestionVO setExamvo = new SetExamQuestionVO();
			setExamvo.setExamId(Integer.parseInt(String.valueOf(item.get("examId"))));
			setExamvo.setQuestionId(Integer.parseInt(String.valueOf(item.get("questionId"))));
			
			// 2019.07.16 성재민
			// 총합이 늘 100 점이 될수 있게 로직을 조정 해야 함
			// 배점 정하는 로직 수정 필요
			setExamvo.setPoint(100 / tempMapList.size());
			
			QuestionVO questionVo = new QuestionVO();
			questionVo.setQuestionId(setExamvo.getQuestionId());
			questionVo = questionService.getQuestion(questionVo);
			
			setExamQuestionService.insertSetExamQuestion(setExamvo);
			setExamvoList.add(setExamvo);
			questionVOList.add(questionVo);
		}
		
		// 2019.07.11 성재민
		// 출제 상태 출제 중으로 변경 출제 중으로
		// 출제된 문제 기업회원에게 컨펌 후 다시 출제 하거나 출제를 확정한다.
		
		
//		examVo.setSetExamStatus("I2");
//		examService.updateExam(examVo);
//		
		model.addAttribute("questionVOList", questionVOList);
		model.addAttribute("examId", setExamvoList.get(0).getExamId());
		
		//QuestionVO vo = new QuestionVO();
		
		
		// 2019.07.11 성재민
		// 출제된 문제 볼수 있는 화면으로 연결이 되어야 함.
		return "redirect:/getQuestionList.do/"+examId +"/";
	}
	
	@RequestMapping("/getQuestionList.do/{examId}")
	public String getQuestionSetList(@PathVariable("examId") int examId, Model model) {
		ExamVO examVO = new ExamVO();
		examVO.setExamId(examId);
		model.addAttribute("selectedExam", managerService.getManagerExam(examVO));
		model.addAttribute("result" ,questionService.getQuestionSetList(examId));
		return "manager/manager/managerExamQuestionList";
	}
	
}
