package com.cbt.estimate;

import java.util.List;
import java.util.Map;

import com.cbt.category.CategoryVO;
import com.cbt.common.Paging;



public interface EstimateService {
	
	void insertEstimate(EstimateVO vo);
	
	void updateEstimate(EstimateVO vo);
	
	void deleteEstimate(EstimateVO vo);
	
	EstimateVO getEstimate(EstimateVO vo);
	
	List<EstimateVO> getEstimateList(EstimateVO vo);
	
	public Map<String, Object> getEstimateList(EstimateVO vo, Paging paging);
	
	
	int getCateoryId(EstimateVO vo);
	
	//카테고리 nameList를 가져오는 메서드
	List<EstimateVO> getCateoryNameList(CategoryVO vo);
	
	//////////////////////결제 상태/////////////////////////////
	//1.출제전 -> 2. 출제중
	void updatesTradeProgressExchange2(int estimateId);
	//2.출제중 -> 3. 출제완료는 시험에서 결제완료수정하면
	void updatesTradeProgressExchange3(int estimateId);
	//3.출제완료 -> 4.결제 결제대기
	void updatesTradeProgressExchange4(EstimateVO vo);
	//4.결제 대기 -> 5.결제 완료
	void updatesTradeProgressExchange5(EstimateVO vo);
	
}
