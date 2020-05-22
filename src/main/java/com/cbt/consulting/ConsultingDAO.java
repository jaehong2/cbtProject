package com.cbt.consulting;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class ConsultingDAO {

	@Autowired
	private SqlSessionTemplate mybatis;
	
	public void insertConsulting(ConsultingVO vo) {
		mybatis.insert("consultingDAO.insertConsulting", vo);
	}
	
	public void updateConsulting(ConsultingVO vo) {
		mybatis.update("consultingDAO.updateConsulting", vo);
	}
	
	public void deleteConsulting(ConsultingVO vo) {
		mybatis.delete("consultingDAO.deleteConsulting", vo);
	}
	
	public ConsultingVO getConsulting(ConsultingVO vo) {
		
		return mybatis.selectOne("consultingDAO.getConsulting", vo);
	}
	
	public List<ConsultingVO> getConsultingList(ConsultingVO vo) {
		return mybatis.selectList("consultingDAO.getConsultingList", vo);
	}
	
	public int getConsultingCount(ConsultingVO vo) {
		return mybatis.selectOne("consultingDAO.getConsultingCount", vo);
	}
	//승환추가
	public List<ConsultingVO> managerConsultingList(ConsultingVO vo) {
		return mybatis.selectList("consultingDAO.managerConsultingList", vo);
	}
	//승환추가 07.15
	public ConsultingVO getManagerConsulting(ConsultingVO vo) {
		return mybatis.selectOne("consultingDAO.getManagerConsulting", vo);
	} 
	
	//승환추가 07.15
	public void managerUpdateConsulting(ConsultingVO vo) {
		mybatis.update("consultingDAO.managerUpdateConsulting", vo);
	}
	
	//승환추가 07.15
	public void managerConsultingDelete(ConsultingVO vo) {
		mybatis.delete("consultingDAO.managerConsultingDelete", vo);
	}
	
	//승환추가 07.15
	public void managerConsultingInsert(ConsultingVO vo) {
		mybatis.insert("consultingDAO.managerConsultingInsert", vo);
	}
	
	//승환추가 07.16 페이지 글수 가져오는 메소드
	public int getManagerConsultingCount(ConsultingVO vo) {
		return mybatis.selectOne("consultingDAO.getManagerConsultingCount", vo);
	}
	
	public List<ConsultingVO> mainConsultingList(ConsultingVO vo) {
		return mybatis.selectList("consultingDAO.mainConsultingList", vo);
	}

	
}
