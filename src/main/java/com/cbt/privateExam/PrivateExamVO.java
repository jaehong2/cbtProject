package com.cbt.privateExam;

// 2019.07.23 성재민
// 비공개 시험에 응시하는 응시자를 저장하는 테이블 추가로 대응하는 VO 생성
public class PrivateExamVO {
	private int 	privateExamId;
	private int 	examId;
	private String 	takerId;
	
	public PrivateExamVO() {
		// TODO Auto-generated constructor stub
	}

	public String getTakerId() {
		return takerId;
	}

	public void setTakerId(String takerId) {
		this.takerId = takerId;
	}

	public int getPrivateExamId() {
		return privateExamId;
	}

	public void setPrivateExamId(int privateExamId) {
		this.privateExamId = privateExamId;
	}

	public int getExamId() {
		return examId;
	}

	public void setExamId(int examId) {
		this.examId = examId;
	}
}
