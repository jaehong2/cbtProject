package com.cbt.category;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class CategoryDAO {
	//190703  재홍  mapper와 연결
	
	@Autowired
	private SqlSessionTemplate mybatis;
	
	public void insertCategory(CategoryVO vo) {
		mybatis.insert("categoryDAO.insertCategory", vo);
	}
	
	public void updateCategory(CategoryVO vo) {
		mybatis.update("categoryDAO.updateCategory", vo);
	}

	public void deleteCategory(CategoryVO vo) {
		mybatis.delete("categoryDAO.deleteCategory", vo);
	}
	
	public CategoryVO getCategory(CategoryVO vo) {
		return mybatis.selectOne("categoryDAO.getCategory", vo);
	}
	
	public List<CategoryVO> getAllCategory() {
		return mybatis.selectList("categoryDAO.getAllCategory");
	}
	
	// 2019.07.08 성재민
	// 대,중,소 분류 id 값이 아니라 이름값으로 가져오는 함수
	public List<Map<String, String>> getAllCategoryMap() {
		return mybatis.selectList("categoryDAO.getAllCategoryMap");
	}
}
