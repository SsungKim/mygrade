package admin.tab6.service;

import java.util.*;

import org.apache.ibatis.session.*;
import org.springframework.beans.factory.annotation.*;
import org.springframework.stereotype.*;
import org.springframework.web.servlet.*;

@Component
public class AdminTab6Service {
	@Autowired
	SqlSessionFactory fac;
	
	// 게시물 리스트
	public List<HashMap> searchList(String type, String search, int page){
		SqlSession ss = fac.openSession();
		HashMap map = new HashMap<>();
		map.put("search", "%"+search+"%");
		map.put("page", (page-1)*20);
		List<HashMap> list = new Vector<>();
		switch(type){
		case "학생부":
			list = ss.selectList("admin.recordList6", map);
			if(search.equals("전체"))
				list = ss.selectList("admin.recordAll", map);
			break;
		case "자소서":
			list = ss.selectList("admin.introList", map);
			if(search.equals("전체"))
				list = ss.selectList("admin.introAll", map);
			break;
		case "면접후기":
			list = ss.selectList("admin.interviewList", map);
			if(search.equals("전체"))
				list = ss.selectList("admin.interviewAll", map);
			break;
		case "정시성적":
			list = ss.selectList("admin.examList", map);
			if(search.equals("전체"))
				list = ss.selectList("admin.examAll", map);
			break;
		}
		for(int i=0; i<list.size(); i++){
			HashMap m = list.get(i);
			List<HashMap> l = ss.selectList("search.word2", m.get("school"));
			m.put("schoolName", l.get(0).get("name"));
			list.set(i, m);
		}
		ss.close();
		return list;
	}
	
	// 게시물 개수
	public int searchPage(String type, String search){
		SqlSession ss = fac.openSession();
		int n = 0;
		switch(type){
		case "학생부":
			n = ss.selectOne("admin.recordCount6", search);
			if(search.equals("전체"))
				n = ss.selectOne("admin.recordAllCount");
			break;
		case "자소서":
			n = ss.selectOne("admin.introCount", search);
			if(search.equals("전체"))
				n = ss.selectOne("admin.introAllCount");
			break;
		case "면접후기":
			n = ss.selectOne("admin.interviewCount", search);
			if(search.equals("전체"))
				n = ss.selectOne("admin.interviewAllCount");
			break;
		case "정시성적":
			n = ss.selectOne("admin.examCount", search);
			if(search.equals("전체"))
				n = ss.selectOne("admin.examAllCount");
			break;
		}
		ss.close();
		return n%20 == 0 ? n/20 : n/20+1;
	}
	
	// 페이지 inner method
	public ModelAndView searchPageInner(ModelAndView mav, int select, String type, String search) {
		int page = searchPage(type, search);
		int first = 1;
		int last = page;
		int start = select > first ? select%10 == 0 ? (select/10)*10-10+1 : (select/10)*10+1 : first;
		int end = start+9 < last ? start+9 : last;
		int prev = select%10 == 0 ? (select/10)*10-20+1 : (start/10)*10-10+1;
		int next = (start/10)*10+10+1;
		mav.addObject("select6", select);
		mav.addObject("first6", first);
		mav.addObject("last6", last);
		mav.addObject("start6", start);
		mav.addObject("end6", end);
		mav.addObject("prev6", prev);
		mav.addObject("next6", next);
		return mav;
	}
	
	// 게시물 삭제
	public boolean remove(String type, String num){
		SqlSession ss = fac.openSession();
		int n = 0;
		switch(type){
		case "학생부":
			n = ss.delete("admin.recordRemove", num);
			break;
		case "자소서":
			n = ss.delete("admin.introRemove", num);
			break;
		case "면접후기":
			n = ss.delete("admin.interviewRemove", num);
			break;
		case "정시성적":
			n = ss.delete("admin.examRemove", num);
			break;
		}
		if(n > 0){
			ss.commit();
			ss.close();
			return true;
		} else {
			ss.rollback();
			ss.close();
			return false;
		}
	}
}
