package com.cbt.consulting;

import java.util.Arrays;

// 2019.07.08 성재민
// consultingId 타입 int로 변경
// consultingTitle(제목) 추가
public class ConsultingVO {
	private int 	consultingId;
	private String 	companyId;
	private String	consultingTitle;
	private String 	consultingContents;
	private String 	consultingDesiredDate;
	private String 	consultingDate;
	private String 	consultingRemarks;
	private String	consultingState;	// 2019.07.03 성재민 상담 상태 설정 변수 추가
	private int 	start;
	private int 	end;
	private String[] consultingList;
	private String  consultingStateName;	// 2019.07.05 이승환 코드불러오기위한 변수 추가
	private String 	sort;				// 2019.07.16 이승환 페이징처리, searching 기능위한 변수 추가
	private String 	searchConsulting;	// 2019.07.16 이승환 페이징처리, searching 기능위한 변수 추가
	private String 	searchKeyword;		// 2019.07.16 이승환 페이징처리, searching 기능위한 변수 추가
	
	

	public String getConsultingStateName() {
		return consultingStateName;
	}

	public void setConsultingStateName(String consultingStateName) {
		this.consultingStateName = consultingStateName;
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

	public ConsultingVO() {
		// TODO Auto-generated constructor stub
	}

	public String getCompanyId() {
		return companyId;
	}

	public void setCompanyId(String companyId) {
		this.companyId = companyId;
	}

	public String getConsultingContents() {
		return consultingContents;
	}

	public void setConsultingContents(String consultingContents) {
		this.consultingContents = consultingContents;
	}

	

	public String getConsultingDesiredDate() {
		return consultingDesiredDate;
	}

	public void setConsultingDesiredDate(String consultingDesiredDate) {
		this.consultingDesiredDate = consultingDesiredDate;
	}

	public String getConsultingDate() {
		return consultingDate;
	}

	public void setConsultingDate(String consultingDate) {
		this.consultingDate = consultingDate;
	}

	public String getConsultingRemarks() {
		return consultingRemarks;
	}

	public void setConsultingRemarks(String consultingRemarks) {
		this.consultingRemarks = consultingRemarks;
	}
	
	public String getConsultingState() {
		return consultingState;
	}   

	public void setConsultingState(String consultingState) {
		this.consultingState = consultingState;
	}

	public int getConsultingId() {
		return consultingId;
	}  

	public void setConsultingId(int consultingId) {
		this.consultingId = consultingId;
	}

	public String getConsultingTitle() {
		return consultingTitle;
	}

	public void setConsultingTitle(String consultingTitle) {
		this.consultingTitle = consultingTitle;
	}

	public String[] getConsultingList() {
		return consultingList;
	}

	public void setConsultingList(String[] consultingList) {
		this.consultingList = consultingList;
	}

	public String getSort() {
		return sort;
	}

	public void setSort(String sort) {
		this.sort = sort;
	}

	public String getSearchConsulting() {
		return searchConsulting;
	}

	public void setSearchConsulting(String searchConsulting) {
		this.searchConsulting = searchConsulting;
	}

	public String getSearchKeyword() {
		return searchKeyword;
	}

	public void setSearchKeyword(String searchKeyword) {
		this.searchKeyword = searchKeyword;
	}

	@Override
	public String toString() {
		return "ConsultingVO [consultingId=" + consultingId + ", companyId=" + companyId + ", consultingTitle="
				+ consultingTitle + ", consultingContents=" + consultingContents + ", consultingDesiredDate="
				+ consultingDesiredDate + ", consultingDate=" + consultingDate + ", consultingRemarks="
				+ consultingRemarks + ", consultingState=" + consultingState + ", start=" + start + ", end=" + end
				+ ", consultingList=" + Arrays.toString(consultingList) + ", consultingStateName=" + consultingStateName
				+ ", sort=" + sort + ", searchConsulting=" + searchConsulting + ", searchKeyword=" + searchKeyword
				+ "]";
	}

	
	
	
}
