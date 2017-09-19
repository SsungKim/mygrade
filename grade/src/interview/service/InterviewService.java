package interview.service;

import java.text.*;
import java.util.*;

import javax.servlet.http.*;

import org.apache.ibatis.session.*;
import org.springframework.beans.factory.annotation.*;
import org.springframework.stereotype.*;

@Component
public class InterviewService {
	@Autowired
	SqlSessionFactory fac;

	// 업로드
	public boolean uploadInterview(HttpSession session, String addr, String school, String subject, String type, String year, String admission,
			String typical, String pass, String time, String people, String kinds, String how, String tip, String content1, String content2) {
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
		if(addr.equals("s") || addr.equals("choose")){
			HashMap m = ss.selectOne("school.university", map);
			subject = m.get("subject").toString();
			type = m.get("type").toString();
			year = m.get("year").toString();
			admission = m.get("admission").toString();
			typical = m.get("typical").toString();
			pass = m.get("pass").toString();
		}
		map.put("subject", subject);
		map.put("type", type);
		map.put("year", year);
		map.put("admission", admission);
		map.put("typical", typical);
		map.put("pass", pass);
		map.put("time", time);
		map.put("people", people);
		map.put("kinds", kinds);
		map.put("how", how);
		map.put("tip", tip);
		map.put("content1", content1);
		map.put("content2", content2);
		try{
			ss.insert("interview.upload", map);
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

	// 면접후기 리스트
	public List<HashMap> interviewList(int page) {
		SqlSession ss = fac.openSession();
		List<HashMap> list = ss.selectList("interview.interviewList", (page-1)*10);
		for(int i=0; i<list.size(); i++){
			HashMap m = list.get(i);
			HashMap mm = ss.selectOne("school.word2", m.get("school"));
			m.put("schoolName", mm.get("name"));
			String content1 = m.get("content1").toString();
			String content2 = m.get("content2").toString();
			content1 = content1.replace(">", "&gt");
			content1 = content1.replace("<", "&lt");
			content2 = content2.replace(">", "&gt");
			content2 = content2.replace("<", "&lt");
			content1 = content1.replace("<br>", "<br>");
			content2 = content2.replace("<br>", "<br>");
			m.put("content1", content1);
			m.put("content2", content2);
			list.set(i, m);
		}
		ss.close();
		return list;
	}

	// 면접후기 페이지
	public int interviewPage() {
		SqlSession ss = fac.openSession();
		int count = ss.selectOne("interview.count");
		ss.close();
		return count%10 == 0 ? count/10 : count/10+1;
	}

	// 면접후기 데이터
	public HashMap interviewOne(String num) {
		SqlSession ss = fac.openSession();
		HashMap map = ss.selectOne("interview.interviewOne", num);
		HashMap map2 = ss.selectOne("search.word2", map.get("school"));
		map.put("school2", map2.get("name"));
		ss.close();
		return map;
	}

	// 면접후기 댓글
	public List<HashMap> commentList(String num, int page) {
		SqlSession ss = fac.openSession();
		HashMap map = new HashMap();
		map.put("num", num);
		map.put("page", (page-1)*5);
		List<HashMap> list = ss.selectList("interview.commentList", map);
		ss.close();
		return list;
	}

	// 댓글 등록
	public boolean comment(String interviewNum, String user, String comment, String point) {
		SqlSession ss = fac.openSession();
		HashMap<String, String> map = new HashMap<>();
		map.put("interviewNum", interviewNum);
		map.put("user", user);
		map.put("comment", comment);
		map.put("point", point);
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm");
		String day = sdf.format(System.currentTimeMillis());
		map.put("day", day);
		try{
			ss.insert("interview.comment", map);
			ss.commit();
			ss.update("interview.pointCommentUpdate", map);
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

	// 댓글 페이지
	public int commentPage(String num) {
		SqlSession ss = fac.openSession();
		int count = ss.selectOne("interview.commentCount", num);
		ss.close();
		return count%5 == 0 ? count/5 : count/5+1;
	}
	
	// 면접후기 검색 리스트
	public List<HashMap> interviewList2(int page, List<HashMap> wordList) {
		SqlSession ss = fac.openSession();
		List<HashMap> li = new Vector<>();
		for(HashMap m : wordList){
			HashMap map = new HashMap();
			map.put("page", (page-1)*10);
			map.put("word", "%"+m.get("num")+"%");
			List<HashMap> list = ss.selectList("interview.interviewList2", map);
			for(int i=0; i<list.size(); i++){
				HashMap m2 = list.get(i);
				HashMap mm = ss.selectOne("school.word2", m2.get("school"));
				m2.put("schoolName", mm.get("name"));
				String content1 = m2.get("content1").toString();
				String content2 = m2.get("content2").toString();
				content1 = content1.replace(">", "&gt");
				content1 = content1.replace("<", "&lt");
				content2 = content2.replace(">", "&gt");
				content2 = content2.replace("<", "&lt");
				content1 = content1.replace("<br>", "<br>");
				content2 = content2.replace("<br>", "<br>");
				m2.put("content1", content1);
				m2.put("content2", content2);
				list.set(i, m2);
				li.add(list.get(i));
			}
		}
		ss.close();
		return li;
	}

	// 면접후기 검색 페이지
	public int interviewPage2(List<HashMap> wordList) {
		SqlSession ss = fac.openSession();
		int count = 0;
		for(HashMap m : wordList){
			int n = ss.selectOne("interview.count2", "%"+m.get("num")+"%");
			count += n;
		}
		ss.close();
		return count%10 == 0 ? count/10 : count/10+1;
	}

	// 면접후기 수정
	public boolean modifyInterview(String user, String name, String addr, String school, String subject, String type, String year,
			String admission, String typical, String pass, String time, String people, String kinds, String how,
			String tip, String content1, String content2, String auto) {
		SqlSession ss = fac.openSession();
		HashMap<String, String> map = new HashMap<>();
		map.put("user", user);
		map.put("name", name);
		map.put("addr", addr);
		map.put("school", school);
		map.put("subject", subject);
		map.put("type", type);
		map.put("year", year);
		map.put("admission", admission);
		map.put("typical", typical);
		map.put("pass", pass);
		if(addr.equals("s")){
			HashMap m = ss.selectOne("school.university", map);
			subject = m.get("subject").toString();
			type = m.get("type").toString();
			year = m.get("year").toString();
			admission = m.get("admission").toString();
			typical = m.get("typical").toString();
			pass = m.get("pass").toString();
		}
		map.put("time", time);
		map.put("people", people);
		map.put("kinds", kinds);
		map.put("how", how);
		map.put("tip", tip);
		map.put("content1", content1);
		map.put("content2", content2);
		map.put("auto", auto);
		int n = ss.update("interview.modify", map);
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

	// 삭제
	public boolean remove(String num) {
		SqlSession ss = fac.openSession();
		int n = ss.delete("interview.remove", num);
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
