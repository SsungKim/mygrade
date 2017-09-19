package admin.tab1.service;

import java.text.*;
import java.util.*;

import javax.servlet.http.*;

import org.apache.poi.ss.usermodel.*;
import org.springframework.beans.factory.annotation.*;
import org.springframework.stereotype.*;
import org.springframework.web.servlet.view.document.*;

@Component
public class Tab1ExcelService extends AbstractXlsView {
	@Autowired
	AdminTab1Service at1;
	
	@Override
	protected void buildExcelDocument(Map<String, Object> model, Workbook workbook, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy");
		String year = sdf.format(System.currentTimeMillis());
		String month = model.get("month").toString();
		String name = year+"년 "+month+"월 입금자 리스트";
		String fileName = new String(name.getBytes("euc-kr"), "8859_1");
		response.setHeader("Content-Disposition", "attachment; fileName=\"" + fileName + ".xls\"");
		response.setHeader("Content-Transfer-Encoding", "binary");	
		Sheet sh = workbook.createSheet(name);
		Row row = sh.createRow(1);
		Cell cell = row.createCell(2);
		cell.setCellValue(name);
		CellStyle cs = workbook.createCellStyle();
		Font f = workbook.createFont();
		f.setBoldweight((short)700);
		cs.setFont(f);
		cell.setCellStyle(cs);
		
		Row row2 = sh.createRow(3);
		row2.createCell(0).setCellValue("번호");
		row2.createCell(1).setCellValue("아이디");
		row2.createCell(2).setCellValue("포인트");
		row2.createCell(3).setCellValue("입금액");
		row2.createCell(4).setCellValue("예금주");
		row2.createCell(5).setCellValue("은행");
		row2.createCell(6).setCellValue("계좌번호");
		
		List<HashMap> payList = at1.payAll(month);
		payList.remove(payList.size()-1);
		for(int i=0; i<payList.size(); i++){
			Row r = sh.createRow(i+4);
			HashMap m = payList.get(i);
			Set<String> set = m.keySet();
			Iterator<String> it = set.iterator();
			while(it.hasNext()){
				String key = it.next();
				String value = m.get(key).toString();
				switch(key){
				case "auto":
					r.createCell(0).setCellValue(value);
					break;
				case "user":
					r.createCell(1).setCellValue(value);
					break;
				case "point":
					r.createCell(2).setCellValue(Integer.parseInt(value)*3/10+"P");
					r.createCell(3).setCellValue(Integer.parseInt(value)*100+"원");
					break;
				case "name":
					r.createCell(4).setCellValue(value);
					break;
				case "bank":
					r.createCell(5).setCellValue(value);
					break;
				case "account":
					r.createCell(6).setCellValue(value);
					break;
				}
			}
		}
	}

}
