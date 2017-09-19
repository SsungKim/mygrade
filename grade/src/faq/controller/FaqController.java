package faq.controller;

import java.util.*;

import org.springframework.beans.factory.annotation.*;
import org.springframework.stereotype.*;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.*;

import faq.service.*;

@Controller
@RequestMapping("/faq")
public class FaqController {
	@Autowired
	FaqService fs;

	// faq index
	@RequestMapping("")
	public ModelAndView faq(){
		ModelAndView mav = new ModelAndView("/board/faq/faq.jsp");
		List<HashMap> list = fs.faq(1);
		mav.addObject("list", list);
		mav = pageInner(mav, 1);
		return mav;
	}
	
	// page inner
	public ModelAndView pageInner(ModelAndView mav, int select){
		mav.addObject("select", select);
		int first = 1;
		int last = fs.faqPage();
		int start = select > 1 ? select : 1;
		int end = start+4 > last ? last : start+4;
		mav.addObject("first", first);
		mav.addObject("last", last);
		mav.addObject("start", start);
		mav.addObject("end", end);
		return mav;
	}
	
	// write
	@RequestMapping("/write")
	public ModelAndView write(){
		ModelAndView mav = new ModelAndView("/board/faq/write.jsp");
		return mav;
	}
	
	@RequestMapping("/write/{title}/{content}/{name}")
	@ResponseBody
	public boolean write2(@PathVariable(name="title")String title, @PathVariable(name="content")String content, 
										@PathVariable(name="name")String name){
		return fs.write(title, content, name);
	}
	
	// view
	@RequestMapping("/view/{num}")
	public ModelAndView view(@PathVariable(name="num")String num){
		ModelAndView mav = new ModelAndView("/board/faq/view.jsp");
		HashMap map = fs.view(num);
		mav.addObject("view", map);
		return mav;
	}
	
	// modify
	@RequestMapping("/modify/{num}")
	public ModelAndView modify(@PathVariable(name="num")String num){
		ModelAndView mav = new ModelAndView("/board/faq/modify.jsp");
		HashMap map = fs.modify(num);
		mav.addObject("view", map);
		mav.addObject("num", num);
		return mav;
	}
	
	@RequestMapping("/modify/{title}/{content}/{num}")
	@ResponseBody
	public boolean modify2(@PathVariable(name="title")String title, @PathVariable(name="content")String content, 
										@PathVariable(name="num")String num){
		return fs.modify2(title, content, num);
	}
	
	// page move
	@RequestMapping("/page/{num}")
	public ModelAndView page(@PathVariable(name="num")int num){
		ModelAndView mav = new ModelAndView("/board/faq/faq.jsp");
		List<HashMap> list = fs.faq(num);
		mav.addObject("list", list);
		mav = pageInner(mav, num);
		return mav;
	}
	
	// remove
	@RequestMapping("/remove/{num}")
	@ResponseBody
	public boolean remove(@PathVariable(name="num")int num){
		return fs.remove(num);
	}
}
