package com.cbt.candidate;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;


public class errorPage {


	@Controller 
	public class ErrorHandling { 
		String path = "/error";

		@RequestMapping(value = "/404") 
		public String error404() { 
			return path + "/404"; 
		} 
		
		@RequestMapping(value = "/500") 
		public String error500() { 
			return path + "/500"; 
		} 
	}
}
