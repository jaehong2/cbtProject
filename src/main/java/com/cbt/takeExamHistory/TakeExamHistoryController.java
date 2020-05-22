package com.cbt.takeExamHistory;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

@Controller
public class TakeExamHistoryController {
	@Autowired
	TakeExamHistoryService takeExamHistoryService;
}
