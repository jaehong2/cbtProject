package com.cbt.privateExam;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

// 2019.07.23 성재민
// 비공개 시험에 응시하는 응시자를 저장하는 테이블 추가로 대응하는 ServiceImpl 생성
@Service
public class PrivateExamServiceImpl implements PrivateExamService {
	@Resource
	PrivateExamDAO dao;
	
	@Override
	public void insertPrivateExam(PrivateExamVO vo) {
		dao.insertPrivateExam(vo);
	}

	@Override
	public void updatePrivateExam(PrivateExamVO vo) {
		dao.updatePrivateExam(vo);
	}

	@Override
	public void deletePrivateExam(PrivateExamVO vo) {
		dao.deletePrivateExam(vo);
	}

	@Override
	public PrivateExamVO getPrivateExam(PrivateExamVO vo) {
		return dao.getPrivateExam(vo);
	}

	@Override
	public List<PrivateExamVO> getPrivateExamListForExamId(PrivateExamVO vo) {
		return dao.getPrivateExamListForExamId(vo);
	}

	@Override
	public List<PrivateExamVO> getAllPrivateExamList() {
		return dao.getAllPrivateExamList();
	}

	@Override
	public List<PrivateExamVO> getPrivateExamListForTakerId(PrivateExamVO vo) {
		return dao.getPrivateExamListForTakerId(vo);
	}

}
