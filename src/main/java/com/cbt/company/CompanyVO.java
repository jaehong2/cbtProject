package com.cbt.company;

public class CompanyVO {
	private String companyId;       
	private String companyPassword;     
	private String companyName;         
	private String businessNumber;      
	private String companyClassification;  
	private String companySectors;      
	private String companyCredit;       
	private String companyManager;    
	private String companyManagerTelNum;	// 2019.07.02 성재민 COMPANY_MANAGER_TELNUM 추가
	private String companyEmail;
	private String[] cpnList;
	private String companyClassificationName;
	private String companySectorsName;
	private int    start;
	private int    end;
	private String sort;
	private String searchCompany;
	private String searchKeyword;
	
	

	public String getCompanyEmail() {
		return companyEmail;
	}

	public void setCompanyEmail(String companyEmail) {
		this.companyEmail = companyEmail;
	}

	public String getCompanyId() {
		return companyId;
	}

	public void setCompanyId(String companyId) {
		this.companyId = companyId;
	}

	public String getCompanyManagerTelNum() {
		return companyManagerTelNum;
	}

	public void setCompanyManagerTelNum(String companyManagerTelNum) {
		this.companyManagerTelNum = companyManagerTelNum;
	}

	public CompanyVO() {
		// TODO Auto-generated constructor stub
	}

	public String getCompanyPassword() {
		return companyPassword;
	}

	public void setCompanyPassword(String companyPassword) {
		this.companyPassword = companyPassword;
	}

	public String getCompanyName() {
		return companyName;
	}

	public void setCompanyName(String companyName) {
		this.companyName = companyName;
	}

	public String getBusinessNumber() {
		return businessNumber;
	}

	public void setBusinessNumber(String businessNumber) {
		this.businessNumber = businessNumber;
	}

	public String getCompanyClassification() {
		return companyClassification;
	}

	public void setCompanyClassification(String companyClassification) {
		this.companyClassification = companyClassification;
	}

	public String getCompanySectors() {
		return companySectors;
	}

	public void setCompanySectors(String companySectors) {
		this.companySectors = companySectors;
	}

	public String getCompanyCredit() {
		return companyCredit;
	}

	public void setCompanyCredit(String companyCredit) {
		this.companyCredit = companyCredit;
	}

	public String getCompanyManager() {
		return companyManager;
	}

	public void setCompanyManager(String companyManager) {
		this.companyManager = companyManager;
	}
	
	public String[] getCpnList() {
		return cpnList;
	}

	public void setCpnList(String[] cpnList) {
		this.cpnList = cpnList;
	}
	

	public String getCompanyClassificationName() {
		return companyClassificationName;
	}

	public void setCompanyClassificationName(String companyClassificationName) {
		this.companyClassificationName = companyClassificationName;
	}

	public String getCompanySectorsName() {
		return companySectorsName;
	}

	public void setCompanySectorsName(String companySectorsName) {
		this.companySectorsName = companySectorsName;
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

	public String getSort() {
		return sort;
	}

	public void setSort(String sort) {
		this.sort = sort;
	}

	public String getSearchCompany() {
		return searchCompany;
	}

	public void setSearchCompany(String searchCompany) {
		this.searchCompany = searchCompany;
	}

	public String getSearchKeyword() {
		return searchKeyword;
	}

	public void setSearchKeyword(String searchKeyword) {
		this.searchKeyword = searchKeyword;
	}

	@Override
	public String toString() {
		return "CompanyVO [clientId=" + companyId + ", companyPassword=" + companyPassword + ", companyName="
				+ companyName + ", businessNumber=" + businessNumber + ", companyClassification="
				+ companyClassification + ", companySectors=" + companySectors + ", companyCredit=" + companyCredit
				+ ", companyManager=" + companyManager + "]";
	}
}
