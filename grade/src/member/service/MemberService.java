package member.service;

import java.io.*;
import java.text.*;
import java.util.*;

import javax.servlet.*;
import javax.servlet.http.*;

import org.apache.ibatis.session.*;
import org.springframework.beans.factory.annotation.*;
import org.springframework.stereotype.*;
import org.springframework.web.multipart.*;

@Component
public class MemberService {
	@Autowired
	SqlSessionFactory fac;
	@Autowired
	ServletContext application;
	@Autowired
	MailService mail;
	
	// 아이디 중복체크
	public boolean idCheck(String id){
		SqlSession ss = fac.openSession();
		List<HashMap> list = ss.selectList("member.idCheck", id);
		if(list.size() > 0){
			ss.close();
			return false;
		} else {
			List<HashMap> list2 = ss.selectList("member.exitList", id);
			if(list2.size() > 0){
				ss.close();
				return false;
			}
		}
		ss.close();
		return true;
	}
	
	// 판매자 x 회원가입
	public boolean join(String id, String name, String pw, String addr1, String addr2, String addr3, String phone1,
			String phone2, String phone3, String agSms, String agEmail, String sales, String email1, String email2, String birth) {
		SqlSession ss = fac.openSession();
		HashMap<String, String> map = new HashMap<>();
		map.put("id", id);
		map.put("name", name);
		map.put("pw", pw);
		map.put("addr1", addr1);
		map.put("addr2", addr2);
		map.put("addr3", addr3);
		map.put("phone1", phone1);
		map.put("phone2", phone2);
		map.put("phone3", phone3);
		map.put("agSms", agSms);
		map.put("agEmail", agEmail);
		map.put("sales", sales);
		map.put("email1", email1);
		map.put("email2", email2);
		map.put("birth", birth);
		try{
			ss.insert("member.join", map);
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

	// 판매자 합격증 uuid 생성
	public String passData(MultipartFile file) {
		if(file.isEmpty()){
			return null;
		}
		try{
			String uuid = UUID.randomUUID().toString().substring(0, 8);
			String extension = file.getOriginalFilename().substring(file.getOriginalFilename().lastIndexOf("."));
			File f = new File(application.getRealPath("/file/sales"), uuid);
			file.transferTo(f);
			return uuid;
		} catch(Exception e){
			e.printStackTrace();
			return null;
		}
	}

	// 판매자 정보 등록
	public int sales(String id, String haddr, String hschool, String bank, String account,
			String uuid) {
		SqlSession ss = fac.openSession();
		HashMap<String, String> map = new HashMap<>();
		map.put("id", id);
		map.put("haddr", haddr);
		map.put("hschool", hschool);
		map.put("bank", bank);
		map.put("account", account);
		map.put("passData", uuid);
		HashMap sales = ss.selectOne("member.salesOne", map);
		if(sales == null){
			try{
				ss.insert("member.sales", map);
				ss.commit();
				ss.close();
				return 0;
			} catch(Exception e){
				e.printStackTrace();
				ss.rollback();
				ss.close();
				return 2;
			}
		} else {
			int n = ss.update("member.salesChange", map);
			if(n > 0){
				ss.commit();
				ss.close();
				return 1;
			} else {
				ss.rollback();
				ss.close();
				return 3;
			}
		}
	}

	// 이메일, 연락처 변경
	public boolean infoSave(String user, String email1, String email2, String phone1, String phone2, String phone3, HttpSession session) {
		SqlSession ss = fac.openSession();
		HashMap<String, String> map = new HashMap<>();
		map.put("user", user);
		map.put("email1", email1);
		map.put("email2", email2);
		map.put("phone1", phone1);
		map.put("phone2", phone2);
		map.put("phone3", phone3);
		int n = ss.update("member.infoSave", map);
		if(n > 0){
			ss.commit();
			List<HashMap> list = ss.selectList("member.member", user);
			session.setAttribute("login", list.get(0));
			ss.close();
			return true;
		} else {
			ss.rollback();
			ss.close();
			return false;
		}
	}
	
	// 주소 변경
	public boolean infoSave2(String user, String addr1, String addr2, String addr3, HttpSession session){
		SqlSession ss = fac.openSession();
		HashMap<String, String> map = new HashMap<>();
		map.put("user", user);
		map.put("addr1", addr1);
		map.put("addr2", addr2);
		map.put("addr3", addr3);
		int n = ss.update("member.infoSave2", map);
		if(n > 0){
			ss.commit();
			List<HashMap> list = ss.selectList("member.member", user);
			session.setAttribute("login", list.get(0));
			ss.close();
			return true;
		} else {
			ss.rollback();
			ss.close();
			return false;
		}
	}
	
	// 비밀번호 변경
	public boolean passChange(String user, String pw){
		SqlSession ss = fac.openSession();
		HashMap<String, String> map = new HashMap<>();
		map.put("user", user);
		map.put("pw", pw);
		int n = ss.update("member.passChange", map);
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

	// 회원탈퇴
	public boolean exit(String user, String reason, String content) {
		SqlSession ss = fac.openSession();
		HashMap<String, String> map = new HashMap<>();
		map.put("user", user);
		map.put("reason", reason);
		map.put("content", content);
		try{
			ss.insert("member.exit", map);
			ss.commit();
			ss.update("member.exitChange", map);
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

	// 판매자 삭제
	public boolean salesDelete(String user) {
		SqlSession ss = fac.openSession();
		int n = ss.delete("member.salesDelete", user);
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

	// 구매하기
	public int buy(HttpSession session, String item, String target, String owner, String school, String subject, String point) {
		SqlSession ss = fac.openSession();
		String user = ((HashMap)session.getAttribute("login")).get("auto").toString();
		String id = ((HashMap)session.getAttribute("login")).get("id").toString();
		HashMap<String, String> map = new HashMap<>();
		map.put("user", user);
		map.put("item", item);
		map.put("target", target);
		map.put("owner", owner);
		map.put("school", school);
		map.put("subject", subject);
		map.put("point", point);
		List<HashMap> buyList = ss.selectList("member.buyList", user);
		if(buyList.size() > 0){
			String today = new SimpleDateFormat("yyyy-MM-dd").format(System.currentTimeMillis());
			for(HashMap m : buyList){
				String targ = m.get("target").toString();
				if(target.equals(targ)){
					String buyDay = m.get("day").toString();
					today = today.replace("-", "");
					buyDay = buyDay.replace("-", "");
					int today1 = Integer.parseInt(today);
					int buyDay1 = Integer.parseInt(buyDay);
					if(today1 - buyDay1 < 15 && m.get("item").toString().equals(item)){
						ss.close();
						return 1;
					}
				}
			}
		}
		try{
			ss.insert("member.buy", map);
			ss.commit();
			map.put("price", point);
			ss.update("member.buyPoint", map);
			ss.commit();
			List<HashMap> list = ss.selectList("member.member", user);
			session.setAttribute("login", list.get(0));
			boolean b = insertSellList(ss, owner, item, target, point);
			ss.close();
			if(b){
				return 0;
			} else {
				return 2;
			}
		} catch(Exception e){
			e.printStackTrace();
			ss.rollback();
			ss.close();
			return 2;
		}
	}
	
	// 판매리스트 등록
	public boolean insertSellList(SqlSession ss, String owner, String item, String target, String point){
		HashMap<String, String> map = new HashMap<>();
		map.put("user", owner);
		map.put("item", item);
		map.put("target", target);
		map.put("point", point);
		try{
			ss.insert("member.insertSellList", map);
			ss.commit();
			ss.update("member.sellPointUpdate", map);
			return true;
		} catch(Exception e){
			e.printStackTrace();
			ss.rollback();
			return false;
		}
	}

	// 구매리스트
	public int buyList(String user, String num) {
		if(user == null){
			return 1;
		}
		SqlSession ss = fac.openSession();
		List<HashMap> buyList = ss.selectList("member.buyList", user);
		ss.close();
		if(buyList.size() > 0){
			String today = new SimpleDateFormat("yyyy-MM-dd").format(System.currentTimeMillis());
			for(HashMap m : buyList){
				String buyDay = m.get("day").toString();
				today = today.replace("-", "");
				buyDay = buyDay.replace("-", "");
				int today1 = Integer.parseInt(today);
				int buyDay1 = Integer.parseInt(buyDay);
				if(today1 - buyDay1 < 15 && m.get("item").toString().equals("면접후기") && m.get("target").toString().equals(num)){
					return 0;
				}
			}
		}
		return 1;
	}
	
	// 구매리스트2
	public List<HashMap> buyList2(HttpSession session){
		SqlSession ss = fac.openSession();
		String user = ((HashMap)session.getAttribute("login")).get("auto").toString();
		List<HashMap> buyList = ss.selectList("member.buyList", user);
		List<HashMap> list = new Vector<>();
		ss.close();
		if(buyList.size() > 0){
			String today = new SimpleDateFormat("yyyy-MM-dd").format(System.currentTimeMillis());
			for(HashMap m : buyList){
				String buyDay = m.get("day").toString();
				today = today.replace("-", "");
				buyDay = buyDay.replace("-", "");
				int today1 = Integer.parseInt(today);
				int buyDay1 = Integer.parseInt(buyDay);
				if(today1 - buyDay1 < 15){
					list.add(m);
				}
			}
		}
		return list;
	}
	
	// 구매리스트3
	public List<HashMap> buyList3(HttpSession session, int page){
		SqlSession ss = fac.openSession();
		String user = ((HashMap)session.getAttribute("login")).get("auto").toString();
		HashMap map = new HashMap();
		map.put("user", user);
		map.put("page", (page-1)*10);
		List<HashMap> buyList = ss.selectList("member.buyList1", map);
		ss.close();
		return buyList;
	}

	// 구매리스트4
	public List<HashMap> buyList4(String user, int page){
		SqlSession ss = fac.openSession();
		HashMap map = new HashMap();
		map.put("user", user);
		map.put("page", (page-1)*10);
		List<HashMap> buyList = ss.selectList("member.buyList1", map);
		ss.close();
		return buyList;
	}
	
	// 판매리스트
	public List<HashMap> sellList(HttpSession session, int page) {
		SqlSession ss = fac.openSession();
		String user = ((HashMap)session.getAttribute("login")).get("id").toString();
		HashMap map = new HashMap();
		map.put("user", user);
		map.put("page", (page-1)*10);
		List<HashMap> buyList = ss.selectList("member.sellList", map);
		ss.close();
		return buyList;
	}
	
	// 판매리스트
	public List<HashMap> sellList2(String user, int page) {
		SqlSession ss = fac.openSession();
		HashMap map = new HashMap();
		map.put("user", user);
		map.put("page", (page-1)*10);
		List<HashMap> buyList = ss.selectList("member.sellList", map);
		ss.close();
		return buyList;
	}

	// 내 면접후기
	public List<HashMap> interviewList(String user) {
		SqlSession ss = fac.openSession();
		List<HashMap> list = ss.selectList("member.myInterview", user);
		for(int i=0; i<list.size(); i++){
			HashMap m = list.get(i);
			HashMap mm = ss.selectOne("school.word2", m.get("school").toString());
			m.put("schoolName", mm.get("name"));
			list.set(i, m);
		}
		ss.close();
		return list;
	}

	// 내 학생부
	public List<HashMap> recordList(String user) {
		SqlSession ss = fac.openSession();
		List<HashMap> list = ss.selectList("member.myRecord", user);
		for(int i=0; i<list.size(); i++){
			HashMap m = list.get(i);
			HashMap mm = ss.selectOne("school.word2", m.get("school").toString());
			m.put("schoolName", mm.get("name"));
			list.set(i, m);
		}
		ss.close();
		return list;
	}

	// 내 자소서
	public List<HashMap> introList(String user) {
		SqlSession ss = fac.openSession();
		List<HashMap> list = ss.selectList("member.myIntro", user);
		for(int i=0; i<list.size(); i++){
			HashMap m = list.get(i);
			HashMap mm = ss.selectOne("school.word2", m.get("school").toString());
			m.put("schoolName", mm.get("name"));
			list.set(i, m);
		}
		ss.close();
		return list;
	}
	
	// 내 정시성적
	public List<HashMap> examList(String user) {
		SqlSession ss = fac.openSession();
		List<HashMap> list = ss.selectList("member.myExam", user);
		for(int i=0; i<list.size(); i++){
			HashMap m = list.get(i);
			HashMap mm = ss.selectOne("school.word2", m.get("school").toString());
			m.put("schoolName", mm.get("name"));
			list.set(i, m);
		}
		ss.close();
		return list;
	}

	// 충전하기
	public boolean charge(String user, int pay, String type, HttpSession session) {
		SqlSession ss = fac.openSession();
		HashMap map = new HashMap();
		map.put("user", user);
		map.put("pay", pay);
		map.put("type", type);
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd_HH:mm:ss");
		String day = sdf.format(System.currentTimeMillis());
		map.put("day", day);
		int point = pay/100;
		map.put("point", point);
		try{
			ss.insert("member.charge", map);
			ss.commit();
			ss.update("member.chargePoint", map);
			ss.commit();
			List<HashMap> list = ss.selectList("member.member", user);
			session.setAttribute("login", list.get(0));
			ss.close();
			return true;
		} catch(Exception e){
			e.printStackTrace();
			ss.rollback();
			ss.close();
			return false;
		}
	}

	// 구매리스트 학생부 데이터
	public HashMap recordOne(HashMap m) {
		SqlSession ss = fac.openSession();
		HashMap map = ss.selectOne("member.recordOne", m.get("target").toString());
		if(map!=null){
			map.put("user", m.get("user").toString());
			map.put("item", m.get("item").toString());
			map.put("target", m.get("target").toString());
			map.put("day", m.get("day").toString());
			HashMap mm = ss.selectOne("school.word2", map.get("school").toString());
			map.put("schoolName", mm.get("name"));
		}
		ss.close();
		return map;
	}

	// 구매리스트 자소서 데이터
	public HashMap introOne(HashMap m) {
		SqlSession ss = fac.openSession();
		HashMap map = ss.selectOne("member.introOne", m.get("target").toString());
		if(map!=null){
			map.put("user", m.get("user").toString());
			map.put("item", m.get("item").toString());
			map.put("target", m.get("target").toString());
			map.put("day", m.get("day").toString());
			HashMap mm = ss.selectOne("school.word2", map.get("school").toString());
			map.put("schoolName", mm.get("name"));
		}
		ss.close();
		return map;
	}

	// 구매리스트 면접후기 데이터
	public HashMap interviewOne(HashMap m) {
		SqlSession ss = fac.openSession();
		HashMap map = ss.selectOne("member.interviewOne", m.get("target").toString());
		if(map!=null){
			map.put("user", m.get("user").toString());
			map.put("item", m.get("item").toString());
			map.put("target", m.get("target").toString());
			map.put("day", m.get("day").toString());
			map.put("point", m.get("point"));
			HashMap mm = ss.selectOne("school.word2", map.get("school").toString());
			map.put("schoolName", mm.get("name"));
		}
		ss.close();
		return map;
	}

	// 구매리스트 정시성적 데이터
	public HashMap examOne(HashMap m) {
		SqlSession ss = fac.openSession();
		HashMap map = ss.selectOne("member.examOne", m.get("target").toString());
		if(map!=null){
			map.put("user", m.get("user").toString());
			map.put("item", m.get("item").toString());
			map.put("target", m.get("target").toString());
			map.put("day", m.get("day").toString());
			HashMap mm = ss.selectOne("school.word2", map.get("school").toString());
			map.put("schoolName", mm.get("name"));
		}
		ss.close();
		return map;
	}
	
	// 판매리스트 학생부 데이터
	public HashMap recordOne1(HashMap m) {
		SqlSession ss = fac.openSession();
		HashMap map = ss.selectOne("member.recordOne", m.get("target").toString());
		if(map!=null){
			map.put("user", m.get("user").toString());
			map.put("item", m.get("item").toString());
			map.put("target", m.get("target").toString());
			map.put("day", m.get("day").toString());
			map.put("point", (Integer.parseInt(m.get("point").toString())*3)/10);
			HashMap mm = ss.selectOne("school.word2", map.get("school").toString());
			map.put("schoolName", mm.get("name"));
		}
		ss.close();
		return map;
	}
	
	// 판매리스트 자소서 데이터
	public HashMap introOne1(HashMap m) {
		SqlSession ss = fac.openSession();
		HashMap map = ss.selectOne("member.introOne", m.get("target").toString());
		if(map!=null){
			map.put("user", m.get("user").toString());
			map.put("item", m.get("item").toString());
			map.put("target", m.get("target").toString());
			map.put("day", m.get("day").toString());
			map.put("point", (Integer.parseInt(m.get("point").toString())*3)/10);
			HashMap mm = ss.selectOne("school.word2", map.get("school").toString());
			map.put("schoolName", mm.get("name"));
		}
		ss.close();
		return map;
	}
	
	// 판매리스트 면접후기 데이터
	public HashMap interviewOne1(HashMap m) {
		SqlSession ss = fac.openSession();
		HashMap map = ss.selectOne("member.interviewOne", m.get("target").toString());
		if(map!=null){
			map.put("user", m.get("user").toString());
			map.put("item", m.get("item").toString());
			map.put("target", m.get("target").toString());
			map.put("day", m.get("day").toString());
			map.put("point", (Integer.parseInt(m.get("point").toString())*3)/10);
			HashMap mm = ss.selectOne("school.word2", map.get("school").toString());
			map.put("schoolName", mm.get("name"));
		}
		ss.close();
		return map;
	}
	
	// 판매리스트 정시성적 데이터
	public HashMap examOne1(HashMap m) {
		SqlSession ss = fac.openSession();
		HashMap map = ss.selectOne("member.examOne", m.get("target").toString());
		if(map!=null){
			map.put("user", m.get("user").toString());
			map.put("item", m.get("item").toString());
			map.put("target", m.get("target").toString());
			map.put("day", m.get("day").toString());
			map.put("point", (Integer.parseInt(m.get("point").toString())*3)/10);
			HashMap mm = ss.selectOne("school.word2", map.get("school").toString());
			map.put("schoolName", mm.get("name"));
		}
		ss.close();
		return map;
	}

	// 아이디 찾기
	public boolean idSearch(String name, String phone, String email, HttpSession session) {
		SqlSession ss = fac.openSession();
		HashMap<String, String> map = new HashMap<>();
		map.put("name", name);
		String phone1 = phone.substring(0, 3);
		String phone2 = phone.substring(3, 7);
		String phone3 = phone.substring(7);
		map.put("phone1", phone1);
		map.put("phone2", phone2);
		map.put("phone3", phone3);
		String email1 = email.substring(0, email.indexOf("@"));
		String email2 = email.substring(email.indexOf("@")+1);
		map.put("email1", email1);
		map.put("email2", email2);
		List<HashMap> list = ss.selectList("member.idSearch", map);
		ss.close();
		if(list.size() > 0){
			session.setAttribute("searchId", list.get(0).get("id").toString());
			return true;
		} else {
			return false;
		}
	}

	// 비밀번호 찾기
	public int pwSearch(String id, String name, String phone, String email) {
		SqlSession ss = fac.openSession();
		HashMap<String, String> map = new HashMap<>();
		map.put("id", id);
		map.put("name", name);
		String phone1 = phone.substring(0, 3);
		String phone2 = phone.substring(3, 7);
		String phone3 = phone.substring(7);
		map.put("phone1", phone1);
		map.put("phone2", phone2);
		map.put("phone3", phone3);
		String email1 = email.substring(0, email.indexOf("@"));
		String email2 = email.substring(email.indexOf("@")+1);
		map.put("email1", email1);
		map.put("email2", email2);
		List<HashMap> list = ss.selectList("member.pwSearch", map);
		String uuid = UUID.randomUUID().toString().substring(0, 8);
		if(list.size() > 0){
			int n = mail.mailSend(id, name, email, uuid);;
			map.put("uuid", uuid);
			ss.update("member.pwChange", map);
			ss.commit();
			ss.close();
			return n;
		} else {
			ss.close();
			return 2;
		}
	}

	// 인증 리스트
	public List<HashMap> certList(String user) {
		SqlSession ss = fac.openSession();
		List<HashMap> list = ss.selectList("member.certList", user);
		for(int i=0; i<list.size(); i++){
			HashMap m = list.get(i);
			List<HashMap> l = ss.selectList("search.word2", m.get("school"));
			m.put("schoolName", l.get(0).get("name"));
			list.set(i, m);
		}
		ss.close();
		return list;
	}

	// 학교등록 여부 확인
	public boolean schoolCheck(String user) {
		SqlSession ss = fac.openSession();
		List<HashMap> schoolData = ss.selectList("school.schoolList", user);
		ss.close();
		return schoolData.size() > 0 ? false : true;
	}

	// 구매확인
	public boolean buyCheck(String num, HttpSession session, String type) {
		SqlSession ss = fac.openSession();
		String user = ((HashMap)session.getAttribute("login")).get("auto").toString();
		List<HashMap> buyList = ss.selectList("member.buyList", user);
		for(HashMap m : buyList){
			if(m.get("item").toString().equals(type)){
				if(m.get("target").toString().equals(num)){
					ss.close();
					return true;
				}
			}
		}
		ss.close();
		return false;
	}

}
