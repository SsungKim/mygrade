package free.controller;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import free.service.FreeService;

@Controller
@RequestMapping("/free")
public class FreeController {
	@Autowired
	FreeService fs;

	// faq index
	@RequestMapping("")
	public ModelAndView free(){
		ModelAndView mav = new ModelAndView("/board/free/free.jsp");
		List<HashMap> list = fs.faq(1);
		mav.addObject("list", list);
		mav = pageInner(mav, 1);
		return mav;
	}
	
	// page inner
	public ModelAndView pageInner(ModelAndView mav, int select){
		mav.addObject("select", select);
		int page = fs.faqPage();
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
		ModelAndView mav = new ModelAndView("/board/free/write.jsp");
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
		ModelAndView mav = new ModelAndView("/board/free/view.jsp");
		HashMap map = fs.view(num);
		mav.addObject("view", map);
		return mav;
	}
	
	// modify
	@RequestMapping("/modify/{num}")
	public ModelAndView modify(@PathVariable(name="num")String num){
		ModelAndView mav = new ModelAndView("/board/free/modify.jsp");
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
		ModelAndView mav = new ModelAndView("/board/free/free.jsp");
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
