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

	// db interviewList name change
	public void interviewNameSet() {
		SqlSession ss = fac.openSession();
		String[] lastName = {"김", "이", "박", "최", "정", "강", "조", "윤", "장", "임", "한", "오", "서", "신", "권", "황", "안", "송", "전", "홍", "유", "고", "문", "양", "배", 
				"조", "백", "허", "유", "남", "신", "노", "정", "하", "곽", "성", "차", "주", "우", "구", "신", "임", "전", "민", "유", "류", "나", "진", "지", "엄", "채", "원", "천", "방",
				"공", "강", "현", "함", "변", "염", "양", "변", "여", "추", "노", "도", "소", "신", "석", "선", "설", "마", "길", "주", "연", "방", "위", "표", "명", "기", "반", "라", "왕", 
				"금", "옥", "육", "인", "맹", "제", "모", "장", "남궁", "탁", "국", "여", "진", "어", "은", "편"};
		String[] firstName1 = {"지", "동", "현", "성", "정", "영", "준", "민", "도", "예", "서", "주", "은", "유", "미"};
		String[] firstName2 = {"훈", "민", "우", "현", "호", "식", "수", "재", "윤", "준", "연", "현", "서", "혜", "빈", "지", "자", "순"};
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
			if(!name1.equals("남궁")){
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
