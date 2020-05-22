package com.cbt.categoryMain;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

@Service
public class CategoryMainServiceImpl implements CategoryMainService {
	@Resource
	CategoryMainDAO dao;
	
	@Override
	public void insertCategoryMain(CategoryMainVO vo) {
		dao.insertCategoryMain(vo);
	}

	@Override
	public void updateCategoryMain(CategoryMainVO vo) {
		dao.updateCategoryMain(vo);
	}

	@Override
	public void deleteCategoryMain(CategoryMainVO vo) {
		dao.deleteCategoryMain(vo);
	}

	@Override
	public CategoryMainVO getCategoryMain(CategoryMainVO vo) {
		return dao.getCategoryMain(vo);
	}

	@Override
	public List<CategoryMainVO> getAllCategoryMain() {
		return dao.getAllCategoryMain();
	}

}
