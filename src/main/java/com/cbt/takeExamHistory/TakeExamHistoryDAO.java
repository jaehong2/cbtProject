package com.cbt.takeExamHistory;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.cbt.takeExam.TakeExamVO;

// 2019.07.16 성재민
// 메소드와 쿼리 연결
@Repository
public class TakeExamHistoryDAO {
	
	@Autowired
	private SqlSessionTemplate mybatis;
	
	// 2019.07.16 성재민
	// insert
	public void insertTakeExamHistory(TakeExamHistoryVO vo) {
		mybatis.insert("TakeExamHistoryDAO.insertTakeExamHistory", vo);
	}
	
	// 2019.07.16 성재민
	// update
	public void updateTakeExamHistory(TakeExamHistoryVO vo) {
		mybatis.update("TakeExamHistoryDAO.updateTakeExamHistory", vo);
	}
	
	// 2019.07.16 성재민
	// 단건 삭제
	public void deleteTakeExamHistory(TakeExamHistoryVO vo) {
		mybatis.delete("TakeExamHistoryDAO.deleteTakeExamHistory", vo);
	}

	// 2019.07.16 성재민
	// 응시자 id로 삭제
	public void deleteTakeExamHistoryForTakerId(TakeExamHistoryVO vo) {
		mybatis.delete("TakeExamHistoryDAO.deleteTakeExamHistoryForTakerId", vo);
	}
	
	// 2019.07.16 성재민
	// 단건 조회
	public TakeExamHistoryVO getTakeExamHistory(TakeExamHistoryVO vo) {
		return mybatis.selectOne("TakeExamHistoryDAO.getTakeExamHistory", vo);
	}
	
	// 2019.07.16 성재민
	// 응시자 ID 와 시험 ID로 해당 응시자의 해당 시험 조회
	public List<Map<String, Object>> getTakeExamHistoryForTakerIdAndExamIdList(TakeExamVO vo) {
		return mybatis.selectList("TakeExamHistoryDAO.getTakeExamHistoryForTakerIdAndExamIdList", vo);
	}
	
	
	// 2019.07.16 성재민
	// 시험 ID로 해당 시험 조회
	public List<Map<String, Object>> getTakeExamHistoryForExamIdList(TakeExamVO vo) {
		return mybatis.selectList("TakeExamHistoryDAO.getTakeExamHistoryForExamIdList", vo);
	}
	
	// 2019.07.17 김재용
	// 응시자 ID로 총점 과 정답수 조회
	public Map<String, Object> getTakeExamHistoryForSumPointAndCount(TakeExamVO vo) {
		return mybatis.selectOne("TakeExamHistoryDAO.getTakeExamHistoryForSumPointAndCount", vo);
	}
	
}
