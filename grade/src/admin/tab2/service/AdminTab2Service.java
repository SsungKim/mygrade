package admin.tab2.service;

import java.text.*;
import java.util.*;

import org.apache.ibatis.session.*;
import org.springframework.beans.factory.annotation.*;
import org.springframework.stereotype.*;
import org.springframework.web.servlet.*;

@Component
public class AdminTab2Service {
	@Autowired
	SqlSessionFactory fac;

	// 충전리스트
	public List<HashMap> chargeList(int page, String day1, String day2) {
		SqlSession ss = fac.openSession();
		HashMap map = new HashMap();
		map.put("page", (page-1)*20);
		if(day1.equals("0")){
			SimpleDateFormat sdf2 = new SimpleDateFormat("yyyy-MM-dd");
			String now = sdf2.format(System.currentTimeMillis());
			String day = now.substring(0, now.lastIndexOf("-")+1) + "01";
			map.put("day1", day);
			map.put("day2", now);
		} else {
			String year1 = day1.substring(0, 4);
			String month1 = day1.substring(day1.indexOf("-")+1, day1.lastIndexOf("-"));
			String day11 = day1.substring(day1.lastIndexOf("-")+1);
			if(month1.length() == 1)
				month1 = "0"+month1;
			if(day11.length() == 1)
				day11 = "0"+day11;
			day1 = year1+month1+day11;
			String year2 = day2.substring(0, 4);
			String month2 = day2.substring(day2.indexOf("-")+1, day2.lastIndexOf("-"));
			String day22 = day2.substring(day2.lastIndexOf("-")+1);
			if(month2.length() == 1)
				month2 = "0"+month2;
			if(day22.length() == 1)
				day22 = "0"+day22;
			day2 = year2+month2+day22;
			map.put("day1", day1);
			map.put("day2", day2);
		}
		List<HashMap> list = ss.selectList("admin.chargeList", map);
		ss.close();
		return list;
	}
	
	// 충전리스트 page
	public int chargePage(String day1, String day2){
		SqlSession ss = fac.openSession();
		HashMap map = new HashMap();
		if(day1.equals("0")){
			SimpleDateFormat sdf2 = new SimpleDateFormat("yyyy-MM-dd");
			String now = sdf2.format(System.currentTimeMillis());
			String day = now.substring(0, now.lastIndexOf("-")+1) + "01";
			map.put("day1", day);
			map.put("day2", now);
		} else {
			String year1 = day1.substring(0, 4);
			String month1 = day1.substring(day1.indexOf("-")+1, day1.lastIndexOf("-"));
			String day11 = day1.substring(day1.lastIndexOf("-")+1);
			if(month1.length() == 1)
				month1 = "0"+month1;
			if(day11.length() == 1)
				day11 = "0"+day11;
			day1 = year1+month1+day11;
			String year2 = day2.substring(0, 4);
			String month2 = day2.substring(day2.indexOf("-")+1, day2.lastIndexOf("-"));
			String day22 = day2.substring(day2.lastIndexOf("-")+1);
			if(month2.length() == 1)
				month2 = "0"+month2;
			if(day22.length() == 1)
				day22 = "0"+day22;
			day2 = year2+month2+day22;
			map.put("day1", day1);
			map.put("day2", day2);
		}
		int n = ss.selectOne("admin.chargeCount", map);
		ss.close();
		return n%20==0 ? n/20 : n/20+1;
	}

	// 충전리스트 page inner method
	public ModelAndView chargePageInner(ModelAndView mav, int select, String day1, String day2) {
		int page = chargePage(day1, day2);
		int first = 1;
		int last = page;
		int start = select > first ? select%10 == 0 ? (select/10)*10-10+1 : (select/10)*10+1 : first;
		int end = start+9 < last ? start+9 : last;
		int prev = select%10 == 0 ? (select/10)*10-20+1 : (start/10)*10-10+1;
		int next = (start/10)*10+10+1;
		mav.addObject("select2", select);
		mav.addObject("first2", first);
		mav.addObject("last2", last);
		mav.addObject("start2", start);
		mav.addObject("end2", end);
		mav.addObject("prev2", prev);
		mav.addObject("next2", next);
		return mav;
	}

	// 월별
	public List<HashMap> monthTotal(String year) {
		SqlSession ss = fac.openSession();
		List<HashMap> list = new Vector<>();
		for(int i=1; i<=12; i++){
			String month = i > 10 ? ""+i : "0"+i;
			String day1 = "01";
			String day2 = "30";
			if(month.equals("1") || month.equals("3") || month.equals("5") || month.equals("7") || month.equals("8") || month.equals("10") ||
					month.equals("12")){
				day2 = "31";
			} else if(month.equals("2")){
				day2 = "28";
			}
			String d1 = year+month+day1;
			String d2 = year+month+day2;
			List<HashMap> li = carhgeMonth(d1, d2);
			HashMap m = new HashMap();
			int pay = 0;
			for(int j=0; j<li.size(); j++){
				pay += Integer.parseInt(li.get(0).get("pay").toString());
			}
			m.put("pay", pay);
			list.add(m);
		}
		ss.close();
		return list;
	}
	
	// 충전리스트 월 전체
	public List<HashMap> carhgeMonth(String day1, String day2){
		SqlSession ss = fac.openSession();
		HashMap map = new HashMap();
		map.put("day1", day1);
		map.put("day2", day2);
		List<HashMap> list = ss.selectList("admin.chargeMonth", map);
		ss.close();
		return list;
	}
}
