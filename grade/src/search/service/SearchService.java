package search.service;

import java.util.*;

import org.apache.ibatis.session.*;
import org.springframework.beans.factory.annotation.*;
import org.springframework.stereotype.*;

@Component
public class SearchService {
	@Autowired
	SqlSessionFactory fac;
	
	// search both
	public List<HashMap> selectBoth(List<HashMap> wordList, String subject, int page) {
		SqlSession ss = fac.openSession();
		List<HashMap> li = new Vector<>();
		for(HashMap m : wordList){
			HashMap map = new HashMap<>();
			map.put("word", "%"+m.get("num")+"%");
			map.put("subject", "%"+subject+"%");
			map.put("page", (page-1)*12);
//			List<HashMap> list = ss.selectList("search.searchrecord", map);
			List<HashMap> list = ss.selectList("search.searchinterview", map);
			for(int i=0; i<list.size(); i++){
				HashMap m2 = list.get(i);
				HashMap mm = ss.selectOne("school.word2", m2.get("school").toString());
				m2.put("schoolName", mm.get("name"));
				String content1 = m2.get("content1").toString();
				String content2 = m2.get("content2").toString();
				content1 = content1.replace(">", "&gt");
				content1 = content1.replace("<", "&lt");
				content2 = content2.replace(">", "&gt");
				content2 = content2.replace("<", "&lt");
				content1 = content1.replace("&ltbr&gt", "&nbsp;");
				content2 = content2.replace("&ltbr&gt", "&nbsp;");
				m2.put("content1", content1);
				m2.put("content2", content2);
				list.set(i, m2);
				li.add(list.get(i));
			}
		}
		ss.close();
		return li;
	}
	
	// 검색 페이지
	public int searchPageBoth(List<HashMap> wordList, String subject) {
		SqlSession ss = fac.openSession();
		int count = 0;
		for(HashMap m : wordList){
			HashMap map = new HashMap();
			map.put("word", "%"+m.get("num")+"%");
			map.put("subject", "%"+subject+"%");
//			int n = ss.selectOne("search.countrecord", "%"+m.get("num")+"%");
			int n = ss.selectOne("search.countinterview", map);
			count += n;
		}
		ss.close();
		return count%12 == 0 ? count/12 : count/12+1;
	}

	// 검색
	public List<HashMap> selectSchool(List<HashMap> wordList, int page) {
		SqlSession ss = fac.openSession();
		List<HashMap> li = new Vector<>();
		for(HashMap m : wordList){
			HashMap map = new HashMap<>();
			map.put("word", "%"+m.get("num")+"%");
			map.put("page", (page-1)*12);
//			List<HashMap> list = ss.selectList("search.searchrecord", map);
			List<HashMap> list = ss.selectList("search.searchinterview2", map);
			for(int i=0; i<list.size(); i++){
				HashMap m2 = list.get(i);
				HashMap mm = ss.selectOne("school.word2", m2.get("school").toString());
				m2.put("schoolName", mm.get("name"));
				String content1 = m2.get("content1").toString();
				String content2 = m2.get("content2").toString();
				content1 = content1.replace(">", "&gt");
				content1 = content1.replace("<", "&lt");
				content2 = content2.replace(">", "&gt");
				content2 = content2.replace("<", "&lt");
				content1 = content1.replace("&ltbr&gt", "&nbsp;");
				content2 = content2.replace("&ltbr&gt", "&nbsp;");
				m2.put("content1", content1);
				m2.put("content2", content2);
				list.set(i, m2);
				li.add(list.get(i));
			}
		}
		ss.close();
		return li;
	}

	// 검색 페이지
	public int searchPageSchool(List<HashMap> wordList) {
		SqlSession ss = fac.openSession();
		int count = 0;
		for(HashMap m : wordList){
//			int n = ss.selectOne("search.countrecord", "%"+m.get("num")+"%");
			int n = ss.selectOne("search.countinterview2", "%"+m.get("num")+"%");
			count += n;
		}
		ss.close();
		return count%12 == 0 ? count/12 : count/12+1;
	}

	// 검색
	public List<HashMap> selectSubject(String subject, int page) {
		SqlSession ss = fac.openSession();
		HashMap map = new HashMap();
		map.put("subject", "%"+subject+"%");
		map.put("page", (page-1)*12);
		List<HashMap> li = new Vector<>();
		List<HashMap> list = ss.selectList("search.searchinterview3", map);
		for(int i=0; i<list.size(); i++){
			HashMap m2 = list.get(i);
			HashMap mm = ss.selectOne("school.word2", m2.get("school").toString());
			m2.put("schoolName", mm.get("name"));
			String content1 = m2.get("content1").toString();
			String content2 = m2.get("content2").toString();
			content1 = content1.replace(">", "&gt");
			content1 = content1.replace("<", "&lt");
			content2 = content2.replace(">", "&gt");
			content2 = content2.replace("<", "&lt");
			content1 = content1.replace("&ltbr&gt", "&nbsp;");
			content2 = content2.replace("&ltbr&gt", "&nbsp;");
			m2.put("content1", content1);
			m2.put("content2", content2);
			list.set(i, m2);
			li.add(list.get(i));
		}
		ss.close();
		return li;
	}
	
	// 검색 페이지
	public int searchPageSubject(String subject) {
		SqlSession ss = fac.openSession();
		int count = ss.selectOne("search.countinterview3", "%"+subject+"%");
		ss.close();
		return count%12 == 0 ? count/12 : count/12+1;
	}
	
	// 상세검색
	public List<HashMap> searchList2Both(List<HashMap> wordList, String subject, int page, String type) {
		SqlSession ss = fac.openSession();
		HashMap map = new HashMap();
		List<HashMap> li = new Vector<>();
		for(HashMap m : wordList){
			map.put("word", "%"+m.get("num")+"%");
			map.put("subject", "%"+subject+"%");
			map.put("page", (page-1)*12);
			List<HashMap> list = ss.selectList("search.search"+type, map);
			for(int i=0; i<list.size(); i++){
				HashMap m2 = list.get(i);
				HashMap mm = ss.selectOne("school.word2", m2.get("school").toString());
				m2.put("schoolName", mm.get("name"));
				String content1 = m2.get("content1").toString();
				String content2 = m2.get("content2").toString();
				content1 = content1.replace(">", "&gt");
				content1 = content1.replace("<", "&lt");
				content2 = content2.replace(">", "&gt");
				content2 = content2.replace("<", "&lt");
				content1 = content1.replace("&ltbr&gt", "&nbsp;");
				content2 = content2.replace("&ltbr&gt", "&nbsp;");
				m2.put("content1", content1);
				m2.put("content2", content2);
				list.set(i, m2);
				li.add(list.get(i));
			}
		}
		ss.close();
		return li;
	}

	// 상세검색 페이지
	public int searchPage2Both(List<HashMap> wordList, String subject, String type) {
		SqlSession ss = fac.openSession();
		int count = 0;
		for(HashMap m : wordList){
			HashMap<String, String> map = new HashMap<>();
			map.put("word", "%"+m.get("num")+"%");
			map.put("subject", "%"+subject+"%");
			int n = ss.selectOne("search.count"+type, map);
			count += n;
		}
		ss.close();
		return count%12 == 0 ? count/12 : count/12+1;
	}

	// 상세검색
	public List<HashMap> searchList2School(List<HashMap> wordList, int page, String type) {
		SqlSession ss = fac.openSession();
		HashMap map = new HashMap();
		List<HashMap> li = new Vector<>();
		for(HashMap m : wordList){
			map.put("word", "%"+m.get("num")+"%");
			map.put("page", (page-1)*12);
			List<HashMap> list = ss.selectList("search.search"+type+"2", map);
			for(int i=0; i<list.size(); i++){
				HashMap m2 = list.get(i);
				HashMap mm = ss.selectOne("school.word2", m2.get("school").toString());
				m2.put("schoolName", mm.get("name"));
				String content1 = m2.get("content1").toString();
				String content2 = m2.get("content2").toString();
				content1 = content1.replace(">", "&gt");
				content1 = content1.replace("<", "&lt");
				content2 = content2.replace(">", "&gt");
				content2 = content2.replace("<", "&lt");
				content1 = content1.replace("&ltbr&gt", "&nbsp;");
				content2 = content2.replace("&ltbr&gt", "&nbsp;");
				m2.put("content1", content1);
				m2.put("content2", content2);
				list.set(i, m2);
				li.add(list.get(i));
			}
		}
		ss.close();
		return li;
	}

	// 상세검색 페이지
	public int searchPage2School(List<HashMap> wordList, String type) {
		SqlSession ss = fac.openSession();
		int count = 0;
		for(HashMap m : wordList){
			HashMap<String, String> map = new HashMap<>();
			map.put("word", "%"+m.get("num")+"%");
			int n = ss.selectOne("search.count"+type+"2", map);
			count += n;
		}
		ss.close();
		return count%12 == 0 ? count/12 : count/12+1;
	}

	// 상세검색
	public List<HashMap> searchList2Subject(String subject, int page, String type) {
		SqlSession ss = fac.openSession();
		HashMap map = new HashMap();
		map.put("subject", "%"+subject+"%");
		map.put("page", (page-1)*12);
		List<HashMap> li = new Vector<>();
		List<HashMap> list = ss.selectList("search.search"+type+"3", map);
		for(int i=0; i<list.size(); i++){
			HashMap m2 = list.get(i);
			HashMap mm = ss.selectOne("school.word2", m2.get("school").toString());
			m2.put("schoolName", mm.get("name"));
			String content1 = m2.get("content1").toString();
			String content2 = m2.get("content2").toString();
			content1 = content1.replace(">", "&gt");
			content1 = content1.replace("<", "&lt");
			content2 = content2.replace(">", "&gt");
			content2 = content2.replace("<", "&lt");
			content1 = content1.replace("&ltbr&gt", "&nbsp;");
			content2 = content2.replace("&ltbr&gt", "&nbsp;");
			m2.put("content1", content1);
			m2.put("content2", content2);
			list.set(i, m2);
			li.add(list.get(i));
		}
		ss.close();
		return li;
	}
	
	// 상세검색 페이지
	public int searchPage2Subject(String subject, String type) {
		SqlSession ss = fac.openSession();
		int count = ss.selectOne("search.count"+type+"3", "%"+subject+"%");
		ss.close();
		return count%12 == 0 ? count/12 : count/12+1;
	}

	// 대학 변환
	public List<HashMap> word(String word) {
		SqlSession ss = fac.openSession();
		List<HashMap> list = ss.selectList("search.word3", "%"+word+"%");
		ss.close();
		return list;
	}
	
	// 검색 단어 변경
	public String wordSearchChange(String word2) {
		word2 = word2.toUpperCase();
		if(word2.indexOf("교대") >= 0){
			word2 = word2.replace("교대", "교육대");
		}
		if(word2.indexOf("외대") >= 0){
			word2 = word2.replace("외대", "외국어대");
		}
		if(word2.indexOf("여대") >= 0){
			word2 = word2.replace("여대", "여자대");
		}
		if(word2.indexOf("공대") >= 0){
			word2 = word2.replace("공대", "공과대");
		}
		if(word2.indexOf("예대") >= 0){
			word2 = word2.replace("예대", "예술대");
		}
		if(word2.equals("한체대")){
			word2 = word2.replace("한체대", "한국체육대학교");
		}
		if(word2.equals("건대")){
			word2 = word2.replace("건대", "건국대학교");
		}
		if(word2.equals("고대")){
			word2 = word2.replace("고대", "고려대학교");
		}
		if(word2.equals("성대")){
			word2 = word2.replace("성대", "성균관대학교");
		}
		if(word2.equals("숙대")){
			word2 = word2.replace("숙대", "숙명여자대학교");
		}
		if(word2.equals("연대")){
			word2 = word2.replace("연대", "연세대학교");
		}
		if(word2.equals("육사")){
			word2 = word2.replace("육사", "육군사관학교");
		}
		if(word2.equals("이대")){
			word2 = word2.replace("이대", "이화여자대학교");
		}
		if(word2.equals("한대")){
			word2 = word2.replace("한대", "한양대");
		}
		if(word2.equals("홍대")){
			word2 = word2.replace("홍대", "홍익대");
		}
		if(word2.equals("카이스트")){
			word2 = word2.replace("카이스트", "KAIST");
		}
		if(word2.equals("디지스트")){
			word2 = word2.replace("디지스트", "DGIST");
		}
		if(word2.equals("지스트")){
			word2 = word2.replace("지스트", "GIST");
		}
		if(word2.equals("유니스트")){
			word2 = word2.replace("유니스트", "UNIST");
		}
		if(word2.equals("포스텍")){
			word2 = word2.replace("포스텍", "POSTECH");
		}
		if(word2.equals("공사")){
			word2 = word2.replace("공사", "공군사관학교");
		}
		if(word2.equals("꽃대")){
			word2 = word2.replace("꽃대", "꽃동네대학교");
		}
		if(word2.equals("해사")){
			word2 = word2.replace("해사", "해군사관학교");
		}
		if(word2.equals("DIMA")){
			word2 = word2.replace("DIMA", "동아방송예술대학교");
		}
		if(word2.equals("한예종")){
			word2 = word2.replace("한예종", "한국예술종합학교");
		}
		if(word2.equals("동아방송대")){
			word2 = word2.replace("동아방송대", "동아방송예술대학교");
		}
		return word2;
	}
}
