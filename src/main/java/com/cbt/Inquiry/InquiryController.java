package com.cbt.Inquiry;

import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

// 2019.07.20 성재민
// 문의 테이블 추가로 대응하는 Controller 생성
@Controller
public class InquiryController {
	@Autowired
	InquiryService inquiryService;
	
	// 2019.07.20 성재민
	// 인서트 요청 처리
	@RequestMapping(value = "insertInquiry.do", method = RequestMethod.POST)
	@ResponseBody
	public boolean insertInquiry(@RequestBody Map<String, Object> param) {
		String msg 	= (String) param.get("msg");
		String id 	= (String) param.get("id");
		String rid 	= (String) param.get("rid");
		
		InquiryVO vo = new InquiryVO();
		vo.setInquiryContent(msg);
		vo.setInquiryTakerId(id);
		vo.setInquiryRoomId(rid);
		
		try {
			inquiryService.insertInquiry(vo);
		} catch (Exception e) {
			return false;
		}
		
		return true;
	}
	
	// 2019.07.21 성재민
	// 업데이트 요청 처리
	@RequestMapping(value = "updateInquiry.do", method = RequestMethod.POST)
	@ResponseBody
	public boolean updateInquiry(@RequestBody Map<String, Object> param, HttpSession session) {
		String rid 		= (String) param.get("rid");
		String status 	= (String) param.get("status");
			
		InquiryVO vo = new InquiryVO();
		vo.setInquiryRoomId(rid);
		vo.setReplyStatus(status);
			
		try {
			inquiryService.updateInquiry(vo);
			int count = inquiryService.getBeforeReplyCount();
			if(count > 0) {
				session.setAttribute("beforeReplyCount", count);
			} else {
				session.removeAttribute("beforeReplyCount");
			}
		} catch (Exception e) {
			return false;
		}
			
		return true;
	}
	
	// 2019.07.21 성재민
	// 업데이트 요청 처리
	@RequestMapping(value = "updateInquiry.do/{rid}/{status}", method = RequestMethod.GET)
	@ResponseBody
	public boolean updateInquiryTemp(@PathVariable("rid") String rid, @PathVariable("status") String status, HttpSession session) {				
		InquiryVO vo = new InquiryVO();
		vo.setInquiryRoomId(rid);
		vo.setReplyStatus(status);
				
		try {
			inquiryService.updateInquiry(vo);
			int count = inquiryService.getBeforeReplyCount();
			if(count > 0) {
				session.setAttribute("beforeReplyCount", count);
			} else {
				session.removeAttribute("beforeReplyCount");
			}
		} catch (Exception e) {
			return false;
		}
			
		return true;
	}
	
	// 2019.07.21 성재민
	// 삭제 요청 처리
	@RequestMapping(value = "deleteInquiry.do", method = RequestMethod.POST)
	@ResponseBody
	public boolean deleteInquiry(@RequestBody Map<String, Object> param) {
		String rid 	= (String) param.get("rid");
			
		InquiryVO vo = new InquiryVO();
		vo.setInquiryRoomId(rid);
			
		try {
			inquiryService.deleteInquiry(vo);
		} catch (Exception e) {
			return false;
		}
			
		return true;
	}
	
	// 2019.07.22 성재민
	// 처리가 필요한 문의 갯수 가져오는 함수
	@RequestMapping(value = "getBeforeReplyCount.do", method = RequestMethod.POST)
	@ResponseBody
	public int getBeforeReplyCount(HttpSession session) {	
		try {
			int count = inquiryService.getBeforeReplyCount();
			if(count > 0) {
				session.setAttribute("beforeReplyCount", count);
			}
			
			return count;
		} catch (Exception e) {
			return 0;
		}
	}
}
