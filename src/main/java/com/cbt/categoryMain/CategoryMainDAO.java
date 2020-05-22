package com.cbt.categoryMain;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class CategoryMainDAO {
	@Autowired
	private SqlSessionTemplate mybatis;
	
	public void insertCategoryMain(CategoryMainVO vo) {
		mybatis.insert("categoryMainDAO.insertCategoryMain", vo);
	}
	
	public void updateCategoryMain(CategoryMainVO vo) {
		mybatis.update("categoryMainDAO.updateCategoryMain", vo);
	}

	public void deleteCategoryMain(CategoryMainVO vo) {
		mybatis.delete("categoryMainDAO.deleteCategoryMain", vo);
	}
	
	public CategoryMainVO getCategoryMain(CategoryMainVO vo) {
		return mybatis.selectOne("categoryMainDAO.getCategoryMain", vo);
	}
	
	public List<CategoryMainVO> getAllCategoryMain() {
		return mybatis.selectList("categoryMainDAO.getAllCategoryMain");
	}
}
