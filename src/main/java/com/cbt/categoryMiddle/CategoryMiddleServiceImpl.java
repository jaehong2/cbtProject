package com.cbt.categoryMiddle;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

@Service
public class CategoryMiddleServiceImpl implements CategoryMiddleService {
	@Resource
	CategoryMiddleDAO dao;
	
	@Override
	public void insertCategoryMiddle(CategoryMiddleVO vo) {
		dao.insertCategoryMiddle(vo);
	}

	@Override
	public void updateCategoryMiddle(CategoryMiddleVO vo) {
		dao.updateCategoryMiddle(vo);
	}

	@Override
	public void deleteCategoryMiddle(CategoryMiddleVO vo) {
		dao.deleteCategoryMiddle(vo);
	}

	@Override
	public CategoryMiddleVO getCategoryMiddle(CategoryMiddleVO vo) {
		return dao.getCategoryMiddle(vo);
	}

	@Override
	public List<CategoryMiddleVO> getCategoryMiddleList(CategoryMiddleVO vo) {
		return dao.getCategoryMiddleList(vo);
	}

	@Override
	public List<CategoryMiddleVO> getAllCategoryMiddleList() {
		return dao.getAllCategoryMiddleList();
	}

}
