package com.cbt.takeExamHistory;

public class TakeExamHistoryVO {
	private int 	takeExamHistoryId;
	private String 	takerId;
	private int 	setExamQuestionId;
	private String 	takerAnswer;
	private int 	takerScore;
	private int 	takeExamId;
	
	public TakeExamHistoryVO() {
		// TODO Auto-generated constructor stub
	}

	public int getTakeExamHistoryId() {
		return takeExamHistoryId;
	}

	public void setTakeExamHistoryId(int takeExamHistoryId) {
		this.takeExamHistoryId = takeExamHistoryId;
	}

	public String getTakerId() {
		return takerId;
	}

	public void setTakerId(String takerId) {
		this.takerId = takerId;
	}

	public int getSetExamQuestionId() {
		return setExamQuestionId;
	}

	public void setSetExamQuestionId(int setExamQuestionId) {
		this.setExamQuestionId = setExamQuestionId;
	}

	public String getTakerAnswer() {
		return takerAnswer;
	}

	public void setTakerAnswer(String takerAnswer) {
		this.takerAnswer = takerAnswer;
	}

	public int getTakerScore() {
		return takerScore;
	}

	public void setTakerScore(int takerScore) {
		this.takerScore = takerScore;
	}

	public int getTakeExamId() {
		return takeExamId;
	}

	public void setTakeExamId(int takeExamId) {
		this.takeExamId = takeExamId;
	}
	
	
}
