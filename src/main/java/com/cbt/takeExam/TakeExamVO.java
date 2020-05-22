package com.cbt.takeExam;

import java.sql.Date;

public class TakeExamVO {
	
	private int 	takeExamId;
	private Date 	takeExamDate;
	private int 	score;
	private int 	examId;
	private String 	takerId;
	private int 	start;
	private int 	end;
	
	
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

	
	public int getTakeExamId() {
		return takeExamId;
	}
	
	public void setTakeExamId(int takeExamId) {
		this.takeExamId = takeExamId;
	}
	
	public Date getTakeExamDate() {
		return takeExamDate;
	}
	
	public void setTakeExamDate(Date takeExamDate) {
		this.takeExamDate = takeExamDate;
	}
	
	public String getTakerId() {
		return takerId;
	}
	
	public void setTakerId(String takerId) {
		this.takerId = takerId;
	}
	
	public int getScore() {
		return score;
	}

	public void setScore(int score) {
		this.score = score;
	}

	public int getExamId() {
		return examId;
	}

	public void setExamId(int examId) {
		this.examId = examId;
	}

	@Override
	public String toString() {
		return "TakeExamVO [takeExamId=" + takeExamId + ", takeExamDate=" + takeExamDate + ", score=" + score
				+ ", examId=" + examId + ", takerId=" + takerId + ", start=" + start + ", end=" + end + "]";
	}


}
