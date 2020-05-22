package com.cbt.manager;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.cbt.exam.ExamVO;

@Repository
public class ManagerDAO {
	@Autowired
	private SqlSessionTemplate mybatis;
	
	public void insertManager(ManagerVO vo) {
		System.out.println("===> insertManager() 기능처리");
		mybatis.insert("ManagerDAO.insertManager", vo);
	}

	public void updateManager(ManagerVO vo) {
		System.out.println("===> updateManager() 기능처리");
		mybatis.update("ManagerDAO.updateManager", vo);
	}

	public void deleteManager(ManagerVO vo) {
		System.out.println("===> deleteManager() 기능처리");
		mybatis.delete("ManagerDAO.deleteManager", vo);
	}

	public ManagerVO getManager(ManagerVO vo) {
		System.out.println("===> getManager() 기능처리");
		return mybatis.selectOne("ManagerDAO.getManager", vo);
	}

	public List<ManagerVO> getManagerList(ManagerVO vo) {
		System.out.println("===> getManagerList() 기능처리");
		return mybatis.selectList("ManagerDAO.getManagerList", vo);
	}
	
	public ManagerTakerVO getManagerUserAccountView(ManagerTakerVO vo) {
		
		return mybatis.selectOne("ManagerDAO.getManagerUserAccountView", vo);
	}
	
	public ManagerTakerVO getManagerUserAccountList(ManagerTakerVO vo) {
		
		return mybatis.selectOne("ManagerDAO.getManagerUserAccountList", vo);
	}
	
	// 로그인 구현(7/9 생성, june)
	public ManagerVO loginManager(ManagerVO vo) {
		return mybatis.selectOne("ManagerDAO.managerLogin", vo);
	}
	
	// 2019.07.15 성재민
	// 모든 시험 가져오는 메소드
	public List<Map<String, String>> getManagerAllExam(ExamVO vo) {
		return mybatis.selectList("ManagerDAO.managerGetAllExam", vo);
	}
	
	// 2019.07.15 성재민
	// 시험 id로 하나만 검색
	public Map<String, String> getManagerExam(ExamVO vo) {
		return mybatis.selectOne("ManagerDAO.managerGetExamForExamVOId", vo);
	}
	
	// 2019.07.23 성재민
	// 모든 비공개 시험 정보 가져오기
	public List<Map<String, Object>> getManagerAllPrivateExamList() {
		return mybatis.selectList("ManagerDAO.getManagerAllPrivateExamList");
	}
	
	public List<ManagerVO> managerTakerListMain(ManagerTakerVO vo) {
		return mybatis.selectList("ManagerDAO.getManagerList", vo);
	}
	
	public int getExamCount(ExamVO vo) {
    	return mybatis.selectOne("ManagerDAO.getExamCount", vo);
    }
	
}
