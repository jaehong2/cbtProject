package com.cbt.manager;

import org.springframework.web.multipart.MultipartFile;

public class EmailVO {
	String from;
	String tomail;
	String subject;
	String content;
	private MultipartFile filename;
	
	
	public MultipartFile getFilename() {
		return filename;
	}
	public void setFilename(MultipartFile filename) {
		this.filename = filename;
	}
	public String getFrom() {
		return from;
	}
	public void setFrom(String from) {
		this.from = from;
	}
	
	public String getTomail() {
		return tomail;
	}
	public void setTomail(String tomail) {
		this.tomail = tomail;
	}
	public String getSubject() {
		return subject;
	}
	public void setSubject(String subject) {
		this.subject = subject;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}

	@Override
	public String toString() {
		return "EmailVO [from=" + from + ", tomail=" + tomail + ", subject=" + subject + ", content=" + content + ", filename="
				+ filename + "]";
	}	
}
