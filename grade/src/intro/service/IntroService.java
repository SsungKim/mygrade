package intro.service;

import java.io.*;
import java.util.*;

import javax.servlet.*;
import javax.servlet.http.*;

import org.apache.ibatis.session.*;
import org.springframework.beans.factory.annotation.*;
import org.springframework.stereotype.*;
import org.springframework.web.multipart.*;

@Component
public class IntroService {
	@Autowired
	SqlSessionFactory fac;
	@Autowired
	ServletContext application;
	
	// 자소서 등록
	public boolean uploadIntro(String user, String id, String name, String univ, String content1, String content2, String content3,
			String content4, String title) {
		SqlSession ss = fac.openSession();
		HashMap<String, String> map = new HashMap<>();
		map.put("user", user);
		map.put("id", id);
		map.put("name", name);
		map.put("school", univ);
		map.put("content1", content1);
		map.put("content2", content2);
		map.put("content3", content3);
		map.put("content4", content4);
		map.put("title", title);
		HashMap school = ss.selectOne("school.schoolOne", map);
		map.put("addr", school.get("addr").toString());
		map.put("subject", school.get("subject").toString());
		map.put("type", school.get("type").toString());
		map.put("year", school.get("year").toString());
		map.put("admission", school.get("admission").toString());
		map.put("typical", school.get("typical").toString());
		map.put("pass", school.get("pass").toString());
		List<HashMap> list = ss.selectList("intro.introUniv", map);
		if(list.size()>0){
			int n = ss.update("intro.introUpdate", map);
			if(n > 0){
				ss.commit();
				ss.close();
				return true;
			} else {
				ss.rollback();
				ss.close();
				return false;
			}
		} else {
			try{
				ss.insert("intro.introUpload", map);
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
	}
	
	// 자소서 등록 - 관리자
	public boolean uploadIntroAdmin(String user, String id, String name, String content1, String content2, String content3, String content4,
			String title, String addr, String school, String subject, String type, String year, String admission,
			String typical, String pass) {
		SqlSession ss = fac.openSession();
		HashMap<String, String> map = new HashMap<>();
		map.put("user", user);
		map.put("id", id);
		map.put("name", name);
		map.put("content1", content1);
		map.put("content2", content2);
		map.put("content3", content3);
		map.put("content4", content4);
		map.put("title", title);
		map.put("addr", addr);
		map.put("school", school);
		map.put("subject", subject);
		map.put("type", type);
		map.put("year", year);
		map.put("admission", admission);
		map.put("typical", typical);
		map.put("pass", pass);
		try{
			ss.insert("intro.introUpload", map);
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
	
	// 학교리스트
	public List<HashMap> schoolList(String user) {
		SqlSession ss = fac.openSession();
		List<HashMap> list = ss.selectList("school.schoolList", user);
		for(int i=0; i<list.size(); i++){
			HashMap m = list.get(i);
			List<HashMap> l = ss.selectList("search.word2", m.get("school"));
			m.put("schoolName", l.get(0).get("name"));
			list.set(i, m);
		}
		ss.close();
		return list;
	}
	
	// 자소서 리스트
	public List<HashMap> intro(int num){
		SqlSession ss = fac.openSession();
		List<HashMap> list = ss.selectList("intro.introList", (num-1)*12);
		for(int i=0; i<list.size(); i++){
			HashMap m = list.get(i);
			HashMap mm = ss.selectOne("school.word2", m.get("school").toString());
			m.put("schoolName", mm.get("name"));
			list.set(i, m);
		}
		ss.close();
		return list;
	}
	
	// 자소서 페이지
	public int page(){
		SqlSession ss = fac.openSession();
		int n = ss.selectOne("intro.introCount");
		ss.close();
		return n%12==0 ? n/12 : n/12+1;
	}
	
	// 자소서 보기
	public HashMap introOne(String auto) {
		SqlSession ss = fac.openSession();
		HashMap m = ss.selectOne("intro.introOne", auto);
		String content1 = m.get("content1").toString();
//		content1 = content1.replace("<br>", "\n");
		String content2 = m.get("content2").toString();
//		content2 = content2.replace("<br>", "\n");
		String content3 = m.get("content3").toString();
//		content3 = content3.replace("<br>", "\n");
		String content4 = m.get("content4").toString();
//		content4 = content4.replace("<br>", "\n");
		m.put("contnet1", content1);
		m.put("content2", content2);
		m.put("content3", content3);
		m.put("content4", content4);
		HashMap school = ss.selectOne("school.word2", m.get("school").toString());
		m.put("schoolName", school.get("name").toString());
		ss.close();
		return m;
	}
	
	// 검색
	public List<HashMap> search(List<HashMap> wordList, int page) {
		SqlSession ss = fac.openSession();
		List<HashMap> li = new Vector<>();
		for(HashMap m : wordList){
			HashMap map = new HashMap();
			map.put("word", "%"+m.get("num")+"%");
			map.put("page", (page-1)*12);
			List<HashMap> list = ss.selectList("intro.search", map);
			for(int i=0; i<list.size(); i++){
				HashMap m2 = list.get(i);
				HashMap mm = ss.selectOne("school.word2", m2.get("school").toString());
				m2.put("schoolName", mm.get("name"));
				list.set(i, m2);
				li.add(list.get(i));
			}
		}
		ss.close();
		return li;
	}

	// 자소서 검색 페이지
	public int page2(List<HashMap> wordList) {
		SqlSession ss = fac.openSession();
		int count = 0;
		for(HashMap m : wordList){
			int n = ss.selectOne("intro.introCount2", "%"+m.get("num")+"%");
			count += n;
		}
		ss.close();
		return count%12==0 ? count/12 : count/12+1;
	}
}
