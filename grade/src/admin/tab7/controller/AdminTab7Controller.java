package admin.tab7.controller;

import java.util.*;

import org.springframework.beans.factory.annotation.*;
import org.springframework.stereotype.*;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.*;

import admin.service.*;
import admin.tab7.service.*;

@Controller
@RequestMapping("/admin/tab7")
public class AdminTab7Controller {
	@Autowired
	AdminTab7Service at7;
	
	// tab7 search
	@RequestMapping("/search/{word}")
	@ResponseBody
	public ModelAndView tab7Search(@PathVariable(name="word")String word){
		ModelAndView mav = new ModelAndView("/admin/content/tab7Content.jsp");
		List<HashMap> memberList = at7.memberSearch(word, 1);
		mav.addObject("memberList", memberList);
		return mav;
	}
	
	// tab7 search page
	@RequestMapping("/searchPage/{word}")
	@ResponseBody
	public ModelAndView tab7SearchPage(@PathVariable(name="word")String word){
		ModelAndView mav = new ModelAndView("/admin/page/tab7Page.jsp");
		mav.addObject("tab", "7");
		mav = memberPage2(mav, 1, word);
		return mav;
	}
	
	// member page inner method2
	public ModelAndView memberPage2(ModelAndView mav, int select, String word){
		int page = at7.memberPage2(word);
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
	
	// tab7 select
	@RequestMapping("/select/{select}")
	@ResponseBody
	public ModelAndView tab7Select(@PathVariable(name="select")String select){
		ModelAndView mav = new ModelAndView("/admin/content/tab7Content.jsp");
		List<HashMap> memberList = at7.memberSelect(select, 1);
		mav.addObject("memberList", memberList);
		return mav;
	}
	
	// tab7 select page
	@RequestMapping("/selectPage/{select}")
	@ResponseBody
	public ModelAndView tab7SelectPage(@PathVariable(name="select")String select){
		ModelAndView mav = new ModelAndView("/admin/page/tab7Page.jsp");
		mav.addObject("tab", "7");
		mav = memberPage3(mav, 1, select);
		return mav;
	}
	
	// member page inner method3
	public ModelAndView memberPage3(ModelAndView mav, int select, String word){
		int page = at7.memberPage3(word);
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
	
	// tab7 select and search
	@RequestMapping("/select/search/{select}/{word}")
	@ResponseBody
	public ModelAndView tab7SelectSearch(@PathVariable(name="select")String select, @PathVariable(name="word")String word){
		ModelAndView mav = new ModelAndView("/admin/content/tab7Content.jsp");
		List<HashMap> memberList = at7.memberSearchSelect(word, select, 1);
		mav.addObject("memberList", memberList);
		return mav;
	}
	
	// tab7 select and search page
	@RequestMapping("/selectSearchPage/{select}/{word}")
	@ResponseBody
	public ModelAndView tab7SelectSearchPage(@PathVariable(name="select")String select, @PathVariable(name="word")String word){
		ModelAndView mav = new ModelAndView("/admin/page/tab7Page.jsp");
		mav.addObject("tab", "7");
		mav = memberPage4(mav, 1, select, word);
		return mav;
	}
	
	// member page inner method4
	public ModelAndView memberPage4(ModelAndView mav, int num, String select, String word){
		int page = at7.memberPage4(select, word);
		int first = 1;
		int last = page;
		int start = num > first ? (num/10)*10+1 : first;
		int end = start+9 < last ? start+9 : last;
		int prev = (start/10)*10-10+1;
		int next = (start/10)*10+10+1;
		mav.addObject("select", num);
		mav.addObject("first", first);
		mav.addObject("last", last);
		mav.addObject("start", start);
		mav.addObject("end", end);
		mav.addObject("prev", prev);
		mav.addObject("next", next);
		return mav;
	}
	
	// page move
	@RequestMapping("/page/{num}")
	@ResponseBody
	public ModelAndView page(@PathVariable(name="num")int num){
		ModelAndView mav = new ModelAndView("/admin/content/tab7Content.jsp");
		List<HashMap> memberList = at7.memberList(num);
		mav.addObject("memberList", memberList);
		return mav;
	}
	
	// page move
	@RequestMapping("/pages/{num}")
	@ResponseBody
	public ModelAndView pages(@PathVariable(name="num")int num){
		ModelAndView mav = new ModelAndView("/admin/page/tab7Page.jsp");
		mav.addObject("tab", "7");
		mav = at7.memberPageInner(mav, num);
		return mav;
	}
	
	// 회원 추방
	@RequestMapping("/exitMember/{user}")
	@ResponseBody
	public boolean exitMember(@PathVariable(name="user")String user){
		return at7.exitMember(user);
	}
	
	// 판매자 박탈
	@RequestMapping("/sales/{user}")
	@ResponseBody
	public boolean sales(@PathVariable(name="user")String user){
		return at7.sales(user);
	}
	
	// 관리자 설정
	@RequestMapping("/admin/{user}/{type}")
	@ResponseBody
	public boolean admin(@PathVariable(name="user")String user, @PathVariable(name="type")String type){
		return at7.admin(user, type);
	}
}
