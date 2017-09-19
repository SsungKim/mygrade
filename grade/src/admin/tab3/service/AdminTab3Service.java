package admin.tab3.service;

import java.text.*;
import java.util.*;

import org.apache.ibatis.session.*;
import org.springframework.beans.factory.annotation.*;
import org.springframework.stereotype.*;
import org.springframework.web.servlet.*;

@Component
public class AdminTab3Service {
	@Autowired
	SqlSessionFactory fac;

	// 사용리스트
	public List<HashMap> useList(int page, String day1, String day2) {
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
		List<HashMap> list = ss.selectList("admin.useList", map);
		for(int i=0; i<list.size(); i++){
			HashMap m = list.get(i);
			List<HashMap> l = ss.selectList("search.word2", m.get("school"));
			m.put("schoolName", l.get(0).get("name"));
			list.set(i, m);
		}
		ss.close();
		for(int i=0; i<list.size(); i++){
			HashMap m = list.get(i);
			int point = 100;
			if(m.get("item").toString().equals("면접후기")){
				point = 50;
			}
			if(m.get("item").toString().equals("정시성적")){
				point = 10;
			}
			m.put("point", point);
			m.put("point1", point*70/100);
			m.put("point2", point*30/100);
			list.set(i, m);
		}
		return list;
	}
	
	// 사용리스트 page
	public int usePage(String day1, String day2){
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
		int n = ss.selectOne("admin.useCount", map);
		ss.close();
		return n%20==0 ? n/20 : n/20+1;
	}

	// 사용리스트 page inner method
	public ModelAndView usePageInner(ModelAndView mav, int select, String day1, String day2) {
		int page = usePage(day1, day2);
		int first = 1;
		int last = page;
		int start = select > first ? select%10 == 0 ? (select/10)*10-10+1 : (select/10)*10+1 : first;
		int end = start+9 < last ? start+9 : last;
		int prev = select%10 == 0 ? (select/10)*10-20+1 : (start/10)*10-10+1;
		int next = (start/10)*10+10+1;
		mav.addObject("select3", select);
		mav.addObject("first3", first);
		mav.addObject("last3", last);
		mav.addObject("start3", start);
		mav.addObject("end3", end);
		mav.addObject("prev3", prev);
		mav.addObject("next3", next);
		return mav;
	}

	// 사용리스트 전체
	public List<HashMap> useAll(String day1, String day2) {
		SqlSession ss = fac.openSession();
		HashMap<String, String> map = new HashMap<>();
		map.put("day1", day1);
		map.put("day2", day2);
		List<HashMap> list = ss.selectList("admin.useAll", map);
		ss.close();
		return list;
	}
	
}
