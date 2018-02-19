package info.service;

import java.io.*;
import java.util.*;

import javax.servlet.*;

import org.apache.ibatis.session.*;
import org.springframework.beans.factory.annotation.*;
import org.springframework.stereotype.*;
import org.springframework.web.multipart.*;

@Component
public class InfoService {
	@Autowired
	SqlSessionFactory fac;
	@Autowired
	ServletContext application;
	
	// 등록
	public boolean write(String title, String content, String name){
		SqlSession ss = fac.openSession();
		HashMap<String, String> map = new HashMap<>();
		map.put("title", title);
		map.put("content", content);
		map.put("writer", name);
		try{
			ss.insert("info.write", map);
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
		List<HashMap> list = ss.selectList("info.infoList", (num-1)*10);
		ss.close();
		return list;
	}

	// view
	public HashMap view(String num) {
		SqlSession ss = fac.openSession();
		HashMap map = ss.selectOne("info.infoOne", num);
		ss.close();
		return map;
	}

	// modify
	public HashMap modify(String num) {
		SqlSession ss = fac.openSession();
		HashMap map = ss.selectOne("info.infoOne", num);
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
		int n = ss.update("info.modify", map);
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
		int n = ss.selectOne("info.infoCount");
		ss.close();
		return n%10 == 0 ? n/10 : n/10+1;
	}

	// remove
	public boolean remove(int num) {
		SqlSession ss = fac.openSession();
		int n = ss.delete("info.remove", num);
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

	// 첨부파일 저장
	public String infoData(MultipartFile file) {
		if(file.isEmpty()){
			return null;
		}
		try{
			String uuid = UUID.randomUUID().toString().substring(0, 8);
			String extension = file.getOriginalFilename().substring(file.getOriginalFilename().lastIndexOf("."));
			File f = new File(application.getRealPath("/file/info"), uuid);
			file.transferTo(f);
			return uuid;
		} catch(Exception e){
			e.printStackTrace();
			return null;
		}
	}

	// 입시정보 저장
	public boolean write2(String title, String content, String name, MultipartFile file, String uuid, String fileName) {
		SqlSession ss = fac.openSession();
		HashMap<String, String> map = new HashMap<>();
		map.put("title", title);
		map.put("content", content);
		map.put("writer", name);
		map.put("uuid", uuid);
		map.put("fileName", fileName);
		try{
			ss.insert("info.write", map);
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
