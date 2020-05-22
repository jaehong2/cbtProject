package com.cbt.category;

public class CategoryVO {
	/*19 07 03 재홍 DB맞게 수정*/
	private int 	categoryId;
	private int 	categoryMainId;
	private int 	categoryMiddleId;
	private int 	categorySamllId;
	private String	categoryName;

	public int getCategoryMainId() {
		return categoryMainId;
	}

	public void setCategoryMainId(int categoryMainId) {
		this.categoryMainId = categoryMainId;
	}

	public int getCategoryMiddleId() {
		return categoryMiddleId;
	}

	public void setCategoryMiddleId(int categoryMiddleId) {
		this.categoryMiddleId = categoryMiddleId;
	}

	public int getCategorySamllId() {
		return categorySamllId;
	}

	public void setCategorySamllId(int categorySamllId) {
		this.categorySamllId = categorySamllId;
	}

	public int getCategoryId() {
		return categoryId;
	}

	public void setCategoryId(int categoryId) {
		this.categoryId = categoryId;
	}

	public String getCategoryName() {
		return categoryName;
	}

	public void setCategoryName(String categoryName) {
		this.categoryName = categoryName;
	}
}
