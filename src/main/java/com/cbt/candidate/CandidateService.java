package com.cbt.candidate;

import java.util.List;
import java.util.Map;

import com.cbt.common.Paging;

public interface CandidateService {
	// 글 등록
	void insertCandidate(CandidateVO vo);

	// 글 수정
	void updateCandidate(CandidateVO vo);

	// 글 삭제
	void deleteCandidate(CandidateVO vo);

	// 글 상세 조회
	CandidateVO getCandidate(CandidateVO vo);

	// 로그인 --> 통합로그인 활용하게 됨으로써 주석처리
	CandidateVO commonLogin(CandidateVO vo);

	// 응시자 정보 가져올 리스트 -- 이승환
	List<CandidateVO> getCandidateList(CandidateVO vo);
	
	// 응시자 정보 가져올 리스트, 페이징추가
	public Map<String, Object> managerCandidateList(CandidateVO vo, Paging paging);

	// 2019.07.09
	// 시험정보
	List<Map<String, String>> getExamList(CandidateVO vo);

	public Map<String, Object> getCandidateList(CandidateVO vo, Paging paging);

	// ID 중복체크
	int idcheck(CandidateVO vo);

	// 전체 시험일정 조회
	List<Map<Object, String>> candidateScheduleCheck();

	// 전체 시험일정 조회_페이징처리
	int ExamScheduleCount();

	// temp
	Map<Object, Object> candidateScheduleCheckPage(Paging paging, String takerId);
	
	// 카카오 아이디 insert
	public int insertKakaoCandidate(CandidateVO vo);

	// ID 찾기
	String findID(CandidateVO vo);
	
	// 이메일 중복체크
	int emailcheck(CandidateVO vo);

}
