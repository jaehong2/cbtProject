package com.cbt.candidate;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import com.cbt.common.Paging;

@Service("candidateService")
public class CandidateServiceImpl implements CandidateService {
	BCryptPasswordEncoder scpwd = new BCryptPasswordEncoder();
	
	@Resource
	private CandidateDAO candidateDAO;
	
	//2019.07.01 장세준 insert method 
	public void insertCandidate(CandidateVO vo) {
		vo.setTakerPassword(scpwd.encode(vo.getTakerPassword()));
		candidateDAO.insertCandidate(vo);
	}

	public void updateCandidate(CandidateVO vo) {
		vo.setTakerPassword(scpwd.encode(vo.getTakerPassword()));
		candidateDAO.updateCandidate(vo);
	}

	public void deleteCandidate(CandidateVO vo) {
		candidateDAO.deleteCandidate(vo);
	}

	public CandidateVO getCandidate(CandidateVO vo) {
		return candidateDAO.getCandidate(vo);
	}

	public Map<String, Object> getCandidateList(CandidateVO vo, Paging paging) {
		paging.setPageUnit(10);
		if(paging.getPage() == null) {
			paging.setPage(1);
		}
		vo.setStart(paging.getFirst());
		vo.setEnd(paging.getLast());
		
		paging.setTotalRecord(candidateDAO.getCount(vo));
		return null;
	}

	// 통합 로그인 구현
	public CandidateVO commonLogin(CandidateVO vo) {
		CandidateVO user = candidateDAO.commonLogin(vo);
		String rawPw = vo.getTakerPassword();
		if (scpwd.matches(rawPw, user.getTakerPassword())) {
			return user;
		} else {
			return null;
		}
	}
	 

	public int idcheck(CandidateVO vo) {
		return candidateDAO.idcheck(vo);
	}

	@Override
	public List<CandidateVO> getCandidateList(CandidateVO vo) {
		return candidateDAO.getCandidateList(vo);
	}

	
	@Override
	public List<Map<String, String>> getExamList(CandidateVO vo) {
		return candidateDAO.getExamList(vo);
	}

//	@Override
//	public Map<String, Object> ExamSchedule(CandidateVO vo, Paging paging) {
//		if(paging != null) {
//			if(paging.getPage() == null) {
//				paging.setPage(1);
//			}
//			vo.setStart(paging.getFirst());
//			vo.setEnd(paging.getLast());
//			paging.setTotalRecord(candidateDAO.getCount(vo));
//			Map<String, Object> map = new HashMap<String, Object>();
//			map.put("examSchedule", candidateDAO.getExamSchdule(vo));
//			map.put("paging", paging);
//			return map;
//		}
//		return null;
//	}

	@Override
	public int ExamScheduleCount() {
		return candidateDAO.getCount(null);
	}

	public List<Map<Object, String>> candidateScheduleCheck() {
		
		return candidateDAO.candidateScheduleCheck();
	}

	
	
	
	
	@Override
	public Map<Object, Object> candidateScheduleCheckPage(Paging paging, String takerId) {
		CandidateVO vo = new CandidateVO();
		vo.setTakerId(takerId);
		vo.setStart(1);
		vo.setEnd(5);
		if(paging != null) {
			if(paging.getPage() == null) {
				paging.setPage(1);
			}
			vo.setStart(paging.getFirst());
			vo.setEnd(paging.getLast());
			
			paging.setTotalRecord(candidateDAO.examCount());
			Map<Object, Object> map = new HashMap<Object, Object>();
			map.put("schedulePage", candidateDAO.candidateScheduleCheckPage(vo));
			map.put("paging", paging);
		return map;
		}
		return null;
	}

	@Override
	public Map<String, Object> managerCandidateList(CandidateVO vo, Paging paging) {
		//출력건수
			paging.setPageUnit(10);
			//페이지번호 파라미터
			if(paging.getPage() == null) {
				paging.setPage(1);
			}
			//시작/마지막 레코드 번호
			vo.setStart(paging.getFirst());
			vo.setEnd(paging.getLast());
			//전체 건수
			paging.setTotalRecord(candidateDAO.getManagerCandidateCount(vo));
			
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("takerList", candidateDAO.managerCandidateList(vo));
			map.put("paging", paging);
			return map;	
	}

	@Override
	public int insertKakaoCandidate(CandidateVO vo) {
		return candidateDAO.insertKakaoCandidate(vo);
	}

	@Override
	public String findID(CandidateVO vo) {
		return candidateDAO.findID(vo);
		
	}

	@Override
	public int emailcheck(CandidateVO vo) {
		// TODO Auto-generated method stub
		return candidateDAO.emailcheck(vo);
	} 
}
