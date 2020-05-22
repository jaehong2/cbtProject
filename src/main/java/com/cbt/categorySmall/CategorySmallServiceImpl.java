package com.cbt.categorySmall;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class CategorySmallServiceImpl implements CategorySmallService {
	@Autowired
	CategorySmallDAO dao;
	
	@Override
	public void insertCategorySmall(CategorySmallVO vo) {
		dao.insertCategorySmall(vo);
	}

	@Override
	public void updateCategorySmall(CategorySmallVO vo) {
		dao.updateCategorySmall(vo);
	}

	@Override
	public void deleteCategorySmall(CategorySmallVO vo) {
		dao.deleteCategorySmall(vo);
	}

	@Override
	public CategorySmallVO getCategorySmall(CategorySmallVO vo) {
		return dao.getCategorySmall(vo);
	}

	@Override
	public List<CategorySmallVO> getCategorySmallList(CategorySmallVO vo) {
		return dao.getCategorySmallList(vo);
	}

	@Override
	public List<CategorySmallVO> getAllCategorySmallList() {
		return dao.getAllCategorySmallList();
	}

}
