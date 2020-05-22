package com.cbt.takeExam;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.cbt.common.Paging;

@Service
public class TakeExamServiceImpl implements TakeExamService {

	@Resource
	TakeExamDAO dao;
	public TakeExamServiceImpl() {
	}
	
	public TakeExamVO selectTakeExamId(TakeExamVO vo) {
		
		return dao.selectTakeExamId(vo);
	}
	
	public void insertTakeExam(TakeExamVO vo) {
		
		dao.insertTakeExam(vo);
	}

	public void updateTakeExam(TakeExamVO vo) {
		
		dao.updateTakeExam(vo);
	}

	public void deleteTakeExam(TakeExamVO vo) {
		
		dao.deleteTakeExam(vo);
	}

	public TakeExamVO getTakeExam(TakeExamVO vo) {
		
		return dao.getTakeExam(vo);
	}

	@Override
	public Map<String, Object> getExamList(TakeExamVO vo, Paging paging) {
		if(paging != null) {
			
			if(paging.getPage() == null) {
			paging.setPage(1);
		}
		vo.setStart(paging.getFirst());
		vo.setEnd(paging.getLast());
		
		paging.setTotalRecord(dao.getExamCount(vo));
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("ExamList", dao.getExamList(vo));
		map.put("paging", paging);
		return map;
	}
	return null;
	}

	@Override
	public int getExamCount() {
		return dao.getExamCount(null);
	}

	// 2019.07.16 성재민
	// 시험 iD 로 검색
	@Override
	public List<TakeExamVO> getTakeExamForExamId(TakeExamVO vo) {
		return dao.getTakeExamForExamId(vo);
	}

}
