package com.cbt.category;

import java.util.List;
import java.util.Map;

public interface CategoryService {
	
	void insertCategory(CategoryVO vo);
	
	void updateCategory(CategoryVO vo);
	
	void deleteCategory(CategoryVO vo);
	
	CategoryVO getCategory(CategoryVO vo);

	List<CategoryVO> getAllCategory();
	
	// 2019.07.08 성재민
		// 대,중,소 분류 id 값이 아니라 이름값으로 가져오는 함수
	List<Map<String, String>> getAllCategoryMap();
}
