package admin.tab7.service;

import java.text.*;
import java.util.*;

import org.apache.ibatis.session.*;
import org.springframework.beans.factory.annotation.*;
import org.springframework.stereotype.*;
import org.springframework.web.servlet.*;

@Component
public class AdminTab7Service {
	@Autowired
	SqlSessionFactory fac;
	
	// memberList
	public List<HashMap> memberList(int page){
		SqlSession ss = fac.openSession();
		List<HashMap> list = ss.selectList("admin.memberList", (page-1)*20);
		for(int i=0; i<list.size(); i++){
			HashMap m = list.get(i);
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy");
			String year = sdf.format(System.currentTimeMillis());
			if(m.get("birth").toString().length() >= 4){
				String birth = m.get("birth").toString().substring(0, 4);
				int age = Integer.parseInt(year)-Integer.parseInt(birth)+1;
				m.put("age", age);
			} else {
				String age = "-";
				m.put("age", age);
			}
			list.set(i, m);
		}
		ss.close();
		return list;
	}

	// memberList page
	public int memberPage() {
		SqlSession ss = fac.openSession();
		int page = ss.selectOne("admin.memberCount");
		ss.close();
		return page%20==0 ? page/20 : page/20+1;
	}
	
	// member page inner method
	public ModelAndView memberPageInner(ModelAndView mav, int select){
		int page = memberPage();
		int first = 1;
		int last = page;
		int start = select > first ? select%10 == 0 ? (select/10)*10-10+1 : (select/10)*10+1 : first;
		int end = start+9 < last ? start+9 : last;
		int prev = select%10 == 0 ? (select/10)*10-20+1 : (start/10)*10-10+1;
		int next = (start/10)*10+10+1;
		mav.addObject("select7", select);
		mav.addObject("first7", first);
		mav.addObject("last7", last);
		mav.addObject("start7", start);
		mav.addObject("end7", end);
		mav.addObject("prev7", prev);
		mav.addObject("next7", next);
		return mav;
	}
	
	// memberList search
	public List<HashMap> memberSearch(String word, int page) {
		SqlSession ss = fac.openSession();
		HashMap map = new HashMap();
		map.put("word", "%"+word+"%");
		map.put("page", (page-1)*20);
		List<HashMap> list = ss.selectList("admin.memberSearch", map);
		ss.close();
		return list;
	}

	public int memberPage2(String word) {
		SqlSession ss = fac.openSession();
		int page = ss.selectOne("admin.memberCount2", "%"+word+"%");
		ss.close();
		return page%20==0 ? page/20 : page/20+1;
	}

	// select
	public List<HashMap> memberSelect(String select, int page) {
		SqlSession ss = fac.openSession();
		HashMap map = new HashMap();
		map.put("select", "%"+select+"%");
		map.put("page", (page-1)*20);
		List<HashMap> list = ss.selectList("admin.memberSelect", map);
		if(select.equals("choose")){
			list = ss.selectList("admin.memberList", (page-1)*20);
		}
		ss.close();
		return list;
	}
	
	public int memberPage3(String select) {
		SqlSession ss = fac.openSession();
		int page = ss.selectOne("admin.memberCount3", "%"+select+"%");
		if(select.equals("choose")){
			page = ss.selectOne("admin.memberCount");
		}
		ss.close();
		return page%20==0 ? page/20 : page/20+1;
	}

	// select and search
	public List<HashMap> memberSearchSelect(String word, String select, int page) {
		SqlSession ss = fac.openSession();
		HashMap map = new HashMap();
		map.put("word", "%"+word+"%");
		map.put("select", "%"+select+"%");
		map.put("page", (page-1)*20);
		List<HashMap> list = ss.selectList("admin.memberSearchSelect", map);
		if(select.equals("choose")){
			list = ss.selectList("admin.memberSearch", map);
		}
		ss.close();
		return list;
	}

	public int memberPage4(String select, String word) {
		SqlSession ss = fac.openSession();
		HashMap map = new HashMap();
		map.put("select", "%"+select+"%");
		map.put("word", "%"+word+"%");
		int page = ss.selectOne("admin.memberCount4", map);
		if(select.equals("choose")){
			page = ss.selectOne("admin.memberCount2", map);
		}
		ss.close();
		return page%20==0 ? page/20 : page/20+1;
	}

	// 회원 추방
	public boolean exitMember(String user) {
		SqlSession ss = fac.openSession();
		int n = ss.update("admin.exitMember", user);
		HashMap map = ss.selectOne("member.member", user);
		if(n > 0){
			try{
				ss.insert("admin.exitAdd", map);
				ss.commit();
				ss.close();
				return true;
			} catch(Exception e){
				e.printStackTrace();
				ss.rollback();
				ss.close();
				return false;
			}
		} else {
			ss.rollback();
			ss.close();
			return false;
		}
	}

	// 판매자 박탈
	public boolean sales(String user) {
		SqlSession ss = fac.openSession();
		int n = ss.update("admin.sales", user);
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

	// 관리자 설정
	public boolean admin(String user, String type) {
		SqlSession ss = fac.openSession();
		HashMap<String, String> map = new HashMap<>();
		map.put("user", user);
		map.put("type", type);
		int n = ss.update("admin.admin", map);
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
