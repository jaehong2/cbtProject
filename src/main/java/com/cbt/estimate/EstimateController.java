package com.cbt.estimate;

import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.PrintWriter;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.text.SimpleDateFormat;
import java.util.List;

import javax.activation.DataSource;
import javax.activation.FileDataSource;
import javax.mail.MessagingException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeUtility;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.CellStyle;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.MailException;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.cbt.category.CategoryVO;
import com.cbt.categoryMain.CategoryMainService;
import com.cbt.common.CustomerUser;
import com.cbt.common.EmailVO;
import com.cbt.common.Paging;
import com.cbt.company.CompanyService;
import com.cbt.company.CompanyVO;
import com.cbt.condition.ConditionService;

/* @RestController가 @ResponseBody를 포함하고 있기 때문에
 * view가 필요하고 restfulAPI와 묶고 싶을 경우 클래스에 @Controller로 지정해주고, restfulAPI에는 일일이 @ResponseBody를 붙여야된다.
 */
@ContextConfiguration(locations = "classpath:config/applicationContext.xml")
@Controller
public class EstimateController {
	@Autowired
	CategoryMainService categoryMainService;// 카테고리 대, 중, 소 값을 가져오기 위함
	@Autowired
	ConditionService conditionService;
	@Autowired
	EstimateService estimateService;
	
	@Autowired
	private JavaMailSenderImpl mailSender;
	@Autowired
	CompanyService companyService;

	// 기업은 자기의뢰 내용을 볼수있다. company-select
	@RequestMapping(value = "companyEstimateList.do", method = RequestMethod.GET)
	public ModelAndView companyEstimateListForm(Paging paging, ModelAndView mv, EstimateVO vo,
			Authentication authentication) throws IOException {
		// 해당 기업의 ID값으로 세션처리
		CustomerUser user = (CustomerUser) authentication.getPrincipal();
		vo.setCompanyId(user.getUsername());
		mv.addObject("result", estimateService.getEstimateList(vo, paging));
		mv.setViewName("company/company/companyEstimateList");
		return mv;

	}

	// 기업은 자기의뢰 수정 할수 있다. company-update
	@RequestMapping(value = "companyEstimateUpdate.do", method = RequestMethod.GET)
	public String companyEstimateUpdateForm() {
		return "company/company/companyEstimateDetail";
		// return "company/companyEstimateDetail";
	}

	@RequestMapping(value = "/companyEstimateUpdate.do", method = RequestMethod.POST)
	public void companyEstimateUpdate(EstimateVO vo, HttpServletResponse response) throws IOException {
		// vo.setEstimateId(estimateId);
		estimateService.updateEstimate(vo);

		PrintWriter out = response.getWriter();

		// 윈도우창 닫기
		response.setContentType("text/html; charset=UTF-8");
		out.print("<script>");
		out.print("window.opener.top.location.reload();");
		out.print("window.close();");
		out.print("</script>");
		out.flush();
	}

	// 기업은 자기의뢰를 삭제 할 수 있다. company-delete
	@RequestMapping(value = "companyEstimateDelete.do")
	@ResponseBody
	public void companyEstimateDelete(EstimateVO vo) {
		estimateService.deleteEstimate(vo);
	}

	// 의뢰세부내용보기 company-select-detail
	@RequestMapping(value = "companyEstimateDetail.do/{estimateId}", method = RequestMethod.GET)
	public String companyEstimateDetail(@PathVariable("estimateId") int estimateId, // String ->int바꿔야함
			EstimateVO vo, Model model) {

		vo.setEstimateId(estimateId);
		
		/*	날짜뒤에 .0빼기
		 * vo.getPaymentDate().toString().substring(1, 17); vo.setPaymentDate();
		 */ 
		model.addAttribute("myEstimateList", estimateService.getEstimate(vo)); // 기업별 디테일 의뢰 조회
		model.addAttribute("B", conditionService.getConditionDetailList("B")); // B-의뢰진행상태
		model.addAttribute("G", conditionService.getConditionDetailList("G")); // G-시험난이도
		model.addAttribute("H", conditionService.getConditionDetailList("H")); // H-시험횟수
		model.addAttribute("K", conditionService.getConditionDetailList("K")); // K-응시대상자
		model.addAttribute("L", conditionService.getConditionDetailList("L")); // L-응시목적
		model.addAttribute("M", conditionService.getConditionDetailList("M")); // M-시험분류
		model.addAttribute("N", conditionService.getConditionDetailList("N")); // N-시험간격
		return "empty/company/companyEstimateDetail";
	}

	// 기업 의뢰상태

	// 4.결제대기 -> 5.결제완료

	@RequestMapping(value = "companyPaymentUpdate.do", method = RequestMethod.POST)
	@ResponseBody
	public int companyPaymentUpdate(EstimateVO vo,EmailVO emailVO, HttpServletRequest request) throws IOException, MessagingException {
		 
		estimateService.updatesTradeProgressExchange5(vo);
		
		vo = estimateService.getEstimate(vo);
		emailVO.setSubject("[KG이니시스 결제확인]"+ vo.getCompanyId() +"님,(주)케이지이니시스에서 결제하신 내역 확인바랍니다."); 
		
		emailVO.setFromEmail("dtg3431@gmail.com");
		emailVO.setToEmail(vo.getCompanyEmail()); //기업 이메일로처리
		
		String test= "";
		

		try {
			byte[] encodded = Files.readAllBytes(Paths.get(request.getSession().getServletContext().getRealPath("DocumentForm/mail.html")));
			test = new String(encodded, "UTF-8");
			System.out.println(test);

			System.out.println(vo);
			test = test.replace("#{estimatePrice}",  Integer.toString(vo.getEstimatePrice())+"원");
			test = test.replace("#{companyId}", vo.getCompanyId());
			test = test.replace("#{paymentDate}", vo.getPaymentDate().toString().substring(0, 19));
			test = test.replace("#{estimateName}", vo.getEstimateName());
		}catch( FileNotFoundException e) {
			e.printStackTrace();
		}
		emailVO.setText(test);
		this.sendEmail(emailVO);
		//
		return 1;

	}

	//////////////////////////////////////////////////////////
	//////////////////////////// 관리자///////////////////////
	// ↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓//

	// 관리자는 기업의 의뢰서를 조회할수있다. manager-select
	@RequestMapping(value = "managerEstimateList.do", method = RequestMethod.GET)
	public ModelAndView managerEstimateListForm(Paging paging, ModelAndView mv, EstimateVO vo) throws IOException {

		mv.addObject("result", estimateService.getEstimateList(vo, paging));
		mv.setViewName("manager/manager/managerEstimateList");
		return mv;

	}

	// 관리자의뢰 등록 관리자는 상담내역을가지고 의뢰서를 등록한다. manager-insert
	@RequestMapping(value = "managerEstimateInsert.do", method = RequestMethod.GET)
	public String managerEstimateInsertForm(Model model) {

		model.addAttribute("B", conditionService.getConditionDetailList("B")); // K-응시대상자
		model.addAttribute("K", conditionService.getConditionDetailList("K")); // K-응시대상자
		model.addAttribute("G", conditionService.getConditionDetailList("G")); // G-시험난이도
		model.addAttribute("H", conditionService.getConditionDetailList("H")); // H-시험횟수
		model.addAttribute("M", conditionService.getConditionDetailList("M")); // M-시험분류
		model.addAttribute("L", conditionService.getConditionDetailList("L")); // L-응시목적
		model.addAttribute("N", conditionService.getConditionDetailList("N")); // N-시험간격
		return "manager/manager/managerEstimateInsert";
	}

	@RequestMapping(value = "managerEstimateInsert.do", method = RequestMethod.POST)
	public String managerEstimateInsert(EstimateVO vo) {
		estimateService.insertEstimate(vo);
		return "redirect:managerEstimateList.do";
	}

	// 관리자는 의뢰내용을 수정 할수 있다. manager-update
	@RequestMapping(value = "managerEstimateUpdate.do", method = RequestMethod.GET)
	public String managerEstimateUpdateForm() {
		return "manager/manager/managerDetailEstimateList";
		// return "company/companyEstimateDetail";
	}

	@RequestMapping(value = "/managerEstimateUpdate.do", method = RequestMethod.POST)
	public void managerEstimateUpdate(EstimateVO vo, HttpServletResponse response) throws IOException {

		PrintWriter out = response.getWriter();
		// vo.setEstimateId(estimateId);
		estimateService.updateEstimate(vo);

		// 윈도우창 닫기
		response.setContentType("text/html; charset=UTF-8");
		out.print("<script>");
		out.print("window.opener.top.location.reload();");
		out.print("window.close();");
		out.print("</script>");
		out.flush();
	}

	// 관리자는 의뢰를 삭제 할 수 있다. manager-delete
	@RequestMapping(value = "managerEstimateDelete.do", method = RequestMethod.GET)
	public String managerEstimateDelete(EstimateVO vo) {
		estimateService.deleteEstimate(vo);
		return "redirect:managerEstimateList.do";
	}

	// 관리자 의뢰세부내용보기 manager-select-detail
	@RequestMapping(value = "managerEstimateDetail.do/{estimateId}", method = RequestMethod.GET)
	public String managerEstimateDetail(@PathVariable("estimateId") int estimateId, // String ->int바꿔야함
			EstimateVO vo, Model model) {

		vo.setEstimateId(estimateId);
		model.addAttribute("myEstimateList", estimateService.getEstimate(vo));
		model.addAttribute("B", conditionService.getConditionDetailList("B")); // B-의뢰진행상태
		model.addAttribute("G", conditionService.getConditionDetailList("G")); // G-시험난이도
		model.addAttribute("H", conditionService.getConditionDetailList("H")); // H-시험횟수
		model.addAttribute("K", conditionService.getConditionDetailList("K")); // K-응시대상자
		model.addAttribute("L", conditionService.getConditionDetailList("L")); // L-응시목적
		model.addAttribute("M", conditionService.getConditionDetailList("M")); // M-시험분류
		model.addAttribute("N", conditionService.getConditionDetailList("N")); // N-시험간격
		return "empty/manager/managerEstimateDetail";
	}

	// 카테고리 id와 이름을 가져옴
	@RequestMapping(value = "getCateoryNameList.do", method = RequestMethod.GET)
	@ResponseBody
	public List<EstimateVO> categoryMain(CategoryVO vo) {
		return estimateService.getCateoryNameList(vo);
	}

	// 매니저가 확인메일보냄 의뢰진행상태 출제완료

	@RequestMapping(value = "managerSendEmail.do", method = RequestMethod.GET)
	@ResponseBody
	public void managerSendEmail(EstimateVO vo, HttpServletRequest request, HttpServletResponse response,EmailVO emailVO)
			throws MessagingException, IOException {

		// 의뢰진행상태 출제 완료 -> 결제대기
		estimateService.updatesTradeProgressExchange4(vo);
		PrintWriter out = response.getWriter();		
		//메일발송
	/*	emailVO.setSubject("결제사항 및 시험확인"); 
		emailVO.setText("이용해주셔서 감사합니다. 결제 정보입니다.");
		emailVO.setFromEmail("dtg3431@gmail.com");
		emailVO.setToEmail("dtg3444@naver.com"); //기업 이메일로처리
		emailVO.setAttachFile(request.getSession().getServletContext().getRealPath("/DocumentForm/결제방법.pdf"));
		
		*/
		

		 MimeMessage message = mailSender.createMimeMessage();
	     MimeMessageHelper messageHelper = new MimeMessageHelper(message, true, "UTF-8");
	      
	      messageHelper.setSubject("결제사항 및 시험확인");
	      messageHelper.setText("이용해주셔서 감사합니다. 결제 정보입니다.");
	      messageHelper.setFrom("dtg3431@gmail.com");
	      messageHelper.setTo(new InternetAddress("dtg3444@naver.com", "재홍", "UTF-8"));

	      DataSource dataSource = new FileDataSource(request.getSession().getServletContext().getRealPath("/DocumentForm/결제방법.pdf"));
	       messageHelper.addAttachment(MimeUtility.encodeText("결제방법.pdf", "UTF-8", "B"), dataSource);
	       
	       //messageHelper.addInline("inlinetest", new FileDataSource("C:\\이재홍.jpg"));
	       System.out.println("mail send ok");
	       //의뢰진행상태 출제 완료 -> 결제대기
	       estimateService.updatesTradeProgressExchange4(vo);
	       out.print("<script>");
	       out.print("window.opener.top.location.reload();");
	       out.print("window.close();");
	       out.print("</script>");
	       out.flush();
	      try {
	         mailSender.send(message); //messageHelper.getMimeMessage()
	      } catch (MailException e) {
	         e.printStackTrace();
	      }
		
		
		
		
		
		
		
		
		
		
		/*
		 * this.sendEmail(emailVO); //
		 * 
		 * //결과 출력 out.print("<script>");
		 * out.print("window.opener.top.location.reload();");
		 * out.print("window.close();"); out.print("</script>"); out.flush();
		 */
		//
	}

	// companyID와 NAME을 가져오기위함
	@RequestMapping(value = "getcompanyNameList.do", method = RequestMethod.GET)
	@ResponseBody
	public List<CompanyVO> getcompanyNameList(CompanyVO vo) {

		return companyService.getCompanyList(vo);

	}

	// 엑셀

	@RequestMapping(value = "/estimateQuestionExcelDown.do/{estimateId}")
	public void estimateQuestionExcelDown(@PathVariable("estimateId") int estimateId, HttpServletResponse response) {
		EstimateVO vo = new EstimateVO();
		SimpleDateFormat transFormat = new SimpleDateFormat("yyyy-MM-dd"); // 날짜 타입변환을 위해 사용
		String RequestDay; // 날짜 타입변환을 위해 사용
		String ExamDate; // 날짜 타입변환을 위해 사용
		vo.setEstimateId(estimateId);

		List<EstimateVO> estimateList = estimateService.getEstimateList(vo);

		Workbook wb = new HSSFWorkbook();
		Sheet sheet = wb.createSheet("의뢰 견적서");
		Row row = null;
		Cell cell = null;
		int rowNo = 0;

		CellStyle headStyle = wb.createCellStyle();
		CellStyle bodyStyle = wb.createCellStyle();

		row = sheet.createRow(rowNo++);
		cell = row.createCell(0);
		cell.setCellStyle(headStyle);
		cell.setCellValue("의뢰ID"); // 의뢰ID
		cell = row.createCell(1);
		cell.setCellStyle(headStyle);
		cell.setCellValue("카테고리"); // 카테고리
		cell = row.createCell(2);
		cell.setCellStyle(headStyle);
		cell.setCellValue("기업ID"); // 기업ID
		cell = row.createCell(3);
		cell.setCellStyle(headStyle);
		cell.setCellValue("의뢰이름"); // 의뢰이름
		cell = row.createCell(4);
		cell.setCellStyle(headStyle);
		cell.setCellValue("의뢰일"); // 의뢰일
		cell = row.createCell(5);
		cell.setCellStyle(headStyle);
		cell.setCellValue("금액"); // 금액
		cell = row.createCell(6);
		cell.setCellStyle(headStyle);
		cell.setCellValue("의뢰진행상태"); // 의뢰진행상태
		cell = row.createCell(7);
		cell.setCellStyle(headStyle);
		cell.setCellValue("응시대상자"); // 응시대상자
		cell = row.createCell(8);
		cell.setCellStyle(headStyle);
		cell.setCellValue("응시목적"); // 응시목적
		cell = row.createCell(9);
		cell.setCellStyle(headStyle);
		cell.setCellValue("응시자 수 "); // 응시자 수
		cell = row.createCell(10);
		cell.setCellStyle(headStyle);
		cell.setCellValue("시험분류"); // 시험분류
		cell = row.createCell(11);
		cell.setCellStyle(headStyle);
		cell.setCellValue("난이도"); // 난이도
		cell = row.createCell(12);
		cell.setCellStyle(headStyle);
		cell.setCellValue("시험일시"); // 시험일시
		cell = row.createCell(13);
		cell.setCellStyle(headStyle);
		cell.setCellValue("비고"); // 비고
		cell = row.createCell(14);
		cell.setCellStyle(headStyle);
		cell.setCellValue("시험간격"); // 시험간격

		for (EstimateVO evo : estimateList) {
			row = sheet.createRow(rowNo++);
			cell = row.createCell(0);
			cell.setCellStyle(bodyStyle);
			cell.setCellValue(evo.getEstimateId());
			cell = row.createCell(1);
			cell.setCellStyle(bodyStyle);
			cell.setCellValue(evo.getCategoryName());
			cell = row.createCell(2);
			cell.setCellStyle(bodyStyle);
			cell.setCellValue(evo.getCompanyId());
			cell = row.createCell(3);
			cell.setCellStyle(bodyStyle);
			cell.setCellValue(evo.getEstimateName());
			cell = row.createCell(4);
			cell.setCellStyle(bodyStyle);
			RequestDay = transFormat.format(evo.getRequestDay()); // date ->String
			cell.setCellValue(RequestDay);
			cell = row.createCell(5);
			cell.setCellStyle(bodyStyle);
			cell.setCellValue(evo.getEstimatePrice());
			cell = row.createCell(6);
			cell.setCellStyle(bodyStyle);
			cell.setCellValue(evo.getTradeProgressName());
			cell = row.createCell(7);
			cell.setCellStyle(bodyStyle);
			cell.setCellValue(evo.getCandidateName());
			cell = row.createCell(8);
			cell.setCellStyle(bodyStyle);
			cell.setCellValue(evo.getApplyPurposeName());
			cell = row.createCell(9);
			cell.setCellStyle(bodyStyle);
			cell.setCellValue(evo.getApplicants());
			cell = row.createCell(10);
			cell.setCellStyle(bodyStyle);
			cell.setCellValue(evo.getExamClassficationName());
			cell = row.createCell(11);
			cell.setCellStyle(bodyStyle);
			cell.setCellValue(evo.getLevelOfDifficultyName());
			cell = row.createCell(12);
			cell.setCellStyle(bodyStyle);
			ExamDate = transFormat.format(evo.getExamDate()); // date ->String
			cell.setCellValue(ExamDate);
			cell = row.createCell(13);
			cell.setCellStyle(bodyStyle);
			cell.setCellValue(evo.getRemarks());
			cell = row.createCell(14);
			cell.setCellStyle(bodyStyle);
			cell.setCellValue(evo.getExamIntervalName());
		}

		response.setContentType("application/vnd.ms-excel");
		response.setHeader("Content-Disposition", "Attachment;Filename=EstimateList.xls");

		try {
			wb.write(response.getOutputStream());
			wb.close();
			response.getOutputStream().close();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	
	//이메일 메서드
	public void sendEmail(EmailVO vo)
			throws MessagingException, IOException {
		
		MimeMessage message = mailSender.createMimeMessage();
		MimeMessageHelper messageHelper = new MimeMessageHelper(message, true, "UTF-8");

		messageHelper.setSubject(vo.getSubject());
		messageHelper.setText(vo.getText(),true);
		messageHelper.setFrom(vo.getFromEmail());
		messageHelper.setTo(new InternetAddress(vo.getToEmail(), "", "UTF-8"));
		
		
		
		if(vo.getAttachFile() != null) {
			DataSource dataSource = new FileDataSource(vo.getAttachFile());
			messageHelper.addAttachment(MimeUtility.encodeText("결제방법.pdf", "UTF-8", "B"), dataSource);
		}
		
//messageHelper.addInline("inlinetest", new FileDataSource("C:\\이재홍.jpg"));
		System.out.println("mail send ok");
		try {
			mailSender.send(message); // messageHelper.getMimeMessage()
		} catch (MailException e) {
			e.printStackTrace();
		}
	}	

}
