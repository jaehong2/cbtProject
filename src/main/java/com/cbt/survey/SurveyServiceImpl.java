package com.cbt.survey;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

@Service
public class SurveyServiceImpl implements SurveyService {

	@Resource
	SurveyDAO dao;
	
	public void insertSurvey(SurveyVO vo) {
		dao.insertSurvey(vo);
	}

	public void updateSurvey(SurveyVO vo) {
		dao.updateSurvey(vo);
	}

	public void deleteSurvey(SurveyVO vo) {
		dao.deleteSurvey(vo);
	}

	public SurveyVO getSurvey(SurveyVO vo) {
		return dao.getSurvey(vo);
	}

	// examId로 조회하여 난이도 등 조회 (7/21, june)
	@Override
	public List<Map<String, Object>> getSurveyList(SurveyVO vo) {
		return dao.getSurveyList(vo);
	}

}
