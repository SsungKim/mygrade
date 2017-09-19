package admin.controller;

import java.text.*;
import java.util.*;

import javax.servlet.http.*;

import org.springframework.beans.factory.annotation.*;
import org.springframework.stereotype.*;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.*;

import admin.service.*;
import admin.tab1.service.*;
import admin.tab2.service.*;
import admin.tab3.service.*;
import admin.tab4.service.*;
import admin.tab5.service.*;
import admin.tab6.controller.*;
import admin.tab6.service.*;
import admin.tab7.service.*;

@Controller
@RequestMapping("/admin")
public class AdminController {
	@Autowired
	AdminService as;
	@Autowired
	AdminTab7Service at7;
	@Autowired
	AdminTab4Service at4;
	@Autowired
	AdminTab5Service at5;
	@Autowired
	AdminTab2Service at2;
	@Autowired
	AdminTab3Service at3;
	@Autowired
	AdminTab1Service at1;
	@Autowired
	AdminTab6Service at6;

	// admin
	@RequestMapping("")
	public ModelAndView admin(){
		ModelAndView mav = new ModelAndView("/admin/admin.jsp");
		List<HashMap> payList = at1.payList(1, "0");
		mav.addObject("payList", payList);
		List<HashMap> payAll = at1.payAll("0");
		mav.addObject("payAll", payAll);
		SimpleDateFormat sdf = new SimpleDateFormat("M");
		String month = sdf.format(System.currentTimeMillis());
		mav.addObject("month", month);
		mav = at1.payPageInner(mav, 1, "0");
		return mav;
	}
	
	// tab
	@RequestMapping("/tab/{num}")
	@ResponseBody
	public ModelAndView tab(@PathVariable(name="num")int num){
		ModelAndView mav = new ModelAndView("/admin/tab"+num+".jsp");
		switch(num){
		case 1:
			List<HashMap> payList = at1.payList(1, "0");
			mav.addObject("payList", payList);
			List<HashMap> payAll = at1.payAll("0");
			mav.addObject("payAll", payAll);
			SimpleDateFormat sdf = new SimpleDateFormat("M");
			String month = sdf.format(System.currentTimeMillis());
			mav.addObject("month", month);
			mav = at1.payPageInner(mav, 1, "0");
			break;
		case 2:
			List<HashMap> chargeList = at2.chargeList(1, "0", "0");
			mav.addObject("chargeList", chargeList);
			mav.addObject("tab", "2");
			mav = at2.chargePageInner(mav, 1, "0", "0");
			SimpleDateFormat sdf2 = new SimpleDateFormat("yyyy-MM-dd");
			String now = sdf2.format(System.currentTimeMillis());
			String day1 = now.substring(0, now.lastIndexOf("-")+1) + "01";
			mav.addObject("day1", day1);
			mav.addObject("day2", now);
			int price = 0;
			for(HashMap m : chargeList){
				price += Integer.parseInt(m.get("pay").toString());
			}
			mav.addObject("price", price);
			break;
		case 3:
			List<HashMap> useList  = at3.useList(1, "0", "0");
			mav.addObject("useList", useList);
			mav.addObject("tab", "3");
			mav = at3.usePageInner(mav, 1, "0", "0");
			SimpleDateFormat sdf3 = new SimpleDateFormat("yyyy-MM-dd");
			String now2 = sdf3.format(System.currentTimeMillis());
			String day2 = now2.substring(0, now2.lastIndexOf("-")+1) + "01";
			mav.addObject("day1", day2);
			mav.addObject("day2", now2);
			List<HashMap> useAll = at3.useAll(day2, now2);
			int p1 = 0;
			int p2 = 0;
			int p3 = 0;
			for(int i=0; i<useAll.size(); i++){
				HashMap m = useAll.get(i);
				int point = 100;
				if(m.get("item").toString().equals("면접후기")){
					point = 50;
				}
				if(m.get("item").toString().equals("정시성적")){
					point = 10;
				}
				p1 += point;
			}
			p2 = p1*70/100;
			p3 = p1*30/100;
			mav.addObject("p1", p1);
			mav.addObject("p2", p2);
			mav.addObject("p3", p3);
			break;
		case 4:
			List<HashMap> certList = at4.certList(1);
			mav.addObject("certList", certList);
			mav.addObject("tab", "4");
			mav = at4.certPageInner(mav, 1);
			mav.addObject("tab4Type", "normal");
			break;
		case 5:
			List<HashMap> recordList = at5.certList(1);
			mav.addObject("certList", recordList);
			mav.addObject("tab", "5");
			mav.addObject("tab5Type", "cert");
			mav = at5.certPageInner(mav, 1);
			break;
		case 6:
			List<HashMap> searchList = at6.searchList("학생부", "전체", 1);
			mav.addObject("searchList", searchList);
			mav.addObject("search", "전체");
			mav.addObject("tab6Type", "학생부");
			mav.addObject("tab", "6");
			mav = at6.searchPageInner(mav, 1, "학생부", "전체");
			break;
		case 7:
			List<HashMap> memberList = at7.memberList(1);
			mav.addObject("memberList", memberList);
			mav.addObject("tab", "7");
			mav = at7.memberPageInner(mav, 1);
			break;
		}
		return mav;
	}
	
	// 충전데이터 저장
	@RequestMapping("/chargeData/{user}/{id}/{prim}/{tradeId}/{pay}/{applyNum}")
	@ResponseBody
	public void chargeData(@PathVariable(name="user")String user, @PathVariable(name="id")String id, 
			@PathVariable(name="prim")String prim, @PathVariable(name="tradeId")String tradeId, @PathVariable(name="pay")String pay,
			@PathVariable(name="applyNum")String applyNum, HttpSession session){
		as.chargeData(user, id, prim, tradeId, pay, applyNum, session);
	}
}
