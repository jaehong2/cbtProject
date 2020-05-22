package com.cbt.Inquiry;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

// 2019.07.20 성재민
// 문의 테이블 추가로 대응하는 DAO 객체 생성
@Repository
public class InquiryDAO {
	@Autowired
	private SqlSessionTemplate mybatis;
	
	public void insertInquiry(InquiryVO vo) {
		mybatis.insert("inquiryDAO.insertInquiry", vo);
	}
	
	public void updateInquiry(InquiryVO vo) {
		mybatis.update("inquiryDAO.updateInquiry", vo);
	}
	
	public void deleteInquiry(InquiryVO vo) {
		mybatis.delete("inquiryDAO.deleteInquiry", vo);
	}
	
	public InquiryVO getInquiry(InquiryVO vo) {
		return mybatis.selectOne("inquiryDAO.", vo);
	}
	
	// 2019.07.20 성재민
	// 답변이 되지 않은 문의의 개수 받아오기.
	public int getBeforeReplyCount() {
		return mybatis.selectOne("inquiryDAO.getBeforeReplyCount");
	}
	
	// 2019.07.20 성재민
	// 답변이 되지 않은 문의 받아오기.
	public List<InquiryVO> getBeforeReplyList() {
		return mybatis.selectList("inquiryDAO.getBeforeReplyList");
	}
	
	public List<InquiryVO> getInquiryList(InquiryVO vo){
		if(vo == null) {
			return mybatis.selectList("inquiryDAO.");
		} else {
			return mybatis.selectList("inquiryDAO.", vo);
		}
	}
}
