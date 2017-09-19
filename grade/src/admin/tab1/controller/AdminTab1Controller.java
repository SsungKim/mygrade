package admin.tab1.controller;

import java.util.*;
import org.springframework.beans.factory.annotation.*;
import org.springframework.stereotype.*;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.*;

import admin.tab1.service.*;

@Controller
@RequestMapping("/admin/tab1")
public class AdminTab1Controller {
	@Autowired
	AdminTab1Service at1;
	@Autowired
	Tab1ExcelService ex;
	
	// �� ����
	@RequestMapping("/month/{month}")
	@ResponseBody
	public ModelAndView month(@PathVariable(name="month")String month,
			@RequestParam(name="page", required=false, defaultValue="0")int page){
		ModelAndView mav = new ModelAndView("/admin/content/tab1Content.jsp");
		List<HashMap> payList = new Vector<>();
		if(page == 0){
			payList = at1.payList(1, month);
		} else {
			payList = at1.payList(page, month);
		}
		mav.addObject("payList", payList);
		List<HashMap> payAll = at1.payAll(month);
		mav.addObject("payAll", payAll);
		mav.addObject("month", month);
		return mav;
	}
	
	// �� ���� page
	@RequestMapping("/monthPage/{month}")
	@ResponseBody
	public ModelAndView monthPage(@PathVariable(name="month")String month,
			@RequestParam(name="page", required=false, defaultValue="0")int page){
		ModelAndView mav = new ModelAndView("/admin/page/tab1Page.jsp");
		if(page == 0){
			mav = at1.payPageInner(mav, 1, month);
		} else {
			mav = at1.payPageInner(mav, page, month);
		}
		return mav;
	}
	
	// �� ��ü
	@RequestMapping("/monthAll/{month}")
	@ResponseBody
	public List<HashMap> monthAll(@PathVariable(name="month")String month){
		return at1.payAll(month);
	}
	
	// ���� ����
	@RequestMapping("/excel")
	public ModelAndView excel(@RequestParam(name="month")String month){
		ModelAndView mav = new ModelAndView("tab1ExcelService");
		mav.addObject("month", month);
		return mav;
	}
}
