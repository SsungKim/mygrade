package exam.controller;

import java.util.*;

import javax.servlet.http.*;

import org.springframework.beans.factory.annotation.*;
import org.springframework.stereotype.*;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.*;

import exam.service.*;
import member.service.*;
import record.service.*;
import search.service.*;

@Controller
@RequestMapping("/exam")
public class ExamController {
	@Autowired
	ExamService es;
	@Autowired
	RecordService rs;
	@Autowired
	SearchService ss;
	@Autowired
	MemberService ms;
	
	// upload
	@RequestMapping("/upload")
	public ModelAndView upload(HttpSession session){
		ModelAndView mav = new ModelAndView("/exam/upload.jsp");
		String auto = ((HashMap)session.getAttribute("login")).get("auto").toString();
		List<HashMap> schoolList = es.schoolList(auto);
		mav.addObject("schoolList", schoolList);
		return mav;
	}
	
	// 수능점수 등록 - 관리자
	@RequestMapping("/uploadExam1/{addr}/{school}/{subject}/{type}/{year}/{admission}/{typical}/{pass}/{examType}/{mathType}/"
			+ "{exType}/{innerType1}/{innerType2}/{langType}/{point}/{passCount}")
	@ResponseBody
	public boolean uploadExam(HttpSession session, @PathVariable(name="addr")String addr, @PathVariable(name="school")String school,
			@PathVariable(name="subject")String subject, @PathVariable(name="type")String type, @PathVariable(name="year")String year,
			@PathVariable(name="admission")String admission, @PathVariable(name="typical")String typical,
			@PathVariable(name="pass")String pass, @PathVariable(name="examType")String examType,
			@PathVariable(name="mathType")String mathType, @PathVariable(name="exType")String exType, 
			@PathVariable(name="innerType1")String innerType1, @PathVariable(name="innerType2")String innerType2,
			@PathVariable(name="langType")String langType, @PathVariable(name="point")String[] point,
			@PathVariable(name="passCount")String passCount){
		return es.uploadExam1(session, addr, school, subject, type, year, admission, typical, pass, examType, mathType, exType, innerType1, innerType2, langType, point, passCount);
	}

	// 수능점수 등록 - 일반
	@RequestMapping("/uploadExam2/{examType}/{mathType}/{exType}/{innerType1}/{innerType2}/{langType}/{point}/"
			+ "{univ1}/{passCount1}/{univ2}/{passCount2}/{univ3}/{passCount3}")
	@ResponseBody
	public boolean uploadExam2(HttpSession session, @PathVariable(name="examType")String examType,
			@PathVariable(name="mathType")String mathType, @PathVariable(name="exType")String exType, 
			@PathVariable(name="innerType1")String innerType1, @PathVariable(name="innerType2")String innerType2,
			@PathVariable(name="langType")String langType, @PathVariable(name="point")String[] point,
			@PathVariable(name="univ1")String univ1, @PathVariable(name="passCount1")String passCount1,
			@PathVariable(name="univ2")String univ2, @PathVariable(name="passCount2")String passCount2,
			@PathVariable(name="univ3")String univ3, @PathVariable(name="passCount3")String passCount3){
		return es.uploadExam2(session, examType, mathType, exType, innerType1, innerType2, langType, point, univ1, passCount1, univ2, passCount2, univ3, passCount3);
	}
	
	// 정시성적
	@RequestMapping("")
	public ModelAndView exam(){
		ModelAndView mav = new ModelAndView("/exam/exam.jsp");
		List<HashMap> examList = es.examList(1);
		mav.addObject("examList", examList);
		mav = pageInner(mav, 1);
		return mav;
	}
	
	// 페이지 처리
	public ModelAndView pageInner(ModelAndView mav, int select){
		int page = es.examPage();
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
	
	// 보기
	@RequestMapping("/view/{num}")
	public ModelAndView view(@PathVariable(name="num")String num, HttpSession session){
		ModelAndView mav = new ModelAndView("/exam/view.jsp");
		HashMap exam = es.examOne(num);
		mav.addObject("exam", exam);
		mav.addObject("itemNum", exam.get("auto").toString());
		mav.addObject("itemUser", exam.get("user").toString());
		mav.addObject("itemSchool", exam.get("school").toString());
		mav.addObject("itemSubject", exam.get("subject").toString());
		List<HashMap> certList = ms.certList(exam.get("user").toString());
		mav.addObject("certList", certList);
		boolean buyCheck = ms.buyCheck(num, session, "정시성적");
		mav.addObject("buyCheck", buyCheck ? "buy" : "no");
		return mav;
	}
	
	// 페이지 이동
	@RequestMapping("/page/{page}")
	public ModelAndView page(@PathVariable(name="page")int page){
		ModelAndView mav = new ModelAndView("/exam/exam.jsp");
		List<HashMap> examList = es.examList(page);
		mav.addObject("examList", examList);
		mav = pageInner(mav, page);
		return mav;
	}
	
	// 검색
	@RequestMapping("/search/both/{word}/{word2}")
	public ModelAndView searchBoth(@PathVariable(name="word")String word, @PathVariable(name="word2")String word2){
		ModelAndView mav = new ModelAndView("/exam/exam.jsp");
		mav.addObject("word1", word);
		mav.addObject("word2", word2);
		word = ss.wordSearchChange(word);
		List<HashMap> wordList = ss.word(word);
		List<HashMap> exam = es.examList2Both(1, wordList, word2);
		mav.addObject("examList", exam);
		mav = pageInner2Both(mav, 1, wordList, word2);
		mav.addObject("type", "exam");
		return mav;
	}
	
	// 검색 페이지
	public ModelAndView pageInner2Both(ModelAndView mav, int select, List<HashMap> wordList, String subject){
		int page = es.examPage2Both(wordList, subject);
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
		ModelAndView mav = new ModelAndView("/exam/exam.jsp");
		mav.addObject("word1", word);
		word = ss.wordSearchChange(word);
		List<HashMap> wordList = ss.word(word);
		List<HashMap> exam = es.examList2School(1, wordList);
		mav.addObject("examList", exam);
		mav = pageInner2School(mav, 1, wordList);
		mav.addObject("type", "exam");
		return mav;
	}
	
	// 검색 페이지
	public ModelAndView pageInner2School(ModelAndView mav, int select, List<HashMap> wordList){
		int page = es.examPage2School(wordList);
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
		ModelAndView mav = new ModelAndView("/exam/exam.jsp");
		mav.addObject("word2", word);
		List<HashMap> exam = es.examList2Subject(1, word);
		mav.addObject("examList", exam);
		mav = pageInner2Subject(mav, 1, word);
		mav.addObject("type", "exam");
		return mav;
	}
	
	// 검색 페이지
	public ModelAndView pageInner2Subject(ModelAndView mav, int select, String subject){
		int page = es.examPage2Subject(subject);
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
		ModelAndView mav = new ModelAndView("/exam/exam.jsp");
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
		List<HashMap> exam = new Vector<>();
		switch(type){
		case "both":
			exam = es.examList2Both(page, wordList, word2);
			mav = pageInner2Both(mav, page, wordList, word2);
			break;
		case "school":
			exam = es.examList2School(page, wordList);
			mav = pageInner2School(mav, page, wordList);
			break;
		case "subject":
			exam = es.examList2Subject(page, word2);
			mav = pageInner2Subject(mav, page, word2);
			break;
		}
		mav.addObject("examList", exam);
		mav.addObject("type", "exam");
		return mav;
	}
	
	

	
	
	
	
	// schoolList
	@RequestMapping("/schoolList/{auto}")
	@ResponseBody
	public List<HashMap> schoolList(@PathVariable(name="auto")String auto){
		return es.schoolList(auto);
	}
}
