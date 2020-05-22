package com.cbt.manager;


import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.activation.DataSource;
import javax.activation.FileDataSource;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeUtility;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.cbt.Inquiry.InquiryService;
import com.cbt.candidate.CandidateService;
import com.cbt.candidate.CandidateVO;
import com.cbt.common.Paging;
import com.cbt.company.CompanyService;
import com.cbt.company.CompanyVO;
import com.cbt.condition.ConditionService;
import com.cbt.consulting.ConsultingService;
import com.cbt.consulting.ConsultingVO;
import com.cbt.estimate.EstimateService;
import com.cbt.estimate.EstimateVO;
import com.cbt.exam.ExamService;
import com.cbt.exam.ExamVO;

@Controller
public class ManagerController {
	@Autowired
	ManagerService managerService;
	@Autowired
	CompanyService companyService;
	@Autowired
	CandidateService candidateService;
	@Autowired
	ConditionService conditionService;
	@Autowired
	ConsultingService consultingService;
	@Autowired
	EstimateService estimateService;
	@Autowired
	ExamService examService;
	// 2019.07.20 성재민
	// 문의 처리를 위해 추가
	@Autowired
	InquiryService inquiryService;
	@Autowired 
	private JavaMailSenderImpl mailSender;
	

	// 메인
	@RequestMapping(value = "/managerMain.do", method = RequestMethod.GET)
	public String managerMain(Model model, CandidateVO candidateVO 
										   , CompanyVO companyVO
										   , ConsultingVO consultingVO
										   , ExamVO examVO
										   , HttpSession session) {
		
		candidateVO.setStart(1);
		candidateVO.setEnd(3);
		
		companyVO.setStart(1);
		companyVO.setEnd(3);
		
		consultingVO.setStart(1); 
		consultingVO.setEnd(3);
		
		examVO.setStart(1); 
		examVO.setEnd(3);
		
		model.addAttribute("takerTop3", candidateService.getCandidateList(candidateVO));
		model.addAttribute("candidate", candidateService.getCandidateList(candidateVO));
		
		model.addAttribute("companyTop3", companyService.getCompanyList(companyVO));
		model.addAttribute("company", companyService.getCompanyList(companyVO));
		
		model.addAttribute("consultingTop3", consultingService.mainConsultingList(consultingVO));
		model.addAttribute("consulting", consultingService.mainConsultingList(consultingVO));
		
		model.addAttribute("examTop3", examService.mainExamList(examVO));
		model.addAttribute("exam", examService.mainExamList(examVO));
		
		/*
		 * model.addAttribute("examTop3", examService.getExamList(examVO));
		 * model.addAttribute("exam", examService.getExamList(examVO));
		 */
		
		// 2019.07.20 성재민
		// 로그인시 답변이 안된 문의 의 갯수를 받아온다.
		int count = inquiryService.getBeforeReplyCount();
		if(count > 0) {
			session.setAttribute("beforeReplyCount", count);
		}
		
		return "manager/manager/managerMain";
	}

	// 등록폼
	@RequestMapping(value = "managerInsertManager.do", method = RequestMethod.GET)
	public String insertManagerForm() {
		return "manager/manager/managerInsertManager";
	}

	// 등록처리
	@RequestMapping(value = "managerInsertManager.do", method = RequestMethod.POST)
	public String insertManager(ManagerVO vo) {
		managerService.insertManager(vo);
		return "redirect:managerGetManagerList.do";
	}

	// 전체조회
	@RequestMapping("/managerGetManagerList.do")
	public ModelAndView getManagerList(ModelAndView mv, Paging paging,
			@RequestParam(value = "searchManager", required = false) String searchManager) {

		ManagerVO vo = new ManagerVO();
		vo.setSearchManager(searchManager);
		mv.addObject("result", managerService.getManagerList(vo, paging));
		mv.setViewName("manager/manager/managerGetManagerList");
		return mv;
	}

	// 수정폼
	@RequestMapping("/managerUpdateManager/{managerId}")
	public String updateManagerForm(@PathVariable("managerId") String managerId, ManagerVO vo, Model model) {
		vo.setManagerId(managerId);
		model.addAttribute("manager", managerService.getManager(vo));
		return "manager/manager/managerUpdateManager";
	}

	// 수정처리
	@RequestMapping("managerUpdateManager.do")
	public String updateManager(@ModelAttribute("manager") ManagerVO vo) {
		System.out.println("===========\n" + vo);
		managerService.updateManager(vo);
		return "redirect:managerGetManagerList.do";
	}

	// 삭제처리
	@RequestMapping("deleteManager.do")
	public String deleteManager(ManagerVO vo) {
		managerService.deleteManager(vo);
		return "redirect:managerGetManagerList.do";
	}

	// 7/5 재용추가
	@RequestMapping("managerUserAccountView.do")
	public ModelAndView managerUserAccountView() {
		ManagerTakerVO vo = new ManagerTakerVO();
		vo.setTakerId("sime00");

		ModelAndView mv = new ModelAndView();

		mv.addObject("getManagerUserAccountView", managerService.getManagerUserAccountView(vo));
		mv.setViewName("manager/managerUserAccountView");

		return mv;
	}

	// 7/5 재용추가

	// 7/5 재용추가
	@RequestMapping("managerRequestListDetail.do")
	public String managerRequestListDetail() {

		return "manager/manager/managerRequestListDetail";
	}
	// 기업계정 or 응시자계정 관리 선택지
	@RequestMapping("managerAccountControl.do")
	public String managerAccountControl() {

		return "manager/manager/managerAccountControl";
	}
	// 매니저, 기업 상담 리스트 출력
	@RequestMapping(value = "managerConsultingList.do", method = RequestMethod.GET)
	public ModelAndView managerConsultingList(Paging paging, ModelAndView mv, ConsultingVO vo) {
		mv.addObject("result", consultingService.managerConsultingList(vo, paging));
		mv.setViewName("manager/manager/managerConsultingList");
		return mv;
	}

	// 매니저 기업 리스트 출력
	@RequestMapping(value = "managerAccountList.do", method = RequestMethod.GET)
	public ModelAndView managerAccountList(Paging paging, ModelAndView mv, CompanyVO vo) {
		mv.addObject("result", companyService.managerAccountList(vo, paging));
		mv.setViewName("manager/manager/managerAccountList");
		return mv;
	}

	// 관리자 컴퍼니 상세조회, 수정폼
	@RequestMapping(value = "managerAccountManage.do/{companyId}", method = RequestMethod.GET)
	public String managerAccountManage(@PathVariable String companyId, Model model, CompanyVO vo) {
		vo.setCompanyId(companyId);
		model.addAttribute("result", companyService.getCompany(vo));
		model.addAttribute("E", conditionService.getConditionDetailList("E"));
		model.addAttribute("F", conditionService.getConditionDetailList("F"));
		return "manager/manager/managerAccountManage";
	}

	// 관리자 컴퍼니 정보 수정처리
	@RequestMapping(value = "managerAccountManage.do", method = RequestMethod.POST)
	public String ManagerAccountManage(@ModelAttribute("company") CompanyVO vo) {
		companyService.updateCompany(vo);
		return "redirect:managerAccountList.do";
	}
	
	// 관리자 상담 상세조회, 수정폼
	@RequestMapping(value = "managerConsultingListDetail.do/{consultingId}", method = RequestMethod.GET)
	public String managerConsultingListDetail(@PathVariable int consultingId, Model model, ConsultingVO vo) {
		vo.setConsultingId(consultingId);
		model.addAttribute("result", consultingService.getManagerConsulting(vo));
		model.addAttribute("C", conditionService.getConditionDetailList("C"));
		return "manager/manager/managerConsultingListDetail";
	}

	// 관리자 상담 정보 수정처리
	@RequestMapping(value = "managerConsultingListDetail.do", method = RequestMethod.POST)
	public String managerConsultingListDetail(@ModelAttribute("consulting") ConsultingVO vo) {
		System.out.println(vo);
		consultingService.managerUpdateConsulting(vo);
		return "redirect:managerConsultingList.do";
	}

	// 매니저가 회사 추가폼
	@RequestMapping(value = "managerAccountInsert.do", method = RequestMethod.GET)
	public String managerAccountInsertForm(CompanyVO vo, Model model) {
		model.addAttribute("E", conditionService.getConditionDetailList("E"));
		model.addAttribute("F", conditionService.getConditionDetailList("F"));
		return "manager/manager/managerAccountInsert";
	}

	// 매니저가 회사 추가
	@RequestMapping(value = "managerAccountInsert.do", method = RequestMethod.POST)
	public String managerAccountInsert(CompanyVO vo) {
		companyService.insertCompany(vo);
		return "redirect:managerAccountList.do";
	}
	
	// 매니저가 상담추가 폼
	@RequestMapping(value = "managerConsultingInsert.do", method = RequestMethod.GET)
	public String managerConsultingInsertForm(ConsultingVO vo, Model model) {
		model.addAttribute("C", conditionService.getConditionDetailList("C"));
		return "manager/manager/managerConsultingInsert";
	}

	// 매니저가 상담 추가
	@RequestMapping(value = "managerConsultingInsert.do", method = RequestMethod.POST)
	public String managerConsultingInsert(ConsultingVO vo) {
		consultingService.managerConsultingInsert(vo);
		return "redirect:managerConsultingList.do";
	}

	// 매니저가 회사 삭제처리
	@RequestMapping("managerAccountDelete.do")
	public String managerAccountDelete(CompanyVO vo) {
		companyService.deleteCompany(vo);
		return "redirect:managerAccountList.do";
	}

	// 관리자 유저 리스트 출력
	// 2019.07.23 성재민
	// 응시자 정보를 받아올때 
	// 비공개 시험 정보도 같이 받아옴.
	@RequestMapping(value = "managerUserAccountList.do", method = RequestMethod.GET)
	public ModelAndView managerUserAccountList(Paging paging, ModelAndView mv, CandidateVO vo) {
		mv.addObject("result", candidateService.managerCandidateList(vo, paging));
		// 2019.07.23 성재민
		// 비공개 시험 정보 가져와서 처리.
		mv.addObject("privateExamList", managerService.getManagerAllPrivateExamList());
		mv.setViewName("manager/manager/managerUserAccountList");
		return mv;
	}
	

	// 관리자 응시자 상세조회, 수정폼
	@RequestMapping(value = "managerUserAccountEdit.do/{takerId}", method = RequestMethod.GET)
	public String managerUserAccountEdit(@PathVariable String takerId, Model model, CandidateVO vo) {
		vo.setTakerId(takerId);
		model.addAttribute("result", candidateService.getCandidate(vo));
		model.addAttribute("J", conditionService.getConditionDetailList("J"));
		return "manager/manager/managerUserAccountEdit";
	}

	// 관리자 응시자 정보 수정처리
	@RequestMapping(value = "managerUserAccountEdit.do", method = RequestMethod.POST)
	public String updateUserAccount(@ModelAttribute("taker") CandidateVO vo) {
		candidateService.updateCandidate(vo);
		return "redirect:managerUserAccountList.do";
	}

	// 매니저가 유저 추가폼
	@RequestMapping(value = "managerUserInsert.do", method = RequestMethod.GET)
	public String managerUserInsertForm(CandidateVO vo, Model model) {
		model.addAttribute("J", conditionService.getConditionDetailList("J"));
		return "manager/manager/managerUserInsert";
	}

	// 매니저가 유저 추가
	@RequestMapping(value = "managerUserInsert.do", method = RequestMethod.POST)
	public String managerUserInsert(CandidateVO vo) {
		candidateService.insertCandidate(vo);
		return "redirect:managerUserAccountList.do";
	}

	// 매니저가 유저 삭제
	@RequestMapping("managerUserDelete.do")
	public String managerUserDelete(CandidateVO vo) {
		candidateService.deleteCandidate(vo);
		return "redirect:managerUserAccountList.do";
	}
	
	// 매니저가 유저 삭제
	@RequestMapping("managerConsultingDelete.do")
	public String managerConsultingDelete(ConsultingVO vo) {
		consultingService.managerConsultingDelete(vo);
		return "redirect:managerConsultingList.do";
	}

	// 로그인 폼 (7/9 생성, JUNE)
	@RequestMapping(value = "managerLogin.do", method = RequestMethod.GET)
	public String managerLoginForm() {
		return "manager/manager/managerLogin";
	}

	// 로그인처리 (7/9 생성, JUNE)
	@RequestMapping(value = "managerLogin.do", method = RequestMethod.POST)
	public String managerLogin(ManagerVO vo, HttpSession session) {
		String targetPage = "manager/manager/managerLogin";
		ManagerVO loginManager = managerService.loginManager(vo);
		if (loginManager != null) {
			session.setAttribute("manager", loginManager);
			targetPage = "redirect:managerMain.do";
		}
		return targetPage;
	}

	// 로그아웃 처리(7/9 생성, JUNE)
	@RequestMapping(value = "managerLogout.do", method = RequestMethod.GET)
	public String managerLogout(HttpSession session) {
		session.invalidate();
		return "redirect:managerMain.do";
	}

	
	// 2019.07.15 성재민
	// 엑셀 업로드 처리
	@RequestMapping(value="managerExcelUploadForm.do", method=RequestMethod.GET)
	public String ExcelForm() {
		return "manager/manager/managerExcelUpload";
	}
		
	@RequestMapping(value="managerExcelUpload.do", method=RequestMethod.POST)
	public String ExcelUplod(MultipartHttpServletRequest request, Model model) {
		
		MultipartFile file = null;
		Iterator<String> iterator = request.getFileNames();
		if(iterator.hasNext()) {
			file = request.getFile(iterator.next());
		}
		
		List<CandidateVO> list = managerService.uploadExcelFile(file);	
		
		// 2019.08.05 성재민
		for(CandidateVO vo : list) {
			if(vo == null) {
				continue;
			}
			
			if(vo.getTakerId() == "" || vo.getTakerId() == null) {
				continue;
			}
			
			try {
				candidateService.insertCandidate(vo);
			} catch (Exception e) {
				continue;
			}
		}	
		
		return "redirect:managerUserAccountList.do";
	}
	
	// 2019.07.15 성재민
	// 시험 목록 전시
	@RequestMapping(value="managerExamList.do", method=RequestMethod.GET)
	public ModelAndView managerExamList(ModelAndView mv, ExamVO vo, Paging paging) {
		mv.addObject("result", managerService.getManagerAllExam(vo, paging));
		mv.setViewName("manager/manager/managerExamList");
		return mv;
	}
	
	@RequestMapping(value="managerExamListDetail.do/{examId}", method=RequestMethod.GET)
	public String managerExamListDetail(@PathVariable("examId") int examId, Model model) {
		ExamVO vo = new ExamVO();
		vo.setExamId(examId);
		model.addAttribute("selectedExam", managerService.getManagerExam(examService.getExam(vo)));
		return "manager/manager/managerExamListDetail";
	}
	
	@RequestMapping(value = "managerExamInsert.do/{estimateId}", method = RequestMethod.GET)
	public String managerExamInsertForm(@PathVariable("estimateId") int estimateId, ExamVO vo, Model model) {
		EstimateVO estimateVO = new EstimateVO();
		estimateVO.setEstimateId(estimateId);
		model.addAttribute("estimate", estimateService.getEstimate(estimateVO));
		model.addAttribute("O", conditionService.getConditionDetailList("O"));
		model.addAttribute("D", conditionService.getConditionDetailList("D"));
		model.addAttribute("I", conditionService.getConditionDetailList("I"));
		return "manager/manager/managerExamInsert";
	}
	
	@RequestMapping(value = "managerExamInsert.do/{estimateId}", method = RequestMethod.POST)
	public String managerExamInsert(@PathVariable("estimateId") int estimateId, ExamVO vo) {
		estimateService.updatesTradeProgressExchange2(estimateId);
		examService.insertExam(vo);
		return "redirect:/managerExamList.do";
	}

	
	
	@RequestMapping(value="managerExamUpdate.do/{examId}", method=RequestMethod.GET)
	public String managerExamUpdateForm(@PathVariable("examId") int examId, Model model, ExamVO vo ) {
		vo.setExamId(examId);
		model.addAttribute("selectedExam", managerService.getManagerExam(examService.getExam(vo)));
		model.addAttribute("O", conditionService.getConditionDetailList("O"));
		model.addAttribute("D", conditionService.getConditionDetailList("D"));
		model.addAttribute("I", conditionService.getConditionDetailList("I"));
		return "manager/manager/managerExamUpdate";
	}
	
	@RequestMapping(value = "managerExamUpdate.do", method = RequestMethod.POST)
	public String updateExam(@ModelAttribute("exam") ExamVO vo) {
		System.out.println("시험상태"+vo.getSetExamStatus());
		System.out.println("아이뒤"+vo.getEstimateId());
		if(vo.getSetExamStatus().equals("I2")) { //시험출제상태를 출제 완료로 수정하면 의뢰에서도 출제완료로 수정
			System.out.println("성공했다임마ㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏ");
			estimateService.updatesTradeProgressExchange3(vo.getEstimateId());
		}
		examService.updateExam(vo);
		
		return "redirect:managerExamList.do";
	}
	
	
	@ModelAttribute("consultingMap")
	public Map<String, String> consultingMap() {
		Map<String, String> map = new HashMap<String, String>();
		map.put("기업", "COMPANY_ID");
		map.put("제목", "CONSULTING_TITLE");
		map.put("상담희망일", "CONSULTING_DESIRED_DATE");
		map.put("상담진행상태", "CONSULTING_STATE_NM");
		return map;
	}
	
	@ModelAttribute("companyMap")
	public Map<String, String> companyMap() {
		Map<String, String> map = new HashMap<String, String>();
		map.put("기업ID", "COMPANY_ID");
		map.put("기업이름", "COMPANY_NAME");
		map.put("담당자", "COMPANY_MANAGER");
		return map;
	}
	
	@ModelAttribute("takerMap")
	public Map<String, String> takerMap() {
		Map<String, String> map = new HashMap<String, String>();
		map.put("응시자ID", "TAKER_ID");
		map.put("이름", "TAKER_NAME");
		map.put("EMAIL", "TAKER_EMAIL");
		return map;
	}
	
	@ModelAttribute("examMap")
	public Map<String, String> examMap() {
		Map<String, String> map = new HashMap<String, String>();
		map.put("회사명", "COMPANY_NAME");
		map.put("시험상태", "EXAM_STATUS");
		map.put("시험일", "EXAM_START_TIME");
		return map;
	}
	
	// 2019.07.20 성재민
	// 문의관련 화면 추가
	@RequestMapping(value="managerInquiryList.do", method=RequestMethod.GET)
	public String managerInquiryList(Model model) {
		if(inquiryService.getBeforeReplyList().size() > 0) {
			model.addAttribute("InquiryList", inquiryService.getBeforeReplyList());
		}
		
		return "manager/manager/managerInquiryList";
	}
	
	// 차트 조회하기 전에 먼저 종류를 선택하게 한다 (7/22 june) 
	@RequestMapping(value="managerChart.do", method=RequestMethod.GET)
	public String  managerChart() {
		return "manager/manager/managerSimpleChart";
	}
	
	//mailForm
	@RequestMapping(value="managerExamSendForm.do")
	public String managerExamSendForm(ExamVO examVO, Model model) {
		model.addAttribute("selectedExam", managerService.getManagerExam(examVO));
		return "empty/manager/managerExamSend";
	}
	
	//mailSending 
	@RequestMapping(value="managerExamSend.do")
	public void managerExamMailSend(HttpServletRequest request, EmailVO vo ,HttpServletResponse response) throws IOException {
		vo.setFrom("freehwans@gmail.com");
		PrintWriter out = response.getWriter();
		
		try {
			MimeMessage message = mailSender.createMimeMessage();
			MimeMessageHelper messageHelper = new MimeMessageHelper(message, true, "utf-8");
			
			messageHelper.setFrom(vo.getFrom());
			messageHelper.setTo(vo.getTomail());
			messageHelper.setSubject(vo.getSubject());
			messageHelper.setText(vo.getContent());
			String fileName = "";
			MultipartFile uploadFile = vo.getFilename();
			if(uploadFile != null && uploadFile.getSize() > 0) {
				fileName = uploadFile.getOriginalFilename();
				uploadFile.transferTo(new File("c:/upload/" + fileName));
				DataSource dataSource = new FileDataSource("c:/upload/" + fileName);
				messageHelper.addAttachment(MimeUtility.encodeText(fileName, "utf-8", "B"), dataSource);
			}

			mailSender.send(message);
			
			response.setContentType("text/html; charset=UTF-8");
			out.print("<script>");
			out.print("alert('메일 발송 성공!');");
			out.print("window.close();");
			out.print("</script>");
			out.flush();
		} catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	@RequestMapping(value = "managerDeleteTakerList.do", method = RequestMethod.POST)
	@ResponseBody
	public boolean managerDeleteTakerList(@RequestBody List<String> param) {
		boolean returnValue = true;
		for(String item : param) {
			item = item.replace("\n", "");
			item = item.replace("\t", "");	
			try {
				CandidateVO vo = new CandidateVO();
				vo.setTakerId(item);
				candidateService.deleteCandidate(vo);
			} catch (Exception e) {
				returnValue = false;
				e.printStackTrace();
			}
		}
		
		return returnValue;
	}
}