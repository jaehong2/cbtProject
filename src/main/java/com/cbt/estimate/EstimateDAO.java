package com.cbt.estimate;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.cbt.category.CategoryVO;

@Repository
public class EstimateDAO {
	//19 07 04 재홍 mybatis  "" 구문 연결
	@Autowired
	private SqlSessionTemplate mybatis;
	
	public void insertEstimate(EstimateVO vo) {
		
		mybatis.insert("EstimateDAO.insertEstimate", vo);
	}
	
	public void updateEstimate(EstimateVO vo) {
		
		mybatis.update("EstimateDAO.updateEstimate", vo);
	}
	
	public void deleteEstimate(EstimateVO vo) {
		
		mybatis.delete("EstimateDAO.deleteEstimate", vo);
	}
	
	public EstimateVO getEstimate(EstimateVO vo) {
		return mybatis.selectOne("EstimateDAO.getEstimate", vo);
	}
	
	public List<EstimateVO> getEstimateList(EstimateVO vo) {
		return mybatis.selectList("EstimateDAO.getEstimateList", vo);
	}
	
	
	 //페이지 글수 가져오는 메서드
    public int getCount(EstimateVO vo) {
    	return mybatis.selectOne("EstimateDAO.getCount", vo);
    }
    
    public int getCateoryId(EstimateVO vo) {
    	return mybatis.selectOne("EstimateDAO.getCateoryId",vo);
    }
    
    //카테고리 전체이름 가져오는 메서드
    public List<EstimateVO> getCateoryNameList(CategoryVO vo){
    	return mybatis.selectList("EstimateDAO.getCateoryNameList");
    }
   
  //상태 1. -> 2. 변경
    public void updatesTradeProgressExchange2(int estimateId) {
		mybatis.update("EstimateDAO.updatesTradeProgressExchange2", estimateId);
	}
    
    //상태 2. -> 3. 변경
    public void updatesTradeProgressExchange3(int estimateId) {
		mybatis.update("EstimateDAO.updatesTradeProgressExchange3", estimateId);
	}
    
    //상태 3. -> 4. 변경
    public void updatesTradeProgressExchange4(EstimateVO vo) {
		mybatis.update("EstimateDAO.updatesTradeProgressExchange4", vo);
	}
    //상태 4. -> 5. 변경
    public void updatesTradeProgressExchange5(EstimateVO vo) {
		
		mybatis.update("EstimateDAO.updatesTradeProgressExchange5", vo);
	}
}
