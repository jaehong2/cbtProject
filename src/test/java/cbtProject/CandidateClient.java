package cbtProject;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.junit.Ignore;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.cbt.question.QuestionDAO;
import com.cbt.question.QuestionVO;
import com.cbt.takeExam.TakeExamVO;


@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = "classpath:config/applicationContext.xml")
public class CandidateClient {

	@Autowired
	QuestionDAO dao;
	@Ignore
	@Test
	public void getTestList() {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("takeExamId", 1);
		dao.getTestList(map);
		System.out.println(map);
		System.out.println(map.get("result"));
		System.out.println(map.get("QuestionVOt"));
		
	}
	
	@Ignore @Test
	public void getTestResultList() {
		QuestionVO vo = new QuestionVO();
		vo.setTakeExamId(1);
		
		vo = dao.getTestResultList(vo);
		
		System.out.println(vo);
		System.out.println(vo.getExamId());
		System.out.println(vo.getExamName());
		System.out.println(vo.getPassingScore());
		System.out.println(vo.getPoint());
		System.out.println(vo.getTakeExamId());
		System.out.println(vo.getTakerName());
		
	}
	
	@Ignore @Test
	public void getcandidateTakeExamList() {
		TakeExamVO vo = new TakeExamVO();
		vo.setExamId(1);
		
	}
	
	@Test
	public void readexcel() {
        String path = "C:\\Users\\Root\\Downloads\\test5555.xlsx"; // 읽을 파일 경로
        ArrayList<QuestionVO> theaterlist = new ArrayList<QuestionVO>(); // 데이터를 담을 list
 
        try {
            File file = new File(path);
            FileInputStream inputStream = new FileInputStream(file);
            HSSFWorkbook hworkbook = new HSSFWorkbook(inputStream); // 2007 이전 버전(xls파일)
            
//            XSSFWorkbook xworkbook = new XSSFWorkbook(inputStream); // 2007 이후 버전(xlsx파일)
            
            HSSFSheet curSheet; // 현재 sheet
            HSSFCell curCell; // 현재 cell
            HSSFRow curRow; // 현재 row
 
            int sheetNumber = hworkbook.getNumberOfSheets(); // 엑셀 Sheet 총 갯수
            //System.out.println("sheetNumber : "+sheetNumber);  Sheet 갯수 확인
            while (sheetNumber != 0) {
                sheetNumber--;
 
                curSheet = hworkbook.getSheetAt(sheetNumber);
                int row = curSheet.getPhysicalNumberOfRows();
                //System.out.println(row); 현재 sheet의 row 갯수 확인
                for (int i = 1; i < row; i++) {
                	QuestionVO vo = new QuestionVO();
                    curRow = curSheet.getRow(i);
                    
                    // vo의 setter를 이용해 담고 있습니다.
                    // 여기서는 그대로 담는 것이 아니라 자료형에 맞춰서 형변환을 해주셔야 합니다.
                    vo.setQuestionContent(String.valueOf(curRow.getCell(1)));
                    vo.setExample1(String.valueOf(curRow.getCell(2)));
                    vo.setExample2(String.valueOf(curRow.getCell(3)));
                    vo.setExample3(String.valueOf(curRow.getCell(4)));
                    vo.setExample4(String.valueOf(curRow.getCell(5)));
                    vo.setRightAnswer(String.valueOf(curRow.getCell(6)));
                    vo.setRightCommentary(String.valueOf(curRow.getCell(7)));
                    vo.setLevelOfDifficulty(Integer.valueOf(String.valueOf(curRow.getCell(8))));
                    vo.setCategoryId(Integer.valueOf(String.valueOf(curRow.getCell(9))));
                    vo.setQuestionType(String.valueOf(curRow.getCell(10)));
 
                    theaterlist.add(vo);
                }
            }
 
        } catch (FileNotFoundException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        } catch (IOException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        System.out.println(theaterlist);
    }

}
