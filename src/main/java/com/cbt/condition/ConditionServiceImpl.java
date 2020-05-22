package com.cbt.condition;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

@Service("conditionService")
public class ConditionServiceImpl implements ConditionService {
	@Resource
	ConditionDAO dao;
	
	@Override
	public void insertCondition(ConditionVO vo) {
		dao.insertCondition(vo);
	}

	@Override
	public void updateCondition(ConditionVO vo) {
		dao.updateCondition(vo);
	}

	@Override
	public void deleteCondition(ConditionVO vo) {
		dao.deleteCondition(vo);
	}
	
	@Override
	public ConditionVO getCondition(ConditionVO vo) {
		return dao.getCondition(vo);
	}
	
	@Override
	public List<ConditionVO> getConditionList(ConditionVO vo) {
		return dao.getConditionList(vo);
	}

	@Override
	public List<ConditionVO> getAllConditionList() {
		return dao.getAllConditionList();
	}

	//190709 마스터 상세 조회 재홍
	@Override
	public List<ConditionVO> getConditionDetailList(String code) {

		return dao.getConditionDetailList(code);
	}

	/*
	 * @Override public Map<String, Object> getConditionList(ConditionVO vo, Paging
	 * paging) { Map<String, Object> map = new HashMap<String, Object>();
	 * map.put("conditionList", dao.getConditionList(vo)); return map; }
	 */
	
}
