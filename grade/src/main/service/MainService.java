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
	
	// �α���
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
	
	// �ڵ��α���
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

	// ���ε� ���а˻�
	public List<HashMap> searchUniv(String word) {
		SqlSession ss = fac.openSession();
		List<HashMap> list = ss.selectList("search.word3", "%"+word+"%");
		ss.close();
		return list;
	}

	// ���а˻� �� ����
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
			map.put("addr1", "����");
			map.put("addr2", "������");
			map.put("addr3", "��ġ��");
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

	// db interviewList name change
	public void interviewNameSet() {
		SqlSession ss = fac.openSession();
		String[] lastName = {"��", "��", "��", "��", "��", "��", "��", "��", "��", "��", "��", "��", "��", "��", "��", "Ȳ", "��", "��", "��", "ȫ", "��", "��", "��", "��", "��", 
				"��", "��", "��", "��", "��", "��", "��", "��", "��", "��", "��", "��", "��", "��", "��", "��", "��", "��", "��", "��", "��", "��", "��", "��", "��", "ä", "��", "õ", "��",
				"��", "��", "��", "��", "��", "��", "��", "��", "��", "��", "��", "��", "��", "��", "��", "��", "��", "��", "��", "��", "��", "��", "��", "ǥ", "��", "��", "��", "��", "��", 
				"��", "��", "��", "��", "��", "��", "��", "��", "����", "Ź", "��", "��", "��", "��", "��", "��"};
		String[] firstName1 = {"��", "��", "��", "��", "��", "��", "��", "��", "��", "��", "��", "��", "��", "��", "��"};
		String[] firstName2 = {"��", "��", "��", "��", "ȣ", "��", "��", "��", "��", "��", "��", "��", "��", "��", "��", "��", "��", "��"};
		String name1 = "";
		String name2 = "";
		String name3 = "";
		List<HashMap> interviewList = ss.selectList("interview.interviewAllList");
		for(int i=0; i<interviewList.size(); i++){
			double lastNameRate = Math.random();
			double firstNameRate1 = Math.random();
			double firstNameRate2 = Math.random();
			double nameLength = Math.random();
			int n = (int)(lastNameRate*99);
			int m = (int)(firstNameRate1*15);
			int o = (int)(firstNameRate2*18);
			name1 = lastName[n];
			name2 = firstName1[m];
			name3 = firstName2[o];
			String name = name1+name2+name3;
			if(!name1.equals("����")){
				if(nameLength > 0.85){
					name = name1+name2;
				}
			}
			HashMap map = new HashMap();
			map.put("name", name);
			map.put("auto", interviewList.get(i).get("auto").toString());
			ss.update("interview.interviewNameSet", map);
		}
		ss.commit();
		ss.close();
	}
}
