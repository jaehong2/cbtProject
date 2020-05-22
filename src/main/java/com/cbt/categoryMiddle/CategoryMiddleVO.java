package com.cbt.categoryMiddle;

public class CategoryMiddleVO {
	private int 	categoryMiddleId;
	private int 	categoryMainId;
	private String 	categoryMiddleName;
	
	public CategoryMiddleVO() {
		// TODO Auto-generated constructor stub
	}

	public int getCategoryMiddleId() {
		return categoryMiddleId;
	}

	public void setCategoryMiddleId(int categoryMiddleId) {
		this.categoryMiddleId = categoryMiddleId;
	}

	public int getCategoryMainId() {
		return categoryMainId;
	}

	public void setCategoryMainId(int categoryMainId) {
		this.categoryMainId = categoryMainId;
	}

	public String getCategoryMiddleName() {
		return categoryMiddleName;
	}

	public void setCategoryMiddleName(String categoryMiddleName) {
		this.categoryMiddleName = categoryMiddleName;
	}

}
