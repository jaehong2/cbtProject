package com.cbt.question;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.poi.openxml4j.opc.OPCPackage;
import org.apache.poi.xssf.usermodel.XSSFCell;
import org.apache.poi.xssf.usermodel.XSSFRow;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.cbt.candidate.CandidateVO;
import com.cbt.common.Paging;
import com.cbt.takeExam.TakeExamVO;



// 7/2 문제 서비스impl 작성    -재용

@Service
public class QuestionServiceImpl implements QuestionService {
	
	@Resource
	QuestionDAO questionDAO;
	
	public QuestionServiceImpl() {
	}
	
	public void insertQuestion(QuestionVO vo) {
		questionDAO.insertQuestion(vo);
	}

	public void insertTakeExamHistory(TakeExamVO vo) {
		questionDAO.insertTakeExamHistory(vo);
	}

	public void updateTakeExamHistory(QuestionVO vo) {
		questionDAO.updateTakeExamHistory(vo);
	}

	public void deleteQuestion(QuestionVO vo) {
		questionDAO.deleteQuestion(vo);
	}

	public QuestionVO getQuestion(QuestionVO vo) {
		
		return questionDAO.getQuestion(vo);
	}

	public Map<String, Object> getQuestionList(QuestionVO vo, Paging paging) {

		return null;
	}

	public void getTestList() {
		
	}

	public List<Map<String, Object>> getTestList(Map<String, Object> map) {
		System.out.println("2 " + map);
		questionDAO.getTestList(map);
		System.out.println("3 "+map.get("result"));
		
		return null;
	}

	public QuestionVO getTestResultList(QuestionVO vo) {
		vo = questionDAO.getTestResultList(vo);
		System.out.println(vo.getExamId());
		System.out.println(vo.getExamName());
		System.out.println(vo.getPassingScore());
		System.out.println(vo.getPoint());
		System.out.println(vo.getTakeExamId());
		System.out.println(vo.getTakerName());
		
		return vo;
	}
	
	public List<Map<String, Object>> candidateRightAnswerList(TakeExamVO vo) {
		return questionDAO.candidateRightAnswerList(vo);
	}
	
	public List<QuestionVO> candidateTakeExamList(QuestionVO vo) {
		List<QuestionVO> list = questionDAO.candidateTakeExamList(vo);
		
		return list;
	}

	public List<Map<String, Object>> getTestStart(TakeExamVO vo) {
		List<Map<String, Object>> list = questionDAO.getTestStart(vo);
		return list;
	}

	public int getSetCount(TakeExamVO vo) {
		
		return questionDAO.getSetCount(vo);
	}
	
	public int getTakeCount(TakeExamVO vo) {
		
		return questionDAO.getTakeCount(vo);
	}
	
	public int getHistoryCount(TakeExamVO vo) {
		
		return questionDAO.getHistoryCount(vo);
	}

	public List<Map<String, Object>> candidateExaminationList(CandidateVO vo) {
		
		return questionDAO.candidateExaminationList(vo);
	}

	public Map<String, Object> candidateExaminationListDetail(TakeExamVO vo) {
		
		return questionDAO.candidateExaminationListDetail(vo);
	}
	
	public void rightAnswer(int tId) {
		questionDAO.rightAnswer(tId);
	}
	
	public int takeExamScoreNullCheck(TakeExamVO vo) {
		return questionDAO.takeExamScoreNullCheck(vo);
	}
	
	public void rightLastAnswer(TakeExamVO vo) {
		questionDAO.rightLastAnswer(vo);
	}

	public List<QuestionVO> managerAllQuestionList() {
		return questionDAO.managerAllQuestionList();
	}
	
	public List<QuestionVO> uploadExcelFile(MultipartFile excelFile) {
		List<QuestionVO> list = new ArrayList<QuestionVO>();
		try {
			OPCPackage opcPackage = OPCPackage.open(excelFile.getInputStream());
			XSSFWorkbook workbook = new XSSFWorkbook(opcPackage);
			// 첫번째 시트 불러오기
			XSSFSheet sheet = workbook.getSheetAt(0);

			// 한줄씩 반복문
			for (int i = 1; i < sheet.getLastRowNum() + 1; ++i) {
				XSSFRow row = sheet.getRow(i);
				QuestionVO questionVO = new QuestionVO();

				// 행이 존재하기 않으면 패스
				if (row == null) {
					continue;
				}
			// 엑셀 파일의 각각의 값 읽어 오기
			// 엑셀 파일과 vo 객체가 타입이 맞지 않는 경우엔 타입을 맞춰서 입력 하여야 함.
			//for(int j = 0; j < row.getLastCellNum(); ++j) {
				
			// 엑셀 파일타이
				XSSFCell cell = row.getCell(0);
				if(cell != null) {
					questionVO.setQuestionId(Integer.parseInt(cell.getStringCellValue()));
				}
				
				cell = row.getCell(1);
				if(cell != null) {
					questionVO.setQuestionContent(cell.getStringCellValue());
				}
				
				cell = row.getCell(2);
				if(cell != null) {
					questionVO.setExample1(cell.getStringCellValue());
				}
				
				cell = row.getCell(3);
				if(cell != null) {
					questionVO.setExample2(cell.getStringCellValue());
				}
				
				cell = row.getCell(4);
				if(cell != null) {
					questionVO.setExample3(cell.getStringCellValue());
				}
				
				cell = row.getCell(5);
				if(cell != null) {
					questionVO.setExample4(cell.getStringCellValue());
				}
				
				cell = row.getCell(6);
				if(cell != null) {
					questionVO.setRightAnswer(cell.getStringCellValue());
				}
				
				cell = row.getCell(7);
				if(cell != null) {
					questionVO.setRightCommentary(cell.getStringCellValue());
				}
				
				cell = row.getCell(8);
				if(cell != null) {
					questionVO.setLevelOfDifficulty(Integer.parseInt(cell.getStringCellValue()));
				}
				
				cell = row.getCell(9);
				if(cell != null) {
					questionVO.setCategoryId(Integer.parseInt(cell.getStringCellValue()));
				}
				
				cell = row.getCell(10);
				if(cell != null) {
					questionVO.setQuestionType(cell.getStringCellValue());
				}
				
				list.add(questionVO);
			}
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	
	public void insertQuestionList(List<QuestionVO> vo) {
		questionDAO.insertQuestionList(vo);
	}

	public QuestionVO selectExamName(int examId) {
		return questionDAO.selectExamName(examId);
	}

	public QuestionVO candidateTestResult(QuestionVO vo) {
		
		return questionDAO.candidateTestResult(vo);
	}

	@Override
	public List<Map<String, Object>> getQuestionSetList(int examId) {
		return questionDAO.getQuestionSetList(examId);
	}

}
