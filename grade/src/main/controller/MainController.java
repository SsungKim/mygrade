package main.controller;

import java.util.*;

import javax.servlet.http.*;

import org.springframework.beans.factory.annotation.*;
import org.springframework.stereotype.*;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.*;

import main.service.*;
import search.service.*;

@Controller
@RequestMapping("/")
public class MainController {
	@Autowired
	MainService ms;
	@Autowired
	SearchService ss;
	
	// 인덱스
	@RequestMapping("")
	public ModelAndView index(HttpServletRequest req, HttpSession session){
		ModelAndView mav = new ModelAndView("/main/index.jsp");
		Cookie[] car = req.getCookies();
		int n = 0;
		String id = "";
		String pw = "";
		if(car != null){
			for(Cookie c : car){
				if(c.getName().equals("autoId")){
					n++;
					id = c.getValue();
				}
				if(c.getName().equals("autoPw")){
					n++;
					pw = c.getValue();
				}
			}
			if(n==2){
				ms.autoLogin(id, pw, session);
			}
		}
		// 아이피 저장 및 방문자수 리턴
		String ipSize = ms.visitIp(req);
		String todayVisit = ipSize.substring(0, ipSize.indexOf('/'));
		String totalVisit = ipSize.substring(ipSize.indexOf('/')+1);
		session.setAttribute("todayVisit", todayVisit);
		session.setAttribute("totalVisit", totalVisit);
		return mav;
	}
	
	// 로그인
	@RequestMapping("/login/{id}/{pw}/{auto}/{save}")
	@ResponseBody
	public int login(@PathVariable(name="id")String id, @PathVariable(name="pw")String pw, @PathVariable(name="auto")boolean auto,
								@PathVariable(name="save")boolean save, HttpSession session, HttpServletRequest req, HttpServletResponse resp){
		return ms.login(id, pw, auto, save, session, req, resp);
	}
	
	// 로그아웃
	@RequestMapping("/logout")
	public String logout(HttpSession session, HttpServletRequest req, HttpServletResponse resp){
		session.removeAttribute("login");
		Cookie[] car = req.getCookies();
		if(car != null){
			for(Cookie c : car){
				if(c.getName().equals("autoId")){
					Cookie cc = new Cookie("autoId", "a");
					cc.setPath("/");
					cc.setMaxAge(0);
					resp.addCookie(cc);
				}
				if(c.getName().equals("autoPw")){
					Cookie cc = new Cookie("autoPw", "a");
					cc.setPath("/");
					cc.setMaxAge(0);
					resp.addCookie(cc);
				}
			}
		}
		return "redirect:/";
	}
	
	// 대학선택
	@RequestMapping("/university/{place}")
	@ResponseBody
	public ModelAndView university(@PathVariable(name="place")String place){
		ModelAndView mav = new ModelAndView("/main/university.jsp");
		mav.addObject("place", place);
		return mav;
	}
	
	// youtube test
	@RequestMapping("/youtube")
	public ModelAndView youtube(){
		ModelAndView mav = new ModelAndView("/main/youtube.jsp");
		return mav;
	}
	
	// 업로드 대학 단어 변경
	@RequestMapping("/wordChange/{word}")
	@ResponseBody
	public List<String> wordChange(@PathVariable(name="word")String word){
		List<String> list = new Vector<>();
		word = ss.wordSearchChange(word);
		list.add(word);
		return list;
	}
	
	// 업로드 대학검색
	@RequestMapping("/searchUniv/{word}")
	@ResponseBody
	public ModelAndView searchUniv(@PathVariable(name="word")String word){
		ModelAndView mav = new ModelAndView("/main/univList.jsp");
		List<HashMap> list = ms.searchUniv(word);
		mav.addObject("list", list);
		return mav;
	}
	
	// 대학 검색 후 대학 선택
	@RequestMapping("/selectUniv/{word}")
	@ResponseBody
	public HashMap<String, String> selectUniv(@PathVariable(name="word")String word){
		return ms.selectUniv(word);
	}
	
	// db test id setting
//	@RequestMapping("/dbTestSet")
//	public String dbTestSet(){
//		ms.dbTestSet();
//		return "redirect:/";
//	}
	
	// db interviewList name change
//	@RequestMapping("/interviewNameSet")
//	public String interviewNameSet(){
//		ms.interviewNameSet();
//		return "redirect:/";
//	}
	
	// db interview comment id change
	@RequestMapping("/interviewCommentIdSet")
	public String interviewCommentIdSet(){
		ms.interviewCommentIdSet();
		return "redirect:/";
	}
	
	// db interview comment day change
//	@RequestMapping("/interviewCommentDaySet")
//	public String interviewCommentDaySet(){
//		ms.interviewCommentDaySet();
//		return "redirect:/";
//	}
}
