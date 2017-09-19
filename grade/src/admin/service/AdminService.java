package admin.service;

import java.text.*;
import java.util.*;

import javax.servlet.http.*;

import org.apache.ibatis.session.*;
import org.springframework.beans.factory.annotation.*;
import org.springframework.stereotype.*;

@Component
public class AdminService {
	@Autowired
	SqlSessionFactory fac;

	// 충전데이터 저장
	public void chargeData(String user, String id, String prim, String tradeId, String pay, String applyNum, HttpSession session) {
		SqlSession ss = fac.openSession();
		HashMap map = new HashMap();
		map.put("user", user);
		map.put("id", id);
		map.put("prim", prim);
		map.put("tradeId", tradeId);
		map.put("pay", pay);
		map.put("applyNum", applyNum);
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String day = sdf.format(System.currentTimeMillis());
		map.put("day", day);
		try{
			ss.insert("admin.chargeData", map);
			int point = Integer.parseInt(pay)/100;
			map.put("point", point);
			ss.update("member.chargePoint", map);
			ss.commit();
			HashMap m = (HashMap)session.getAttribute("login");
			m.put("point", Integer.parseInt(m.get("point").toString())+point);
			session.setAttribute("login", m);
			ss.close();
		} catch(Exception e){
			e.printStackTrace();
			ss.rollback();
			ss.close();
		}
	}
	

}
