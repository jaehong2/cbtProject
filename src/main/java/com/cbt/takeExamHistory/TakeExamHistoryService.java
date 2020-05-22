package com.cbt.takeExamHistory;

import java.util.List;
import java.util.Map;

import com.cbt.takeExam.TakeExamVO;

public interface TakeExamHistoryService {
	
	void insertTakeExamHistory(TakeExamHistoryVO vo);
	
	void updateTakeExamHistory(TakeExamHistoryVO vo);
	
	void deleteTakeExamHistory(TakeExamHistoryVO vo);
	
	// 2019.07.16 성재민
	// 응시자 id로 삭제
	void deleteTakeExamHistoryForTakerId(TakeExamHistoryVO vo);
	
	TakeExamHistoryVO getTakeExamHistory(TakeExamHistoryVO vo);
	
	// 2019.07.16 성재민
	// 응시자 ID 와 시험 ID로 해당 응시자의 해당 시험 조회
	List<Map<String, Object>> getTakeExamHistoryForTakerIdAndExamIdList(TakeExamVO vo);
	
	// 2019.07.16 성재민
	// 시험 ID로 해당 시험 조회
	public List<Map<String, Object>> getTakeExamHistoryForExamIdList(TakeExamVO vo);
	
	// 2019.07.17 김재용
	// 응시자 ID로 총점 과 정답수 조회
	Map<String, Object> getTakeExamHistoryForSumPointAndCount(TakeExamVO vo);
}
