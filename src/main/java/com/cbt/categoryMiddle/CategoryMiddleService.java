package com.cbt.categoryMiddle;

import java.util.List;

public interface CategoryMiddleService {
	
	void insertCategoryMiddle(CategoryMiddleVO vo);
	
	void updateCategoryMiddle(CategoryMiddleVO vo);
	
	void deleteCategoryMiddle(CategoryMiddleVO vo);
	
	CategoryMiddleVO getCategoryMiddle(CategoryMiddleVO vo);
	
	List<CategoryMiddleVO> getCategoryMiddleList(CategoryMiddleVO vo);	// 메인 카테고리에 포함되는 중분류 카테고리 검색
	
	List<CategoryMiddleVO> getAllCategoryMiddleList();
}
