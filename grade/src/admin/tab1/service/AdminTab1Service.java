package admin.tab1.service;

import java.text.*;
import java.util.*;

import org.apache.ibatis.session.*;
import org.springframework.beans.factory.annotation.*;
import org.springframework.stereotype.*;
import org.springframework.web.servlet.*;

@Component
public class AdminTab1Service {
	@Autowired
	SqlSessionFactory fac;

	// 입금자 리스트
	public List<HashMap> payList(int page, String month) {
		SqlSession ss = fac.openSession();
		HashMap map = new HashMap();
		map.put("page", (page-1)*20);
		if(month.equals("0")){
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
			String day2 = sdf.format(System.currentTimeMillis());
			String day1 = day2.substring(0, day2.lastIndexOf("-")+1) + "01";
			map.put("day1", day1);
			map.put("day2", day2);
		} else {
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy");
			String year = sdf.format(System.currentTimeMillis());
			if(month.length()==1){
				month = "0"+month;
			}
			String day = "30";
			if(month.equals("1") || month.equals("3") || month.equals("5") || month.equals("7") || month.equals("8") || month.equals("10") ||
					month.equals("12")){
				day = "31";
			} else if(month.equals("2")){
				day = "28";
			}
			String day1 = year+month+"01";
			String day2 = year+month+day;
			map.put("day1", day1);
			map.put("day2", day2);
		}
		List<HashMap> list = ss.selectList("admin.payList", map);
		for(int i=0; i<list.size(); i++){
			HashMap m = list.get(i);
			String item = m.get("item").toString();
			int point = 12;
			int pay = 1200;
			switch(item){
			case "면접후기":
				point = 9;
				pay = 900;
				break;
			case "정시성적":
				point = 3;
				pay = 300;
				break;
			}
			m.put("point", point);
			m.put("pay", pay);
			list.set(i, m);
		}
		List<HashMap> list2 = new Vector<>();
		list2.add(new HashMap());
		for(int i=0; i<list.size()+1; i++){
			for(int j=i+1; j<list.size(); j++){
				HashMap m1 = list.get(i);
				HashMap m2 = list.get(j);
				if(m1.get("user").toString().equals(m2.get("user").toString())){
					m1.put("point", Integer.parseInt(m1.get("point").toString())+Integer.parseInt(m2.get("point").toString()));
					m1.put("pay", Integer.parseInt(m1.get("pay").toString())+Integer.parseInt(m2.get("pay").toString()));
					list.set(i, m1);
					list.remove(j);
					j--;
				}
			}
		}
		ss.close();
		return list;
	}
	
	// 입금자 리스트 전체
	public List<HashMap> payAll(String month){
		SqlSession ss = fac.openSession();
		HashMap map = new HashMap();
		if(month.equals("0")){
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
			String day2 = sdf.format(System.currentTimeMillis());
			String day1 = day2.substring(0, day2.lastIndexOf("-")+1) + "01";
			map.put("day1", day1);
			map.put("day2", day2);
		} else {
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy");
			String year = sdf.format(System.currentTimeMillis());
			if(month.length()==1){
				month = "0"+month;
			}
			String day = "30";
			if(month.equals("1") || month.equals("3") || month.equals("5") || month.equals("7") || month.equals("8") || month.equals("10") ||
					month.equals("12")){
				day = "31";
			} else if(month.equals("2")){
				day = "28";
			}
			String day1 = year+month+"01";
			String day2 = year+month+day;
			map.put("day1", day1);
			map.put("day2", day2);
		}
		List<HashMap> list = ss.selectList("admin.payAll", map);
		int point = 0;
		int pay = 0;
		for(int i=0; i<list.size(); i++){
			HashMap m = list.get(i);
			String item = m.get("item").toString();
			switch(item){
			case "면접후기":
				point += 9;
				pay += 900;
				break;
			case "정시성적":
				point += 3;
				pay += 300;
				break;
			default:
				point += 12;
				pay += 1200;
				break;
			}
		}
		HashMap map2 = new HashMap();
		map2.put("point", point);
		map2.put("pay", pay);
		list.add(map2);
		ss.close();
		return list;
	}
	
	// 입금자 리스트 개수
	public int payPage(String month){
		SqlSession ss = fac.openSession();
		HashMap map = new HashMap();
		if(month.equals("0")){
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
			String day2 = sdf.format(System.currentTimeMillis());
			String day1 = day2.substring(0, day2.lastIndexOf("-")+1) + "01";
			map.put("day1", day1);
			map.put("day2", day2);
		} else {
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy");
			String year = sdf.format(System.currentTimeMillis());
			if(month.length()==1){
				month = "0"+month;
			}
			String day = "30";
			if(month.equals("1") || month.equals("3") || month.equals("5") || month.equals("7") || month.equals("8") || month.equals("10") ||
					month.equals("12")){
				day = "31";
			} else if(month.equals("2")){
				day = "28";
			}
			String day1 = year+month+"01";
			String day2 = year+month+day;
			map.put("day1", day1);
			map.put("day2", day2);
		}
		int n = ss.selectOne("admin.payCount", map);
		ss.close();
		return n%20==0 ? n/20 : n/20+1;
	}

	// 입금자 리스트 page method
	public ModelAndView payPageInner(ModelAndView mav, int select, String month) {
		int page = payPage(month);
		int first = 1;
		int last = page;
		int start = select > first ? select%10 == 0 ? (select/10)*10-10+1 : (select/10)*10+1 : first;
		int end = start+9 < last ? start+9 : last;
		int prev = select%10 == 0 ? (select/10)*10-20+1 : (start/10)*10-10+1;
		int next = (start/10)*10+10+1;
		mav.addObject("select1", select);
		mav.addObject("first1", first);
		mav.addObject("last1", last);
		mav.addObject("start1", start);
		mav.addObject("end1", end);
		mav.addObject("prev1", prev);
		mav.addObject("next1", next);
		return mav;
	}
}
