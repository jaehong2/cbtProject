package com.cbt.candidate;

import java.util.Arrays;
import java.util.List;

//2019.07.01 장세준 - VO 생성
public class CandidateVO {
	private String takerId;
	private String takerName;
	private String takerInfo;
	private String takerEducation;
	private String takerEmail;
	private String takerPassword;
	private String takerPhoneNum; 
	private String takerEducationNm;
	private String RoleName;

	private String companyId;
	private String compnayEmail;
	
	public String getCompnayEmail() {
		return compnayEmail;
	}
	
	public void setCompnayEmail(String compnayEmail) {
		this.compnayEmail = compnayEmail;
	}

	public String getCompanyId() {
		return companyId;
	}

	public void setCompanyId(String companyId) {
		this.companyId = companyId;
	}

	public String getRoleName() {
		return RoleName;
	}

	public void setRoleName(String roleName) {
		RoleName = roleName;
	}

	public CandidateVO() {
		// TODO Auto-generated constructor stub
	}
	
	public CandidateVO(List<String> valueList) {
		takerId 			= valueList.get(0);
		takerName 			= valueList.get(1);
		takerInfo 			= valueList.get(2);
		takerEducation 		= valueList.get(3);
		takerEmail 			= valueList.get(4);
		takerPassword 		= valueList.get(5);
		takerPhoneNum 		= valueList.get(6); 
		takerEducationNm 	= valueList.get(7);
	}
	
	public String getTakerEducationNm() {
		return takerEducationNm;
	}
	public void setTakerEducationNm(String takerEducationNm) {
		this.takerEducationNm = takerEducationNm;
	}
	public String getTakerPhoneNum() {
		return takerPhoneNum;
	}
	public void setTakerPhoneNum(String takerPhoneNum) {
		this.takerPhoneNum = takerPhoneNum;
	}

	// 페이징을 위한 추가 (cnt, sort~ seqList)   장세준    7/2 
	private int cnt;
	private String sort;
	private String searchKeyword;
	private String searchCondition;
	private int start;
	private int end;
	private int[] seqList;
	private String[] takerList;
	
	
	public String[] getTakerList() {
		return takerList;
	}
	public void setTakerList(String[] takerList) {
		this.takerList = takerList;
	}
	public int getCnt() {
		return cnt;
	}
	public void setCnt(int cnt) {
		this.cnt = cnt;
	}
	public String getSort() {
		return sort;
	}
	public void setSort(String sort) {
		this.sort = sort;
	}
	public String getSearchKeyword() {
		return searchKeyword;
	}
	public void setSearchKeyword(String searchKeyword) {
		this.searchKeyword = searchKeyword;
	}
	public String getSearchCondition() {
		return searchCondition;
	}
	public void setSearchCondition(String searchCondition) {
		this.searchCondition = searchCondition;
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
	public String getOutMsg() {
		return outMsg;
	}
	public void setOutMsg(String outMsg) {
		this.outMsg = outMsg;
	}

	private String outMsg;
	
	
	public int[] getSeqList() {
		return seqList;
	}
	public void setSeqList(int[] seqList) {
		this.seqList = seqList;
	}
	public String getTakerId() {
		return takerId;
	}
	public void setTakerId(String takerId) {
		this.takerId = takerId;
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

	public String getTakerEducation() {
		return takerEducation;
	}
	public void setTakerEducation(String takerEducation) {
		this.takerEducation = takerEducation;
	}
	public String getTakerEmail() {
		return takerEmail;
	}
	public void setTakerEmail(String takerEmail) {
		this.takerEmail = takerEmail;
	}
	public String getTakerPassword() {
		return takerPassword;
	}
	public void setTakerPassword(String takerPassword) {
		this.takerPassword = takerPassword;
	}

	@Override
	public String toString() {
		return "CandidateVO [takerId=" + takerId + ", takerName=" + takerName + ", takerInfo=" + takerInfo
				+ ", takerEducation=" + takerEducation + ", takerEmail=" + takerEmail + ", takerPassword="
				+ takerPassword + ", takerPhoneNum=" + takerPhoneNum + ", takerEducationNm=" + takerEducationNm
				+ ", RoleName=" + RoleName + ", cnt=" + cnt + ", sort=" + sort + ", searchKeyword=" + searchKeyword
				+ ", searchCondition=" + searchCondition + ", start=" + start + ", end=" + end + ", seqList="
				+ Arrays.toString(seqList) + ", takerList=" + Arrays.toString(takerList) + ", outMsg=" + outMsg + "]";
	}
	

	
}
