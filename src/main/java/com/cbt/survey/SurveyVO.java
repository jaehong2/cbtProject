package com.cbt.survey;

public class SurveyVO {

	private int surveyId;
	private int surveyType;
	private int takeExamId;
	private int examId;
	

	// 설문조사 문제 -> 항목 고정하여 테이블에 넣음 (7/19) june
	/*
	 * private int surveyQuestionNumber; private int contents; private int value;
	 */
	

	private int q1;
	private int q2;
	private int q3;
	private int q4;
	private int q5;
	private int q6;
	private int q7;
	private int q8;
	private int q9;
	
	private String q0;
	
	
	public String getQ0() {
		return q0;
	}

	public void setQ0(String q0) {
		this.q0 = q0;
	}

	public int getSurveyId() {
		return surveyId;
	}

	public void setSurveyId(int surveyId) {
		this.surveyId = surveyId;
	}
	
	// 설문조사 문제 -> 항목 고정하여 테이블에 넣음 (7/19) june
	/*
	 * public int getSurveyQuestionNumber() { return surveyQuestionNumber; }
	 * 
	 * public void setSurveyQuestionNumber(int surveyQuestionNumber) {
	 * this.surveyQuestionNumber = surveyQuestionNumber; }
	 * 
	 * public int getContents() { return contents; }
	 * 
	 * public void setContents(int contents) { this.contents = contents; }
	 * 
	 * public int getValue() { return value; }
	 * 
	 * public void setValue(int value) { this.value = value; }
	 */

	public int getSurveyType() {
		return surveyType;
	}

	public void setSurveyType(int surveyType) {
		this.surveyType = surveyType;
	}

	public int getTakeExamId() {
		return takeExamId;
	}
	
	public void setTakeExamId(int takeExamId) {
		this.takeExamId = takeExamId;
	}
	
	public int getQ1() {
		return q1;
	}

	public void setQ1(int q1) {
		this.q1 = q1;
	}

	public int getQ2() {
		return q2;
	}

	public void setQ2(int q2) {
		this.q2 = q2;
	}

	public int getQ3() {
		return q3;
	}

	public void setQ3(int q3) {
		this.q3 = q3;
	}

	public int getQ4() {
		return q4;
	}

	public void setQ4(int q4) {
		this.q4 = q4;
	}

	public int getQ5() {
		return q5;
	}

	public void setQ5(int q5) {
		this.q5 = q5;
	}

	public int getQ6() {
		return q6;
	}

	public void setQ6(int q6) {
		this.q6 = q6;
	}

	public int getQ7() {
		return q7;
	}

	public void setQ7(int q7) {
		this.q7 = q7;
	}

	public int getQ8() {
		return q8;
	}

	public void setQ8(int q8) {
		this.q8 = q8;
	}

	public int getQ9() {
		return q9;
	}

	public void setQ9(int q9) {
		this.q9 = q9;
	}
	
	public int getExamId() {
		return examId;
	}

	public void setExamId(int examId) {
		this.examId = examId;
	}
	
	@Override
	public String toString() {
		return "SurveyVO [surveyId=" + surveyId + ", surveyType=" + surveyType + ", takeExamId=" + takeExamId + "]";
	}
}
