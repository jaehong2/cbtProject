package com.cbt.categoryMiddle;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class CategoryMiddleDAO {
	@Autowired
	private SqlSessionTemplate mybatis;
	
	public void insertCategoryMiddle(CategoryMiddleVO vo) {
		mybatis.insert("categoryMiddleDAO.insertCategoryMiddle", vo);
	}
	
	public void updateCategoryMiddle(CategoryMiddleVO vo) {
		mybatis.update("categoryMiddleDAO.updateCategoryMiddle", vo);
	}

	public void deleteCategoryMiddle(CategoryMiddleVO vo) {
		mybatis.delete("categoryMiddleDAO.deleteCategoryMiddle", vo);
	}
	
	public CategoryMiddleVO getCategoryMiddle(CategoryMiddleVO vo) {
		return mybatis.selectOne("categoryMiddleDAO.getCategoryMiddle", vo);
	}
	
	public List<CategoryMiddleVO> getCategoryMiddleList(CategoryMiddleVO vo) {
		return mybatis.selectList("categoryMiddleDAO.getCategoryMiddleList", vo);
	}
	
	public List<CategoryMiddleVO> getAllCategoryMiddleList() {
		return mybatis.selectList("categoryMiddleDAO.getAllCategoryMiddleList");
	}
}
