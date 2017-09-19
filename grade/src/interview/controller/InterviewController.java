package interview.controller;

import java.util.*;

import javax.servlet.http.*;

import org.springframework.beans.factory.annotation.*;
import org.springframework.stereotype.*;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.*;

import exam.service.*;
import interview.service.*;
import member.service.*;
import search.service.*;

@Controller
@RequestMapping("/interview")
public class InterviewController {
	@Autowired
	InterviewService is;
	@Autowired
	MemberService ms;
	@Autowired
	SearchService ss;
	@Autowired
	ExamService es;
	
	// 면접후기 메인
	@RequestMapping("")
	public ModelAndView interview(){
		ModelAndView mav = new ModelAndView("/interview/interview.jsp");
		List<HashMap> interview = is.interviewList(1);
		mav.addObject("interview", interview);
		mav = pageInner(mav, 1);
		mav.addObject("type", "interview");
		return mav;
	}
	
	// 페이지 처리
	public ModelAndView pageInner(ModelAndView mav, int select){
		int page = is.interviewPage();
		int first = 1;
		int last = page;
		int start = select > first ? select%10 == 0 ? (select/10)*10-10+1 : (select/10)*10+1 : first;
		int end = start+9 < last ? start+9 : last;
		int prev = select%10 == 0 ? (select/10)*10-20+1 : (start/10)*10-10+1;
		int next = (start/10)*10+10+1;
		mav.addObject("select", select);
		mav.addObject("first", first);
		mav.addObject("last", last);
		mav.addObject("start", start);
		mav.addObject("end", end);
		mav.addObject("prev", prev);
		mav.addObject("next", next);
		return mav;
	}
	
	// 면접후기 보기
	@RequestMapping("/view/{num}")
	public ModelAndView view(@PathVariable(name="num")String num, HttpSession session){
		ModelAndView mav = new ModelAndView("/interview/view.jsp");
		HashMap interview = is.interviewOne(num);
		mav.addObject("interview", interview);
		List<HashMap> comment = is.commentList(num, 1);
		mav.addObject("comment", comment);
		mav = commentPageInner(mav, 1, num);
		mav.addObject("itemNum", interview.get("auto").toString());
		mav.addObject("itemUser", interview.get("id").toString());
		mav.addObject("itemSchool", interview.get("school").toString());
		mav.addObject("itemSubject", interview.get("subject").toString());
		List<HashMap> buyList = ms.buyList2(session);
		mav.addObject("buy", "1");
		for(int i=0; i<buyList.size(); i++){
			if(buyList.get(i).get("item").toString().equals("면접후기")){
				if(buyList.get(i).get("target").toString().equals(num)){
					mav.addObject("buy", "0");
				}
			}
		}
		List<HashMap> certList = ms.certList(interview.get("user").toString());
		mav.addObject("certList", certList);
		return mav;
	}
	
	// 면접후기 댓글 페이지이동
	@RequestMapping("/comment/{num}/{page}")
	public ModelAndView commentPage(@PathVariable(name="num")String num, @PathVariable(name="page")int page,
															HttpSession session){
		ModelAndView mav = new ModelAndView("/interview/view.jsp");
		HashMap interview = is.interviewOne(num);
		mav.addObject("interview", interview);
		List<HashMap> comment = is.commentList(num, page);
		mav.addObject("comment", comment);
		mav.addObject("itemNum", interview.get("auto").toString());
		mav = commentPageInner(mav, page, num);
		mav.addObject("buy", "1");
		List<HashMap> buyList = ms.buyList2(session);
		for(int i=0; i<buyList.size(); i++){
			if(buyList.get(i).get("item").toString().equals("면접후기")){
				if(buyList.get(i).get("target").toString().equals(num)){
					mav.addObject("buy", "0");
				}
			}
		}
		return mav;
	}
	
	// 댓글 페이지 처리
	public ModelAndView commentPageInner(ModelAndView mav, int select, String num){
		int page = is.commentPage(num);
		int first = 1;
		int last = page;
		int start = select > first ? select%10 == 0 ? (select/10)*10-10+1 : (select/10)*10+1 : first;
		int end = start+9 < last ? start+9 : last;
		int prev = select%10 == 0 ? (select/10)*10-20+1 : (start/10)*10-10+1;
		int next = (start/10)*10+10+1;
		mav.addObject("select", select);
		mav.addObject("first", first);
		mav.addObject("last", last);
		mav.addObject("start", start);
		mav.addObject("end", end);
		mav.addObject("prev", prev);
		mav.addObject("next", next);
		return mav;
	}
	
	// 업로드 페이지
	@RequestMapping("/upload")
	public ModelAndView upload(HttpSession session){
		ModelAndView mav = new ModelAndView("/interview/upload.jsp");
		String user = ((HashMap)session.getAttribute("login")).get("auto").toString();
		List<HashMap> schoolList = is.schoolList(user);
		mav.addObject("schoolList", schoolList);
		return mav;
	}
	
	// 업로드
	@RequestMapping("/uploadInterview/{addr}/{school}/{subject}/{type}/{year}/{admission}/{typical}/{pass}/{time}/"
			+ "{people}/{kinds}/{how}/{tip}/{content1}/{content2}")
	@ResponseBody
	public boolean uploadInterview(HttpSession session, @PathVariable(name="addr")String addr, @PathVariable(name="school")String school,
			@PathVariable(name="subject")String subject, @PathVariable(name="type")String type, @PathVariable(name="year")String year,
			@PathVariable(name="admission")String admission, @PathVariable(name="typical")String typical, @PathVariable(name="pass")String pass,
			@PathVariable(name="time")String time, @PathVariable(name="people")String people, @PathVariable(name="kinds")String kinds,
			@PathVariable(name="how")String how, @PathVariable(name="tip")String tip, @PathVariable(name="content1")String content1,
			@PathVariable(name="content2")String content2){
		return is.uploadInterview(session, addr, school, subject, type, year, admission, typical, pass, time, people, kinds, how, tip, content1, content2);
	}
	
	// 업로드2
	@RequestMapping("/uploadInterview2")
	public String uploadInterview2(HttpSession session, @RequestParam(name="addr", required=false, defaultValue="s")String addr, @RequestParam(name="year", required=false, defaultValue="s")String year,
											@RequestParam(name="school", required=false, defaultValue="s")String school, @RequestParam(name="type", required=false, defaultValue="s")String type,
											@RequestParam(name="admission", required=false, defaultValue="s")String admission, @RequestParam(name="typical", required=false, defaultValue="s")String typical,
											@RequestParam(name="pass", required=false, defaultValue="s")String pass, @RequestParam(name="time")String time,
											@RequestParam(name="people")String people, @RequestParam(name="kinds")String kinds,
											@RequestParam(name="how")String how, @RequestParam(name="tip")String tip,
											@RequestParam(name="content1")String content1, @RequestParam(name="content2")String content2,
											@RequestParam(name="subject", required=false, defaultValue="s")String subject, @RequestParam(name="univ", required=false, defaultValue="s")String univ){
		String user = ((HashMap)session.getAttribute("login")).get("auto").toString();
		String id = ((HashMap)session.getAttribute("login")).get("id").toString();
		String name = ((HashMap)session.getAttribute("login")).get("name").toString();
		content1 = content1.replace("\r\n", "<br>");
		content2 = content2.replace("\r\n", "<br>");
		if(school.equals("choose")){
			school = univ;
		}
		is.uploadInterview(session, addr, school, subject, type, year, admission, typical, pass, time, people, kinds, how, tip, content1, content2);
		return "redirect:/member/myData/"+user;
	}
	
	// 페이지 이동
	@RequestMapping("/page/{page}")
	public ModelAndView page(@PathVariable(name="page")int page){
		ModelAndView mav = new ModelAndView("/interview/interview.jsp");
		List<HashMap> interview = is.interviewList(page);
		mav.addObject("interview", interview);
		mav = pageInner(mav, page);
		mav.addObject("type", "interview");
		return mav;
	}
	
	// 검색
	@RequestMapping("/search/{type}/{word}")
	public ModelAndView search(@PathVariable(name="type")String type, @PathVariable(name="word")String word){
		ModelAndView mav = new ModelAndView("/interview/interview.jsp");
		mav.addObject("word", word);
		List<HashMap> wordList = new Vector<>();
		if(type.equals("학교")){
			word = ss.wordSearchChange(word);
			wordList = ss.word(word);
		} else {
			HashMap m = new HashMap();
			m.put("num", word);
			wordList.add(m);
		}
		mav.addObject("sType", type);
		List<HashMap> interview = is.interviewList2(1, wordList);
		mav.addObject("interview", interview);
		mav = pageInner2(mav, 1, wordList);
		mav.addObject("type", "interview");
		return mav;
	}
	
	// 검색 페이지
	public ModelAndView pageInner2(ModelAndView mav, int select, List<HashMap> wordList){
		int page = is.interviewPage2(wordList);
		int first = 1;
		int last = page;
		int start = select > first ? select%10 == 0 ? (select/10)*10-10+1 : (select/10)*10+1 : first;
		int end = start+9 < last ? start+9 : last;
		int prev = select%10 == 0 ? (select/10)*10-20+1 : (start/10)*10-10+1;
		int next = (start/10)*10+10+1;
		mav.addObject("select", select);
		mav.addObject("first", first);
		mav.addObject("last", last);
		mav.addObject("start", start);
		mav.addObject("end", end);
		mav.addObject("prev", prev);
		mav.addObject("next", next);
		return mav;
	}
	
	// 검색 페이지 이동
	@RequestMapping("/search/page/{type}/{word}/{page}")
	public ModelAndView search2(@PathVariable(name="type")String type, @PathVariable(name="word")String word, @PathVariable(name="page")int page){
		ModelAndView mav = new ModelAndView("/interview/interview.jsp");
		mav.addObject("word", word);
		List<HashMap> wordList = new Vector<>();
		if(type.equals("학교")){
			word = ss.wordSearchChange(word);
			wordList = ss.word(word);
		} else {
			HashMap m = new HashMap();
			m.put("num", word);
			wordList.add(m);
		}
		mav.addObject("sType", type);
		List<HashMap> interview = is.interviewList2(page, wordList);
		mav.addObject("interview", interview);
		mav = pageInner2(mav, page, wordList);
		mav.addObject("type", "interview");
		return mav;
	}
	
	// 수정
	@RequestMapping("/modify/{auto}")
	public ModelAndView modify(@PathVariable(name="auto")String auto, HttpSession session){
		ModelAndView mav = new ModelAndView("/interview/modify.jsp");
		HashMap interview = is.interviewOne(auto);
		mav.addObject("interview", interview);
		interview.put("content1", interview.get("content1").toString().replace("<br>", "\n"));
		interview.put("content2", interview.get("content2").toString().replace("<br>", "\n"));
		String user = ((HashMap)session.getAttribute("login")).get("auto").toString();
		List<HashMap> schoolList = is.schoolList(user);
		mav.addObject("schoolList", schoolList);
		return mav;
	}
	
	// 수정2
	@RequestMapping("/modifyInterview2")
	public String modifyInterview2(HttpSession session, @RequestParam(name="addr", required=false, defaultValue="s")String addr, @RequestParam(name="year", required=false, defaultValue="s")String year,
			@RequestParam(name="school", required=false, defaultValue="s")String school, @RequestParam(name="type", required=false, defaultValue="s")String type,
			@RequestParam(name="admission", required=false, defaultValue="s")String admission, @RequestParam(name="typical", required=false, defaultValue="s")String typical,
			@RequestParam(name="pass", required=false, defaultValue="s")String pass, @RequestParam(name="time")String time,
			@RequestParam(name="people")String people, @RequestParam(name="kinds")String kinds,
			@RequestParam(name="how")String how, @RequestParam(name="tip")String tip,
			@RequestParam(name="content1")String content1, @RequestParam(name="content2")String content2,
			@RequestParam(name="subject", required=false, defaultValue="s")String subject, @RequestParam(name="univ", required=false, defaultValue="s")String univ,
			@RequestParam(name="auto")String auto){
		String user = ((HashMap)session.getAttribute("login")).get("auto").toString();
		String name = ((HashMap)session.getAttribute("login")).get("name").toString();
		content1 = content1.replace("\r\n", "<br>");
		content2 = content2.replace("\r\n", "<br>");
		if(school.equals("s")){
			school = univ;
		}
		is.modifyInterview(user, name, addr, school, subject, type, year, admission, typical, pass, time, people, kinds, how, tip, content1, content2, auto);
		return "redirect:/member/myData/"+user;
	}
	
	// 삭제
	@RequestMapping("/remove/{num}")
	@ResponseBody
	public boolean remove(@PathVariable(name="num")String num){
		return is.remove(num);
	}
	
	// 대학 자동 선택
	@RequestMapping("/univ/{addr}/{school}")
	@ResponseBody
	public ModelAndView univ(@PathVariable(name="addr")String addr, @PathVariable(name="school")String school){
		ModelAndView mav = new ModelAndView("/main/university.jsp");
		mav.addObject("place", addr);
		mav.addObject("school", school);
		return mav;
	}
	
	
	
	
	
	
	
	
	// 면접후기 댓글등록
	@RequestMapping("/comment/{interviewNum}/{user}/{comment}/{point}")
	@ResponseBody
	public boolean comment(@PathVariable(name="interviewNum")String interviewNum, @PathVariable(name="user")String user,
											@PathVariable(name="comment")String comment, @PathVariable(name="point")String point){
		return is.comment(interviewNum, user, comment, point);
	}
	
	// 수정완료
//	@RequestMapping("/modifyInterview/{user}/{name}/{addr}/{school}/{subject}/{type}/{admission}/{typical}/{pass}/{time}/"
//			+ "{people}/{kinds}/{how}/{tip}/{content1}/{content2}/{auto}")
//	@ResponseBody
//	public boolean modifyInterview(@PathVariable(name="user")String user, @PathVariable(name="addr")String addr,
//													@PathVariable(name="school")String school, @PathVariable(name="type")String type,
//													@PathVariable(name="admission")String admission, @PathVariable(name="typical")String typical,
//													@PathVariable(name="pass")String pass, @PathVariable(name="time")String time,
//													@PathVariable(name="people")String people, @PathVariable(name="kinds")String kinds,
//													@PathVariable(name="how")String how, @PathVariable(name="tip")String tip,
//													@PathVariable(name="content1")String content1, @PathVariable(name="content2")String content2,
//													@PathVariable(name="name")String name, @PathVariable(name="subject")String subject,
//													@PathVariable(name="auto")String auto){
//		return is.modifyInterview(user, name, addr, school, subject, type, admission, typical, pass, time, people, kinds, how, tip, content1, content2, auto);
//	}
}
