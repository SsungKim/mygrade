package exam.service;

import java.util.*;

import javax.servlet.http.*;

import org.apache.ibatis.session.*;
import org.springframework.beans.factory.annotation.*;
import org.springframework.stereotype.*;

@Component
public class ExamService {
	@Autowired
	SqlSessionFactory fac;
	
	// 학교리스트
	public List<HashMap> schoolList(String auto) {
		SqlSession ss = fac.openSession();
		List<HashMap> list = ss.selectList("exam.schoolList", auto);
		for(int i=0; i<list.size(); i++){
			HashMap m = list.get(i);
			List<HashMap> l = ss.selectList("search.word2", m.get("school"));
			m.put("schoolName", l.get(0).get("name"));
			list.set(i, m);
		}
		ss.close();
		return list;
	}
	
	// 정시성적 등록 - 관리자
	public boolean uploadExam1(HttpSession session, String addr, String school, String subject, String type, String year,
			String admission, String typical, String pass, String examType, String mathType, String exType, String innerType1, 
			String innerType2, String langType, String[] point, String passCount) {
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
		map.put("examType", examType);
		map.put("mathType", mathType);
		map.put("explorType", exType);
		map.put("innerType1", innerType1);
		map.put("innerType2", innerType2);
		map.put("langType", langType.equals("choose") ? "-" : langType);
		for(int i=0; i<point.length; i++){
			map.put("point"+(i+1), point[i]);
		}
		map.put("passCount", passCount);
		try{
			ss.insert("exam.uploadExam1", map);
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
	
	// 정시성적 등록 - 일반
	public boolean uploadExam2(HttpSession session, String examType, String mathType, String exType, String innerType1,
			String innerType2, String langType, String[] point, String univ1, String passCount1, String univ2,
			String passCount2, String univ3, String passCount3) {
		SqlSession ss = fac.openSession();
		HashMap<String, String> map = new HashMap<>();
		String user = ((HashMap)session.getAttribute("login")).get("auto").toString();
		String id = ((HashMap)session.getAttribute("login")).get("id").toString();
		String name = ((HashMap)session.getAttribute("login")).get("name").toString();
		map.put("user", user);
		map.put("id", id);
		map.put("name", name);
		map.put("examType", examType);
		map.put("mathType", mathType);
		map.put("explorType", exType);
		map.put("innerType1", innerType1);
		map.put("innerType2", innerType2);
		map.put("langType", langType.equals("choose") ? "-" : langType);
		map.put("passCount1", passCount1.equals("1차합격") ? "1차합격(1차)" : passCount1);
		map.put("passCount2", passCount2.equals("1차합격") ? "1차합격(1차)" : passCount2);
		map.put("passCount3", passCount3.equals("1차합격") ? "1차합격(1차)" : passCount3);
		int check = 0;
		if(!univ1.equals("s")){
			check++;
			HashMap map1 = new HashMap();
			map1.put("user", user);
			map1.put("school", univ1);
			HashMap school1 = ss.selectOne("school.university", map1);
			map.put("addr1", school1.get("addr").toString());
			map.put("school1", school1.get("school").toString());
			map.put("subject1", school1.get("subject").toString());
			map.put("type1", school1.get("type").toString());
			map.put("year1", school1.get("year").toString());
			map.put("admission1", school1.get("admission").toString());
			map.put("typical1", school1.get("typical").toString());
			map.put("pass1", school1.get("pass").toString());
		}
		if(!univ2.equals("s")){
			check++;
			HashMap map2 = new HashMap();
			map2.put("user", user);
			map2.put("school", univ2);
			HashMap school2 = ss.selectOne("school.university", map2);
			map.put("addr2", school2.get("addr").toString());
			map.put("school2", school2.get("school").toString());
			map.put("subject2", school2.get("subject").toString());
			map.put("type2", school2.get("type").toString());
			map.put("year2", school2.get("year").toString());
			map.put("admission2", school2.get("admission").toString());
			map.put("typical2", school2.get("typical").toString());
			map.put("pass2", school2.get("pass").toString());
		}
		if(!univ3.equals("s")){
			check++;
			HashMap map3 = new HashMap();
			map3.put("user", user);
			map3.put("school", univ3);
			HashMap school3 = ss.selectOne("school.university", map3);
			map.put("addr3", school3.get("addr").toString());
			map.put("school3", school3.get("school").toString());
			map.put("subject3", school3.get("subject").toString());
			map.put("type3", school3.get("type").toString());
			map.put("year3", school3.get("year").toString());
			map.put("admission3", school3.get("admission").toString());
			map.put("typical3", school3.get("typical").toString());
			map.put("pass3", school3.get("pass").toString());
		}
		for(int i=0; i<point.length; i++){
			map.put("point"+(i+1), point[i]);
		}
		int input = 0;
		for(int i=1; i<=check; i++){
			HashMap m = ss.selectOne("exam.examCheck"+(i+1), map);
			if(m != null){
				int n = ss.update("exam.updateExam"+(i+1), map);
				if(n > 0){
					ss.commit();
					input++;
				} else {
					ss.rollback();
				}
			} else {
				try{
					ss.insert("exam.uploadExam"+(i+1), map);
					ss.commit();
					input++;
				} catch(Exception e){
					e.printStackTrace();
					ss.rollback();
				}
			}
		}
		ss.close();
		if(check == input){
			return true;
		} else {
			return false;
		}
	}
	
	// 정시성적 리스트
	public List<HashMap> examList(int page) {
		SqlSession ss = fac.openSession();
		List<HashMap> list = ss.selectList("exam.examList", (page-1)*12);
		for(int i=0; i<list.size(); i++){
			HashMap m = list.get(i);
			HashMap mm = ss.selectOne("school.word2", m.get("school").toString());
			m.put("schoolName", mm.get("name"));
			list.set(i, m);
		}
		ss.close();
		return list;
	}

	// 정시성적 리스트 페이지
	public int examPage() {
		SqlSession ss = fac.openSession();
		int count = ss.selectOne("exam.count");
		ss.close();
		return count%12 == 0 ? count/12 : count/12+1;
	}
	
	// 정시성적 보기
	public HashMap examOne(String num) {
		SqlSession ss = fac.openSession();
		HashMap map = ss.selectOne("exam.examOne", num);
		HashMap mm = ss.selectOne("school.word2", map.get("school").toString());
		map.put("schoolName", mm.get("name"));
		ss.close();
		return map;
	}
	
	// 면접후기 검색 리스트
	public List<HashMap> examList2Both(int page, List<HashMap> wordList, String subject) {
		SqlSession ss = fac.openSession();
		List<HashMap> li = new Vector<>();
		for(HashMap m : wordList){
			HashMap map = new HashMap();
			map.put("page", (page-1)*10);
			map.put("word", m.get("num"));
			map.put("subject", "%"+subject+"%");
			List<HashMap> list = ss.selectList("exam.examList2", map);
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
	public int examPage2Both(List<HashMap> wordList, String subject) {
		SqlSession ss = fac.openSession();
		HashMap map = new HashMap();
		int count = 0;
		for(HashMap m : wordList){
			map.put("word", m.get("num"));
			map.put("subject", "%"+subject+"%");
			int n = ss.selectOne("exam.count2", map);
			count += n;
		}
		ss.close();
		return count%10 == 0 ? count/10 : count/10+1;
	}
	
	// 면접후기 검색 리스트
	public List<HashMap> examList2School(int page, List<HashMap> wordList) {
		SqlSession ss = fac.openSession();
		List<HashMap> li = new Vector<>();
		for(HashMap m : wordList){
			HashMap map = new HashMap();
			map.put("page", (page-1)*10);
			map.put("word", m.get("num"));
			List<HashMap> list = ss.selectList("exam.examList3", map);
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
	public int examPage2School(List<HashMap> wordList) {
		SqlSession ss = fac.openSession();
		int count = 0;
		for(HashMap m : wordList){
			int n = ss.selectOne("exam.count3", m.get("num"));
			count += n;
		}
		ss.close();
		return count%10 == 0 ? count/10 : count/10+1;
	}
	
	// 면접후기 검색 리스트
	public List<HashMap> examList2Subject(int page, String subject) {
		SqlSession ss = fac.openSession();
		List<HashMap> li = new Vector<>();
		HashMap map = new HashMap();
		map.put("page", (page-1)*10);
		map.put("subject", "%"+subject+"%");
		List<HashMap> list = ss.selectList("exam.examList4", map);
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
	public int examPage2Subject(String subject) {
		SqlSession ss = fac.openSession();
		int count = ss.selectOne("exam.count4", "%"+subject+"%");
		ss.close();
		return count%10 == 0 ? count/10 : count/10+1;
	}
	
	
	
	
	
	


	// 검색 학생부 리스트
	public List<HashMap> examList2(int page, List<HashMap> wordList) {
		SqlSession ss = fac.openSession();
		List<HashMap> li = new Vector<>();
		for(HashMap m : wordList){
			HashMap map = new HashMap();
			map.put("page", (page-1)*12);
			map.put("word", "%"+m.get("num")+"%");
			List<HashMap> list = ss.selectList("exam.examList2", map);
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
	
	// 학생부 검색 페이지
	public int examPage2(List<HashMap> wordList) {
		SqlSession ss = fac.openSession();
		int count = 0;
		for(HashMap m : wordList){
			int n = ss.selectOne("exam.count2", "%"+m.get("num")+"%");
			count += n;
		}
		ss.close();
		return count%12 == 0 ? count/12 : count/12+1;
	}

	// 기본정보, 핵심정보
	public HashMap infoList(String auto) {
		SqlSession ss = fac.openSession();
		HashMap map = ss.selectOne("exam.infoList", auto);
		ss.close();
		return map;
	}
}
