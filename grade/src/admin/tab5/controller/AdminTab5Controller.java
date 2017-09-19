package admin.tab5.controller;

import java.util.*;

import org.springframework.beans.factory.annotation.*;
import org.springframework.stereotype.*;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.*;

import admin.tab5.service.*;

@Controller
@RequestMapping("/admin/tab5")
public class AdminTab5Controller {
	@Autowired
	AdminTab5Service at5;

	// cert Save
	@RequestMapping("/cert/{cert}")
	@ResponseBody
	public boolean cert(@PathVariable(name="cert")String[] cert){
		return at5.certSave(cert);
	}
	
	// certList
	@RequestMapping("/certList/{page}")
	@ResponseBody
	public ModelAndView certList(@PathVariable(name="page")int page){
		ModelAndView mav = new ModelAndView("/admin/content/tab5Content.jsp");
		List<HashMap> certList = at5.certList(page);
		mav.addObject("certList", certList);
		mav.addObject("tab5Type", "cert");
		return mav;
	}
	
	// certList page
	@RequestMapping("/certPage")
	@ResponseBody
	public ModelAndView certPage(){
		ModelAndView mav = new ModelAndView("/admin/page/tab5Page.jsp");
		mav.addObject("tab", "5");
		mav = at5.certPageInner(mav, 1);
		mav.addObject("tab5Type", "cert");
		return mav;
	}
	
	// certEndList
	@RequestMapping("/certEndList/{page}")
	@ResponseBody
	public ModelAndView certEndList(@PathVariable(name="page")int page){
		ModelAndView mav = new ModelAndView("/admin/content/tab5Content.jsp");
		List<HashMap> certList = at5.certEndList(page);
		mav.addObject("certList", certList);
		mav.addObject("tab5Type", "certEnd");
		return mav;
	}
	
	// certEndPage
	@RequestMapping("/certEndPage")
	@ResponseBody
	public ModelAndView certEndPage(){
		ModelAndView mav = new ModelAndView("/admin/page/tab5Page.jsp");
		mav.addObject("tab", "5");
		mav = at5.certEndPageInner(mav, 1);
		mav.addObject("tab5Type", "certEnd");
		return mav;
	}
	
	// recordFile
	@RequestMapping("/recordFile/{num}")
	@ResponseBody
	public ModelAndView recordFile(@PathVariable(name="num")String num){
		ModelAndView mav = new ModelAndView("/admin/content/tab5Content2.jsp");
		List<String> recordFile = at5.recordFile(num);
		mav.addObject("recordFile", recordFile);
		mav.addObject("recordSize", recordFile.size());
		return mav;
	}
	
	// tab5 page Lsit
	@RequestMapping("/{type}/page/{page}")
	@ResponseBody
	public ModelAndView page(@PathVariable(name="type")String type, @PathVariable(name="page")int page){
		ModelAndView mav = new ModelAndView("/admin/content/tab5Content.jsp");
		List<HashMap> certList = at5.certList(page);
		if(type.equals("end"))
			certList = at5.certEndList(page);
		return mav;
	}
	
	// tab5 page
	@RequestMapping("/{type}/page2/{page}")
	@ResponseBody
	public ModelAndView page2(@PathVariable(name="type")String type, @PathVariable(name="page")int page){
		ModelAndView mav = new ModelAndView("/admin/page/tab5Page.jsp");
		mav = at5.certPageInner(mav, 1);
		if(type.equals("end"))
			mav = at5.certEndPageInner(mav, 1);
		return mav;
	}
}
