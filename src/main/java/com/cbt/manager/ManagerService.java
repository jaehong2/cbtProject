package com.cbt.manager;

import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.List;
import java.util.Map;

import org.springframework.web.multipart.MultipartFile;

import com.cbt.candidate.CandidateVO;
import com.cbt.common.Paging;
import com.cbt.company.CompanyVO;
import com.cbt.exam.ExamVO;

public interface ManagerService {
	// 글 등록
	void insertManager(ManagerVO vo);

	// 글 수정
	void updateManager(ManagerVO vo);

	// 글 삭제
	void deleteManager(ManagerVO vo);

	// 글 상세 조회
	ManagerVO getManager(ManagerVO vo);

	// 글 목록 조회
	List<ManagerVO> getManagerList(ManagerVO vo);
	
	// 7/5 재용추가
	ManagerTakerVO getManagerUserAccountView(ManagerTakerVO vo);

	public Map<String, Object> getManagerList(ManagerVO vo, Paging paging);
	
	// 기업목록 조회
	List<CompanyVO> managerAccountList(CompanyVO vo);

	// 로그인 처리 (7/9 추가, June)
	ManagerVO loginManager(ManagerVO vo);

	// 2019.07.15 성재민
	// 엑셀 업로드
	public List<CandidateVO> uploadExcelFile(MultipartFile excelFile);
	
	// 2019.07.15 성재민
	// 모든 시험 리턴
	public Map<String, Object> getManagerAllExam(ExamVO vo, Paging paging);
	
	// 2019.07.15 성재민
	// 시험 id로 하나만 검색
	public Map<String, String> getManagerExam(ExamVO vo);
	
	// 2019.07.23 성재민
	// 모든 비공개 시험 정보 가져오기
	public List<Map<String, Object>> getManagerAllPrivateExamList();

}
