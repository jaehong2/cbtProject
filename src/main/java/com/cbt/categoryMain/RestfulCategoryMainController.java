package com.cbt.categoryMain;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class RestfulCategoryMainController {
	@Autowired
	CategoryMainService categoryMainService;
	
	// 대분류 전체 조회
	@RequestMapping(value="getAllCategoryMainList.do", method=RequestMethod.POST)
	public List<CategoryMainVO> getAllCategoryMainList() {
		return categoryMainService.getAllCategoryMain();
	}
	
	// 2019.07.08 성재민
	// 이름 조회
	@RequestMapping(value="getCategoryMainName.do/{id}", produces = "application/text; charset=utf8" ,method=RequestMethod.POST)
	public String getCategoryMainName(@PathVariable("id") int id) {
		CategoryMainVO vo = new CategoryMainVO();
		vo.setCategoryMainId(id);
		CategoryMainVO resultVo = categoryMainService.getCategoryMain(vo);
		return resultVo.getCategoryMainName();
	}
}
