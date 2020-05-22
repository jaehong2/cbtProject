package com.cbt.Inquiry;

import java.util.List;

// 2019.07.20 성재민
// 문의 테이블 추가로 대응하는 Service 생성
public interface InquiryService {
	void insertInquiry(InquiryVO vo);
	
	void updateInquiry(InquiryVO vo);
	
	void deleteInquiry(InquiryVO vo);
	
	InquiryVO getInquiry(InquiryVO vo);
	
	List<InquiryVO> getInquiryList(InquiryVO vo);
	
	// 2019.07.20 성재민
	// 답변이 되지 않은 문의의 개수 받아오기.
	int getBeforeReplyCount();
	
	// 2019.07.20 성재민
	// 답변이 되지 않은 문의 받아오기.
	List<InquiryVO> getBeforeReplyList();
}
