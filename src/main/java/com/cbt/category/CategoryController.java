	package com.cbt.category;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

// 2019.07.04 성재민
// 카테고리 컨트롤러 연결
@Controller
public class CategoryController {
	@Autowired
	CategoryService categoryService;
	
	@RequestMapping(value = "categoryMain.do", method = RequestMethod.GET)
	public String categoryMain(Model model) {
		model.addAttribute("categoryList", categoryService.getAllCategoryMap());
		return "manager/category/categoryMain";
	}
	
	@RequestMapping(value = "insertCategory.do", method = RequestMethod.GET)
	public String insertCategoryForm() {
		return "manager/category/insertCategory";
	}
	
	@RequestMapping(value = "insertCategory.do", method = RequestMethod.POST)
	public String insertCategory(CategoryVO vo) {
		categoryService.insertCategory(vo);
		return "redirect:categoryMain.do";
	}
	
	// 2019.07.07 성재민 
	// 카테고리 업데이트 화면 연결
	// 전달인자로 넘오온 id 로 카테고리를 찾아 값을 넘김
	// 해당 값으로 수정 폼에 초기값 설정
	@RequestMapping(value = "updateCategory.do/{categoryId}", method = RequestMethod.GET)
	public String updateCategoryForm(@PathVariable("categoryId") int categoryId, Model model) {
		CategoryVO vo = new CategoryVO();
		vo.setCategoryId(categoryId);
		model.addAttribute("updateTargetCategory", categoryService.getCategory(vo));
		return "manager/category/updateCategory";
	}
	
	@RequestMapping(value = "updateCategory.do", method = RequestMethod.POST)
	public String updateCategory(CategoryVO vo) {
		categoryService.updateCategory(vo);
		return "redirect:categoryMain.do";
	}
	
	@RequestMapping(value = "deleteCategory.do/{categoryId}", method = RequestMethod.GET)
	public String deleteCategory(@PathVariable("categoryId") int categoryId, HttpServletRequest request) {
		CategoryVO vo = new CategoryVO();
		vo.setCategoryId(categoryId);
		categoryService.deleteCategory(vo);
		
		return "redirect:/categoryMain.do";
	}
}
