package com.cbt.question;


public class QuestionVO {
	
	
	// 7/2 생성    -재용
	private int questionId;
	private String questionContent;
	private String example1;
	private String example2;
	private String example3;
	private String example4;
	private String rightAnswer;
	private String rightCommentary;
	private int levelOfDifficulty;
	private int categoryId;
	private String questionType;
	private int examId;
	private String setExamQuestionId;
	private int point;
	private int count;
	private int takeExamId;
	private String takerId;
	private String takerAnswer;
	private String examName;
	private int passingScore;
	private String examStartTime;
	private int takerScore;
	private String takerName;
	private String takerInfo;
	private int sumPoint;
	private int getPoint;
	private int score;
	
	
	
	public QuestionVO() {
		
	}
	public int getScore() {
		return score;
	}

	public void setScore(int score) {
		this.score = score;
	}

	public int getSumPoint() {
		return sumPoint;
	}
	public void setSumPoint(int sumPoint) {
		this.sumPoint = sumPoint;
	}
	public int getGetPoint() {
		return getPoint;
	}
	public void setGetPoint(int getPoint) {
		this.getPoint = getPoint;
	}
	public int getTakerScore() {
		return takerScore;
	}
	public void setTakerScore(int takerScore) {
		this.takerScore = takerScore;
	}
	public String getTakerName() {
		return takerName;
	}
	public void setTakerName(String takerName) {
		this.takerName = takerName;
	}
	public String getTakerInfo() {
		return takerInfo;
	}
	public void setTakerInfo(String takerInfo) {
		this.takerInfo = takerInfo;
	}
	public String getExamName() {
		return examName;
	}
	public void setExamName(String examName) {
		this.examName = examName;
	}
	public int getPassingScore() {
		return passingScore;
	}
	public void setPassingScore(int passingScore) {
		this.passingScore = passingScore;
	}
	public String getExamStartTime() {
		return examStartTime;
	}
	public void setExamStartTime(String examStartTime) {
		this.examStartTime = examStartTime;
	}
	public String getTakerAnswer() {
		return takerAnswer;
	}
	public void setTakerAnswer(String takerAnswer) {
		this.takerAnswer = takerAnswer;
	}
	public String getTakerId() {
		return takerId;
	}
	public void setTakerId(String takerId) {
		this.takerId = takerId;
	}
	public int getTakeExamId() {
		return takeExamId;
	}
	public void setTakeExamId(int takeExamId) {
		this.takeExamId = takeExamId;
	}
	public int getExamId() {
		return examId;
	}
	public void setExamId(int examId) {
		this.examId = examId;
	}
	public int getQuestionId() {
		return questionId;
	}
	public void setQuestionId(int questionId) {
		this.questionId = questionId;
	}
	public String getQuestionContent() {
		return questionContent;
	}
	public void setQuestionContent(String questionContent) {
		this.questionContent = questionContent;
	}
	public String getExample1() {
		return example1;
	}
	public void setExample1(String example1) {
		this.example1 = example1;
	}
	public String getExample2() {
		return example2;
	}
	public void setExample2(String example2) {
		this.example2 = example2;
	}
	public String getExample3() {
		return example3;
	}
	public void setExample3(String example3) {
		this.example3 = example3;
	}
	public String getExample4() {
		return example4;
	}
	public void setExample4(String example4) {
		this.example4 = example4;
	}
	public String getRightAnswer() {
		return rightAnswer;
	}
	public void setRightAnswer(String rightAnswer) {
		this.rightAnswer = rightAnswer;
	}
	public String getRightCommentary() {
		return rightCommentary;
	}
	public void setRightCommentary(String rightCommentary) {
		this.rightCommentary = rightCommentary;
	}
	public int getLevelOfDifficulty() {
		return levelOfDifficulty;
	}
	public void setLevelOfDifficulty(int levelOfDifficulty) {
		this.levelOfDifficulty = levelOfDifficulty;
	}
	public int getCategoryId() {
		return categoryId;
	}
	public void setCategoryId(int categoryId) {
		this.categoryId = categoryId;
	}
	public String getQuestionType() {
		return questionType;
	}
	public void setQuestionType(String questionType) {
		this.questionType = questionType;
	}
	public String getSetExamQuestionId() {
		return setExamQuestionId;
	}
	public void setSetExamQuestionId(String setExamQuestionId) {
		this.setExamQuestionId = setExamQuestionId;
	}
	public int getPoint() {
		return point;
	}
	public void setPoint(int point) {
		this.point = point;
	}
	public int getCount() {
		return count;
	}
	public void setCount(int count) {
		this.count = count;
	}

	@Override
	public String toString() {
		return "QuestionVO [questionId=" + questionId + ", questionContent=" + questionContent + ", example1="
				+ example1 + ", example2=" + example2 + ", example3=" + example3 + ", example4=" + example4
				+ ", rightAnswer=" + rightAnswer + ", rightCommentary=" + rightCommentary + ", levelOfDifficulty="
				+ levelOfDifficulty + ", categoryId=" + categoryId + ", questionType=" + questionType + ", examId="
				+ examId + ", setExamQuestionId=" + setExamQuestionId + ", point=" + point + ", count=" + count
				+ ", takeExamId=" + takeExamId + ", takerId=" + takerId + ", takerAnswer=" + takerAnswer + ", examName="
				+ examName + ", passingScore=" + passingScore + ", examStartTime=" + examStartTime + ", takerScore="
				+ takerScore + ", takerName=" + takerName + ", takerInfo=" + takerInfo + ", sumPoint=" + sumPoint
				+ ", getPoint=" + getPoint + "]";
	}
	
	
	
	
	

}
