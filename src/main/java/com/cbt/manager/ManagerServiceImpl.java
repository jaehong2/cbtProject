package com.cbt.manager;

import java.io.ByteArrayInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.mail.util.ByteArrayDataSource;

import org.apache.poi.openxml4j.opc.OPCPackage;
import org.apache.poi.xssf.usermodel.XSSFCell;
import org.apache.poi.xssf.usermodel.XSSFRow;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.cbt.candidate.CandidateVO;
import com.cbt.common.Paging;
import com.cbt.company.CompanyDAO;
import com.cbt.company.CompanyVO;
import com.cbt.exam.ExamVO;

@Service("managerService")
public class ManagerServiceImpl implements ManagerService {
	
	
	
	BCryptPasswordEncoder scpwd = new BCryptPasswordEncoder();
	
	@Autowired
	ManagerDAO managerDAO;

	@Override
	public void insertManager(ManagerVO vo) {
		vo.setManagerPassword(scpwd.encode(vo.getManagerPassword()));
		managerDAO.insertManager(vo);
	}

	@Override
	public void updateManager(ManagerVO vo) {
		managerDAO.updateManager(vo);

	}

	@Override
	public void deleteManager(ManagerVO vo) {
		managerDAO.deleteManager(vo);

	}

	@Override
	public ManagerVO getManager(ManagerVO vo) {
		return managerDAO.getManager(vo);
	}

	@Override
	public List<ManagerVO> getManagerList(ManagerVO vo) {
		return managerDAO.getManagerList(vo);
	}

	@Override
	public Map<String, Object> getManagerList(ManagerVO vo, Paging paging) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("managerList", managerDAO.getManagerList(vo));
		return map;
	}

	// 7/5 재용 추가
	public ManagerTakerVO getManagerUserAccountView(ManagerTakerVO vo) {
		return managerDAO.getManagerUserAccountView(vo);
	}

	public List<CompanyVO> managerAccountList(CompanyDAO dao, CompanyVO vo) {
		return dao.getCompanyList(vo);
	}

	@Override
	public List<CompanyVO> managerAccountList(CompanyVO vo) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public ManagerVO loginManager(ManagerVO vo) {
		return managerDAO.loginManager(vo);
	}

	// 2019.07.15 성재민
	// 엑셀 업로드
	@Override
	public List<CandidateVO> uploadExcelFile(MultipartFile excelFile) {
		List<CandidateVO> list = new ArrayList<CandidateVO>();
		try {
			OPCPackage opcPackage = OPCPackage.open(excelFile.getInputStream());
			XSSFWorkbook workbook = new XSSFWorkbook(opcPackage);

			// 첫번째 시트 불러오기
			XSSFSheet sheet = workbook.getSheetAt(0);

			// 한줄씩 반복문
			for (int i = 1; i < sheet.getLastRowNum() + 1; ++i) {
				XSSFRow row = sheet.getRow(i);

				// 행이 존재하기 않으면 패스
				if (row == null) {
					continue;
				}

				List<String> candidateVOValues = new ArrayList<String>();
				
				// 엑셀 파일의 각각의 값 읽어 오기
				// 엑셀 파일과 vo 객체가 타입이 맞지 않는 경우엔 타입을 맞춰서 입력 하여야 함.
				for(int j = 0; j < row.getLastCellNum(); ++j) {
					XSSFCell cell = row.getCell(j);
					if(cell != null) {
						candidateVOValues.add(cell.getStringCellValue());
					}
				}
				
				// vo 객체 변수 갯수 체크 하여 매칭
				if(candidateVOValues.size() == 8) {
					CandidateVO candidateVO = new CandidateVO(candidateVOValues);
					list.add(candidateVO);
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	// 2019.07.15 성재민
	// 모든 시험 리턴
	@Override
	public Map<String, Object> getManagerAllExam(ExamVO vo, Paging paging) {
		paging.setPageUnit(10);
		//페이지번호 파라미터
		if(paging.getPage() == null) {
			paging.setPage(1);
		}
		// 시작/마지막 레코드 번호
		vo.setStart(paging.getFirst());
		vo.setEnd(paging.getLast());
		// 전체 건수
		paging.setTotalRecord(managerDAO.getExamCount(vo));
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("examList", managerDAO.getManagerAllExam(vo));
		map.put("paging", paging);
		return map;

	}

	// 2019.07.15 성재민
	// 시험 id로 하나만 검색
	@Override
	public Map<String, String> getManagerExam(ExamVO vo) {
		return managerDAO.getManagerExam(vo);
	}

	// 2019.07.23 성재민
	// 모든 비공개 시험 정보 가져오기
	@Override
	public List<Map<String, Object>> getManagerAllPrivateExamList() {
		return managerDAO.getManagerAllPrivateExamList();
	}
	
	
}
