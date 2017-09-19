package admin.tab3.controller;

import java.text.*;
import java.util.*;

import org.springframework.beans.factory.annotation.*;
import org.springframework.stereotype.*;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.*;

import admin.tab3.service.*;

@Controller
@RequestMapping("/admin/tab3")
public class AdminTab3Controller {
	@Autowired
	AdminTab3Service at3;
	
	// 검색
	@RequestMapping("/search/{day1}/{day2}")
	@ResponseBody
	public ModelAndView search(@PathVariable(name="day1")String day1, @PathVariable(name="day2")String day2,
			@RequestParam(name="page", required=false, defaultValue="0")int page){
		ModelAndView mav = new ModelAndView("/admin/content/tab3Content.jsp");
		List<HashMap> useList = new Vector<>();
		if(page == 0){
			useList  = at3.useList(1, day1, day2);
		} else {
			useList  = at3.useList(page, day1, day2);
		}
		mav.addObject("useList", useList);
		mav.addObject("tab", "3");
		List<HashMap> useAll = at3.useAll(day1, day2);
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
		return mav;
	}
	
	// 검색 page
	@RequestMapping("/searchPage/{day1}/{day2}")
	@ResponseBody
	public ModelAndView searchPage(@PathVariable(name="day1")String day1, @PathVariable(name="day2")String day2,
			@RequestParam(name="page", required=false, defaultValue="0")int page){
		ModelAndView mav = new ModelAndView("/admin/page/tab3Page.jsp");
		if(page == 0){
			mav = at3.usePageInner(mav, 1, day1, day2);
		} else {
			mav = at3.usePageInner(mav, page, day1, day2);
		}
		return mav;
	}
}
