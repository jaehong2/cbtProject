package com.cbt.condition;

import java.util.Arrays;

public class ConditionVO {
	private int conditionSeq;
	private String masterCd;
	private String masterNm;
	private String detailCd;
	private String detailNm;
	private String useYn;
	
	private String searchCondition;
	private String[] cdTionList;
	
	public ConditionVO() {
		// TODO Auto-generated constructor stub
	}
		
	public String[] getCdTionList() {
		return cdTionList;
	}

	public void setCdTionList(String[] cdTionList) {
		this.cdTionList = cdTionList;
	}

	public String getSearchCondition() {
		return searchCondition;
	}
	
	public void setSearchCondition(String searchCondition) {
		this.searchCondition = searchCondition;
	}
	
	public int getConditionSeq() {
		return conditionSeq;
	}
	
	public void setConditionSeq(int conditionSeq) {
		this.conditionSeq = conditionSeq;
	}
	
	public String getMasterCd() {
		return masterCd;
	}
	
	public void setMasterCd(String masterCd) {
		this.masterCd = masterCd;
	}
	
	public String getMasterNm() {
		return masterNm;
	}
	
	public void setMasterNm(String masterNm) {
		this.masterNm = masterNm;
	}
	
	public String getDetailCd() {
		return detailCd;
	}
	
	public void setDetailCd(String detailCd) {
		this.detailCd = detailCd;
	}
	
	public String getDetailNm() {
		return detailNm;
	}
	
	public void setDetailNm(String detailNm) {
		this.detailNm = detailNm;
	}
	
	public String getUseYn() {
		return useYn;
	}
	
	public void setUseYn(String useYn) {
		this.useYn = useYn;
	}

	@Override
	public String toString() {
		return "ConditionVO [conditionSeq=" + conditionSeq + ", masterCd=" + masterCd + ", masterNm=" + masterNm
				+ ", detailCd=" + detailCd + ", detailNm=" + detailNm + ", useYn=" + useYn + ", searchCondition="
				+ searchCondition + ", cdTionList=" + Arrays.toString(cdTionList) + "]";
	}
	
	
	
}
