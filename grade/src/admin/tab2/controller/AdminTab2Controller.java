package admin.tab2.controller;

import java.text.*;
import java.util.*;

import org.springframework.beans.factory.annotation.*;
import org.springframework.stereotype.*;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.*;

import admin.tab2.service.*;

@Controller
@RequestMapping("/admin/tab2")
public class AdminTab2Controller {
	@Autowired
	AdminTab2Service at2;

	// °Ë»ö
	@RequestMapping("/search/{day1}/{day2}")
	@ResponseBody
	public ModelAndView search(@PathVariable(name="day1")String day1, @PathVariable(name="day2")String day2,
			@RequestParam(name="page", required=false, defaultValue="0")int page){
		ModelAndView mav = new ModelAndView("/admin/content/tab2Content.jsp");
		List<HashMap> chargeList = new Vector<>();
		if(page == 0){
			chargeList = at2.chargeList(1, day1, day2);
		} else {
			chargeList = at2.chargeList(page, day1, day2);
		}
		mav.addObject("chargeList", chargeList);
		int price = 0;
		for(HashMap m : chargeList){
			price += Integer.parseInt(m.get("pay").toString());
		}
		mav.addObject("price", price);
		return mav;
	}
	
	// °Ë»ö page
	@RequestMapping("/searchPage/{day1}/{day2}")
	public ModelAndView searchPage(@PathVariable(name="day1")String day1, @PathVariable(name="day2")String day2,
			@RequestParam(name="page", required=false, defaultValue="0")int page){
		ModelAndView mav = new ModelAndView("/admin/page/tab2Page.jsp");
		if(page == 0){
			mav = at2.chargePageInner(mav, 1, day1, day2);
		} else {
			mav = at2.chargePageInner(mav, page, day1, day2);
		}
		return mav;
	}
	
	// ¿ùº°
	@RequestMapping("/monthTotal/{year}")
	@ResponseBody
	public ModelAndView monthTotal(@PathVariable(name="year")String year){
		ModelAndView mav = new ModelAndView("/admin/content/tab2Content2.jsp");
		List<HashMap> chargeTotal = at2.monthTotal(year);
		mav.addObject("chargeTotal", chargeTotal);
		return mav;
	}
	
	// ¿¢¼¿ ÀúÀå
	@RequestMapping("/excel")
	public ModelAndView excel(@RequestParam(name="day1")String day1, @RequestParam(name="day2")String day2){
		ModelAndView mav = new ModelAndView("tab2ExcelService");
		mav.addObject("day1", day1);
		mav.addObject("day2", day2);
		return mav;
	}
}
