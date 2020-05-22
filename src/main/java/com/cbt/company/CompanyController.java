package com.cbt.company;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.cbt.candidate.CandidateVO;
import com.cbt.common.CustomerUser;
import com.cbt.condition.ConditionService;
import com.cbt.exam.ExamService;
import com.cbt.exam.ExamVO;

// 2019.06.27 성재민
// 컴퍼니 메인 컨트롤러 연결
@Controller
public class CompanyController {
	@Autowired
	CompanyService companyService;

	// 2019.07.31 성재민
	// 기업 회원 가입시 회사분류와 세부업종 값을 받아오기 위해 ConditionService 사용
	@Autowired
	ConditionService conditionService;

	// 2019.07.31 성재민
	// 기업에서 차트를 그리기 위해 시험 정보를 가져오기 위해 사용
	@Autowired
	ExamService examService;

	@RequestMapping(value = "companyMain.do", method = RequestMethod.GET)
	public String companyMain() {
		return "company/company/companyMain";
	}

	@RequestMapping(value = "companySignUp.do", method = RequestMethod.GET)
	public String companySignUpForm(Model model) {
		model.addAttribute("companyClassificationList", conditionService.getConditionDetailList("E")); // E-회사분류
		model.addAttribute("companySectorsList", conditionService.getConditionDetailList("F")); // F-세부업종
		return "company/company/companySignUp";
	}

	// 2019.07.31 성재민
	// 가입 후 가입 완료 메시지를 위한 기능 추가
	@RequestMapping(value = "companySignUp.do", method = RequestMethod.POST)
	public String companySignUp(CompanyVO vo) {

		try {
			companyService.insertCompany(vo);

		} catch (Exception e) {
			// TODO: handle exception
		}
		
		return "redirect:candidateLogin.do";
	}

	@RequestMapping(value = "companyUpdate.do", method = RequestMethod.GET)
	public String companyUpdateForm(Model model, Authentication authentication) {
		CustomerUser user = (CustomerUser) authentication.getPrincipal();
		CompanyVO vo = new CompanyVO();
		vo.setCompanyId(user.getUsername());
		vo = companyService.getCompany(vo);
		vo = companyService.loginCompany(vo);
		vo.setCompanyPassword(vo.getCompanyPassword());
		model.addAttribute("company", vo);
		model.addAttribute("companyClassificationList", conditionService.getConditionDetailList("E")); // E-회사분류
		model.addAttribute("companySectorsList", conditionService.getConditionDetailList("F")); // F-세부업종
		
		return "company/company/companyUpdate";
	}

	@RequestMapping(value = "companyUpdate.do", method = RequestMethod.POST)
	public String companyUpdate(CompanyVO vo) {
		companyService.updateCompany(vo);
		return "company/company/companyMain";
	}

	// 2019.08.02 성재민
	// companyLoginForm() 수정
	/*
	 * @RequestMapping(value = "companyLogin.do", method = RequestMethod.GET) public
	 * String companyLoginForm() { return "candidate/candidate/candidateLogin"; }
	 */

	/*
	 * @RequestMapping(value = "companyLogin.do", method = RequestMethod.GET) public
	 * String companyLoginForm(Model model, HttpSession session) { String joinResult
	 * = (String) session.getAttribute("joinResult"); if(joinResult != null &&
	 * joinResult != "") { model.addAttribute("joinResult", joinResult);
	 * session.removeAttribute("joinResult"); }
	 * 
	 * return "candidate/candidate/candidateLogin"; }
	 * 
	 * @RequestMapping(value = "companyLogin.do", method = RequestMethod.POST)
	 * public String companyLogin(CompanyVO vo, HttpSession session, Model model) {
	 * String targetPage = "company/company/companyLogin"; CompanyVO loginCompany =
	 * companyService.loginCompany(vo);
	 * 
	 * if (loginCompany != null) { //session.setAttribute("company", loginCompany);
	 * targetPage = "redirect:candidateMain.do"; } else { // 2019.07.10 성재민 // 로그인
	 * 실패시 로그인 실패 메시지를 띄우기 위해 값 설정 model.addAttribute("loginFail", true); }
	 * 
	 * return targetPage; }
	 */

	// 로그아웃 폼
	@RequestMapping(value = "companyLogout.do", method = RequestMethod.GET)
	public String companyLogout(HttpSession session) {
		session.invalidate();
		return "redirect:companyMain.do";
	}

	@RequestMapping(value = "companyAccount.do", method = RequestMethod.GET)
	public String companyAccount(Model model, Authentication authentication) {
		CustomerUser user = (CustomerUser) authentication.getPrincipal();
		CompanyVO vo = new CompanyVO();
		vo.setCompanyId(user.getUsername());
		vo = companyService.getCompany(vo);
		vo = companyService.loginCompany(vo);
		vo.setCompanyPassword(vo.getCompanyPassword());
		model.addAttribute("company", vo);
		model.addAttribute("companyClassificationList", conditionService.getConditionDetailList("E")); // E-회사분류
		model.addAttribute("companySectorsList", conditionService.getConditionDetailList("F")); // F-세부업종
		
		
		return "company/company/companyAccount";
	}

	@RequestMapping(value = "companyDelete.do", method = RequestMethod.GET)
	public String companyDelete(HttpSession session, Authentication authentication) {
		// CompanyVO vo = (CompanyVO) session.getAttribute("company");
		CustomerUser user = (CustomerUser) authentication.getPrincipal();
		CompanyVO vo = new CompanyVO();
		vo.setCompanyId(user.getUsername());

		companyService.deleteCompany(vo);
		session.invalidate();

		return "redirect:candidateMain.do";
	}

	// 관리자 컴퍼니 정보 수정처리
	@RequestMapping("updateManagerAccount.do")
	public String updateManagerAccount(@ModelAttribute("company") CompanyVO vo) {
		companyService.updateCompany(vo);
		return "redirect:managerAccountList.do";
	}

	@RequestMapping(value = "companyIntroduce.do", method = RequestMethod.GET)
	public String companyIntroduce() {
		return "company/company/companyIntroduce";
	}

	@RequestMapping(value = "companySystemintro.do", method = RequestMethod.GET)
	public String companySystemintro() {
		return "company/company/companySystemintro";
	}

	// 2019.07.31 성재민
	// 차트를 그리기 위한 정보 추가
	@RequestMapping(value = "companyChart.do", method = RequestMethod.GET)
	public String companyChart(Authentication authentication, Model model) {
		// 2019.07.31 성재민
		// 차트를 위한 시험 정보를 가져옴
		CustomerUser user = (CustomerUser) authentication.getPrincipal();
		CompanyVO vo = new CompanyVO();
		vo.setCompanyId(user.getUsername());
		model.addAttribute("examList", examService.getCompleteExamList(vo));
		return "company/company/companyChart";
	}

	// 2019.07.31 성재민
	// 사업자 번호 중복 체크
	@ResponseBody
	@RequestMapping(value = "businessNumCheck.do/{businessNum}", method = RequestMethod.POST)
	public Map<String, Boolean> idcheck(@PathVariable("businessNum") String businessNum, Model model) {
		Map<String, Boolean> map = new HashMap<String, Boolean>();
		CompanyVO vo = new CompanyVO();
		vo.setBusinessNumber(businessNum);
		int n = companyService.getBusinessNumCount(vo);
		if (n == 0) {
			map.put("result", true);
		} else {
			map.put("result", false);
		}

		return map;
	}
}
