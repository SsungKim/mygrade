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
	
	// �Խù� ����Ʈ
	public List<HashMap> searchList(String type, String search, int page){
		SqlSession ss = fac.openSession();
		HashMap map = new HashMap<>();
		map.put("search", "%"+search+"%");
		map.put("page", (page-1)*20);
		List<HashMap> list = new Vector<>();
		switch(type){
		case "�л���":
			list = ss.selectList("admin.recordList6", map);
			if(search.equals("��ü"))
				list = ss.selectList("admin.recordAll", map);
			break;
		case "�ڼҼ�":
			list = ss.selectList("admin.introList", map);
			if(search.equals("��ü"))
				list = ss.selectList("admin.introAll", map);
			break;
		case "�����ı�":
			list = ss.selectList("admin.interviewList", map);
			if(search.equals("��ü"))
				list = ss.selectList("admin.interviewAll", map);
			break;
		case "���ü���":
			list = ss.selectList("admin.examList", map);
			if(search.equals("��ü"))
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
	
	// �Խù� ����
	public int searchPage(String type, String search){
		SqlSession ss = fac.openSession();
		int n = 0;
		switch(type){
		case "�л���":
			n = ss.selectOne("admin.recordCount6", search);
			if(search.equals("��ü"))
				n = ss.selectOne("admin.recordAllCount");
			break;
		case "�ڼҼ�":
			n = ss.selectOne("admin.introCount", search);
			if(search.equals("��ü"))
				n = ss.selectOne("admin.introAllCount");
			break;
		case "�����ı�":
			n = ss.selectOne("admin.interviewCount", search);
			if(search.equals("��ü"))
				n = ss.selectOne("admin.interviewAllCount");
			break;
		case "���ü���":
			n = ss.selectOne("admin.examCount", search);
			if(search.equals("��ü"))
				n = ss.selectOne("admin.examAllCount");
			break;
		}
		ss.close();
		return n%20 == 0 ? n/20 : n/20+1;
	}
	
	// ������ inner method
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
	
	// �Խù� ����
	public boolean remove(String type, String num){
		SqlSession ss = fac.openSession();
		int n = 0;
		switch(type){
		case "�л���":
			n = ss.delete("admin.recordRemove", num);
			break;
		case "�ڼҼ�":
			n = ss.delete("admin.introRemove", num);
			break;
		case "�����ı�":
			n = ss.delete("admin.interviewRemove", num);
			break;
		case "���ü���":
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
