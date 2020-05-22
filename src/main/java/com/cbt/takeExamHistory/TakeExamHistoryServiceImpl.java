package com.cbt.takeExamHistory;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.cbt.takeExam.TakeExamVO;

// 2019.07.16 성재민
// dao 와 연결
@Service
public class TakeExamHistoryServiceImpl implements TakeExamHistoryService {

	@Resource
	TakeExamHistoryDAO dao;
	
	public TakeExamHistoryServiceImpl() {
		
	}
	
	public void insertTakeExamHistory(TakeExamHistoryVO vo) {
		dao.insertTakeExamHistory(vo);
	}

	public void updateTakeExamHistory(TakeExamHistoryVO vo) {
		dao.updateTakeExamHistory(vo);
	}

	// 2019.07.16 성재민
	// 단건 삭제
	public void deleteTakeExamHistory(TakeExamHistoryVO vo) {
		dao.deleteTakeExamHistory(vo);
	}

	// 2019.07.16 성재민
	// 단건 조회
	public TakeExamHistoryVO getTakeExamHistory(TakeExamHistoryVO vo) {
		return dao.getTakeExamHistory(vo);
	}

	// 2019.07.16 성재민
	// 응시자 ID로 삭제
	@Override
	public void deleteTakeExamHistoryForTakerId(TakeExamHistoryVO vo) {
		dao.deleteTakeExamHistoryForTakerId(vo);
	}

	// 2019.07.16 성재민
	// 응시자 ID 와 시험 ID로 해당 응시자의 해당 시험 조회
	@Override
	public List<Map<String, Object>> getTakeExamHistoryForTakerIdAndExamIdList(TakeExamVO vo) {
		return dao.getTakeExamHistoryForTakerIdAndExamIdList(vo);
	}

	// 2019.07.16 성재민
	// 시험 ID로 해당 시험 조회
	@Override
	public List<Map<String, Object>> getTakeExamHistoryForExamIdList(TakeExamVO vo) {
		return dao.getTakeExamHistoryForExamIdList(vo);
	}

	// 2019.07.17 김재용
		// 응시자 ID로 총점 과 정답수 조회
	@Override
	public Map<String, Object> getTakeExamHistoryForSumPointAndCount(TakeExamVO vo) {
		return dao.getTakeExamHistoryForSumPointAndCount(vo);
	}
}
