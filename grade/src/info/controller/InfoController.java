package info.controller;

import java.util.*;

import org.springframework.beans.factory.annotation.*;
import org.springframework.stereotype.*;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.*;
import org.springframework.web.servlet.*;

import info.service.*;

@Controller
@RequestMapping("/info")
public class InfoController {
	@Autowired
	InfoService is;

	// faq index
	@RequestMapping("")
	public ModelAndView info(){
		ModelAndView mav = new ModelAndView("/board/info/info.jsp");
		List<HashMap> list = is.faq(1);
		mav.addObject("list", list);
		mav = pageInner(mav, 1);
		return mav;
	}
	
	// page inner
	public ModelAndView pageInner(ModelAndView mav, int select){
		mav.addObject("select", select);
		int page = is.faqPage();
		int first = 1;
		int last = page;
		int start = select > first ? select%10 == 0 ? (select/10)*10-10+1 : (select/10)*10+1 : first;
		int startM = select > first ? select%5 == 0? (select/5)*5-5+1 : (select/5)*5+1 : first;
		int end = start+9 < last ? start+9 : last;
		int endM = startM+4 < last ? startM+4 : last;
		int prev = select%10 == 0 ? (select/10)*10-20+1 : (start/10)*10-10+1;
		int prevM = select%5 == 0 ? (select/5)*5-10+1 : (startM/5)*5-5+1;
		int next = (start/10)*10+10+1;
		int nextM = (startM/5)*5+5+1;
		mav.addObject("select", select);
		mav.addObject("first", first);
		mav.addObject("last", last);
		mav.addObject("start", start);
		mav.addObject("startM", startM);
		mav.addObject("end", end);
		mav.addObject("endM", endM);
		mav.addObject("prev", prev);
		mav.addObject("prevM", prevM);
		mav.addObject("next", next);
		mav.addObject("nextM", nextM);
		return mav;
	}
	
	// write
	@RequestMapping("/write")
	public ModelAndView write(){
		ModelAndView mav = new ModelAndView("/board/info/write.jsp");
		return mav;
	}
	
	@RequestMapping("/write/{title}/{content}/{name}")
	@ResponseBody
	public boolean write2(@PathVariable(name="title")String title, @PathVariable(name="content")String content, 
										@PathVariable(name="name")String name){
		return is.write(title, content, name);
	}
	
	@RequestMapping("/write2")
	@ResponseBody
	public boolean write3(@RequestParam(name="title")String title, @RequestParam(name="content")String content,
			@RequestParam(name="name")String name, @RequestParam(name="infoFile", required=false)MultipartFile file){
		String uuid = "";
		String fileName = "";
		if(file != null){
			uuid = is.infoData(file);
			fileName = file.getOriginalFilename();
		}
		return is.write2(title, content, name, file, uuid, fileName);
	}
	
	// view
	@RequestMapping("/view/{num}")
	public ModelAndView view(@PathVariable(name="num")String num){
		ModelAndView mav = new ModelAndView("/board/info/view.jsp");
		HashMap map = is.view(num);
		mav.addObject("view", map);
		return mav;
	}
	
	// modify
	@RequestMapping("/modify/{num}")
	public ModelAndView modify(@PathVariable(name="num")String num){
		ModelAndView mav = new ModelAndView("/board/info/modify.jsp");
		HashMap map = is.modify(num);
		mav.addObject("view", map);
		mav.addObject("num", num);
		return mav;
	}
	
	@RequestMapping("/modify/{title}/{content}/{num}")
	@ResponseBody
	public boolean modify2(@PathVariable(name="title")String title, @PathVariable(name="content")String content, 
										@PathVariable(name="num")String num){
		return is.modify2(title, content, num);
	}
	
	// page move
	@RequestMapping("/page/{num}")
	public ModelAndView page(@PathVariable(name="num")int num){
		ModelAndView mav = new ModelAndView("/board/info/info.jsp");
		List<HashMap> list = is.faq(num);
		mav.addObject("list", list);
		mav = pageInner(mav, num);
		return mav;
	}
	
	// remove
	@RequestMapping("/remove/{num}")
	@ResponseBody
	public boolean remove(@PathVariable(name="num")int num){
		return is.remove(num);
	}
	
	// ÷������ �ޱ�
	@RequestMapping("/fileDown")
	public ModelAndView fileDown(@RequestParam(name="uuid")String uuid){
		ModelAndView mav = new ModelAndView("infoFileDown");
		mav.addObject("uuid", uuid);
		return mav;
	}
}
