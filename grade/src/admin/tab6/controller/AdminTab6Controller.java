package admin.tab6.controller;

import java.util.*;

import org.springframework.beans.factory.annotation.*;
import org.springframework.stereotype.*;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.*;

import admin.tab6.service.*;

@Controller
@RequestMapping("/admin/tab6")
public class AdminTab6Controller {
	@Autowired
	AdminTab6Service at6;
	
	// 게시물 리스트
	@RequestMapping("/search/{type}/{search}/{page}")
	@ResponseBody
	public ModelAndView search(@PathVariable(name="type")String type, @PathVariable(name="search")String search,
			@PathVariable(name="page")int page){
		ModelAndView mav = new ModelAndView("/admin/content/tab6Content.jsp");
		List<HashMap> searchList = at6.searchList(type, search, page);
		mav.addObject("searchList", searchList);
		mav.addObject("tab6Type", type);
		return mav;
	}
	
	// 게시물 페이지
	@RequestMapping("/searchPage/{type}/{search}/{page}")
	@ResponseBody
	public ModelAndView seachPage(@PathVariable(name="type")String type, @PathVariable(name="search")String search,
			@PathVariable(name="page")int page){
		ModelAndView mav = new ModelAndView("/admin/page/tab6Page.jsp");
		mav = at6.searchPageInner(mav, page, type, search);
		mav.addObject("tab6Type", type);
		return mav;
	}
	
	// 게시물 제거
	@RequestMapping("/remove/{type}/{num}")
	@ResponseBody
	public boolean remove(@PathVariable(name="type")String type, @PathVariable(name="num")String num){
		return at6.remove(type, num);
	}
}
