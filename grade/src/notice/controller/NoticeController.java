package notice.controller;

import java.util.*;

import org.springframework.beans.factory.annotation.*;
import org.springframework.stereotype.*;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.*;

import notice.service.*;

@Controller
@RequestMapping("/notice")
public class NoticeController {
	@Autowired
	NoticeService ns;

	// notice index
	@RequestMapping("")
	public ModelAndView notice(){
		ModelAndView mav = new ModelAndView("/board/notice/notice.jsp");
		List<HashMap> list = ns.notice(1);
		mav.addObject("list", list);
		mav = pageInner(mav, 1);
		return mav;
	}
	
	// page inner
	public ModelAndView pageInner(ModelAndView mav, int select){
		mav.addObject("select", select);
		int page = ns.noticePage();
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
		ModelAndView mav = new ModelAndView("/board/notice/write.jsp");
		return mav;
	}
	
	@RequestMapping("/write/{title}/{content}/{name}")
	@ResponseBody
	public boolean write2(@PathVariable(name="title")String title, @PathVariable(name="content")String content, 
										@PathVariable(name="name")String name){
		return ns.write(title, content, name);
	}
	
	// view
	@RequestMapping("/view/{num}")
	public ModelAndView view(@PathVariable(name="num")String num){
		ModelAndView mav = new ModelAndView("/board/notice/view.jsp");
		HashMap map = ns.view(num);
		mav.addObject("view", map);
		return mav;
	}
	
	// modify
	@RequestMapping("/modify/{num}")
	public ModelAndView modify(@PathVariable(name="num")String num){
		ModelAndView mav = new ModelAndView("/board/notice/modify.jsp");
		HashMap map = ns.modify(num);
		mav.addObject("view", map);
		mav.addObject("num", num);
		return mav;
	}
	
	@RequestMapping("/modify/{title}/{content}/{num}")
	@ResponseBody
	public boolean modify2(@PathVariable(name="title")String title, @PathVariable(name="content")String content, 
										@PathVariable(name="num")String num){
		return ns.modify2(title, content, num);
	}
	
	// page move
	@RequestMapping("/page/{num}")
	public ModelAndView page(@PathVariable(name="num")int num){
		ModelAndView mav = new ModelAndView("/board/notice/notice.jsp");
		List<HashMap> list = ns.notice(num);
		mav.addObject("list", list);
		mav = pageInner(mav, num);
		return mav;
	}
	
	// remove
	@RequestMapping("/remove/{num}")
	@ResponseBody
	public boolean remove(@PathVariable(name="num")int num){
		return ns.remove(num);
	}
}
