package com.cbt.categorySmall;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class CategorySmallDAO {
	@Autowired
	private SqlSessionTemplate mybatis;
	
	public void insertCategorySmall(CategorySmallVO vo) {
		mybatis.insert("categorySmallDAO.insertCategorySmall", vo);
	}
	
	public void updateCategorySmall(CategorySmallVO vo) {
		mybatis.update("categorySmallDAO.updateCategorySmall", vo);
	}

	public void deleteCategorySmall(CategorySmallVO vo) {
		mybatis.delete("categorySmallDAO.deleteCategorySmall", vo);
	}
	
	public CategorySmallVO getCategorySmall(CategorySmallVO vo) {
		return mybatis.selectOne("categorySmallDAO.getCategorySmall", vo);
	}
	
	public List<CategorySmallVO> getCategorySmallList(CategorySmallVO vo) {
		return mybatis.selectList("categorySmallDAO.getCategorySmallList", vo);
	}
	
	public List<CategorySmallVO> getAllCategorySmallList() {
		return mybatis.selectList("categorySmallDAO.getAllCategorySmallList");
	}
}
