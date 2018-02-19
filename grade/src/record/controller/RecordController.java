package record.controller;

import java.util.*;

import javax.servlet.http.*;

import org.springframework.beans.factory.annotation.*;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.*;
import org.springframework.web.servlet.*;

import exam.service.*;
import member.service.*;
import record.service.*;
import search.service.*;

@RestController
@RequestMapping("/record")
public class RecordController {
	@Autowired
	RecordService rs;
	@Autowired
	MemberService ms;
	@Autowired
	SearchService ss;
	@Autowired
	ExamService es;

	// �л���
	@RequestMapping("")
	public ModelAndView record(){
		ModelAndView mav = new ModelAndView("/record/record.jsp");
		List<HashMap> recordList = rs.recordList(1);
		mav.addObject("recordList", recordList);
		mav = pageInner(mav, 1);
		mav.addObject("type", "record");
		return mav;
	}
	
	// ������ ó��
	public ModelAndView pageInner(ModelAndView mav, int select){
		int page = rs.recordPage();
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
		ModelAndView mav = new ModelAndView("/record/upload.jsp");
		String auto = ((HashMap)session.getAttribute("login")).get("auto").toString();
		List<HashMap> schoolList = es.schoolList(auto);
		mav.addObject("schoolList", schoolList);
		return mav;
	}
	
	// �л��� ���ϵ��
	@RequestMapping("/uploadFile")
	@ResponseBody
	public boolean uploadFile(MultipartHttpServletRequest req, HttpSession session){
		Iterator<String> it = req.getFileNames();
		String[] recordData = new String[50];
		int num = 0;
		while(it.hasNext()){
			MultipartFile file = req.getFile(it.next());
			String uuid = null;
			if(file != null){
				uuid = rs.recordData(file);
			}
			recordData[num] = uuid;
			num++;
		}
		return rs.uploadFile(session, recordData);
	}

	// �л��� ���
	@RequestMapping("/uploadRecord")
	@ResponseBody
	public boolean uploadRecord(HttpSession session, @RequestParam(name="addr", required=false, defaultValue="a")String addr, @RequestParam(name="school", required=false, defaultValue="a")String school,
			@RequestParam(name="subject", required=false, defaultValue="a")String subject, @RequestParam(name="type", required=false, defaultValue="a")String type, @RequestParam(name="year", required=false, defaultValue="a")String year,
			@RequestParam(name="admission", required=false, defaultValue="a")String admission, @RequestParam(name="typical", required=false, defaultValue="a")String typical,
			@RequestParam(name="pass", required=false, defaultValue="a")String pass, @RequestParam(name="award1")String award1,
			@RequestParam(name="career")String career,
			@RequestParam(name="autonomous")String auto,
			@RequestParam(name="extra")String extra,
			@RequestParam(name="club")String club,
			@RequestParam(name="help")String help,
			@RequestParam(name="soju")String soju,
			@RequestParam(name="paper")String paper,
			@RequestParam(name="etc")String etc,
			@RequestParam(name="reading")String reading,
			@RequestParam(name="special")String special,
			@RequestParam(name="grade")String grade, @RequestParam(name="award")String award,
			@RequestParam(name="time")String time, @RequestParam(name="book")String book){
		return rs.uploadRecord(session, addr, school, subject, type, year, admission, typical, pass, award1, career,
				auto, extra, club, help, soju, paper, etc, reading, special, grade, award, time, book);
	}
	
	// �л��� ���2
	@RequestMapping("/uploadRecord2")
	public ModelAndView uploadRecord2(HttpSession session, @RequestParam(name="addr", required=false, defaultValue="a")String addr, @RequestParam(name="school", required=false, defaultValue="a")String school,
			@RequestParam(name="subject", required=false, defaultValue="a")String subject, @RequestParam(name="type", required=false, defaultValue="a")String type, @RequestParam(name="year", required=false, defaultValue="a")String year,
			@RequestParam(name="admission", required=false, defaultValue="a")String admission, @RequestParam(name="typical", required=false, defaultValue="a")String typical,
			@RequestParam(name="pass", required=false, defaultValue="a")String pass, @RequestParam(name="award1")String award1,
			@RequestParam(name="career")String career,
			@RequestParam(name="autonomous")String auto,
			@RequestParam(name="extra")String extra,
			@RequestParam(name="club")String club,
			@RequestParam(name="help")String help,
			@RequestParam(name="soju")String soju,
			@RequestParam(name="paper")String paper,
			@RequestParam(name="etc")String etc,
			@RequestParam(name="reading")String reading,
			@RequestParam(name="special")String special,
			@RequestParam(name="grade")String grade, @RequestParam(name="award")String award,
			@RequestParam(name="time")String time, @RequestParam(name="book")String book){
		String user = ((HashMap)session.getAttribute("login")).get("auto").toString();
		rs.uploadRecord(session, addr, school, subject, type, year, admission, typical, pass, award1, career,
				auto, extra, club, help, soju, paper, etc, reading, special, grade, award, time, book);
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
	
	// �л��� ����
	@RequestMapping("/view/{num}")
	public ModelAndView view(@PathVariable(name="num")String num, HttpSession session){
		ModelAndView mav = new ModelAndView("/record/view.jsp");
		HashMap record = rs.recordView(num);
		mav.addObject("record", record);
		mav.addObject("itemNum", record.get("auto").toString());
		mav.addObject("itemUser", record.get("user").toString());
		mav.addObject("itemSchool", record.get("school").toString());
		mav.addObject("itemSubject", record.get("subject").toString());
		List<HashMap> certList = ms.certList(record.get("user").toString());
		mav.addObject("certList", certList);
		boolean buyCheck = ms.buyCheck(num, session, "�л���");
		mav.addObject("buyCheck", buyCheck ? "buy" : "no");
		return mav;
	}

	// ������ �̵�
	@RequestMapping("/page/{page}")
	public ModelAndView page(@PathVariable(name="page")int page){
		ModelAndView mav = new ModelAndView("/record/record.jsp");
		List<HashMap> recordList = rs.recordList(page);
		mav.addObject("recordList", recordList);
		mav = pageInner(mav, page);
		mav.addObject("type", "record");
		return mav;
	}
	
	// �˻� ������ �̵�
	@RequestMapping("/search/page/{type}/{word}/{word2}/{page}")
	public ModelAndView search2(@PathVariable(name="type")String type, @PathVariable(name="word")String word,
			@PathVariable(name="word2")String word2, @PathVariable(name="page")int page){
		ModelAndView mav = new ModelAndView("/record/record.jsp");
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
		List<HashMap> record = new Vector<>();
		switch(type){
		case "both":
			record = rs.recordList2Both(page, wordList, word2);
			mav = pageInner2Both(mav, page, wordList, word2);
			break;
		case "school":
			record = rs.recordList2School(page, wordList);
			mav = pageInner2School(mav, page, wordList);
			break;
		case "subject":
			record = rs.recordList2Subject(page, word2);
			mav = pageInner2Subject(mav, page, word2);
			break;
		}
		mav.addObject("recordList", record);
		mav.addObject("type", "record");
		return mav;
	}
	
	// �˻�
	@RequestMapping("/search/both/{word}/{word2}")
	public ModelAndView searchBoth(@PathVariable(name="word")String word, @PathVariable(name="word2")String word2){
		ModelAndView mav = new ModelAndView("/record/record.jsp");
		mav.addObject("word1", word);
		mav.addObject("word2", word2);
		word = ss.wordSearchChange(word);
		List<HashMap> wordList = ss.word(word);
		List<HashMap> record = rs.recordList2Both(1, wordList, word2);
		mav.addObject("recordList", record);
		mav = pageInner2Both(mav, 1, wordList, word2);
		mav.addObject("type", "record");
		return mav;
	}
	
	// �˻� ������
	public ModelAndView pageInner2Both(ModelAndView mav, int select, List<HashMap> wordList, String subject){
		int page = rs.recordPage2Both(wordList, subject);
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
		ModelAndView mav = new ModelAndView("/record/record.jsp");
		mav.addObject("word1", word);
		word = ss.wordSearchChange(word);
		List<HashMap> wordList = ss.word(word);
		List<HashMap> record = rs.recordList2School(1, wordList);
		mav.addObject("recordList", record);
		mav = pageInner2School(mav, 1, wordList);
		mav.addObject("type", "record");
		return mav;
	}
	
	// �˻� ������
	public ModelAndView pageInner2School(ModelAndView mav, int select, List<HashMap> wordList){
		int page = rs.recordPage2School(wordList);
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
		ModelAndView mav = new ModelAndView("/record/record.jsp");
		mav.addObject("word2", word);
		List<HashMap> record = rs.recordList2Subject(1, word);
		mav.addObject("recordList", record);
		mav = pageInner2Subject(mav, 1, word);
		mav.addObject("type", "record");
		return mav;
	}
	
	// �˻� ������
	public ModelAndView pageInner2Subject(ModelAndView mav, int select, String subject){
		int page = rs.recordPage2Subject(subject);
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
	
	
	
	
	
	
	
	
	
	
	
	// ����������
	@RequestMapping("/modify/{num}")
	public ModelAndView modify(@PathVariable(name="num")String num, HttpSession session){
		ModelAndView mav = new ModelAndView("/record/modify.jsp");
		String auto = ((HashMap)session.getAttribute("login")).get("auto").toString();
		List<HashMap> schoolList = es.schoolList(auto);
		mav.addObject("schoolList", schoolList);
		HashMap record = rs.recordView(num);
		mav.addObject("record", record);
		return mav;
	}
	
	// �л��� ����
	@RequestMapping("/modifyRecord")
	public ModelAndView uploadModify(HttpSession session, @RequestParam(name="addr", required=false, defaultValue="a")String addr, @RequestParam(name="school", required=false, defaultValue="a")String school,
			@RequestParam(name="subject", required=false, defaultValue="a")String subject, @RequestParam(name="type", required=false, defaultValue="a")String type, @RequestParam(name="year", required=false, defaultValue="a")String year,
			@RequestParam(name="admission", required=false, defaultValue="a")String admission, @RequestParam(name="typical", required=false, defaultValue="a")String typical,
			@RequestParam(name="pass", required=false, defaultValue="a")String pass, @RequestParam(name="award1")String award1,
			@RequestParam(name="career")String career,
			@RequestParam(name="autonomous")String auto1,
			@RequestParam(name="extra")String extra,
			@RequestParam(name="club")String club,
			@RequestParam(name="help")String help,
			@RequestParam(name="soju")String soju,
			@RequestParam(name="paper")String paper,
			@RequestParam(name="etc")String etc,
			@RequestParam(name="reading")String reading,
			@RequestParam(name="special")String special,
			@RequestParam(name="grade")String grade, @RequestParam(name="award")String award,
			@RequestParam(name="time")String time, @RequestParam(name="book")String book, @RequestParam(name="auto")String auto){
		String user = ((HashMap)session.getAttribute("login")).get("auto").toString();
		rs.modifyRecord(session, addr, school, subject, type, year, admission, typical, pass, award1, career,
				auto1, extra, club, help, soju, paper, etc, reading, special, grade, award, time, book, auto);
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
}
