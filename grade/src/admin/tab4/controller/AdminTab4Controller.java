package admin.tab4.controller;

import java.util.*;

import org.springframework.beans.factory.annotation.*;
import org.springframework.stereotype.*;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.*;

import admin.tab4.service.*;

@Controller
@RequestMapping("/admin/tab4")
public class AdminTab4Controller {
	@Autowired
	AdminTab4Service at4;
	
	// cert Save
	@RequestMapping("/cert/{entData}/{passData}")
	@ResponseBody
	public boolean cert(@PathVariable(name="entData")String[] entData, @PathVariable(name="passData")String[] passData){
		return at4.certSave(entData, passData);
	}
	
	// certList
	@RequestMapping("/certList/{page}")
	@ResponseBody
	public ModelAndView certList(@PathVariable(name="page")int page){
		ModelAndView mav = new ModelAndView("/admin/content/tab4Content.jsp");
		List<HashMap> certList = at4.certList(page);
		mav.addObject("certList", certList);
		mav.addObject("tab4Type", "normal");
		return mav;
	}
	
	// certList page
	@RequestMapping("/certPage")
	@ResponseBody
	public ModelAndView certPage(){
		ModelAndView mav = new ModelAndView("/admin/page/tab4Page.jsp");
		mav.addObject("tab", "4");
		mav = at4.certPageInner(mav, 1);
		mav.addObject("tab4Type", "normal");
		return mav;
	}
	
	// certEndList
	@RequestMapping("/certEndList/{page}")
	@ResponseBody
	public ModelAndView certEndList(@PathVariable(name="page")int page){
		ModelAndView mav = new ModelAndView("/admin/content/tab4Content.jsp");
		List<HashMap> certList = at4.certEndList(page);
		mav.addObject("certList", certList);
		mav.addObject("tab4Type", "end");
		return mav;
	}
	
	// certEndPage
	@RequestMapping("/certEndPage")
	@ResponseBody
	public ModelAndView certEndPage(){
		ModelAndView mav = new ModelAndView("/admin/page/tab4Page.jsp");
		mav.addObject("tab", "4");
		mav = at4.certEndPageInner(mav, 1);
		mav.addObject("tab4Type", "end");
		return mav;
	}
	
	// cert page List
	@RequestMapping("/{type}/page/{page}")
	@ResponseBody
	public ModelAndView certPage(@PathVariable(name="type")String type, @PathVariable(name="page")int page){
		ModelAndView mav = new ModelAndView("/admin/content/tab4Content.jsp");
		List<HashMap> certList = at4.certList(page);
		if(type.equals("end"))
			certList = at4.certEndList(page);
		mav.addObject("certList", certList);
		return mav;
	}
	
	// cert page
	@RequestMapping("/{type}/page2/{page}")
	@ResponseBody
	public ModelAndView certPage2(@PathVariable(name="type")String type, @PathVariable(name="page")int page){
		ModelAndView mav = new ModelAndView("/admin/page/tab4Page.jsp");
		mav = at4.certPageInner(mav, 1);
		if(type.equals("end"))
			mav = at4.certEndPageInner(mav, 1);
		return mav;
	}
}
