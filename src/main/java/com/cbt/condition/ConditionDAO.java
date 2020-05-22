package com.cbt.condition;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class ConditionDAO {
	
	@Autowired
	private SqlSessionTemplate mybatis;
	
	public void insertCondition(ConditionVO vo) {
		System.out.println("===> insertCondition() 기능처리");
		mybatis.insert("ConditionDAO.insertCondition", vo);
	}
	
	public void updateCondition(ConditionVO vo) {
		System.out.println("===> updateCondition() 기능처리");
		mybatis.update("ConditionDAO.updateCondition", vo);
	}
	
	public void deleteCondition(ConditionVO vo) {
		System.out.println("===> deleteCondition() 기능처리");
		mybatis.delete("ConditionDAO.deleteCondition", vo);
	}
	
	public ConditionVO getCondition(ConditionVO vo) {
		System.out.println("===> getCondition() 기능처리");
		return mybatis.selectOne("ConditionDAO.getCondition", vo);
	}
	
	public List<ConditionVO> getConditionList(ConditionVO vo) {
		System.out.println("===> getConditionList() 기능 처리");
		return mybatis.selectList("ConditionDAO.getConditionList", vo);
	}

	public List<ConditionVO> getAllConditionList() {
		System.out.println("===> getAllConditionList() 기능 처리");
		return mybatis.selectList("ConditionDAO.getConditionList");
	}
	
	//190709 디테일 코드 조회 재홍 
	public List<ConditionVO> getConditionDetailList(String code) {
		System.out.println("===> getConditionDetailList() 기능 처리");
		return mybatis.selectList("ConditionDAO.getConditionDetailList",code);
	}
}
