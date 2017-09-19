package school.service;

import java.io.*;
import java.util.*;

import javax.servlet.*;
import javax.servlet.http.*;

import org.apache.ibatis.session.*;
import org.springframework.beans.factory.annotation.*;
import org.springframework.stereotype.*;
import org.springframework.web.multipart.*;

@Component
public class SchoolService {
	@Autowired
	SqlSessionFactory fac;
	@Autowired
	ServletContext application;
	
	// �հ��� ����
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
	
	// �б� ����
	public int uploadSchool(HttpSession session, String addr, String school, String subject, String year,
			String admission, String typical, String hschool, String pass, String type) {
		SqlSession ss = fac.openSession();
		HashMap<String, String> map = new HashMap<>();
		String user = ((HashMap)session.getAttribute("login")).get("auto").toString();
		map.put("user", user);
		map.put("addr", addr);
		map.put("school", school);
		map.put("subject", subject);
		map.put("year", year);
		map.put("admission", admission);
		map.put("typical", typical);
		map.put("hschool", hschool);
		map.put("pass", pass);
		map.put("type", type);
		HashMap m = ss.selectOne("school.university", map);
		if(m != null){
			return 2;
		}
//		List<HashMap> list = ss.selectList("school.schoolList", user);
//		if(list.size() == 6){
//			ss.delete("school.deleteSchool", user);
//			ss.commit();
//		}
		try{
			ss.insert("school.uploadSchool", map);
			ss.commit();
			ss.close();
			return 0;
		} catch(Exception e){
			e.printStackTrace();
			ss.rollback();
			ss.close();
			return 1;
		}
	}

	// �б� ����Ʈ
	public List<HashMap> schoolList(String user) {
		SqlSession ss = fac.openSession();
		List<HashMap> list = ss.selectList("school.schoolList", user);
		for(int i=0; i<list.size(); i++){
			HashMap map = list.get(i);
			HashMap mm = ss.selectOne("school.word2", map.get("school").toString());
			map.put("schoolName", mm.get("name"));
			list.set(i, map);
		}
		ss.close();
		return list;
	}

	// ���� ����
	public boolean deleteSchool(String user) {
		SqlSession ss = fac.openSession();
		List<HashMap> list = ss.selectList("school.schoolList", user);
		if(list.size()>0){
			int n = ss.delete("school.deleteSchool", user);
			if(n>0){
				ss.commit();
				ss.close();
				return true;
			} else {
				ss.rollback();
				ss.close();
				return false;
			}
		} else {
			return true;
		}
	}

	// �հ���, ������ ����
	public boolean uploadData(HttpSession session, String school, String uuid) {
		SqlSession ss = fac.openSession();
		String user = ((HashMap)session.getAttribute("login")).get("auto").toString();
		HashMap<String, String> map = new HashMap<>();
		map.put("user", user);
		map.put("school", school);
		map.put("uuid", uuid);
		try{
			ss.insert("school.uploadData", map);
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

	// �հ��� ����Ʈ
	public List<HashMap> schoolData(String user) {
		SqlSession ss = fac.openSession();
		List<HashMap> list = ss.selectList("school.schoolData", user);
		ss.close();
		return list;
	}
}
