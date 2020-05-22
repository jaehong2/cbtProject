package com.cbt.survey;

import java.util.List;
import java.util.Map;

public interface SurveyService {

	void insertSurvey(SurveyVO vo);
	
	void updateSurvey(SurveyVO vo);
	
	void deleteSurvey(SurveyVO vo);
	
	SurveyVO getSurvey(SurveyVO vo);
	
	// examId로 조회하여 난이도 등 조회 (7/21, june)
	public List<Map<String, Object>> getSurveyList(SurveyVO vo);
	
}
