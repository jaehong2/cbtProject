package com.cbt.setExamQuestion;

public class SetExamQuestionVO {
	private int examId;
	private int questionId;
	private int setExamQuestionId;
	private int point;

	public SetExamQuestionVO() {
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

	public int getSetExamQuestionId() {
		return setExamQuestionId;
	}

	public void setSetExamQuestionId(int setExamQuestionId) {
		this.setExamQuestionId = setExamQuestionId;
	}

	public int getPoint() {
		return point;
	}

	public void setPoint(int point) {
		this.point = point;
	}

	@Override
	public String toString() {
		return "SetExamQuestionVO [examId=" + examId + ", questionId=" + questionId + ", setExamQuestionId="
				+ setExamQuestionId + ", point=" + point + "]";
	}
}
