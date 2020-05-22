package com.cbt.manager;

import java.util.Arrays;

public class ManagerVO {
	private String managerId;
	private String managerPassword;
	private String managerName;
	private String searchManager;
	private String[] mngList;
	//페이징
	private int start;	//페이징시작번호
	private int end;	//페이징끝번호
		
		
	
	
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
	public String[] getMngList() {
		return mngList;
	}
	public void setMngList(String[] mngList) {
		this.mngList = mngList;
	}
	public String getSearchManager() {
		return searchManager;
	}
	public void setSearchManager(String searchManager) {
		this.searchManager = searchManager;
	}
	public String getManagerId() {
		return managerId;
	}
	public void setManagerId(String managerId) {
		this.managerId = managerId;
	}
	public String getManagerPassword() {
		return managerPassword;
	}
	public void setManagerPassword(String managerPassword) {
		this.managerPassword = managerPassword;
	}
	public String getManagerName() {
		return managerName;
	}
	public void setManagerName(String managerName) {
		this.managerName = managerName;
	}
	@Override
	public String toString() {
		return "ManagerVO [managerId=" + managerId + ", managerPassword=" + managerPassword + ", managerName="
				+ managerName + ", searchManager=" + searchManager + ", mngList=" + Arrays.toString(mngList) + "]";
	}
	
	

	
}
