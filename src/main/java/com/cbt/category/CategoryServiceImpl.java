package com.cbt.category;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

@Service
public class CategoryServiceImpl implements CategoryService {
	@Resource
	CategoryDAO dao;

	@Override
	public void insertCategory(CategoryVO vo) {
		dao.insertCategory(vo);
	}
	
	@Override
	public void updateCategory(CategoryVO vo) {
		dao.updateCategory(vo);
	}
	
	@Override
	public void deleteCategory(CategoryVO vo) {
		dao.deleteCategory(vo);
	}
	
	@Override
	public CategoryVO getCategory(CategoryVO vo) {
		return dao.getCategory(vo);
	}

	@Override
	public List<CategoryVO> getAllCategory() {
		return dao.getAllCategory();
	}

	// 2019.07.08 성재민
	// 대,중,소 분류 id 값이 아니라 이름값으로 가져오는 함수
	@Override
	public List<Map<String, String>> getAllCategoryMap() {
		return dao.getAllCategoryMap();
	}
}
