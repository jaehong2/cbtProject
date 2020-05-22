package com.cbt.takeExam;

import java.util.List;
import java.util.Map;

import com.cbt.common.Paging;

public interface TakeExamService {
	
	TakeExamVO selectTakeExamId(TakeExamVO vo);
	
	void insertTakeExam(TakeExamVO vo);
	
	void updateTakeExam(TakeExamVO vo);
	
	void deleteTakeExam(TakeExamVO vo);
	
	TakeExamVO getTakeExam(TakeExamVO vo);

	Map<String, Object> getExamList(TakeExamVO vo, Paging paging);
	
	int getExamCount();
	
	// 2019.07.16 성재민
	// 시험 iD 로 검색
	public List<TakeExamVO> getTakeExamForExamId(TakeExamVO vo);
	
}
