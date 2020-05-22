package com.cbt.question;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Date;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.CellStyle;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.FileSystemResource;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.cbt.candidate.CandidateService;
import com.cbt.candidate.CandidateVO;
import com.cbt.common.CustomerUser;
import com.cbt.exam.ExamService;
import com.cbt.exam.ExamVO;
import com.cbt.manager.ManagerService;
import com.cbt.setExamQuestion.SetExamQuestionService;
import com.cbt.setExamQuestion.SetExamQuestionVO;
import com.cbt.takeExam.TakeExamVO;
import com.cbt.takeExamHistory.TakeExamHistoryService;

// 7/2 문제 컨트롤러 생성   -재용

@Controller
public class QuestionController {

	@Autowired
	QuestionService questionService;
	@Autowired
	SetExamQuestionService setExamQuestionService;
	@Autowired
	ExamService examService;
	@Autowired
	TakeExamHistoryService takeExamHistoryService;
	@Autowired
	CandidateService candidateService;
	@Autowired
	private JavaMailSender mailSender;
	@Autowired
	ManagerService managerService;
	
	// 2019.07.17 김재용
	// 시험 시작 화면으로 가기
	@RequestMapping(value = "candidateTakeExam.do", method = RequestMethod.POST)
	public ModelAndView candidateTakeExamList(TakeExamVO vo, HttpServletResponse response) throws IOException {
		ModelAndView mv = new ModelAndView();
		System.out.println(vo);
		// 응시자ID 가지고 해당 시험을 제출한 사람 가리기 제출하지 않은사람은 9999 리턴
		int check = questionService.takeExamScoreNullCheck(vo);
		if (check != 9999) {

			// 이미 제출한 응시자면 alert
			response.setContentType("text/html charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>alert('이미 응시 완료한 시험입니다.'); history.go(-1);</script>");
			out.flush();

		} else {
			ExamVO examVO = new ExamVO();
			examVO.setExamId(vo.getExamId());

			// 시험 디테일 불러오기
			mv.addObject("examVO", examService.getExam(examVO));

			mv.addObject("takerId", vo.getTakerId());
			mv.addObject("takeExamId", vo.getTakeExamId());

		}
		
		mv.setViewName("empty/candidate/candidateTakeExam");

		return mv;
	}

	// 2019.07.17 김재용
	// 시험 시작 이벤트
	@RequestMapping("/getTestStart.do")
	@ResponseBody
	public List<Map<String, Object>> getTestStart(TakeExamVO vo, Authentication authentication) {

		// 세션에서 아이디 담기
		CustomerUser user = (CustomerUser) authentication.getPrincipal();
		vo.setTakerId(user.getUsername());

		// 응시자ID 로 의뢰된 문항수와 HISTORY 내역비교 해서
		// 시험 제출하지 않은 응시자 가리기
		int history = questionService.getHistoryCount(vo);
		if (history == 0) {

			// 시험 시작시 HISTORY에 내역 미리 insert
			questionService.insertTakeExamHistory(vo);
		}

		// 문제 담기
		List<Map<String, Object>> list = questionService.getTestStart(vo);

		return list;
	}

	@RequestMapping(value = "candidateRightAnswer.do/{examId}", method = RequestMethod.GET)
	public ModelAndView candidateRightAnswerList(@PathVariable("examId") int examId, Authentication authentication) {
		CustomerUser user = (CustomerUser) authentication.getPrincipal();

		TakeExamVO vo = new TakeExamVO();

		vo.setTakerId(user.getUsername());
		vo.setExamId(examId);

		ModelAndView mv = new ModelAndView();

		mv.addObject("rightAnswer", questionService.candidateRightAnswerList(vo));
		mv.setViewName("candidate/candidate/candidateRightAnswer");

		return mv;
	}

	@RequestMapping(value = "/updateTakeExamHistory.do", method = RequestMethod.POST)
	@ResponseBody
	public void updateTakeExamHistory(QuestionVO vo, Authentication authentication) {
		CustomerUser user = (CustomerUser) authentication.getPrincipal();
		vo.setTakerId(user.getUsername());
		questionService.updateTakeExamHistory(vo);

	}
	
	@RequestMapping(value = "candidateTestRedirect.do", method = RequestMethod.POST)
	public void candidateTestRedirect(@RequestParam(value = "takeExamId", required = false) int takeExamId,
			@RequestParam(value = "examId", required = false) int examId, Authentication authentication,
			HttpServletResponse response) throws IOException {

		// 응시자ID를 가지고 제출 정답을 문제정답과 비교해 채점하여 히스토리에 점수 UPDATE
		questionService.rightAnswer(takeExamId);

		TakeExamVO takeExamVO = new TakeExamVO();
		takeExamVO.setTakeExamId(takeExamId);
		takeExamVO.setExamId(examId);

		// 제출한 응시자 총점 기록
		questionService.rightLastAnswer(takeExamVO);
		
		response.setContentType("text/html charset=UTF-8");
		PrintWriter out = response.getWriter();
		out.println("<script>if (window.opener && !window.opener.closed)\r\n" + 
				"window.opener.location = 'candidateTestResult.do/"+takeExamId+"/"+examId+"';\r\n" + 
				"window.close();</script>");
		out.flush();

	}
	
	@RequestMapping(value = "candidateTestResult.do/{takeExamId}/{examId}", method = RequestMethod.GET)
	public ModelAndView candidateGetTestResult(@PathVariable(value = "takeExamId", required = false) int takeExamId,
			@PathVariable(value = "examId", required = false) int examId, Authentication authentication) {

		CustomerUser user = (CustomerUser) authentication.getPrincipal();

		CandidateVO candiVO = new CandidateVO();
		candiVO.setTakerId(user.getUsername());
		ModelAndView mv = new ModelAndView();

		mv.addObject("candiVO", candidateService.getCandidate(candiVO));

		ExamVO examVO = new ExamVO();
		// 시험 ID 를 가지고 해당시험의 상세 정보 가져오기
		examVO.setExamId(examId);
		mv.addObject("examVO", examService.getExam(examVO));

		// 응시자ID를 가지고 제출 정답을 문제정답과 비교해 채점하여 히스토리에 점수 UPDATE
		questionService.rightAnswer(takeExamId);

		TakeExamVO takeExamVO = new TakeExamVO();
		// 시험 ID 와 응시자 ID 를 가지고
		// 맞힌 문제 수 answerCount , 맞힌 문제 합계점수 sumTakerScore 담기
		takeExamVO.setTakeExamId(takeExamId);
		takeExamVO.setExamId(examId);
		mv.addObject("takeExamVO", takeExamHistoryService.getTakeExamHistoryForSumPointAndCount(takeExamVO));

		// 제출한 응시자 총점 기록
		questionService.rightLastAnswer(takeExamVO);

		mv.setViewName("candidate/candidate/candidateTestResult");

		return mv;
	}

	@RequestMapping(value = "candidateTestResult.do", method = RequestMethod.POST)
	public ModelAndView candidateTestResult(@RequestParam(value = "takeExamId", required = false) int takeExamId,
			@RequestParam(value = "examId", required = false) int examId, Authentication authentication) {

		CustomerUser user = (CustomerUser) authentication.getPrincipal();

		CandidateVO candiVO = new CandidateVO();
		candiVO.setTakerId(user.getUsername());
		ModelAndView mv = new ModelAndView();

		mv.addObject("candiVO", candidateService.getCandidate(candiVO));

		ExamVO examVO = new ExamVO();
		// 시험 ID 를 가지고 해당시험의 상세 정보 가져오기
		examVO.setExamId(examId);
		mv.addObject("examVO", examService.getExam(examVO));

		// 응시자ID를 가지고 제출 정답을 문제정답과 비교해 채점하여 히스토리에 점수 UPDATE
		questionService.rightAnswer(takeExamId);

		TakeExamVO takeExamVO = new TakeExamVO();
		// 시험 ID 와 응시자 ID 를 가지고
		// 맞힌 문제 수 answerCount , 맞힌 문제 합계점수 sumTakerScore 담기
		takeExamVO.setTakeExamId(takeExamId);
		takeExamVO.setExamId(examId);
		mv.addObject("takeExamVO", takeExamHistoryService.getTakeExamHistoryForSumPointAndCount(takeExamVO));

		// 제출한 응시자 총점 기록
		questionService.rightLastAnswer(takeExamVO);

		mv.setViewName("candidate/candidate/candidateTestResult");

		return mv;
	}

	@RequestMapping("candidateExaminationList.do")
	public ModelAndView candidateExaminationList(Authentication authentication) {
		ModelAndView mv = new ModelAndView();
		CustomerUser user = (CustomerUser) authentication.getPrincipal();

		CandidateVO vo = new CandidateVO();
		vo.setTakerId(user.getUsername());

		mv.addObject("candidateExaminationList", questionService.candidateExaminationList(vo));

		mv.setViewName("candidate/candidate/candidateExaminationList");
		return mv;
	}

	@RequestMapping(value = "candidateExaminationListDetail.do", method = RequestMethod.POST)
	public ModelAndView candidateExaminationListDetail(TakeExamVO vo, Authentication authentication) {
		ModelAndView mv = new ModelAndView();
		CustomerUser user = (CustomerUser) authentication.getPrincipal();

		vo.setTakerId(user.getUsername());

		mv.addObject("candidateExaminationListDetail", questionService.candidateExaminationListDetail(vo));
		mv.setViewName("candidate/candidate/candidateExaminationListDetail");
		return mv;
	}

	// 2019.07.18 김재용
	// 문제테이블 ALL 리스트 불러오기
	@RequestMapping(value = "managerAllQuestionList.do", method = RequestMethod.GET)
	public ModelAndView managerAllQuestionList() {
		ModelAndView mv = new ModelAndView();

		mv.addObject("examList", questionService.managerAllQuestionList());
		mv.setViewName("manager/manager/managerAllQuestionList");

		return mv;
	}

	@RequestMapping(value = "/excelDown.do")
	public void excelDown(HttpServletResponse response) throws Exception {

		List<QuestionVO> list = questionService.managerAllQuestionList();

		Workbook wb = new XSSFWorkbook();
		Sheet sheet = wb.createSheet("게시판");
		Row row = null;
		Cell cell = null;
		int rowNo = 0;

		CellStyle headStyle = wb.createCellStyle();

		CellStyle bodyStyle = wb.createCellStyle();

		row = sheet.createRow(rowNo++);
		cell = row.createCell(0);
		cell.setCellStyle(headStyle);
		cell.setCellValue("questionId");
		cell = row.createCell(1);
		cell.setCellStyle(headStyle);
		cell.setCellValue("questionContent");
		cell = row.createCell(2);
		cell.setCellStyle(headStyle);
		cell.setCellValue("example1");
		cell = row.createCell(3);
		cell.setCellStyle(headStyle);
		cell.setCellValue("example2");
		cell = row.createCell(4);
		cell.setCellStyle(headStyle);
		cell.setCellValue("example3");
		cell = row.createCell(5);
		cell.setCellStyle(headStyle);
		cell.setCellValue("example4");
		cell = row.createCell(6);
		cell.setCellStyle(headStyle);
		cell.setCellValue("rightAnswer");
		cell = row.createCell(7);
		cell.setCellStyle(headStyle);
		cell.setCellValue("rightCommentary");
		cell = row.createCell(8);
		cell.setCellStyle(headStyle);
		cell.setCellValue("levelOfDifficulty");
		cell = row.createCell(9);
		cell.setCellStyle(headStyle);
		cell.setCellValue("categoryId");
		cell = row.createCell(10);
		cell.setCellStyle(headStyle);
		cell.setCellValue("questionType");

		for (QuestionVO vo : list) {
			row = sheet.createRow(rowNo++);
			cell = row.createCell(0);
			cell.setCellStyle(bodyStyle);
			cell.setCellValue(vo.getQuestionId());
			cell = row.createCell(1);
			cell.setCellStyle(bodyStyle);
			cell.setCellValue(vo.getQuestionContent());
			cell = row.createCell(2);
			cell.setCellStyle(bodyStyle);
			cell.setCellValue(vo.getExample1());
			cell = row.createCell(3);
			cell.setCellStyle(bodyStyle);
			cell.setCellValue(vo.getExample2());
			cell = row.createCell(4);
			cell.setCellStyle(bodyStyle);
			cell.setCellValue(vo.getExample3());
			cell = row.createCell(5);
			cell.setCellStyle(bodyStyle);
			cell.setCellValue(vo.getExample4());
			cell = row.createCell(6);
			cell.setCellStyle(bodyStyle);
			cell.setCellValue(vo.getRightAnswer());
			cell = row.createCell(7);
			cell.setCellStyle(bodyStyle);
			cell.setCellValue(vo.getRightCommentary());
			cell = row.createCell(8);
			cell.setCellStyle(bodyStyle);
			cell.setCellValue(vo.getLevelOfDifficulty());
			cell = row.createCell(9);
			cell.setCellStyle(bodyStyle);
			cell.setCellValue(vo.getCategoryId());
			cell = row.createCell(10);
			cell.setCellStyle(bodyStyle);
			cell.setCellValue(vo.getQuestionType());

		}

//		response.setContentType("application/vnd.ms-excel");
		response.setContentType("application / vnd.openxmlformats-officedocument.spreadsheetml.sheet");

		response.setHeader("Content-Disposition", "attachment;filename=test.xlsx");

		wb.write(response.getOutputStream());
		wb.close();

	}

	@RequestMapping(value = "/managerExamQuestionExcelDown.do/{examId}")
	public void managerExamQuestionExcelDown(@PathVariable("examId") int examId, HttpServletResponse response) {
		//기업정보조회
		ExamVO examVO = new ExamVO();
		examVO.setExamId(examId);
		Map<String, String> company = managerService.getManagerExam(examVO);
		
		//시험문제조회
		SetExamQuestionVO vo = new SetExamQuestionVO();
		vo.setExamId(examId);
		List<SetExamQuestionVO> setExamList = setExamQuestionService.getSetExamQuestionListForExamId(vo);
		List<QuestionVO> questionList = new ArrayList<QuestionVO>();

		for (SetExamQuestionVO setExam : setExamList) {
			QuestionVO questionVO = new QuestionVO();
			questionVO.setQuestionId(setExam.getQuestionId());
			questionList.add(questionService.getQuestion(questionVO));
		}

		Workbook wb = new HSSFWorkbook();
		Sheet sheet = wb.createSheet("출제 문제");
		Row row = null;
		Cell cell = null;
		int rowNo = 0;

		CellStyle headStyle = wb.createCellStyle();
		CellStyle bodyStyle = wb.createCellStyle();

		row = sheet.createRow(rowNo++);
		cell = row.createCell(0);
		cell.setCellStyle(headStyle);
		cell.setCellValue("questionId");
		cell = row.createCell(1);
		cell.setCellStyle(headStyle);
		cell.setCellValue("questionContent");
		cell = row.createCell(2);
		cell.setCellStyle(headStyle);
		cell.setCellValue("example1");
		cell = row.createCell(3);
		cell.setCellStyle(headStyle);
		cell.setCellValue("example2");
		cell = row.createCell(4);
		cell.setCellStyle(headStyle);
		cell.setCellValue("example3");
		cell = row.createCell(5);
		cell.setCellStyle(headStyle);
		cell.setCellValue("example4");
		cell = row.createCell(6);
		cell.setCellStyle(headStyle);
		cell.setCellValue("rightAnswer");
		cell = row.createCell(7);
		cell.setCellStyle(headStyle);
		cell.setCellValue("rightCommentary");

		for (QuestionVO qvo : questionList) {
			row = sheet.createRow(rowNo++);
			cell = row.createCell(0);
			cell.setCellStyle(bodyStyle);
			cell.setCellValue(vo.getQuestionId());
			cell = row.createCell(1);
			cell.setCellStyle(bodyStyle);
			cell.setCellValue(qvo.getQuestionContent());
			cell = row.createCell(2);
			cell.setCellStyle(bodyStyle);
			cell.setCellValue(qvo.getExample1());
			cell = row.createCell(3);
			cell.setCellStyle(bodyStyle);
			cell.setCellValue(qvo.getExample2());
			cell = row.createCell(4);
			cell.setCellStyle(bodyStyle);
			cell.setCellValue(qvo.getExample3());
			cell = row.createCell(5);
			cell.setCellStyle(bodyStyle);
			cell.setCellValue(qvo.getExample4());
			cell = row.createCell(6);
			cell.setCellStyle(bodyStyle);
			cell.setCellValue(qvo.getRightAnswer());
			cell = row.createCell(7);
			cell.setCellStyle(bodyStyle);
			cell.setCellValue(qvo.getRightCommentary());
		}
		String fileName = company.get("companyId")+ System.currentTimeMillis()+".xls";
		response.setContentType("application/vnd.ms-excel");
		response.setHeader("Content-Disposition", "Attachment;Filename="+fileName);

		try {
			wb.write(response.getOutputStream());
			wb.close();
			response.getOutputStream().close();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	// mailForm
	@RequestMapping(value = "/mail/mailForm")
	public String mailForm() {
		return "/mail/mailForm";
	}

	// mailSending 코드
	@RequestMapping(value = "mail/mailSending")
	public String mailSending(HttpServletRequest request) {

		String setfrom = "freehwans@gmail.com";
		String tomail = request.getParameter("tomail"); // 받는사람 이메일
		String title = request.getParameter("title"); // 제목
		String content = request.getParameter("content"); // 내용
		String fileName = "";

		try {
			// MimeMessage message = mailSender.createMimeMessage();
			MimeMessage message = mailSender.createMimeMessage();
			MimeMessageHelper messageHelper = new MimeMessageHelper(message, true, "UTF-8");

			messageHelper.setFrom(setfrom);
			messageHelper.setTo(tomail);
			messageHelper.setSubject(title);
			messageHelper.setText(content);

			// 파일첨부
			FileSystemResource fsr = new FileSystemResource(fileName);
			messageHelper.addAttachment("test2.txt", fsr);
			mailSender.send(message);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "redirect :/mail/mailForm";
	}

	@RequestMapping(value = "managerFileUpload.do", method = RequestMethod.GET)
	public String managerFileUpload() {

		return "manager/manager/managerFileUpload";
	}

	@RequestMapping(value = "/excelUp.do", method = RequestMethod.POST)
	public String ExcelUp(MultipartHttpServletRequest request, Model model) {

		MultipartFile file = null;
		Iterator<String> iterator = request.getFileNames();
		if (iterator.hasNext()) {
			file = request.getFile(iterator.next());
		}
		List<QuestionVO> list = questionService.uploadExcelFile(file);
		// model.addAttribute("list", list);

		for (QuestionVO vo : list) {
			questionService.insertQuestion(vo);
		}

		return "redirect:managerFileUpload.do";

	}

	@RequestMapping(value = "/getTimer.do", method = RequestMethod.POST)
	@ResponseBody
	public Date getTimer(ExamVO vo) {

//		ExamVO examVo = examService.getExam(vo);
//		
//		System.out.println(Integer.parseInt(examVo.getExamStartTime()));
//		System.out.println(Integer.parseInt(examVo.getExamEndTime()));

		Date serverDate = new Date();

		System.out.println(serverDate);

		return serverDate;
	}

	public Date parse(String str) {

		String y = str.substring(0, 4);
		String mon = str.substring(5, 2);
		String d = str.substring(8, 2);
		String h = str.substring(11, 2);
		String min = str.substring(14, 2);

		return new Date();
	}

}
