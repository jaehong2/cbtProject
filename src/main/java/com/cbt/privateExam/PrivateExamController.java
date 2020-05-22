package com.cbt.privateExam;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import javax.mail.MessagingException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class PrivateExamController {
	@Autowired
	PrivateExamService 			privateExamService;
	@Autowired 
	private JavaMailSenderImpl 	mailSender;
	
	@RequestMapping(value = "insertPrivateExam.do", method = RequestMethod.POST)
	@ResponseBody
	public String insertPrivateExam(@RequestBody List<PrivateExamVO> param) {
		return "";
	}
	
	@RequestMapping(value = "sendEmailPrivateExamTaker.do", method = RequestMethod.POST)
	@ResponseBody
	public boolean sendEmailPrivateExamTaker(@RequestBody List<Map<String, Object>> param, HttpServletResponse response) {
		for(Map<String, Object> item : param) {
			String 	examId 		= (String) item.get("examId");
			String 	takerEmail 	= (String) item.get("takerEmail");
			
			try {
				MimeMessage 		message 		= mailSender.createMimeMessage();
			    MimeMessageHelper 	messageHelper 	= new MimeMessageHelper(message, true, "UTF-8");
			    
			    messageHelper.setSubject("시험 안내");
			    messageHelper.setText(new StringBuffer().append("<h1>시험 안내 메일 입니다.</h1>")
			    		.append("<p>이용해주셔서 감사합니다.</p>")
			    		.append("<p>아래 링크를 클릭하시면 홈페이지로 연결됩니다.</p>")
			    		.append("<p>로그인 하시면 시험 등록이 완료가 되며</p>")
			    		.append("<p>비회원 이시면 회원 가입후 이용가능 합니다.</p>")
			    		.append("<a href='http://cbt.com/cbt/candidateMain.do?examId=" + examId + "'>시험 등록 링크</a>")	// 2019.07.23 성재민 이 부분은 차후 서버 ip로 변경하야애 함.
			    		.toString(), true);
			    
			    messageHelper.setFrom("sado14th@gmail.com");
			    messageHelper.setTo(new InternetAddress(takerEmail, "cbt", "UTF-8"));
			    
			    mailSender.send(message);
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (MessagingException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		
		return true;
	}
}
