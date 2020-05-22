package com.cbt.takeExamHistory;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.cbt.takeExam.TakeExamService;
import com.cbt.takeExam.TakeExamVO;

@RestController
public class RestfulTakeExamHistoryController {
	@Autowired
	TakeExamHistoryService takeExamHistoryService;
	@Autowired
	TakeExamService takeExamService;
	
	// 2019.07.16 성재민
	// 차트에서 사용하기 위해 생성
	@RequestMapping(value="getTakeExamHistoryForTakerIdAndExamIdList.do/{takeExamId}", method=RequestMethod.POST)
	public List<Map<String, Object>> getTakeExamHistoryForTakerIdAndExamIdList(@PathVariable("takeExamId") int takeExamId) {
		TakeExamVO takeExamVO = new TakeExamVO();
		takeExamVO.setTakeExamId(takeExamId);
		takeExamVO = takeExamService.getTakeExam(takeExamVO);
		
		// 값이 null 이 아닐때만 넘김.
		if(takeExamVO != null) {
			return takeExamHistoryService.getTakeExamHistoryForTakerIdAndExamIdList(takeExamVO);
		}
		
		return null;
	}
	
	// 2019.07.16 성재민
	// 차트에서 사용하기 위해 생성
	@RequestMapping(value="getTakeExamHistoryForExamIdList.do/{examId}", method=RequestMethod.POST)
	public List<Map<String, Object>> getTakeExamHistoryForExamIdList(@PathVariable("examId") int examId) {
		TakeExamVO takeExamVO = new TakeExamVO();
		takeExamVO.setExamId(examId);
		
		// 값이 있을 때만 처리.
		if(takeExamService.getTakeExamForExamId(takeExamVO).size() > 0) {
			return takeExamHistoryService.getTakeExamHistoryForExamIdList(takeExamVO);
		}
			
		return null;
	}
}
