package record.service;

import java.io.*;
import java.util.*;

import javax.servlet.*;
import javax.servlet.http.*;

import org.apache.ibatis.session.*;
import org.springframework.beans.factory.annotation.*;
import org.springframework.stereotype.*;
import org.springframework.web.multipart.*;

import search.service.*;

@Component
public class RecordService {
	@Autowired
	SqlSessionFactory fac;
	@Autowired
	ServletContext application;
	@Autowired
	SearchService search;
	
	// 학생부 파일저장
	public String recordData(MultipartFile file) {
		if(file.isEmpty()){
			return null;
		}
		try{
			String uuid = UUID.randomUUID().toString().substring(0, 8);
			String extension = file.getOriginalFilename().substring(file.getOriginalFilename().lastIndexOf("."));
			File f = new File(application.getRealPath("/file/record"), uuid);
			file.transferTo(f);
			return uuid;
		} catch(Exception e){
			e.printStackTrace();
			return null;
		}
	}

	// 학생부 파일등록
	public boolean uploadFile(HttpSession session, String[] recordData) {
		SqlSession ss = fac.openSession();
		HashMap<String, String> map = new HashMap<>();
		map.put("user", ((HashMap)session.getAttribute("login")).get("auto").toString());
		for(int i=0; i<recordData.length; i++){
			map.put("record"+(i+1), recordData[i]);
		}
		HashMap record = ss.selectOne("record.recordOne", map.get("user"));
		if(record == null){
			try{
				ss.insert("record.uploadFile", map);
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
			int n = ss.update("record.recordFileUpdate", map);
			if(n>0){
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
	
	// 학생부 저장
	public boolean uploadRecord(HttpSession session, String addr, String school, String subject, String type,
			String year, String admission, String typical, String pass, String award1,
			String career, String auto, String extra, String club, String help, String soju, String paper,
			String etc, String reading, String special, String grade, String award, String time, String book) {
		SqlSession ss = fac.openSession();
		HashMap<String, String> map = new HashMap<>();
		String user = ((HashMap)session.getAttribute("login")).get("auto").toString();
		String id = ((HashMap)session.getAttribute("login")).get("id").toString();
		String name = ((HashMap)session.getAttribute("login")).get("name").toString();
		map.put("user", user);
		map.put("id", id);
		map.put("name", name);
		map.put("addr", addr);
		map.put("school", school);
		map.put("subject", subject);
		map.put("type", type);
		map.put("year", year);
		map.put("admission", admission);
		map.put("typical", typical);
		map.put("pass", pass);
		award1 = award1.replace("\n", "<br>");
		map.put("award1", award1);
		career = career.replace("\n", "<br>");
		map.put("career", career);
		auto = auto.replace("\n", "<br>");
		map.put("auto", auto);
		extra = extra.replace("\n", "<br>");
		map.put("extra", extra);
		club = club.replace("\n", "<br>");
		map.put("club", club);
		help = help.replace("\n", "<br>");
		map.put("help", help);
		soju = soju.replace("\n", "<br>");
		map.put("soju", soju);
		paper = paper.replace("\n", "<br>");
		map.put("paper", paper);
		etc = etc.replace("\n", "<br>");
		map.put("etc", etc);
		reading = reading.replace("\n", "<br>");
		map.put("reading", reading);
		special = special.replace("\n", "<br>");
		map.put("special", special);
		map.put("grade", grade);
		map.put("award", award);
		map.put("time", time);
		map.put("book", book);
		switch(id){
		case "admin":
			return uploadAdmin(ss, map, user);
		default:
			boolean b = false;
			List<HashMap> list = ss.selectList("record.recordUser", user);
			if(list.size() > 0){
				ss.delete("record.deleteRecord", user);
				ss.commit();
			}
			List<HashMap> schoolList = ss.selectList("school.schoolList", user);
			for(int i=0; i<schoolList.size(); i++){
				HashMap aa = schoolList.get(i);
				map.put("addr", aa.get("addr").toString());
				map.put("school", aa.get("school").toString());
				map.put("subject", aa.get("subject").toString());
				map.put("year", aa.get("year").toString());
				map.put("admission", aa.get("admission").toString());
				map.put("typical", aa.get("typical").toString());
				map.put("hschool", aa.get("hschool").toString());
				map.put("pass", aa.get("pass").toString());
				map.put("type", aa.get("type").toString());
				b = uploadNormal(ss, map, user);
			}
			ss.close();
			return b;
		}
	}
	
	// 학생부 업로드 - 일반
	public boolean uploadNormal(SqlSession ss, HashMap map, String user){
		try{
			ss.insert("record.uploadRecord", map);
			List<HashMap> li = ss.selectList("record.recordOne", user);
			if(li.size() > 0){
				HashMap m = li.get(0);
				HashMap tmp = new HashMap();
				tmp.put("auto", m.get("auto"));
				tmp.put("school", map.get("school"));
				ss.update("record.fileSet", tmp);
			}
			ss.commit();
			return true;
		} catch(Exception e){
			e.printStackTrace();
			ss.rollback();
			return false;
		}
	}
	
	// 학생부 업로드 - 관리자
	public boolean uploadAdmin(SqlSession ss, HashMap map, String user){
		try{
			ss.insert("record.uploadRecord", map);
			List<HashMap> li = ss.selectList("record.recordOne", user);
			HashMap m = li.get(0);
			HashMap tmp = new HashMap();
			tmp.put("auto", m.get("auto"));
			tmp.put("school", map.get("school"));
			ss.update("record.fileSet", tmp);
			ss.commit();
			ss.close();
			return true;
		} catch(Exception e){
			e.printStackTrace();
			ss.rollback();
			ss.close();
			return false;
		}
	}
	
	// 학생부 보기
	public HashMap recordView(String num){
		SqlSession ss = fac.openSession();
		HashMap map = ss.selectOne("record.recordView", num);
		HashMap mm = ss.selectOne("school.word2", map.get("school").toString());
		map.put("schoolName", mm.get("name"));
		ss.close();
		return map;
	}
	
	// 학생부 리스트
	public List<HashMap> recordList(int page) {
		SqlSession ss = fac.openSession();
		List<HashMap> list = ss.selectList("record.recordList", (page-1)*12);
		for(int i=0; i<list.size(); i++){
			HashMap m = list.get(i);
			HashMap mm = ss.selectOne("school.word2", m.get("school").toString());
			m.put("schoolName", mm.get("name"));
			list.set(i, m);
		}
		ss.close();
		return list;
	}

	// 학생부 페이지
	public int recordPage() {
		SqlSession ss = fac.openSession();
		int count = ss.selectOne("record.count");
		ss.close();
		return count%12 == 0 ? count/12 : count/12+1;
	}
	
	// 면접후기 검색 리스트
	public List<HashMap> recordList2Both(int page, List<HashMap> wordList, String subject) {
		SqlSession ss = fac.openSession();
		List<HashMap> li = new Vector<>();
		for(HashMap m : wordList){
			HashMap map = new HashMap();
			map.put("page", (page-1)*10);
			map.put("word", m.get("num"));
			map.put("subject", "%"+subject+"%");
			List<HashMap> list = ss.selectList("record.recordList2", map);
			for(int i=0; i<list.size(); i++){
				HashMap m2 = list.get(i);
				HashMap mm = ss.selectOne("school.word2", m2.get("school"));
				m2.put("schoolName", mm.get("name"));
				list.set(i, m2);
				li.add(list.get(i));
			}
		}
		ss.close();
		return li;
	}

	// 면접후기 검색 페이지
	public int recordPage2Both(List<HashMap> wordList, String subject) {
		SqlSession ss = fac.openSession();
		HashMap map = new HashMap();
		int count = 0;
		for(HashMap m : wordList){
			map.put("word", m.get("num"));
			map.put("subject", "%"+subject+"%");
			int n = ss.selectOne("record.count2", map);
			count += n;
		}
		ss.close();
		return count%10 == 0 ? count/10 : count/10+1;
	}
	
	// 면접후기 검색 리스트
	public List<HashMap> recordList2School(int page, List<HashMap> wordList) {
		SqlSession ss = fac.openSession();
		List<HashMap> li = new Vector<>();
		for(HashMap m : wordList){
			HashMap map = new HashMap();
			map.put("page", (page-1)*10);
			map.put("word", m.get("num"));
			List<HashMap> list = ss.selectList("record.recordList3", map);
			for(int i=0; i<list.size(); i++){
				HashMap m2 = list.get(i);
				HashMap mm = ss.selectOne("school.word2", m2.get("school"));
				m2.put("schoolName", mm.get("name"));
				list.set(i, m2);
				li.add(list.get(i));
			}
		}
		ss.close();
		return li;
	}

	// 면접후기 검색 페이지
	public int recordPage2School(List<HashMap> wordList) {
		SqlSession ss = fac.openSession();
		int count = 0;
		for(HashMap m : wordList){
			int n = ss.selectOne("record.count3", m.get("num"));
			count += n;
		}
		ss.close();
		return count%10 == 0 ? count/10 : count/10+1;
	}
	
	// 면접후기 검색 리스트
	public List<HashMap> recordList2Subject(int page, String subject) {
		SqlSession ss = fac.openSession();
		List<HashMap> li = new Vector<>();
		HashMap map = new HashMap();
		map.put("page", (page-1)*10);
		map.put("subject", "%"+subject+"%");
		List<HashMap> list = ss.selectList("record.recordList4", map);
		for(int i=0; i<list.size(); i++){
			HashMap m2 = list.get(i);
			HashMap mm = ss.selectOne("school.word2", m2.get("school"));
			m2.put("schoolName", mm.get("name"));
			list.set(i, m2);
			li.add(list.get(i));
		}
		ss.close();
		return li;
	}

	// 면접후기 검색 페이지
	public int recordPage2Subject(String subject) {
		SqlSession ss = fac.openSession();
		int count = ss.selectOne("record.count4", "%"+subject+"%");
		ss.close();
		return count%10 == 0 ? count/10 : count/10+1;
	}
	
	
	
	
	
	
	
	
	
	
	
	
	// 학생부 수정
	public void modifyRecord(HttpSession session, String addr, String school, String subject, String type, String year,
			String admission, String typical, String pass, String award1,
			String career, String auto1, String extra, String club, String help, String soju, String paper,
			String etc, String reading, String special, String grade, String award, String time, String book, String auto) {
		SqlSession ss = fac.openSession();
		HashMap<String, String> map = new HashMap<>();
		String user = ((HashMap)session.getAttribute("login")).get("auto").toString();
		String id = ((HashMap)session.getAttribute("login")).get("id").toString();
		String name = ((HashMap)session.getAttribute("login")).get("name").toString();
		map.put("user", user);
		map.put("id", id);
		map.put("name", name);
		map.put("addr", addr);
		map.put("school", school);
		map.put("subject", subject);
		map.put("type", type);
		map.put("year", year);
		map.put("admission", admission);
		map.put("typical", typical);
		map.put("pass", pass);
		award1 = award1.replace("\n", "<br>");
		map.put("award1", award1);
		career = career.replace("\n", "<br>");
		map.put("career", career);
		auto1 = auto1.replace("\n", "<br>");
		map.put("auto1", auto1);
		extra = extra.replace("\n", "<br>");
		map.put("extra", extra);
		club = club.replace("\n", "<br>");
		map.put("club", club);
		help = help.replace("\n", "<br>");
		map.put("help", help);
		soju = soju.replace("\n", "<br>");
		map.put("soju", soju);
		paper = paper.replace("\n", "<br>");
		map.put("paper", paper);
		etc = etc.replace("\n", "<br>");
		map.put("etc", etc);
		reading = reading.replace("\n", "<br>");
		map.put("reading", reading);
		special = special.replace("\n", "<br>");
		map.put("special", special);
		map.put("grade", grade);
		map.put("award", award);
		map.put("time", time);
		map.put("book", book);
		map.put("auto", auto);
		ss.update("record.updateRecord", map);
		ss.commit();
		ss.close();
	}
	
	
	
	
	
	
	
	
	
	
	
	// 합격증 저장
	public String passData(MultipartFile file) {
		if(file.isEmpty()){
			return null;
		}
		try{
			String uuid = UUID.randomUUID().toString().substring(0, 8);
			String extension = file.getOriginalFilename().substring(file.getOriginalFilename().lastIndexOf("."));
			File f = new File(application.getRealPath("/file/school"), uuid+extension);
			file.transferTo(f);
			return uuid+extension;
		} catch(Exception e){
			e.printStackTrace();
			return null;
		}
	}

	// 학교 저장
	public boolean uploadSchool(HttpSession session, String addr, String school, String type, String subject,
			String pass, String uuid, String pass1) {
		SqlSession ss = fac.openSession();
		HashMap<String, String> map = new HashMap<>();
		map.put("user", ((HashMap)session.getAttribute("login")).get("auto").toString());
		map.put("addr", addr);
		map.put("school", school);
		map.put("type", type);
		map.put("subject", subject);
		map.put("pass", pass.equals("on") ? "합격" : "불합격");
		map.put("uuid", uuid);
		map.put("pass1", pass1.equals("on") ? "정시" : "수시");
		map.put("typical", "aa");
		map.put("year", "2017년");
		map.put("hschool", "서울고등학교");
		List<HashMap> list = ss.selectList("school.university", map);
		if(list.size()>0){
			return false;
		}
		try{
			ss.insert("record.uploadSchool", map);
			ss.commit();
			ss.close();
			return true;
		} catch(Exception e){
			e.printStackTrace();
			ss.rollback();
			ss.close();
			return false;
		}
	}

	// 학교 리스트
	public List<String> schoolList(String user) {
		SqlSession ss = fac.openSession();
		List<HashMap> list = ss.selectList("record.schoolList", user);
		List<String> list2 = new Vector<>();
		for(HashMap m : list){
			if(!list2.contains(m.get("school").toString())){
				list2.add(m.get("school").toString());
			}
		}
		for(int i=0; i<list2.size(); i++){
			HashMap map2 = ss.selectOne("search.word2", list.get(i).get("school"));
			list2.set(i, map2.get("name").toString());
		}
		ss.close();
		return list2;
	}

	// 기본, 핵심정보 등록
	public boolean uploadInfo(String user, String year, String grade, String hschool, String book, String time,
			String awards) {
		SqlSession ss = fac.openSession();
		HashMap<String, String> map = new HashMap<>();
		map.put("user", user);
		map.put("year", year);
		map.put("grade", grade);
		map.put("hschool", hschool);
		map.put("book", book);
		map.put("time", time);
		map.put("awards", awards);
		HashMap info = ss.selectOne("record.infoOne", user);
		if(info == null){
			try{
				ss.insert("record.uploadInfo", map);
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
			int n = ss.update("record.infoUpdate", map);
			if(n>0){
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

	// 자소서 저장
	public String introData(MultipartFile file) {
		if(file.isEmpty()){
			return null;
		}
		try{
			String uuid = UUID.randomUUID().toString().substring(0, 8);
			String extension = file.getOriginalFilename().substring(file.getOriginalFilename().lastIndexOf("."));
			File f = new File(application.getRealPath("/file/intro"), uuid+extension);
			file.transferTo(f);
			return uuid+extension;
		} catch(Exception e){
			e.printStackTrace();
			return null;
		}
	}

	// 자소서 리스트
	public List<HashMap> introList(int page){
		SqlSession ss = fac.openSession();
		List<HashMap> list = ss.selectList("record.introList", (page-1)*12);
		ss.close();
		return list;
	}
	
	// 자소서 페이지
	public int introPage(){
		SqlSession ss = fac.openSession();
		int count = ss.selectOne("record.introCount");
		ss.close();
		return count%12 == 0 ? count/12 : count/12+1;
	}

	// 기본, 핵심정보
	public List<HashMap> infoOne(String user) {
		SqlSession ss = fac.openSession();
		List<HashMap> list = ss.selectList("record.infoOne", user);
		ss.close();
		return list;
	}

	// 학생부
	public List<String> recordOne(String user) {
		SqlSession ss = fac.openSession();
		List<HashMap> list = ss.selectList("record.recordOne", user);
		ss.close();
		if(list.size() > 0){
			HashMap map = list.get(0);
			List<String> list2 = new Vector<>();
			for(int i=1; i<=50; i++){
				if(map.get("record"+i) != null){
					list2.add(map.get("record"+i).toString());
				}
			}
//			Set<String> set = map.keySet();
//			for(String s : set){
//				if(s.contains("intro")){
//					list2.add(map.get(s).toString());
//				}
//			}
			return list2;
		}
		return null;
	}

	// 자소서
	public List<String> introOne(String num, String user) {
		SqlSession ss = fac.openSession();
		HashMap<String, String> map = new HashMap<>();
		map.put("num", num);
		map.put("user", user);
		List<HashMap> list = ss.selectList("record.introOne", map);
		ss.close();
		if(list.size() > 0){
			HashMap map2 = list.get(0);
			List<String> list2 = new Vector<>();
			Set<String> set = map2.keySet();
			for(String s : set){
				if(s.contains("intro")){
					list2.add(map2.get(s).toString());
				}
			}
			return list2;
		}
		return null;
	}

	// 면접후기
	public List<HashMap> interviewList(String num, String user) {
		SqlSession ss = fac.openSession();
		HashMap<String, String> map = new HashMap<>();
		map.put("num", num);
		map.put("user", user);
		List<HashMap> list = ss.selectList("interview.interviewSomeone", map);
		ss.close();
		return list;
	}

	// 학교정보
	public List<HashMap> schoolOne(String num) {
		SqlSession ss = fac.openSession();
		List<HashMap> list = ss.selectList("record.schoolOne", num);
		ss.close();
		return list;
	}

	// 회원정보
	public List<HashMap> memberOne(String user) {
		SqlSession ss = fac.openSession();
		List<HashMap> list = ss.selectList("member.member", user);
		ss.close();
		return list;
	}

	// 합격한 학교 리스트
	public List<String> schoolList2(String user) {
		SqlSession ss = fac.openSession();
		List<HashMap> list = ss.selectList("record.schoolList", user);
		List<String> list2 = new Vector<>();
		ss.close();
		for(HashMap m : list){
			if(!list2.contains(m.get("school").toString()) && m.get("pass").toString().equals("합격") && !m.get("uuid").toString().equals("")){
				list2.add(m.get("school").toString());
			}
		}
		return list2;
	}
	
	// 검색 자소서 리스트
	public List<HashMap> introList2(int page, String word){
		SqlSession ss = fac.openSession();
		HashMap map = new HashMap();
		map.put("page", (page-1)*12);
		map.put("word", "%"+word+"%");
		List<HashMap> list = ss.selectList("record.introList2", map);
		for(int i=0; i<list.size(); i++){
			HashMap m = list.get(i);
			HashMap mm = ss.selectOne("school.word2", m.get("school").toString());
			m.put("schoolName", mm.get("name"));
			list.set(i, m);
		}
		ss.close();
		return list;
	}
	
	// 자소서 검색 페이지
	public int introPage2(String word){
		SqlSession ss = fac.openSession();
		int count = ss.selectOne("record.introCount2", word);
		ss.close();
		return count%12 == 0 ? count/12 : count/12+1;
	}
}
