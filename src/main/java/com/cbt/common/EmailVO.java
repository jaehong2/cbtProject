package com.cbt.common;


public class EmailVO {
	private String subject; //이메일제목
	private String text;
	private String fromEmail; //보낼이메일주소
	private String ToEmail; //받는 이메일 주소	
	private String attachFile;
	
	
	
	public String getAttachFile() {
		return attachFile;
	}
	public void setAttachFile(String attachFile) {
		this.attachFile = attachFile;
	}
	public String getSubject() {
		return subject;
	}
	public void setSubject(String subject) {
		this.subject = subject;
	}
	public String getText() {
		return text;
	}
	public void setText(String text) {
		this.text = text;
	}
	public String getFromEmail() {
		return fromEmail;
	}
	public void setFromEmail(String fromEmail) {
		this.fromEmail = fromEmail;
	}
	public String getToEmail() {
		return ToEmail;
	}
	public void setToEmail(String toEmail) {
		ToEmail = toEmail;
	}
	
	
}

