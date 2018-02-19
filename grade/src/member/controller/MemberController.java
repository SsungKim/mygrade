package member.controller;

import java.text.*;
import java.util.*;

import javax.servlet.http.*;

import org.springframework.beans.factory.annotation.*;
import org.springframework.stereotype.*;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.*;
import org.springframework.web.servlet.*;

import member.service.*;

@Controller
@RequestMapping("/member")
public class MemberController {
	@Autowired
	MemberService ms;
	
	// �α��� ������
	@RequestMapping("/login")
	public ModelAndView login(HttpServletRequest req, HttpServletResponse resp){
		ModelAndView mav = new ModelAndView("/main/login2.jsp");
		Cookie[] car = req.getCookies();
		String id = "";
		if(car != null){
			for(Cookie c : car){
				if(c.getName().equals("saveId")){
					id = c.getValue();
				}
			}
		}
		mav.addObject("saveId", id);
		return mav;
	}
	
	// ȸ������1 ������
	@RequestMapping("/join1")
	public ModelAndView join1(){
		ModelAndView mav = new ModelAndView("/member/join.jsp");
		mav.addObject("cpId", "TSGM1001");
		mav.addObject("urlCode", "011001");
		//��¥ ����
        Calendar today = Calendar.getInstance();
        SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
        String day = sdf.format(today.getTime());

        java.util.Random ran = new Random();
        //���� ���� ����
        int numLength = 6;
        String randomStr = "";

        for (int i = 0; i < numLength; i++) {
            //0 ~ 9 ���� ���� ����
            randomStr += ran.nextInt(10);
        }

		//reqNum�� �ִ� 40byte ���� ��� ����
        String reqNum = day + randomStr;
        mav.addObject("certNum", reqNum);
        mav.addObject("date", day);
        mav.addObject("certMet", "M");
        mav.addObject("name", "");
        mav.addObject("phoneNo", "");
        mav.addObject("phoneCorp", "");
        mav.addObject("birthDay", "");
        mav.addObject("gender", "");
        mav.addObject("nation", "");
        mav.addObject("plusInfo", "");
        
		return mav;
	}
	
	// ȸ������ �������� ����������
	@RequestMapping("/join2/{name}/{birthDay}/{phoneNo}/{phoneCorp}/{gender}/{result}")
	@ResponseBody
	public void join2Cert(@PathVariable(name="name")String name, @PathVariable(name="birthDay")String birthDay,
											@PathVariable(name="phoneNo")String phoneNo, @PathVariable(name="phoneCorp")String phoneCorp,
											@PathVariable(name="gender")String gender, @PathVariable(name="result")String result,
											HttpSession session){
		session.setAttribute("name", name);
		session.setAttribute("birthDay", birthDay);
		session.setAttribute("phoneNo", phoneNo);
		session.setAttribute("phoneCorp", phoneCorp);
		session.setAttribute("gender", gender);
		session.setAttribute("result", result);
	}
	
	// ȸ������ ������ ������ ����
	@RequestMapping("/join2/{name}/{birthDay}/{gender}/{result}")
	@ResponseBody
	public void join2Ipin(@PathVariable(name="name")String name, @PathVariable(name="birthDay")String birthDay,
										@PathVariable(name="gender")String gender, @PathVariable(name="result")String result,
										HttpSession session){
		session.setAttribute("name", name);
		session.setAttribute("birthDay", birthDay);
		session.setAttribute("gender", gender);
		session.setAttribute("result", result);
	}
	
	// ȸ������ ������ ������������ ����
	@RequestMapping("/join22/{retInfo}")
	public ModelAndView join2Ipin(@PathVariable(name="retInfo")String retInfo, HttpSession session){
		ModelAndView mav = new ModelAndView("/member/ipin4.jsp");
		session.setAttribute("retInfo", retInfo);
		return mav;
	}
	
	// ȸ������2
	@RequestMapping("/join2")
	public ModelAndView join2(){
		ModelAndView mav = new ModelAndView("/member/join2.jsp");
		return mav;
	}
	
	// ������ ��������
	@RequestMapping("/ipinSession/{reqNum2}")
	@ResponseBody
	public void ipinSession(@PathVariable(name="reqNum2")String reqNum2, HttpSession session){
		session.setAttribute("reqNum2", reqNum2);
	}
	
	// ���̵� �ߺ�üũ
	@RequestMapping("/idCheck/{id}")
	@ResponseBody
	public boolean idCheck(@PathVariable(name="id")String id){
		return ms.idCheck(id);
	}
	
	// �Ǹ��� x ȸ������
	@RequestMapping("/join3/{id}/{name}/{pw}/{addr1}/{addr2}/{addr3}/{phone1}/{phone2}/{phone3}/{agSms}/{agEmail}/{sales}/{birth}")
	@ResponseBody
	public boolean join3(@PathVariable(name="id")String id, @PathVariable(name="name")String name,
										@PathVariable(name="pw")String pw, @PathVariable(name="addr1")String addr1,
										@PathVariable(name="addr2")String addr2, @PathVariable(name="addr3")String addr3,
										@PathVariable(name="phone1")String phone1, @PathVariable(name="phone2")String phone2,
										@PathVariable(name="phone3")String phone3, @PathVariable(name="agSms")String agSms,
										@PathVariable(name="agEmail")String agEmail, @PathVariable(name="sales")String sales,
										@RequestParam(name="email1")String email1, @RequestParam(name="email2")String email2,
										@PathVariable(name="birth")String birth){
		return ms.join(id, name, pw, addr1, addr2, addr3, phone1, phone2, phone3, agSms, agEmail, sales, email1, email2, birth);
	}
	
	// �Ǹ��� o ȸ������
	@RequestMapping("/join4")
	@ResponseBody
	public int join4(MultipartHttpServletRequest req, HttpSession session, HttpServletRequest request,
									@RequestParam(name="id")String id, @RequestParam(name="hschoolAddr")String haddr,
									@RequestParam(name="hschool")String hschool,
									@RequestParam(name="bank")String bank, @RequestParam(name="account")String account){
		MultipartFile file = req.getFile("passData");
		String uuid = "";
		if(file != null){
			uuid = ms.passData(file);
		}
		return ms.sales(id, haddr, hschool, bank, account, uuid);
	}
	
	// ������
	@RequestMapping("/info")
	public ModelAndView info(){
		ModelAndView mav = new ModelAndView("/member/info.jsp");
		return mav;
	}
	
	// �̸���, ����ó ����
	@RequestMapping("/infoSave/{user}/{email1}/{email2}/{phone1}/{phone2}/{phone3}")
	@ResponseBody
	public boolean infoSave(@PathVariable(name="user")String user, @PathVariable(name="email1")String email1,
											@PathVariable(name="email2")String email2, @PathVariable(name="phone1")String phone1,
											@PathVariable(name="phone2")String phone2, @PathVariable(name="phone3")String phone3,
											HttpSession session){
		return ms.infoSave(user, email1, email2, phone1, phone2, phone3, session);
	}
	
	// �ּ� ����
	@RequestMapping("/infoSave2/{user}/{addr1}/{addr2}/{addr3}")
	@ResponseBody
	public boolean infoSave2(@PathVariable(name="user")String user, @PathVariable(name="addr1")String addr1,
											@PathVariable(name="addr2")String addr2, @PathVariable(name="addr3")String addr3,
											HttpSession session){
		return ms.infoSave2(user, addr1, addr2, addr3, session);
	}
	
	// ��й�ȣ ����
	@RequestMapping("/passChange/{user}/{pw}")
	@ResponseBody
	public boolean passChange(@PathVariable(name="user")String user, @PathVariable(name="pw")String pw){
		return ms.passChange(user, pw);
	}
	
	// ȸ��Ż��
	@RequestMapping("/exit")
	public ModelAndView exit(){
		ModelAndView mav = new ModelAndView("/member/exit.jsp");
		return mav;
	}
	
	// ȸ��Ż�� �Ϸ�
	@RequestMapping("/exit2/{user}/{reason}/{content}")
	@ResponseBody
	public boolean exit2(@PathVariable(name="user")String user, @PathVariable(name="reason")String reason,
										@PathVariable(name="content")String content){
		return ms.exit(user, reason, content);
	}
	
	// Ż��Ϸ� ������
	@RequestMapping("/exit3")
	public String exit3(){
		return "/member/exit2.jsp";
	}
	
	// ���� ����� ������
	@RequestMapping("/myData/{user}")
	public ModelAndView myData(@PathVariable(name="user")String user){
		ModelAndView mav = new ModelAndView("/member/myData.jsp");
		List<HashMap> interviewList = ms.interviewList(user);
		mav.addObject("interviewList", interviewList);
		List<HashMap> recordList = ms.recordList(user);
		mav.addObject("recordList", recordList);
		List<HashMap> introList = ms.introList(user);
		mav.addObject("introList", introList);
		List<HashMap> examList = ms.examList(user);
		mav.addObject("examList", examList);
		return mav;
	}
	
	// �Ǹ��� ����
	@RequestMapping("/sales")
	public ModelAndView sales(){
		ModelAndView mav = new ModelAndView("/member/sales.jsp");
		return mav;
	}
	
	// �Ǹ��� ����
	@RequestMapping("/salesDelete/{user}")
	@ResponseBody
	public boolean salesDelete(@PathVariable(name="user")String user){
		return ms.salesDelete(user);
	}
	
	// �����ϱ�
	@RequestMapping("/buy/{item}/{target}/{user}/{school}/{subject}/{point}")
	@ResponseBody
	public int buy(HttpSession session, @PathVariable(name="item")String item, @PathVariable(name="target")String target,
							@PathVariable(name="user")String user, @PathVariable(name="school")String school, @PathVariable(name="subject")String subject,
							@PathVariable(name="point")String point){
		System.out.println(item+"/"+target+"/"+user+"/"+school+"/"+subject+"/"+point);
		return ms.buy(session, item, target, user, school, subject, point);
	}
	
	// ���Ÿ���Ʈ
	@RequestMapping("/buyList")
	@ResponseBody
	public List<HashMap> buyList(HttpSession session){
		return ms.buyList2(session);
	}
	
	// �����ϱ�
	@RequestMapping("/charge/{user}/{pay}/{type}")
	@ResponseBody
	public boolean charge(@PathVariable(name="user")String user, @PathVariable(name="pay")int pay,
										@PathVariable(name="type")String type, HttpSession session){
		return ms.charge(user, pay, type, session);
	}
	
	// ��������1
	@RequestMapping("/cert")
	public ModelAndView cert(){
		ModelAndView mav = new ModelAndView("/member/cert.jsp");
		mav.addObject("certId", "TSGM1001");
		mav.addObject("code", "011002");
		return mav;
	}
	
	// ��������2
	@RequestMapping("/cert2")
	public ModelAndView cert2(){
		ModelAndView mav = new ModelAndView("/member/cert2.jsp");
		return mav;
	}
	
	// ��������3
	@RequestMapping("/cert3")
	public ModelAndView cert3(){
		ModelAndView mav = new ModelAndView("/member/cert3.jsp");
		return mav;
	}
	
	// ��������4
	@RequestMapping("/cert4")
	public ModelAndView cert4(){
		ModelAndView mav = new ModelAndView("/member/cert4.jsp");
		return mav;
	}
	
	// ���̵�, ��й�ȣ ã��
	@RequestMapping("/search")
	public ModelAndView idPwSearch(){
		ModelAndView mav = new ModelAndView("/member/idSearch.jsp");
		return mav;
	}
	
	// ���̵� ã��
	@RequestMapping("/idSearch/{name}/{phone}")
	@ResponseBody
	public boolean idSearch(@PathVariable(name="name")String name, @PathVariable(name="phone")String phone,
			@RequestParam(name="email")String email, HttpSession session){
		return ms.idSearch(name, phone, email, session);
	}
	
	// ��й�ȣ ã��
	@RequestMapping("/pwSearch/{id}/{name}/{phone}")
	@ResponseBody
	public int pwSearch(@PathVariable(name="id")String id, @PathVariable(name="name")String name,
			@PathVariable(name="phone")String phone, @RequestParam(name="email")String email){
		return ms.pwSearch(id, name, phone, email);
	}
	
	// ������1
	@RequestMapping("/ipin")
	public ModelAndView ipin(){
		ModelAndView mav = new ModelAndView("/member/ipin1.jsp");
		return mav;
	}

	// ������2
	@RequestMapping("/ipin2/{reqNum}")
	public ModelAndView ipin2(@PathVariable(name="reqNum")String reqNum, HttpSession session){
		ModelAndView mav = new ModelAndView("/member/ipin2.jsp");
		session.setAttribute("reqNum2", reqNum);
		return mav;
	}

	// ������3
	@RequestMapping("/ipin3")
	public ModelAndView ipin3(){
		ModelAndView mav = new ModelAndView("/member/ipin3.jsp");
		return mav;
	}

	// ������4
	@RequestMapping("/ipin4")
	public ModelAndView ipin4(){
		ModelAndView mav = new ModelAndView("/member/ipin4.jsp");
		return mav;
	}
	
	// �ּ� �˻�
	@RequestMapping("/addr/{addr}")
	@ResponseBody
	public ModelAndView addr(@PathVariable(name="addr")String addr){
		ModelAndView mav = new ModelAndView("/member/addr.jsp");
		mav.addObject("addr", addr);
		return mav;
	}
	
	// ���ų���
	@RequestMapping("/sales/buy")
	public ModelAndView salesBuy(HttpSession session, @RequestParam(name="user", required=false, defaultValue="s")String user){
		ModelAndView mav = new ModelAndView("/member/sales/buy.jsp");
		List<HashMap> buyList = new Vector<>();
		if(user.equals("s")){
			buyList = ms.buyList3(session, 1);
		} else {
			buyList = ms.buyList4(user, 1);
			mav.addObject("adminUser", user);
		}
		for(int i=0; i<buyList.size(); i++){
			HashMap m = buyList.get(i);
			String item = m.get("item").toString();
			switch(item){
			case "�л���":
				m = ms.recordOne(m);
				break;
			case "�ڼҼ�":
				m = ms.introOne(m);
				break;
			case "�����ı�":
				m = ms.interviewOne(m);
				break;
			case "���ü���":
				m = ms.examOne(m);
				break;
			}
			buyList.set(i, m);
		}
		if(buyList.size() > 0){
			if(buyList.get(0) == null)
				buyList.remove(0);
		}
		mav.addObject("buyList", buyList);
		mav = pageInner(mav, 1, buyList);
		mav.addObject("type", "buy");
		return mav;
	}
	
	// ���ų��� ������ �̵�
	@RequestMapping("/sales/buy/page/{num}")
	public ModelAndView salesBuy1(HttpSession session, @PathVariable(name="num")int num,
			@RequestParam(name="user", required=false, defaultValue="s")String user){
		ModelAndView mav = new ModelAndView("/member/sales/buy.jsp");
		List<HashMap> buyList = new Vector<>();
		if(user.equals("s")){
			buyList = ms.buyList3(session, num);
		} else {
			buyList = ms.buyList4(user, num);
		}
		mav.addObject("buyList", buyList);
		for(int i=0; i<buyList.size(); i++){
			HashMap m = buyList.get(i);
			String item = m.get("item").toString();
			switch(item){
			case "�л���":
				m = ms.recordOne(m);
				break;
			case "�ڼҼ�":
				m = ms.introOne(m);
				break;
			case "�����ı�":
				m = ms.interviewOne(m);
				break;
			case "���ü���":
				m = ms.examOne(m);
				break;
			}
			buyList.set(i, m);
		}
		mav = pageInner(mav, num, buyList);
		mav.addObject("type", "buy");
		return mav;
	}
	
	// �Ǹų���
	@RequestMapping("/sales/sell")
	public ModelAndView salesSell(HttpSession session, @RequestParam(name="user", required=false, defaultValue="s")String user){
		ModelAndView mav = new ModelAndView("/member/sales/sell.jsp");
		List<HashMap> sellList = new Vector<>();
		if(user.equals("s")){
			sellList = ms.sellList(session, 1);
		} else {
			sellList = ms.sellList2(user, 1);
		}
		for(int i=0; i<sellList.size(); i++){
			HashMap m = sellList.get(i);
			String item = m.get("item").toString();
			switch(item){
			case "�л���":
				m = ms.recordOne1(m);
				break;
			case "�ڼҼ�":
				m = ms.introOne1(m);
				break;
			case "�����ı�":
				m = ms.interviewOne1(m);
				break;
			case "���ü���":
				m = ms.examOne1(m);
				break;
			}
			sellList.set(i, m);
		}
		if(sellList.size() > 0){
			if(sellList.get(0) == null)
				sellList.remove(0);
		}
		mav.addObject("sellList", sellList);
		mav = pageInner(mav, 1, sellList);
		mav.addObject("type", "sell");
		return mav;
	}
	
	// �Ǹų��� ������ �̵�
	@RequestMapping("/sales/sell/page/{num}")
	public ModelAndView salesSell1(HttpSession session, @PathVariable(name="num")int num,
			@RequestParam(name="user", required=false, defaultValue="s")String user){
		ModelAndView mav = new ModelAndView("/member/sales/sell.jsp");
		List<HashMap> sellList = new Vector<>();
		if(user.equals("s")){
			sellList = ms.sellList(session, num);
		} else {
			sellList = ms.sellList2(user, num);
		}
		mav.addObject("sellList", sellList);
		for(int i=0; i<sellList.size(); i++){
			HashMap m = sellList.get(i);
			String item = m.get("item").toString();
			switch(item){
			case "�л���":
				m = ms.recordOne1(m);
				break;
			case "�ڼҼ�":
				m = ms.introOne1(m);
				break;
			case "�����ı�":
				m = ms.interviewOne1(m);
				break;
			case "���ü���":
				m = ms.examOne1(m);
				break;
			}
			sellList.set(i, m);
		}
		mav = pageInner(mav, num, sellList);
		mav.addObject("type", "sell");
		return mav;
	}
	
	// ������ ó��
	public ModelAndView pageInner(ModelAndView mav, int select, List<HashMap> list){
		int page = list.size()%10 == 0 ? list.size()/10 : list.size()/10+1;
		int first = 1;
		int last = page;
		int start = select > first ? (select/10)*10+1 : first;
		int end = start+9 < last ? start+9 : last;
		int prev = (start/10)*10-10+1;
		int next = (start/10)*10+10+1;
		mav.addObject("select", select);
		mav.addObject("first", first);
		mav.addObject("last", last);
		mav.addObject("start", start);
		mav.addObject("end", end);
		mav.addObject("prev", prev);
		mav.addObject("next", next);
		return mav;
	}
	
	// �б���� ���� Ȯ��
	@RequestMapping("/schoolCheck/{user}")
	@ResponseBody
	public boolean schoolCheck(@PathVariable(name="user")String user){
		return ms.schoolCheck(user);
	}
}
