package com.cbt.Inquiry;

// 2019.07.20 성재민
// 문의 테이블 추가로 대응하는 vo 객체 생성
public class InquiryVO {
	private int 	inquiryId;
	private String 	inquiryTakerId;
	private String 	inquiryRoomId;
	private String 	replyStatus;
	private String 	inquiryContent;
	private String	inquiryTime;
	
	public InquiryVO() {
	}
	
	public String getInquiryRoomId() {
		return inquiryRoomId;
	}

	public void setInquiryRoomId(String inquiryRoomId) {
		this.inquiryRoomId = inquiryRoomId;
	}

	public int getInquiryId() {
		return inquiryId;
	}

	public void setInquiryId(int inquiryId) {
		this.inquiryId = inquiryId;
	}

	public String getInquiryTakerId() {
		return inquiryTakerId;
	}

	public void setInquiryTakerId(String inquiryTakerId) {
		this.inquiryTakerId = inquiryTakerId;
	}

	public String getReplyStatus() {
		return replyStatus;
	}

	public void setReplyStatus(String replyStatus) {
		this.replyStatus = replyStatus;
	}

	public String getInquiryContent() {
		return inquiryContent;
	}

	public void setInquiryContent(String inquiryContent) {
		this.inquiryContent = inquiryContent;
	}

	public String getInquiryTime() {
		return inquiryTime;
	}

	public void setInquiryTime(String inquiryTime) {
		this.inquiryTime = inquiryTime;
	}
}
