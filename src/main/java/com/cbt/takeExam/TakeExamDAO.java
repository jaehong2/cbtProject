package com.cbt.takeExam;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class TakeExamDAO {
	
	@Autowired
	private SqlSessionTemplate mybatis;
	
	public TakeExamVO selectTakeExamId(TakeExamVO vo) {
		
		return mybatis.selectOne("takeExamDAO.selectTakeExamId", vo);
	}
	
	public void insertTakeExam(TakeExamVO vo) {
		
		mybatis.insert("takeExamDAO.insertTakeExam", vo);
	}
	
	public void updateTakeExam(TakeExamVO vo) {
		
		mybatis.update("", vo);
	}
	
	public void deleteTakeExam(TakeExamVO vo) {
		
		mybatis.delete("", vo);
	}
	
	// 2019.07.16 성재민
	// ID 로 단건 조회 추가
	public TakeExamVO getTakeExam(TakeExamVO vo) {
		return mybatis.selectOne("takeExamDAO.getTakeExam", vo);
	}
	
	public int getExamCount(TakeExamVO vo) {
		return mybatis.selectOne("takeExamDAO.getExamCount", vo);
	}

	public List<TakeExamVO> getExamList(TakeExamVO vo) {
		if(vo == null) {
			return mybatis.selectList("takeExamDAO.getExamList");
		} else {
			return mybatis.selectList("takeExamDAO.getExamList", vo);
		}
	}
	
	// 2019.07.16 성재민
	// 시험 iD 로 검색
	public List<TakeExamVO> getTakeExamForExamId(TakeExamVO vo) {
		return mybatis.selectList("takeExamDAO.getTakeExamForExamId", vo);
	}
}
