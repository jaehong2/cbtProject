package com.cbt.condition;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;



@Controller
public class ConditionController {
	
	@Autowired
	ConditionService conditionService;
	
	//등록폼
	@RequestMapping(value="insertCondition.do", method=RequestMethod.GET)
	public String insertConditionForm() {
		return "manager/condition/insertCondition";
	}
	
	//등록처리
	@RequestMapping(value="insertCondition.do", method=RequestMethod.POST)
	public String insertCondition(ConditionVO vo) {
		conditionService.insertCondition(vo);
		return "redirect:getConditionList.do";
		
	}
	
	//전체조회
	@RequestMapping(value="getConditionList.do", method=RequestMethod.GET)
	public String getConditionList(Model model) {
		List<ConditionVO> conditionList = conditionService.getAllConditionList();
		model.addAttribute("result", conditionList);
		return "manager/condition/getConditionList";
	}
	
	//수정폼
	@RequestMapping("/updateCondition/{conditionSeq}")
	public String updateConditionForm(  @PathVariable("conditionSeq") int conditionSeq, 
										ConditionVO vo, 
										Model model) {
		vo.setConditionSeq(conditionSeq);
		model.addAttribute("condition", conditionService.getCondition(vo));
		return "manager/condition/updateCondition";
	}
	
	//수정처리
	@RequestMapping("updateCondition.do")
	public String updateCondition(@ModelAttribute("condition") ConditionVO vo) {
		System.out.println("================\n" + vo);
		conditionService.updateCondition(vo);
		return "redirect:getConditionList.do";
	}
	
	//삭제처리
	@RequestMapping("deleteCondition.do")
	public String deleteCondition(ConditionVO vo) {
		conditionService.deleteCondition(vo);
		return "redirect:getConditionList.do";
	}
	
}
