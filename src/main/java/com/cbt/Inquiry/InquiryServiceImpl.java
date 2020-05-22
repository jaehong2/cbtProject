package com.cbt.Inquiry;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

// 2019.07.20 성재민
// 문의 테이블 추가로 대응하는 ServiceImpl 생성
@Service
public class InquiryServiceImpl implements InquiryService {
	@Resource
	InquiryDAO dao;
	
	@Override
	public void insertInquiry(InquiryVO vo) {
		dao.insertInquiry(vo);
	}

	@Override
	public void updateInquiry(InquiryVO vo) {
		dao.updateInquiry(vo);
	}

	@Override
	public void deleteInquiry(InquiryVO vo) {
		dao.deleteInquiry(vo);
	}

	@Override
	public InquiryVO getInquiry(InquiryVO vo) {
		return dao.getInquiry(vo);
	}

	@Override
	public List<InquiryVO> getInquiryList(InquiryVO vo) {
		return dao.getInquiryList(vo);
	}

	// 2019.07.20 성재민
	// 답변이 되지 않은 문의의 개수 받아오기.
	@Override
	public int getBeforeReplyCount() {
		return dao.getBeforeReplyCount();
	}

	// 2019.07.20 성재민
	// 답변이 되지 않은 문의 받아오기.
	@Override
	public List<InquiryVO> getBeforeReplyList() {
		return dao.getBeforeReplyList();
	}
}
