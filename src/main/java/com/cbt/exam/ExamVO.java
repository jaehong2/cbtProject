package com.cbt.exam;

public class ExamVO {

	// 2019.07.08 성재민
	// examId, estimateId 타입 int 로 변경

	// 2019.07.11 성재민
	// 시간 변수들 문자열로 수정

	private int 	examId;
	private String 	examStartTime;
	private String 	examEndTime;
	private int 	questionQuantity;
	private int 	estimateId;
	private int 	numberOfTimes;
	private int 	passingScore;
	private int 	applicants;
	private String 	examName;
	private String 	examStatus;
	private String 	disclosureStatus;
	private String 	setExamStatus;
	private String 	examDescriptionSimple;
	private String 	examDescriptionDetail;
	private int 	start;
	private int 	end;
	private String  companyId;
	private String  sort;
	private String  searchExam;
	private String  searchKeyword;
	private String  examStatusName;
	
	
	
	public String getExamStatusName() {
		return examStatusName;
	}

	public void setExamStatusName(String examStatusName) {
		this.examStatusName = examStatusName;
	}

	public String getSort() {
		return sort;
	}

	public void setSort(String sort) {
		this.sort = sort;
	}

	public String getSearchExam() {
		return searchExam;
	}

	public void setSearchExam(String searchExam) {
		this.searchExam = searchExam;
	}

	public String getSearchKeyword() {
		return searchKeyword;
	}

	public void setSearchKeyword(String searchKeyword) {
		this.searchKeyword = searchKeyword;
	}

	public String getCompanyId() {
		return companyId;
	}

	public void setCompanyId(String companyId) {
		this.companyId = companyId;
	}

	public int getStart() {
		return start;
	}

	public void setStart(int start) {
		this.start = start;
	}

	public int getEnd() {
		return end;
	}

	public void setEnd(int end) {
		this.end = end;
	}
	
	public String getExamStartTime() {
		return examStartTime;
	}

	public void setExamStartTime(String examStartTime) {
		this.examStartTime = examStartTime;
	}

	public String getExamEndTime() {
		return examEndTime;
	}

	public void setExamEndTime(String examEndTime) {
		this.examEndTime = examEndTime;
	}

	public int getQuestionQuantity() {
		return questionQuantity;
	}
	
	public void setQuestionQuantity(int questionQuantity) {
		this.questionQuantity = questionQuantity;
	}
	
	public int getNumberOfTimes() {
		return numberOfTimes;
	}
	
	public void setNumberOfTimes(int numberOfTimes) {
		this.numberOfTimes = numberOfTimes;
	}
	
	public int getPassingScore() {
		return passingScore;
	}
	
	public void setPassingScore(int passingScore) {
		this.passingScore = passingScore;
	}
	
	
	
	public int getApplicants() {
		return applicants;
	}

	public void setApplicants(int applicants) {
		this.applicants = applicants;
	}

	public String getExamName() {
		return examName;
	}
	
	public void setExamName(String examName) {
		this.examName = examName;
	}
	
	public String getExamStatus() {
		return examStatus;
	}
	
	public void setExamStatus(String examStatus) {
		this.examStatus = examStatus;
	}
	
	public String getDisclosureStatus() {
		return disclosureStatus;
	}
	
	public void setDisclosureStatus(String disclosureStatus) {
		this.disclosureStatus = disclosureStatus;
	}
	
	public String getSetExamStatus() {
		return setExamStatus;
	}
	
	public void setSetExamStatus(String setExamStatus) {
		this.setExamStatus = setExamStatus;
	}
	
	public int getExamId() {
		return examId;
	}

	public void setExamId(int examId) {
		this.examId = examId;
	}

	public int getEstimateId() {
		return estimateId;
	}

	public void setEstimateId(int estimateId) {
		this.estimateId = estimateId;
	}

	public String getExamDescriptionSimple() {
		return examDescriptionSimple;
	}

	public void setExamDescriptionSimple(String examDescriptionSimple) {
		this.examDescriptionSimple = examDescriptionSimple;
	}

	public String getExamDescriptionDetail() {
		return examDescriptionDetail;
	}

	public void setExamDescriptionDetail(String examDescriptionDetail) {
		this.examDescriptionDetail = examDescriptionDetail;
	}

	@Override
	public String toString() {
		return "ExamVO [examId=" + examId + ", examStartTime=" + examStartTime + ", examEndTime=" + examEndTime
				+ ", questionQuantity=" + questionQuantity + ", estimateId=" + estimateId + ", numberOfTimes="
				+ numberOfTimes + ", passingScore=" + passingScore + ", applicants=" + applicants + ", examName="
				+ examName + ", examStatus=" + examStatus + ", disclosureStatus=" + disclosureStatus
				+ ", setExamStatus=" + setExamStatus + ", examDescriptionSimple=" + examDescriptionSimple
				+ ", examDescriptionDetail=" + examDescriptionDetail + ", start=" + start + ", end=" + end
				+ ", companyId=" + companyId + ", sort=" + sort + ", searchExam=" + searchExam + ", searchKeyword="
				+ searchKeyword + ", examStatusName=" + examStatusName + "]";
	}

	
}
