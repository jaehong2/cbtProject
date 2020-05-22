package com.cbt.question;

import java.util.List;
import java.util.Map;

import org.springframework.web.multipart.MultipartFile;

import com.cbt.candidate.CandidateVO;
import com.cbt.common.Paging;
import com.cbt.takeExam.TakeExamVO;


//  7/2 문제 서비스 작성    -재용
public interface QuestionService {
	
	void insertQuestion(QuestionVO vo);
	
	void insertQuestionList(List<QuestionVO> vo);
	
	void insertTakeExamHistory(TakeExamVO vo);
	
	void updateTakeExamHistory(QuestionVO vo);
	
	void deleteQuestion(QuestionVO vo);
	
	void rightAnswer(int tId);
	
	void rightLastAnswer(TakeExamVO vo);
	
	int takeExamScoreNullCheck(TakeExamVO vo);
	
	int getSetCount(TakeExamVO vo);
	
	int getTakeCount(TakeExamVO vo);
	
	int getHistoryCount(TakeExamVO vo);
	
	QuestionVO candidateTestResult(QuestionVO vo);
	
	List<Map<String, Object>> getTestStart(TakeExamVO vo);
	
	List<QuestionVO> candidateTakeExamList(QuestionVO vo);
	
	List<QuestionVO> managerAllQuestionList();
	
	List<Map<String, Object>> candidateRightAnswerList(TakeExamVO vo);
	
	QuestionVO getTestResultList(QuestionVO vo);
	
	List<Map<String, Object>> getTestList(Map<String, Object> map);
	
	QuestionVO getQuestion(QuestionVO vo);
	
	Map<String, Object> getQuestionList(QuestionVO vo, Paging paging);
	
	List<Map<String, Object>> candidateExaminationList(CandidateVO vo);
	
	Map<String, Object> candidateExaminationListDetail(TakeExamVO vo);
	
	public List<QuestionVO> uploadExcelFile(MultipartFile excelFile);
	
	QuestionVO selectExamName(int examId);
	
	List<Map<String, Object>>getQuestionSetList(int examId);

}
