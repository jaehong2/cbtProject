package com.cbt.takeExam;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

@Controller
public class TakeExamController {
	@Autowired
	TakeExamService takeExamService;

	// 7.11 생성, 준 -> 응시자가 시험일정에서 내역 보기
	/*
	 * @RequestMapping(value="candidateScheduleCheck.do", method =
	 * RequestMethod.GET) public String candidateScheduleCheck(HttpSession session,
	 * Model model, Paging paging) { CandidateVO loginCandidate = (CandidateVO)
	 * session.getAttribute("candidate"); if(loginCandidate != null) { TakeExamVO vo
	 * = new TakeExamVO(); vo.setTakerId(loginCandidate.getTakerId());
	 * model.addAttribute("result",takeExamService.getExamList(vo, paging)); return
	 * "candidate/candidate/candidateScheduleCheck"; } else { return
	 * "candidate/candidate/candidateLogin"; } }
	 */
}
