package main.service;

import java.text.*;
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
//	public void dbTestSet() {
//		SqlSession ss = fac.openSession();
//		for(int i=501; i<=550; i++){
//			HashMap<String, String> map = new HashMap<>();
//			map.put("id", "test"+i);
//			map.put("name", "test");
//			map.put("pw", "test");
//			map.put("birth", "19991111");
//			map.put("addr1", "����");
//			map.put("addr2", "������");
//			map.put("addr3", "��ġ��");
//			map.put("phone1", "010");
//			map.put("phone2", "9999");
//			map.put("phone3", "9999");
//			map.put("email1", "test");
//			map.put("email2", "test.com");
//			map.put("agSms", "n");
//			map.put("agEmail", "n");
//			map.put("sales", "n");
//			try{
//				ss.insert("member.join", map);
//				ss.commit();
//			} catch(Exception e){
//				ss.rollback();
//				ss.close();
//			}
//		}
//		ss.close();
//	}

	// db interviewList name change
//	public void interviewNameSet() {
//		SqlSession ss = fac.openSession();
//		String[] lastName = {"��", "��", "��", "��", "��", "��", "��", "��", "��", "��", "��", "��", "��", "��", "��", "Ȳ", "��", "��", "��", "ȫ", "��", "��", "��", "��", "��", 
//				"��", "��", "��", "��", "��", "��", "��", "��", "��", "��", "��", "��", "��", "��", "��", "��", "��", "��", "��", "��", "��", "��", "��", "��", "��", "ä", "��", "õ", "��",
//				"��", "��", "��", "��", "��", "��", "��", "��", "��", "��", "��", "��", "��", "��", "��", "��", "��", "��", "��", "��", "��", "��", "��", "ǥ", "��", "��", "��", "��", "��", 
//				"��", "��", "��", "��", "��", "��", "��", "��", "����", "Ź", "��", "��", "��", "��", "��", "��"};
//		String[] firstName1 = {"��", "��", "��", "��", "��", "��", "��", "��", "��", "��", "��", "��", "��", "��", "��"};
//		String[] firstName2 = {"��", "��", "��", "��", "ȣ", "��", "��", "��", "��", "��", "��", "��", "��", "��", "��", "��", "��", "��"};
//		String name1 = "";
//		String name2 = "";
//		String name3 = "";
//		List<HashMap> interviewList = ss.selectList("interview.interviewAllList");
//		for(int i=0; i<interviewList.size(); i++){
//			double lastNameRate = Math.random();
//			double firstNameRate1 = Math.random();
//			double firstNameRate2 = Math.random();
//			double nameLength = Math.random();
//			int n = (int)(lastNameRate*99);
//			int m = (int)(firstNameRate1*15);
//			int o = (int)(firstNameRate2*18);
//			name1 = lastName[n];
//			name2 = firstName1[m];
//			name3 = firstName2[o];
//			String name = name1+name2+name3;
//			if(!name1.equals("����")){
//				if(nameLength > 0.85){
//					name = name1+name2;
//				}
//			}
//			HashMap map = new HashMap();
//			map.put("name", name);
//			map.put("auto", interviewList.get(i).get("auto").toString());
//			ss.update("interview.interviewNameSet", map);
//		}
//		ss.commit();
//		ss.close();
//	}
	
	// db interview comment id change
	public void interviewCommentIdSet() {
		SqlSession ss = fac.openSession();
		String[] alpha = {"a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z"};
		String[] beta = {"A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M", "N", "O", "P", "Q", "R", "S", "T", "U", "V", "W", "X", "Y", "Z"};
		int[] num = {1, 2, 3, 4, 5, 6, 7, 8, 9, 0};
		String id = "";
		List<HashMap> list = ss.selectList("interview.commentAll");
		for(int j=0; j<list.size(); j++){
			id = "";
			int ranId = (int)(Math.random()*17)+4;
			for(int i=0; i<ranId; i++){
				int ran = (int)(Math.random()*3)+1;
				switch(ran){
				case 1:
					ran = (int)(Math.random()*alpha.length);
					break;
				case 2:
					ran = (int)(Math.random()*beta.length);
					break;
				case 3:
					ran = (int)(Math.random()*num.length);
					break;
				}
				if(ran>num.length-1){
					id += Math.random() > 0.5 ? alpha[ran] : beta[ran];
				} else {
					id += num[ran];
				}
			}
			String auto = list.get(j).get("auto").toString();
			HashMap<String, String> map = new HashMap<>();
			map.put("auto", auto);
			map.put("id", id);
			ss.update("interview.commentIdChange", map);
		}
		ss.commit();
		ss.close();
	}

	// �湮�ڼ� üũ �� ������ ����
	public String visitIp(HttpServletRequest req) {
		SqlSession ss = fac.openSession();
		String ip = req.getHeader("X-FORWARDED-FOR"); 
		if(ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
	        ip = req.getHeader("Proxy-Client-IP");
	    }
	    if(ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
	        ip = req.getHeader("WL-Proxy-Client-IP");
	    }
	    if(ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
	        ip = req.getHeader("HTTP_CLIENT_IP");
	    }
	    if(ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
	        ip = req.getHeader("HTTP_X_FORWARDED_FOR");
	    }
	    if(ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
	        ip = req.getRemoteAddr();
	    }
		List<HashMap> ipToday = new Vector<>();
		List<HashMap> ipAll = ss.selectList("main.getIpAll");
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		String today = sdf.format(System.currentTimeMillis());
		for(HashMap m : ipAll){
			if(m.get("day").toString().equals(today)){
				ipToday.add(m);
			}
		}
		int n = 0;
		for(HashMap m : ipToday){
			if(m.get("ip").toString().equals(ip)){
				n++;
				break;
			}
		}
		int todayVisit = ipToday.size();
		int totalVisit = ipAll.size();
		if(n==0){
			try{
				ss.insert("main.visitIp", ip);
				ss.commit();
				ss.close();
				todayVisit++;
				totalVisit++;
			} catch(Exception e){
				e.printStackTrace();
				ss.rollback();
				ss.close();
			}
		} else {
			ss.rollback();
			ss.close();
		}
		return todayVisit+"/"+totalVisit;
	}
	
	// db interview comment day set
//	public void interviewCommentDaySet() {
//		SqlSession ss = fac.openSession();
//		List<HashMap> list = ss.selectList("interview.commentAll");
//		for(int i=0; i<list.size(); i++){
//			String year = "2017";
//			String month = "10";
//			int dayTmp = (int)(Math.random()*24)+1;
//			String day = dayTmp < 10 ? "0"+dayTmp : ""+dayTmp;
//			int hourTmp = (int)(Math.random()*24);
//			String hour = hourTmp < 10 ? "0"+hourTmp : ""+hourTmp;
//			int minTmp = (int)(Math.random()*60);
//			String minute = minTmp < 10 ? "0"+minTmp : ""+minTmp;
//			String date = year+"-"+month+"-"+day+" "+hour+":"+minute;
//			HashMap<String, String> map = new HashMap<>();
//			map.put("auto", list.get(i).get("auto").toString());
//			map.put("day", date);
//			ss.update("interview.commentDayChange", map);
//		}
//		ss.commit();
//		ss.close();
//	}
}
