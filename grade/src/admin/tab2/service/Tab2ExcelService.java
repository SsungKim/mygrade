package admin.tab2.service;

import java.util.*;

import javax.servlet.http.*;

import org.apache.poi.ss.usermodel.*;
import org.springframework.beans.factory.annotation.*;
import org.springframework.stereotype.*;
import org.springframework.web.servlet.view.document.*;

@Component
public class Tab2ExcelService extends AbstractXlsView {
	@Autowired
	AdminTab2Service at2;

	@Override
	protected void buildExcelDocument(Map<String, Object> model, Workbook workbook, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		String day1 = model.get("day1").toString();
		String day2 = model.get("day2").toString();
		String name = day1+"~"+day2+" 충전리스트";
		String fileName = new String(name.getBytes("euc-kr"), "8859_1");
		response.setHeader("Content-Disposition", "attachment; fileName=\"" + fileName + ".xls\"");
		response.setHeader("Content-Transfer-Encoding", "binary");	
		Sheet sh = workbook.createSheet(name);
		Row row = sh.createRow(1);
		Cell cell = row.createCell(1);
		cell.setCellValue(name);
		CellStyle cs = workbook.createCellStyle();
		Font f = workbook.createFont();
		f.setBoldweight((short)700);
		cs.setFont(f);
		cell.setCellStyle(cs);
		
		Row row2 = sh.createRow(3);
		row2.createCell(0).setCellValue("번호");
		row2.createCell(1).setCellValue("날짜");
		row2.createCell(2).setCellValue("아이디");
		row2.createCell(3).setCellValue("금액");
		row2.createCell(4).setCellValue("결제수단");
		
		List<HashMap> chargeList = at2.carhgeMonth(day1, day2);
		for(int i=0; i<chargeList.size(); i++){
			Row r = sh.createRow(i+4);
			HashMap m = chargeList.get(i);
			Set<String> set = m.keySet();
			Iterator<String> it = set.iterator();
			while(it.hasNext()){
				String key = it.next();
				String value = m.get(key).toString();
				switch(key){
				case "auto":
					r.createCell(0).setCellValue(value);
					break;
				case "id":
					r.createCell(2).setCellValue(value);
					break;
				case "pay":
					r.createCell(3).setCellValue(Integer.parseInt(value)+"원");
					break;
				case "applyNum":
					r.createCell(4).setCellValue(value.equals("-") ? "휴대폰" : "신용카드");
					break;
				case "day":
					r.createCell(1).setCellValue(value);
					break;
				}
			}
		}
	}

}
