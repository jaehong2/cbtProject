package com.cbt.consulting;

import java.util.List;
import java.util.Map;

import com.cbt.common.Paging;

public interface ConsultingService {

	void insertConsulting(ConsultingVO vo);
	
	void updateConsulting(ConsultingVO vo);
	
	void deleteConsulting(ConsultingVO vo);
	
	ConsultingVO getConsulting(ConsultingVO vo);
	
	List<ConsultingVO> getConsultingList(ConsultingVO vo);
	
	Map<String, Object> getConsultingList(ConsultingVO vo, Paging paging);
	
	//승환추가
	List<ConsultingVO> managerConsultingList(ConsultingVO vo);
	
	//2019.07.15 승환추가
	public Map<String, Object> managerConsultingList(ConsultingVO vo, Paging paging);
	
	//2019.07.15 승환추가
	ConsultingVO getManagerConsulting(ConsultingVO vo);
	
	//2019.07.15 승환추가
	void managerUpdateConsulting(ConsultingVO vo);
	
	//2019.07.15 승환추가
	void managerConsultingDelete(ConsultingVO vo);
	
	//2019.07.15 승환추가
	void managerConsultingInsert(ConsultingVO vo);
	
	int getConsultingCount();

	List<ConsultingVO> mainConsultingList(ConsultingVO vo);
}
