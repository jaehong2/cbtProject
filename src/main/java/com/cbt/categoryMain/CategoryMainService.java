package com.cbt.categoryMain;

import java.util.List;

public interface CategoryMainService {
	
	void insertCategoryMain(CategoryMainVO vo);
	
	void updateCategoryMain(CategoryMainVO vo);
	
	void deleteCategoryMain(CategoryMainVO vo);
	
	CategoryMainVO getCategoryMain(CategoryMainVO vo);

	List<CategoryMainVO> getAllCategoryMain();
}
