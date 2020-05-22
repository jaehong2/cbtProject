package com.cbt.exam;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.cbt.common.CustomerUser;
import com.cbt.common.Paging;
import com.cbt.company.CompanyVO;

@Controller
public class ExamController {
	@Autowired
	ExamService examService;
	
	// 2019.07.11 성재민
	// 시험 검색시 해당 기업의 시험만 검색 되도록 변경
	// 해당 기업의 시험만 검색 할수 있도록 로그인 된 기업의 정보를 메소드의 전달인자로 사용
	// security 적용에 따른 변경(7/29)
	@RequestMapping(value = "companyExamList.do", method = RequestMethod.GET)
	public ModelAndView companyExamList(CompanyVO vo, Paging paging, ModelAndView mv,
			Authentication authentication) {
		CustomerUser user = (CustomerUser)authentication.getPrincipal();
		vo.setCompanyId(user.getUsername());
		mv.addObject("result", examService.getExamList(vo, paging));
		mv.setViewName("company/company/companyExamList");
		return mv;
	}
	
	@RequestMapping(value = "getCompanyExamList.do/{companyId}", method = RequestMethod.POST)
	public List<ExamVO> companyExamList(@PathVariable("companyId") String companyId) {
		CompanyVO vo = new CompanyVO();
		vo.setCompanyId(companyId);
		return examService.getExamList(vo);
	}
	/*
	 * public String companyExamList(Model model, HttpSession session) { CompanyVO
	 * vo = (CompanyVO) session.getAttribute("company"); // 2019.07.11 성재민 // 로그인 되지
	 * 않았을 경우 로그인 화면으로 전달 if(vo == null) { model.addAttribute("loginFail", true);
	 * return "company/company/companyLogin"; }
	 * model.addAttribute("companyExamList", examService.getExamList(vo)); return
	 * "company/company/companyExamList"; }
	 */
	
	@RequestMapping(value = "companyExamListDetail.do/{examId}", method = RequestMethod.GET)
	public String companyExamListDetail(@PathVariable("examId") int examId, Model model) {
		ExamVO vo = new ExamVO();
		vo.setExamId(examId);
		model.addAttribute("selectedExam", examService.getExam(vo));
		model.addAttribute("selectedExamTaker", examService.getExamTaker(vo));
		
		return "company/company/companyExamListDetail";
	}
	
	@RequestMapping(value = "companyExamListDetailGraph.do/{examId}", method = RequestMethod.GET)
	public String companyExamListDetailGraph(@PathVariable("examId") int examId, Model model) {
		model.addAttribute("examId", examId);
		return "company/company/companyExamListDetailGraph";
	}
}
