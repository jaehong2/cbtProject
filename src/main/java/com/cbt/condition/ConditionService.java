package com.cbt.condition;

import java.util.List;

public interface ConditionService {

	// 상태 등록
	void insertCondition(ConditionVO vo);
	
	// 상태 수정
	void updateCondition(ConditionVO vo);
	
	// 상태 삭제
	void deleteCondition(ConditionVO vo);
	
	// 상태목록 상세조회
	ConditionVO getCondition(ConditionVO vo);
	
	// 상태 목록 조회
	List<ConditionVO> getConditionList(ConditionVO vo);
	
	// 상태 목록 조회
	List<ConditionVO> getAllConditionList();
	
	//190709 마스터 상세 조회 재홍
	public List<ConditionVO> getConditionDetailList(String code);
	/* public Map<String, Object> getConditionList(ConditionVO vo); */
	
}
