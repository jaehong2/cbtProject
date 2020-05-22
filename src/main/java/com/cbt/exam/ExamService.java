package com.cbt.exam;

import java.util.List;
import java.util.Map;

import com.cbt.common.Paging;
import com.cbt.company.CompanyVO;
import com.cbt.consulting.ConsultingVO;
import com.cbt.manager.ManagerVO;

public interface ExamService {
	
	void insertExam(ExamVO vo);
	
	void updateExam(ExamVO vo);
	
	void deleteExam(ExamVO vo);
	
	ExamVO getExam(ExamVO vo);
	
	List<Map<String, Object>> getExamTaker(ExamVO vo);
	
	List<ExamVO> getExamList(ExamVO vo);
	
	public Map<String, Object> getExamList(CompanyVO vo , Paging paging);

	// temp(7/22) --> 삭제예정
	List<ExamVO> getExamSurveyList(ManagerVO vo);
	
	List<ExamVO> mainExamList(ExamVO vo);
	
	// 2019.07.31 성재민
	// 완료된 시험 리스트를 가져오는 메소드
	// 현재는 테스트 구간이라 모든 값을 가져옴 수정 필요.
	List<ExamVO> getCompleteExamList(CompanyVO vo);
	
	List<ExamVO> getExamList(CompanyVO vo);
}
