package com.cbt.privateExam;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

// 2019.07.23 성재민
// 비공개 시험에 응시하는 응시자를 저장하는 테이블 추가로 대응하는 DAO 생성
@Repository
public class PrivateExamDAO {
	@Autowired
	private SqlSessionTemplate mybatis;
	
	public void insertPrivateExam(PrivateExamVO vo) {
		mybatis.insert("privateExamDAO.insertPrivateExam", vo);
	}
	
	public void updatePrivateExam(PrivateExamVO vo) {
		mybatis.update("privateExamDAO.", vo);
	}
	
	public void deletePrivateExam(PrivateExamVO vo) {
		mybatis.delete("privateExamDAO.", vo);
	}
	
	public PrivateExamVO getPrivateExam(PrivateExamVO vo) {
		return mybatis.selectOne("privateExamDAO.", vo);
	}
	
	// 2019.07.25 성재민
	// 응시자 id 로 검색
	public List<PrivateExamVO> getPrivateExamListForTakerId(PrivateExamVO vo){
		return mybatis.selectList("privateExamDAO.getPrivateExamListForTakerId", vo);
	}
	
	public List<PrivateExamVO> getPrivateExamListForExamId(PrivateExamVO vo) {
		return mybatis.selectList("privateExamDAO.", vo);
	}
	
	public List<PrivateExamVO> getAllPrivateExamList() {
		return mybatis.selectList("privateExamDAO.");
	}
}
