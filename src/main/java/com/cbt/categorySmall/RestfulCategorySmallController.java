package com.cbt.categorySmall;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class RestfulCategorySmallController {
	@Autowired
	CategorySmallService categorySmallService;
	
	// 중분류에 포함되는 소분류 전체 조회
	@RequestMapping(value = "getAllCategorySmallList.do/{middleIdx}", method = RequestMethod.POST)
	public List<CategorySmallVO> getAllCategoryMiddleList(@PathVariable("middleIdx") int middleIdx) {
		CategorySmallVO vo = new CategorySmallVO();
		vo.setCategoryMiddleId(middleIdx);
		return categorySmallService.getCategorySmallList(vo);
	}
	
	// 2019.07.08 성재민
	// 이름 조회
	@RequestMapping(value="getCategorySmallName.do/{id}", produces = "application/text; charset=utf8" ,method=RequestMethod.POST)
	public String getCategorySmallName(@PathVariable("id") int id) {
		CategorySmallVO vo = new CategorySmallVO();
		vo.setCategorySmallId(id);
		CategorySmallVO resultVo = categorySmallService.getCategorySmall(vo);
		return resultVo.getCategorySmallName();
	}
}
