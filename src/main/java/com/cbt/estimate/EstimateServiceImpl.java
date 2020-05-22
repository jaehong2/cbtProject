package com.cbt.estimate;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.cbt.category.CategoryVO;
import com.cbt.common.Paging;

@Service
public class EstimateServiceImpl implements EstimateService {

	@Resource
	EstimateDAO estimateDAO;
	@Override
	public void insertEstimate(EstimateVO vo) {
		
		estimateDAO.insertEstimate(vo);
	}
	@Override
	public void updateEstimate(EstimateVO vo) {
		
		estimateDAO.updateEstimate(vo);
	}
	@Override
	public void deleteEstimate(EstimateVO vo) {
		
		estimateDAO.deleteEstimate(vo);
	}
	@Override
	public EstimateVO getEstimate(EstimateVO vo) {
		
		return estimateDAO.getEstimate(vo);
	}

	@Override
	public List<EstimateVO> getEstimateList(EstimateVO vo) {
		return estimateDAO.getEstimateList(vo);
	}
	
	@Override
	public Map<String, Object> getEstimateList(EstimateVO vo, Paging paging) {
		//출력건수
				paging.setPageUnit(10);
				//페이지번호 파라미터
				if(paging.getPage() == null) {
					paging.setPage(1);
				}
				// 시작/마지막 레코드 번호
				vo.setStart(paging.getFirst());
				vo.setEnd(paging.getLast());
				// 전체 건수
				paging.setTotalRecord(estimateDAO.getCount(vo));
				
				Map<String, Object> map = new HashMap<String, Object>();
				map.put("estimateList", estimateDAO.getEstimateList(vo));
				map.put("paging", paging);
				return map;
	}
	
	
	@Override
	public int getCateoryId(EstimateVO vo) {
		return estimateDAO.getCateoryId(vo);
	}
	@Override
	public List<EstimateVO> getCateoryNameList(CategoryVO vo) {
		return estimateDAO.getCateoryNameList(vo);
	}
	
	@Override
	public void updatesTradeProgressExchange2(int estimateId) {
		estimateDAO.updatesTradeProgressExchange2(estimateId);
		
	}
	@Override
	public void updatesTradeProgressExchange3(int estimateId) {
		estimateDAO.updatesTradeProgressExchange3(estimateId);
		
	}
	@Override
	public void updatesTradeProgressExchange4(EstimateVO vo) {
		estimateDAO.updatesTradeProgressExchange4(vo);
		
	}
	@Override
	public void updatesTradeProgressExchange5(EstimateVO vo) {
		estimateDAO.updatesTradeProgressExchange5(vo);
		
	}
	

	

}
