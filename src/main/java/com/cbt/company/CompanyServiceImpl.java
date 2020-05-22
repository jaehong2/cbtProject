package com.cbt.company;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import com.cbt.common.Paging;

@Service
public class CompanyServiceImpl implements CompanyService {
	BCryptPasswordEncoder scpwd = new BCryptPasswordEncoder();
	
	@Autowired
	CompanyDAO companyDAO;
	
	@Override
	public void insertCompany(CompanyVO vo) {
		// TODO Auto-generated method stub
		vo.setCompanyPassword(scpwd.encode(vo.getCompanyPassword()));
		companyDAO.insertCompany(vo);
	}

	@Override
	public void updateCompany(CompanyVO vo) {
		vo.setCompanyPassword(scpwd.encode(vo.getCompanyPassword()));
		companyDAO.updateCompany(vo);
	}

	@Override
	public void deleteCompany(CompanyVO vo) {
		// TODO Auto-generated method stub
		companyDAO.deleteCompany(vo);
	}

	@Override
	public CompanyVO getCompany(CompanyVO vo) {
		return companyDAO.getCompany(vo);
	}
	// 이승환이쓰고있음
	@Override
	public List<CompanyVO> getCompanyList(CompanyVO vo) {
		return companyDAO.getCompanyList(vo);
	}

	@Override
	public Map<String, Object> getCompanyList(CompanyVO vo, Paging paging) {
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
				paging.setTotalRecord(companyDAO.getManagerCompanyCount(vo));
				Map<String, Object> map = new HashMap<String, Object>();
				map.put("companyList", companyDAO.getCompanyList(vo));
				map.put("paging", paging);
				return map;
	}

	@Override
	public CompanyVO loginCompany(CompanyVO vo) {
		return companyDAO.loginCompany(vo);
	}

	@Override
	public Map<String, Object> managerAccountList(CompanyVO vo, Paging paging) {
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
		paging.setTotalRecord(companyDAO.getManagerCompanyCount(vo));
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("companyList", companyDAO.managerAccountList(vo));
		map.put("paging", paging);
		return map;	
	}

	// 2019.07.31 성재민
	// 사업자 번호가 기존에 입력된 값인지 체크
	@Override
	public int getBusinessNumCount(CompanyVO vo) {
		return companyDAO.getBusinessNumCount(vo);
	}
}
