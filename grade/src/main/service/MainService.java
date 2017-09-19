package main.service;

import java.util.*;

import javax.servlet.http.*;

import org.apache.ibatis.session.*;
import org.springframework.beans.factory.annotation.*;
import org.springframework.stereotype.*;

import record.service.*;
import search.service.*;

@Component
public class MainService {
	@Autowired
	SqlSessionFactory fac;
	@Autowired
	RecordService rs;
	@Autowired
	SearchService search;
	
	// 로그인
	public int login(String id, String pw, boolean auto, boolean save, HttpSession session, HttpServletRequest req, HttpServletResponse resp) {
		SqlSession ss = fac.openSession();
		HashMap<String, String> map = new HashMap<>();
		map.put("id", id);
		map.put("pw", pw);
		List<HashMap> list = ss.selectList("member.login", map);
		if(list.size() > 0){
			HashMap sales = ss.selectOne("member.salesOne", list.get(0).get("id").toString());
			if(sales != null){
				list.get(0).put("haddr", sales.get("haddr").toString());
				list.get(0).put("hschool", sales.get("hschool").toString());
				list.get(0).put("bank", sales.get("bank").toString());
				list.get(0).put("account", sales.get("account").toString());
				list.get(0).put("passData", sales.get("passData").toString());
			}
			session.setAttribute("login", list.get(0));
			if(auto){
				Cookie autoId = new Cookie("autoId", list.get(0).get("id").toString());
				autoId.setPath("/");
				autoId.setMaxAge(60*60*24*30);
				resp.addCookie(autoId);
				Cookie autoPw = new Cookie("autoPw", list.get(0).get("pw").toString());
				autoPw.setPath("/");
				autoPw.setMaxAge(60*60*24*30);
				resp.addCookie(autoPw);
				Cookie[] car = req.getCookies();
				if(car != null){
					for(Cookie c : car){
						if(c.getName().equals("saveId")){
							Cookie cc = new Cookie("saveId", "aa");
							cc.setPath("/");
							cc.setMaxAge(0);
							resp.addCookie(cc);
						}
					}
				}
			} else if(save){
				Cookie saveId = new Cookie("saveId", list.get(0).get("id").toString());
				saveId.setPath("/");
				saveId.setMaxAge(60*60*24*30);
				resp.addCookie(saveId);
				Cookie[] car = req.getCookies();
				if(car != null){
					for(Cookie c : car){
						if(c.getName().equals("autoId")){
							Cookie cc = new Cookie("autoId", "a");
							cc.setPath("/");
							cc.setMaxAge(0);
							resp.addCookie(cc);
						}
						if(c.getName().equals("autoPw")){
							Cookie cc = new Cookie("autoPw", "a");
							cc.setPath("/");
							cc.setMaxAge(0);
							resp.addCookie(cc);
						}
					}
				}
			} else {
				Cookie[] car = req.getCookies();
				if(car != null){
					for(Cookie c : car){
						if(c.getName().equals("autoId")){
							Cookie cc = new Cookie("autoId", "a");
							cc.setPath("/");
							cc.setMaxAge(0);
							resp.addCookie(cc);
						}
						if(c.getName().equals("autoPw")){
							Cookie cc = new Cookie("autoPw", "a");
							cc.setPath("/");
							cc.setMaxAge(0);
							resp.addCookie(cc);
						}
						if(c.getName().equals("saveId")){
							Cookie cc = new Cookie("saveId", "a");
							cc.setPath("/");
							cc.setMaxAge(0);
							resp.addCookie(cc);
						}
					}
				}
			}
			ss.close();
			return 0;
		} else {
			List<HashMap> list2 = ss.selectList("member.exitList", map);
			if(list2.size() > 0){
				ss.close();
				return 1;
			} else {
				ss.close();
				return 2;
			}
		}
	}
	
	// 자동로그인
	public void autoLogin(String id, String pw, HttpSession session){
		SqlSession ss = fac.openSession();
		HashMap<String, String> map = new HashMap<>();
		map.put("id", id);
		map.put("pw", pw);
		List<HashMap> list = ss.selectList("member.login", map);
		ss.close();
		if(list.size() > 0){
			session.setAttribute("login", list.get(0));
		}
	}

	// 업로드 대학검색
	public List<HashMap> searchUniv(String word) {
		SqlSession ss = fac.openSession();
		List<HashMap> list = ss.selectList("search.word3", "%"+word+"%");
		ss.close();
		return list;
	}

	// 대학검색 후 선택
	public HashMap<String, String> selectUniv(String word) {
		SqlSession ss = fac.openSession();
		HashMap<String, String> map = ss.selectOne("search.word3", word);
		ss.close();
		return map;
	}

	// db Test id setting
	public void dbTestSet() {
		SqlSession ss = fac.openSession();
		for(int i=501; i<=550; i++){
			HashMap<String, String> map = new HashMap<>();
			map.put("id", "test"+i);
			map.put("name", "test");
			map.put("pw", "test");
			map.put("birth", "19991111");
			map.put("addr1", "서울");
			map.put("addr2", "강남구");
			map.put("addr3", "대치동");
			map.put("phone1", "010");
			map.put("phone2", "9999");
			map.put("phone3", "9999");
			map.put("email1", "test");
			map.put("email2", "test.com");
			map.put("agSms", "n");
			map.put("agEmail", "n");
			map.put("sales", "n");
			try{
				ss.insert("member.join", map);
				ss.commit();
			} catch(Exception e){
				ss.rollback();
				ss.close();
			}
		}
		ss.close();
	}
}
