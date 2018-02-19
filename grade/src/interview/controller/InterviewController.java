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
	
	// �����ı� ����
	@RequestMapping("")
	public ModelAndView interview(){
		ModelAndView mav = new ModelAndView("/interview/interview.jsp");
		List<HashMap> interview = is.interviewList(1);
		mav.addObject("interview", interview);
		mav = pageInner(mav, 1);
		mav.addObject("type", "interview");
		return mav;
	}
	
	// ������ ó��
	public ModelAndView pageInner(ModelAndView mav, int select){
		int page = is.interviewPage();
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
	
	// �����ı� ����
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
			if(buyList.get(i).get("item").toString().equals("�����ı�")){
				if(buyList.get(i).get("target").toString().equals(num)){
					mav.addObject("buy", "0");
				}
			}
		}
		List<HashMap> certList = ms.certList(interview.get("user").toString());
		mav.addObject("certList", certList);
		boolean buyCheck = ms.buyCheck(num, session, "�����ı�");
		mav.addObject("buyCheck", buyCheck ? "buy" : "no");
		return mav;
	}
	
	// �����ı� ��� �������̵�
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
			if(buyList.get(i).get("item").toString().equals("�����ı�")){
				if(buyList.get(i).get("target").toString().equals(num)){
					mav.addObject("buy", "0");
				}
			}
		}
		return mav;
	}
	
	// ��� ������ ó��
	public ModelAndView commentPageInner(ModelAndView mav, int select, String num){
		int page = is.commentPage(num);
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
	
	// ���ε� ������
	@RequestMapping("/upload")
	public ModelAndView upload(HttpSession session){
		ModelAndView mav = new ModelAndView("/interview/upload.jsp");
		String user = ((HashMap)session.getAttribute("login")).get("auto").toString();
		List<HashMap> schoolList = is.schoolList(user);
		mav.addObject("schoolList", schoolList);
		return mav;
	}
	
	// ���ε�
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
	
	// ���ε�2
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
	
	// ������ �̵�
	@RequestMapping("/page/{page}")
	public ModelAndView page(@PathVariable(name="page")int page){
		ModelAndView mav = new ModelAndView("/interview/interview.jsp");
		List<HashMap> interview = is.interviewList(page);
		mav.addObject("interview", interview);
		mav = pageInner(mav, page);
		mav.addObject("type", "interview");
		return mav;
	}
	
	// �˻�
	@RequestMapping("/search/both/{word}/{word2}")
	public ModelAndView searchBoth(@PathVariable(name="word")String word, @PathVariable(name="word2")String word2){
		ModelAndView mav = new ModelAndView("/interview/interview.jsp");
		mav.addObject("word1", word);
		mav.addObject("word2", word2);
		word = ss.wordSearchChange(word);
		List<HashMap> wordList = ss.word(word);
		List<HashMap> interview = is.interviewList2Both(1, wordList, word2);
		mav.addObject("interview", interview);
		mav = pageInner2Both(mav, 1, wordList, word2);
		mav.addObject("type", "interview");
		return mav;
	}
	
	// �˻� ������
	public ModelAndView pageInner2Both(ModelAndView mav, int select, List<HashMap> wordList, String subject){
		int page = is.interviewPage2Both(wordList, subject);
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
	
	// �˻�
	@RequestMapping("/search/school/{word}")
	public ModelAndView searchSchool(@PathVariable(name="word")String word){
		ModelAndView mav = new ModelAndView("/interview/interview.jsp");
		mav.addObject("word1", word);
		word = ss.wordSearchChange(word);
		List<HashMap> wordList = ss.word(word);
		List<HashMap> interview = is.interviewList2School(1, wordList);
		mav.addObject("interview", interview);
		mav = pageInner2School(mav, 1, wordList);
		mav.addObject("type", "interview");
		return mav;
	}
	
	// �˻� ������
	public ModelAndView pageInner2School(ModelAndView mav, int select, List<HashMap> wordList){
		int page = is.interviewPage2School(wordList);
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
	
	// �˻�
	@RequestMapping("/search/subject/{word}")
	public ModelAndView searchSubject(@PathVariable(name="word")String word){
		ModelAndView mav = new ModelAndView("/interview/interview.jsp");
		mav.addObject("word2", word);
		List<HashMap> interview = is.interviewList2Subject(1, word);
		mav.addObject("interview", interview);
		mav = pageInner2Subject(mav, 1, word);
		mav.addObject("type", "interview");
		return mav;
	}
	
	// �˻� ������
	public ModelAndView pageInner2Subject(ModelAndView mav, int select, String subject){
		int page = is.interviewPage2Subject(subject);
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
	
	// �˻� ������ �̵�
	@RequestMapping("/search/page/{type}/{word}/{word2}/{page}")
	public ModelAndView search2(@PathVariable(name="type")String type, @PathVariable(name="word")String word, 
													@PathVariable(name="word2")String word2, @PathVariable(name="page")int page){
		ModelAndView mav = new ModelAndView("/interview/interview.jsp");
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
		List<HashMap> interview = new Vector<>();
		switch(type){
		case "both":
			interview = is.interviewList2Both(page, wordList, word2);
			mav = pageInner2Both(mav, page, wordList, word2);
			break;
		case "school":
			interview = is.interviewList2School(page, wordList);
			mav = pageInner2School(mav, page, wordList);
			break;
		case "subject":
			interview = is.interviewList2Subject(page, word2);
			mav = pageInner2Subject(mav, page, word2);
			break;
		}
		mav.addObject("interview", interview);
		mav.addObject("type", "interview");
		return mav;
	}
	
	// ����
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
	
	// ����2
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
	
	// ����
	@RequestMapping("/remove/{num}")
	@ResponseBody
	public boolean remove(@PathVariable(name="num")String num){
		return is.remove(num);
	}
	
	// ���� �ڵ� ����
	@RequestMapping("/univ/{addr}/{school}")
	@ResponseBody
	public ModelAndView univ(@PathVariable(name="addr")String addr, @PathVariable(name="school")String school){
		ModelAndView mav = new ModelAndView("/main/university.jsp");
		mav.addObject("place", addr);
		mav.addObject("school", school);
		return mav;
	}
	
	// �����ı� ��۵��
	@RequestMapping("/comment/{interviewNum}/{user}/{comment}/{point}")
	@ResponseBody
	public boolean comment(@PathVariable(name="interviewNum")String interviewNum, @PathVariable(name="user")String user,
			@PathVariable(name="comment")String comment, @PathVariable(name="point")String point){
		return is.comment(interviewNum, user, comment, point);
	}
	
	// �����ı� �������
	@RequestMapping("/comment/{interviewNum}/{user}/{point}")
	@ResponseBody
	public boolean comment2(@PathVariable(name="interviewNum")String interviewNum, @PathVariable(name="user")String user,
			@PathVariable(name="point")String point){
		return is.comment2(interviewNum, user, point);
	}
	
	// �����ı� ���� �� ��� ��� ����
	@RequestMapping("/interviewRating/{interviewNum}/{user}")
	@ResponseBody
	public int interviewRating(@PathVariable(name="interviewNum")String interviewNum, @PathVariable(name="user")String user){
		return is.interviewRating(interviewNum, user);
	}
	
	
	
	
	
	
	
	
	// �����Ϸ�
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
