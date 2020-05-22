package com.cbt.categorySmall;

import java.util.List;

public interface CategorySmallService {
	
	void insertCategorySmall(CategorySmallVO vo);
	
	void updateCategorySmall(CategorySmallVO vo);
	
	void deleteCategorySmall(CategorySmallVO vo);
	
	CategorySmallVO getCategorySmall(CategorySmallVO vo);
	
	List<CategorySmallVO> getCategorySmallList(CategorySmallVO vo);	// 중분류에 포함되는 소분류 카테고리 검색
	
	List<CategorySmallVO> getAllCategorySmallList();
}
