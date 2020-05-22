package com.cbt.exam;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.cbt.common.Paging;
import com.cbt.company.CompanyDAO;
import com.cbt.company.CompanyVO;
import com.cbt.consulting.ConsultingVO;
import com.cbt.manager.ManagerVO;

@Service
public class ExamServiceImpl implements ExamService {

	@Resource
	ExamDAO dao;
	
	@Override
	public void insertExam(ExamVO vo) {
		dao.insertExam(vo);
	}
	
	@Override
	public void updateExam(ExamVO vo) {
		dao.updateExam(vo);
	}
	
	@Override
	public void deleteExam(ExamVO vo) {
		dao.deleteExam(vo);
	}
	
	@Override
	public ExamVO getExam(ExamVO vo) {
		return dao.getExam(vo);
	}

	// 2019.07.08 성재민
	// 시험 리스트를 가져오는 메소드
	@Override
	public Map<String, Object> getExamList(CompanyVO vo, Paging paging) {
		
		paging.setPageUnit(10);
		//페이지번호 파라미터
		if(paging.getPage() == null) {
			paging.setPage(1);
		}
		// 시작/마지막 레코드 번호
		vo.setStart(paging.getFirst());
		vo.setEnd(paging.getLast());
		// 전체 건수
		paging.setTotalRecord(dao.getExamCount(vo));
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("companyExamList", dao.getExamList(vo));
		map.put("paging", paging);
		return map;
	}
	@Override
	public List<ExamVO> getExamList(ExamVO vo) {
		// TODO Auto-generated method stub
		return null;
	}
	
	// temp(7/22) --> 삭제예정
	@Override
	public List<ExamVO> getExamSurveyList(ManagerVO vo) {
		return dao.getExamSurveyList(vo);
	}

	@Override
	public List<ExamVO> mainExamList(ExamVO vo) {
		return dao.mainExamList(vo);
	}

	// 2019.07.31 성재민
	// 완료된 시험 리스트를 가져오는 메소드
	// 현재는 테스트 구간이라 모든 값을 가져옴 수정 필요.
	@Override
	public List<ExamVO> getCompleteExamList(CompanyVO vo) {
		return dao.getCompleteExamList(vo);
	}

	@Override
	public List<ExamVO> getExamList(CompanyVO vo) {
		return dao.getExamList(vo);
	}

	@Override
	public List<Map<String, Object>> getExamTaker(ExamVO vo) {
		return dao.getExamTaker(vo);
	}
}
