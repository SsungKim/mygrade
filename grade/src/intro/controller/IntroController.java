package intro.controller;

import java.util.*;

import javax.servlet.http.*;

import org.springframework.beans.factory.annotation.*;
import org.springframework.stereotype.*;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.*;

import exam.service.*;
import intro.service.*;
import member.service.*;
import record.service.*;
import search.service.*;

@Controller
@RequestMapping("/intro")
public class IntroController {
	@Autowired
	IntroService is;
	@Autowired
	RecordService rs;
	@Autowired
	MemberService ms;
	@Autowired
	SearchService ss;
	@Autowired
	ExamService es;
	
	// 자소서 등록
	@RequestMapping("/uploadIntro")
	public ModelAndView uploadIntro(HttpSession session, @RequestParam(name="univ", required=false, defaultValue="s")String univ,
												@RequestParam(name="content1")String content1, @RequestParam(name="content2")String content2,
												@RequestParam(name="content3")String content3, @RequestParam(name="content4")String content4,
												@RequestParam(name="title")String title, @RequestParam(name="addr", required=false, defaultValue="s")String addr,
												@RequestParam(name="school", required=false, defaultValue="s")String school,
												@RequestParam(name="subject", required=false, defaultValue="s")String subject,
												@RequestParam(name="type", required=false, defaultValue="s")String type,
												@RequestParam(name="year", required=false, defaultValue="s")String year,
												@RequestParam(name="admission", required=false, defaultValue="s")String admission,
												@RequestParam(name="typical", required=false, defaultValue="s")String typical,
												@RequestParam(name="pass", required=false, defaultValue="s")String pass){
		String user = ((HashMap)session.getAttribute("login")).get("auto").toString();
		String id = ((HashMap)session.getAttribute("login")).get("id").toString();
		String name = ((HashMap)session.getAttribute("login")).get("name").toString();
		content1 = content1.replace("\n", "<br>");
		content2 = content2.replace("\n", "<br>");
		content3 = content3.replace("\n", "<br>");
		content4 = content4.replace("\n", "<br>");
		if(id.equals("admin")){
			is.uploadIntroAdmin(user, id, name, content1, content2, content3, content4, title, addr, school, subject, type, year, admission, typical, pass);
		} else {
			is.uploadIntro(user, id, name, univ, content1, content2, content3, content4, title);
		}
		ModelAndView mav = new ModelAndView("/member/myData.jsp");
		List<HashMap> interviewList = ms.interviewList(user);
		mav.addObject("interviewList", interviewList);
		List<HashMap> recordList = ms.recordList(user);
		mav.addObject("recordList", recordList);
		List<HashMap> introList = ms.introList(user);
		mav.addObject("introList", introList);
		List<HashMap> examList = ms.examList(user);
		mav.addObject("examList", examList);
		return mav;
	}
	
	// 자소서 쓰기
	@RequestMapping("/upload")
	public ModelAndView write(HttpSession session){
		ModelAndView mav = new ModelAndView("/intro/write.jsp");
		String user = ((HashMap)session.getAttribute("login")).get("auto").toString();
		List<HashMap> schoolList = is.schoolList(user);
		mav.addObject("schoolList", schoolList);
		return mav;
	}
	
	// 자소서
	@RequestMapping("")
	public ModelAndView record(){
		ModelAndView mav = new ModelAndView("/intro/intro.jsp");
		List<HashMap> introList = is.intro(1);
		mav.addObject("introList", introList);
		mav = pageInner(mav, 1);
		mav.addObject("type", "intro");
		return mav;
	}
	
	// 페이지 처리
	public ModelAndView pageInner(ModelAndView mav, int select){
		int page = is.page();
		int first = 1;
		int last = page;
		int start = select > first ? (select/10)*10+1 : first;
		int end = start+9 < last ? start+9 : last;
		int prev = (start/10)*10-10+1;
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
	
	// 자소서 보기
	@RequestMapping("/view/{num}")
	public ModelAndView view(@PathVariable(name="num")String num){
		ModelAndView mav = new ModelAndView("/intro/view.jsp");
		HashMap intro = is.introOne(num);
		mav.addObject("intro", intro);
		mav.addObject("itemNum", intro.get("auto").toString());
		mav.addObject("itemUser", intro.get("user").toString());
		return mav;
	}
	
	// 검색
	@RequestMapping("/search/both/{word}/{word2}")
	public ModelAndView searchBoth(@PathVariable(name="word")String word, @PathVariable(name="word2")String word2){
		ModelAndView mav = new ModelAndView("/intro/intro.jsp");
		mav.addObject("word1", word);
		mav.addObject("word2", word2);
		word = ss.wordSearchChange(word);
		List<HashMap> wordList = ss.word(word);
		List<HashMap> intro = is.introList2Both(1, wordList, word2);
		mav.addObject("introList", intro);
		mav = pageInner2Both(mav, 1, wordList, word2);
		mav.addObject("type", "intro");
		return mav;
	}
	
	// 검색 페이지
	public ModelAndView pageInner2Both(ModelAndView mav, int select, List<HashMap> wordList, String subject){
		int page = is.introPage2Both(wordList, subject);
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
	
	// 검색
	@RequestMapping("/search/school/{word}")
	public ModelAndView searchSchool(@PathVariable(name="word")String word){
		ModelAndView mav = new ModelAndView("/intro/intro.jsp");
		mav.addObject("word1", word);
		word = ss.wordSearchChange(word);
		List<HashMap> wordList = ss.word(word);
		List<HashMap> intro = is.introList2School(1, wordList);
		mav.addObject("introList", intro);
		mav = pageInner2School(mav, 1, wordList);
		mav.addObject("type", "intro");
		return mav;
	}
	
	// 검색 페이지
	public ModelAndView pageInner2School(ModelAndView mav, int select, List<HashMap> wordList){
		int page = is.introPage2School(wordList);
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
	
	// 검색
	@RequestMapping("/search/subject/{word}")
	public ModelAndView searchSubject(@PathVariable(name="word")String word){
		ModelAndView mav = new ModelAndView("/intro/intro.jsp");
		mav.addObject("word2", word);
		List<HashMap> intro = is.introList2Subject(1, word);
		mav.addObject("introList", intro);
		mav = pageInner2Subject(mav, 1, word);
		mav.addObject("type", "intro");
		return mav;
	}
	
	// 검색 페이지
	public ModelAndView pageInner2Subject(ModelAndView mav, int select, String subject){
		int page = is.introPage2Subject(subject);
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
	
	// 검색 페이지 이동
	@RequestMapping("/search/page/{type}/{word}/{word2}/{page}")
	public ModelAndView search2(@PathVariable(name="type")String type, @PathVariable(name="word")String word, 
													@PathVariable(name="word2")String word2, @PathVariable(name="page")int page){
		ModelAndView mav = new ModelAndView("/intro/intro.jsp");
		mav.addObject("word1", word);
		mav.addObject("word2", word2);
		if(word2.equals("-")){
			mav.addObject("word2", "");
		}
		if(word.equals("-")){
			mav.addObject("word1", "");
		}
		word = ss.wordSearchChange(word);
		List<HashMap> wordList = ss.word(word);
		List<HashMap> intro = new Vector<>();
		switch(type){
		case "both":
			intro = is.introList2Both(page, wordList, word2);
			mav = pageInner2Both(mav, page, wordList, word2);
			break;
		case "school":
			intro = is.introList2School(page, wordList);
			mav = pageInner2School(mav, page, wordList);
			break;
		case "subject":
			intro = is.introList2Subject(page, word2);
			mav = pageInner2Subject(mav, page, word2);
			break;
		}
		mav.addObject("introList", intro);
		mav.addObject("type", "intro");
		return mav;
	}
	
	// 수정
	@RequestMapping("/modify/{auto}")
	public ModelAndView modify(@PathVariable(name="auto")String auto, HttpSession session){
		ModelAndView mav = new ModelAndView("/intro/modify.jsp");
		String user = ((HashMap)session.getAttribute("login")).get("auto").toString();
		HashMap intro = is.introOne(auto);
		mav.addObject("intro", intro);
		return mav;
	}
	
	// 자소서 수정
	@RequestMapping("/modifyIntro")
	public ModelAndView modifyIntro(HttpSession session, @RequestParam(name="univ", required=false, defaultValue="s")String univ,
												@RequestParam(name="content1")String content1, @RequestParam(name="content2")String content2,
												@RequestParam(name="content3")String content3, @RequestParam(name="content4")String content4,
												@RequestParam(name="title")String title, @RequestParam(name="addr", required=false, defaultValue="s")String addr,
												@RequestParam(name="school", required=false, defaultValue="s")String school,
												@RequestParam(name="subject", required=false, defaultValue="s")String subject,
												@RequestParam(name="type", required=false, defaultValue="s")String type,
												@RequestParam(name="year", required=false, defaultValue="s")String year,
												@RequestParam(name="admission", required=false, defaultValue="s")String admission,
												@RequestParam(name="typical", required=false, defaultValue="s")String typical,
												@RequestParam(name="pass", required=false, defaultValue="s")String pass,
												@RequestParam(name="auto")String auto){
		String user = ((HashMap)session.getAttribute("login")).get("auto").toString();
		String id = ((HashMap)session.getAttribute("login")).get("id").toString();
		String name = ((HashMap)session.getAttribute("login")).get("name").toString();
		content1 = content1.replace("\n", "<br>");
		content2 = content2.replace("\n", "<br>");
		content3 = content3.replace("\n", "<br>");
		content4 = content4.replace("\n", "<br>");
		if(id.equals("admin")){
			is.modifyIntroAdmin(auto, user, id, name, content1, content2, content3, content4, title, addr, school, subject, type, year, admission, typical, pass);
		} else {
			is.modifyIntro(auto, user, id, name, univ, content1, content2, content3, content4, title);
		}
		ModelAndView mav = new ModelAndView("/member/myData.jsp");
		List<HashMap> interviewList = ms.interviewList(user);
		mav.addObject("interviewList", interviewList);
		List<HashMap> recordList = ms.recordList(user);
		mav.addObject("recordList", recordList);
		List<HashMap> introList = ms.introList(user);
		mav.addObject("introList", introList);
		List<HashMap> examList = ms.examList(user);
		mav.addObject("examList", examList);
		return mav;
	}

	
	
	
	
	
	
	
	
	// 기본, 핵심정보 등록
	@RequestMapping("/uploadInfo/{user}/{yaer}/{grade}/{hschool}/{book}/{time}/{awards}")
	@ResponseBody
	public boolean uploadInfo(@PathVariable(name="user")String user, @PathVariable(name="yaer")String year,
												@PathVariable(name="grade")String grade, @PathVariable(name="hschool")String hschool,
												@PathVariable(name="book")String book, @PathVariable(name="time")String time,
												@PathVariable(name="awards")String awards){
		return rs.uploadInfo(user, year, grade, hschool, book, time, awards);
	}
}
