package free.service;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component
public class FreeService {
	@Autowired
	SqlSessionFactory fac;
	
	// µî·Ï
	public boolean write(String title, String content, String name){
		SqlSession ss = fac.openSession();
		HashMap<String, String> map = new HashMap<>();
		map.put("title", title);
		map.put("content", content);
		map.put("writer", name);
		try{
			ss.insert("free.write", map);
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

	// list
	public List<HashMap> faq(int num) {
		SqlSession ss = fac.openSession();
		List<HashMap> list = ss.selectList("free.freeList", (num-1)*10);
		ss.close();
		return list;
	}

	// view
	public HashMap view(String num) {
		SqlSession ss = fac.openSession();
		HashMap map = ss.selectOne("free.freeOne", num);
		ss.close();
		return map;
	}

	// modify
	public HashMap modify(String num) {
		SqlSession ss = fac.openSession();
		HashMap map = ss.selectOne("free.freeOne", num);
		ss.close();
		return map;
	}

	// modify save
	public boolean modify2(String title, String content, String num) {
		SqlSession ss = fac.openSession();
		HashMap<String, String> map = new HashMap<>();
		map.put("title", title);
		System.out.println(content);
		map.put("content", content);
		map.put("num", num);
		int n = ss.update("free.modify", map);
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

	public int faqPage() {
		SqlSession ss = fac.openSession();
		int n = ss.selectOne("free.freeCount");
		ss.close();
		return n%10 == 0 ? n/10 : n/10+1;
	}

	// remove
	public boolean remove(int num) {
		SqlSession ss = fac.openSession();
		int n = ss.delete("free.remove", num);
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
