package com.cbt.candidate;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Repository;

@Repository
public class CandidateDAO {
	
	BCryptPasswordEncoder scpwd = new BCryptPasswordEncoder();
	
	@Autowired
	private SqlSessionTemplate mybatis;
	
	//2019.07.01 장세준 - insert
	public void insertCandidate(CandidateVO vo) {
		mybatis.insert("candidateDAO.insertCandidate", vo);
	}

	public void updateCandidate(CandidateVO vo) {
		mybatis.update("candidateDAO.updateCandidate", vo);
	}

	public void deleteCandidate(CandidateVO vo) {
		mybatis.delete("candidateDAO.deleteCandidate", vo);
	}

	// 2019.07.09
	// 시험정보 가져옴
	public List<Map<String, String>> getExamList(CandidateVO vo) {
		return mybatis.selectList("candidateDAO.getExamList", vo);
	}	
	
	//SECURITY 통합로그인
	  public CandidateVO commonLogin(CandidateVO vo) { 
		 
		  return  mybatis.selectOne("candidateDAO.commonLogin", vo); 
	  }
	  
	  
	// 암호화 로그인 전 --> 통합로그인 사용
	  
	/*
	 * public CandidateVO loginCandidate(CandidateVO vo) { return
	 * mybatis.selectOne("candidateDAO.candidateLogin", vo); }
	 */
	 
	 
	
	// 암호화 로그인 -- 테스트 기간
	
	
	public CandidateVO loginCandidate(CandidateVO vo) {
		String pw = mybatis.selectOne("candidateDAO.getTakerPassword", vo);
		String rawPw = vo.getTakerPassword();
		if (scpwd.matches(rawPw, pw)) {
			System.out.println("비밀번호 일치");
			System.out.println(pw + rawPw);
			vo.setTakerPassword(pw);
		} else {
			System.out.println("비밀번호 불일치");
			System.out.println(pw + rawPw);
			return null;
		}
		return mybatis.selectOne("candidateDAO.candidateLogin", vo);
	}
	 
	 
	/*
	 * public CandidateVO loginCandidate(CandidateVO vo) { String pw =
	 * mybatis.selectOne("candidateDAO.getTakerPassword", vo); String rawPw =
	 * vo.getTakerPassword(); if (scpwd.matches(rawPw, pw)) {
	 * System.out.println("비밀번호 일치"); System.out.println(pw + rawPw);
	 * vo.setTakerPassword(pw); } else { System.out.println("비밀번호 불일치");
	 * System.out.println(pw + rawPw); return null; } return
	 * mybatis.selectOne("candidateDAO.candidateLogin", vo); }
	 */
	
	
	public int getCount(CandidateVO vo) {
		return mybatis.selectOne("candidateDAO.getCandidate", vo);
	}

	public int idcheck(CandidateVO vo) {
		return mybatis.selectOne("candidateDAO.idcheck",vo);
	}
	
	// 2019.07.09
	public CandidateVO getCandidate(CandidateVO vo) {
		return mybatis.selectOne("candidateDAO.getCandidate", vo);
	}
	
	// 이승환이 쓰고있음
	public List<CandidateVO> getCandidateList(CandidateVO vo) {
		return mybatis.selectList("candidateDAO.getCandidateList", vo);
	}
	
	public int getCount() {
		return mybatis.selectOne("candidateDAO.getCount");
	}
	
	// 전체 시험 스케쥴 가져옴
	public List<Map<Object, String>> candidateScheduleCheck() {
		
		return mybatis.selectList("candidateDAO.candidateScheduleCheck");
	}

	
	
	
	// TEMP

	public List<Map<Object, Object>> candidateScheduleCheckPage(CandidateVO vo){
		return mybatis.selectList("candidateDAO.candidateScheduleCheckPage", vo);
	}

	public int examCount() {
		return mybatis.selectOne("candidateDAO.examCount");
	}
	
	public List<CandidateVO> managerCandidateList(CandidateVO vo) {
		return mybatis.selectList("ManagerDAO.managerCandidateList", vo);
	}
	
	//승환추가 07.17 페이지 글수 가져오는 메소드
	public int getManagerCandidateCount(CandidateVO vo) {
		return mybatis.selectOne("candidateDAO.getManagerCandidateCount", vo);
	}

	public int insertKakaoCandidate(CandidateVO vo) {
		System.out.println("-- -- -- Customer Kakao_Info Insert -- -- --");
		return mybatis.insert("candidateDAO.insertKakaoCandidate", vo);
	}

	public String findID(CandidateVO vo) {
		return mybatis.selectOne("candidateDAO.findID",vo);
	}

	public int emailcheck(CandidateVO vo) {
		return mybatis.selectOne("candidateDAO.emailcheck",vo);
	}
	
}