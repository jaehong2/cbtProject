package com.cbt.privateExam;

import java.util.List;

// 2019.07.23 성재민
// 비공개 시험에 응시하는 응시자를 저장하는 테이블 추가로 대응하는 Service 생성
public interface PrivateExamService {
	public void insertPrivateExam(PrivateExamVO vo);
	
	public void updatePrivateExam(PrivateExamVO vo);
	
	public void deletePrivateExam(PrivateExamVO vo);
	
	public PrivateExamVO getPrivateExam(PrivateExamVO vo);
	
	public List<PrivateExamVO> getPrivateExamListForExamId(PrivateExamVO vo);
	
	public List<PrivateExamVO> getAllPrivateExamList();
	
	// 2019.07.25 성재민
	// 응시자 id 로 검색
	public List<PrivateExamVO> getPrivateExamListForTakerId(PrivateExamVO vo);
}
