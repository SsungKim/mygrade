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
			@RequestParam(name="admission", required=false, defaultValue="a")String admission, @RequestParam(name="typical", required=false, defaultValue="a")String typical, @RequestParam(name="hschool")String hschool,
			@RequestParam(name="pass", required=false, defaultValue="a")String pass, @RequestParam(name="award1")String award1, @RequestParam(name="award2")String award2,
			@RequestParam(name="award3")String award3, @RequestParam(name="career1")String career1, @RequestParam(name="career2")String career2,
			@RequestParam(name="career3")String career3, @RequestParam(name="autonomous1")String auto1, @RequestParam(name="autonomous2")String auto2,
			@RequestParam(name="autonomous3")String auto3, @RequestParam(name="extra1")String extra1, @RequestParam(name="extra2")String extra2,
			@RequestParam(name="extra3")String extra3, @RequestParam(name="club1")String club1, @RequestParam(name="club2")String club2,
			@RequestParam(name="club3")String club3, @RequestParam(name="help1")String help1, @RequestParam(name="help2")String help2,
			@RequestParam(name="help3")String help3, @RequestParam(name="soju1")String soju1, @RequestParam(name="soju2")String soju2,
			@RequestParam(name="soju3")String soju3, @RequestParam(name="paper1")String paper1, @RequestParam(name="paper2")String paper2,
			@RequestParam(name="paper3")String paper3, @RequestParam(name="etc1")String etc1, @RequestParam(name="etc2")String etc2,
			@RequestParam(name="etc3")String etc3, @RequestParam(name="reading1")String reading1, @RequestParam(name="reading2")String reading2,
			@RequestParam(name="reading3")String reading3, @RequestParam(name="special1")String special1, @RequestParam(name="special2")String special2,
			@RequestParam(name="special3")String special3 , @RequestParam(name="grade")String grade, @RequestParam(name="award")String award,
			@RequestParam(name="time")String time, @RequestParam(name="book")String book){
		return rs.uploadRecord(session, addr, school, subject, type, year, admission, typical, hschool, pass, award1, award2, award3, career1,
				career2, career3, auto1, auto2, auto3, extra1, extra2, extra3, club1, club2, club3, help1, help2, help3, soju1, soju2, soju3, paper1,
				paper2, paper3, etc1, etc2, etc3, reading1, reading2, reading3, special1, special2, special3, grade, award, time, book);
	}
	
	// �л��� ���2
	@RequestMapping("/uploadRecord2")
	public ModelAndView uploadRecord2(HttpSession session, @RequestParam(name="addr", required=false, defaultValue="a")String addr, @RequestParam(name="school", required=false, defaultValue="a")String school,
			@RequestParam(name="subject", required=false, defaultValue="a")String subject, @RequestParam(name="type", required=false, defaultValue="a")String type, @RequestParam(name="year", required=false, defaultValue="a")String year,
			@RequestParam(name="admission", required=false, defaultValue="a")String admission, @RequestParam(name="typical", required=false, defaultValue="a")String typical, @RequestParam(name="hschool")String hschool,
			@RequestParam(name="pass", required=false, defaultValue="a")String pass, @RequestParam(name="award1")String award1, @RequestParam(name="award2")String award2,
			@RequestParam(name="award3")String award3, @RequestParam(name="career1")String career1, @RequestParam(name="career2")String career2,
			@RequestParam(name="career3")String career3, @RequestParam(name="autonomous1")String auto1, @RequestParam(name="autonomous2")String auto2,
			@RequestParam(name="autonomous3")String auto3, @RequestParam(name="extra1")String extra1, @RequestParam(name="extra2")String extra2,
			@RequestParam(name="extra3")String extra3, @RequestParam(name="club1")String club1, @RequestParam(name="club2")String club2,
			@RequestParam(name="club3")String club3, @RequestParam(name="help1")String help1, @RequestParam(name="help2")String help2,
			@RequestParam(name="help3")String help3, @RequestParam(name="soju1")String soju1, @RequestParam(name="soju2")String soju2,
			@RequestParam(name="soju3")String soju3, @RequestParam(name="paper1")String paper1, @RequestParam(name="paper2")String paper2,
			@RequestParam(name="paper3")String paper3, @RequestParam(name="etc1")String etc1, @RequestParam(name="etc2")String etc2,
			@RequestParam(name="etc3")String etc3, @RequestParam(name="reading1")String reading1, @RequestParam(name="reading2")String reading2,
			@RequestParam(name="reading3")String reading3, @RequestParam(name="special1")String special1, @RequestParam(name="special2")String special2,
			@RequestParam(name="special3")String special3 , @RequestParam(name="grade")String grade, @RequestParam(name="award")String award,
			@RequestParam(name="time")String time, @RequestParam(name="book")String book){
		String user = ((HashMap)session.getAttribute("login")).get("auto").toString();
		rs.uploadRecord(session, addr, school, subject, type, year, admission, typical, hschool, pass, award1, award2, award3, career1,
				career2, career3, auto1, auto2, auto3, extra1, extra2, extra3, club1, club2, club3, help1, help2, help3, soju1, soju2, soju3, paper1,
				paper2, paper3, etc1, etc2, etc3, reading1, reading2, reading3, special1, special2, special3, grade, award, time, book);
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
	public ModelAndView view(@PathVariable(name="num")String num){
		ModelAndView mav = new ModelAndView("/record/view.jsp");
		HashMap record = rs.recordView(num);
		mav.addObject("record", record);
		mav.addObject("itemNum", record.get("auto").toString());
		mav.addObject("itemUser", record.get("user").toString());
		List<HashMap> certList = ms.certList(record.get("user").toString());
		mav.addObject("certList", certList);
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
			@RequestParam(name="admission", required=false, defaultValue="a")String admission, @RequestParam(name="typical", required=false, defaultValue="a")String typical, @RequestParam(name="hschool")String hschool,
			@RequestParam(name="pass", required=false, defaultValue="a")String pass, @RequestParam(name="award1")String award1, @RequestParam(name="award2")String award2,
			@RequestParam(name="award3")String award3, @RequestParam(name="career1")String career1, @RequestParam(name="career2")String career2,
			@RequestParam(name="career3")String career3, @RequestParam(name="autonomous1")String auto1, @RequestParam(name="autonomous2")String auto2,
			@RequestParam(name="autonomous3")String auto3, @RequestParam(name="extra1")String extra1, @RequestParam(name="extra2")String extra2,
			@RequestParam(name="extra3")String extra3, @RequestParam(name="club1")String club1, @RequestParam(name="club2")String club2,
			@RequestParam(name="club3")String club3, @RequestParam(name="help1")String help1, @RequestParam(name="help2")String help2,
			@RequestParam(name="help3")String help3, @RequestParam(name="soju1")String soju1, @RequestParam(name="soju2")String soju2,
			@RequestParam(name="soju3")String soju3, @RequestParam(name="paper1")String paper1, @RequestParam(name="paper2")String paper2,
			@RequestParam(name="paper3")String paper3, @RequestParam(name="etc1")String etc1, @RequestParam(name="etc2")String etc2,
			@RequestParam(name="etc3")String etc3, @RequestParam(name="reading1")String reading1, @RequestParam(name="reading2")String reading2,
			@RequestParam(name="reading3")String reading3, @RequestParam(name="special1")String special1, @RequestParam(name="special2")String special2,
			@RequestParam(name="special3")String special3 , @RequestParam(name="grade")String grade, @RequestParam(name="award")String award,
			@RequestParam(name="time")String time, @RequestParam(name="book")String book, @RequestParam(name="auto")String auto){
		String user = ((HashMap)session.getAttribute("login")).get("auto").toString();
		rs.modifyRecord(session, addr, school, subject, type, year, admission, typical, hschool, pass, award1, award2, award3, career1,
				career2, career3, auto1, auto2, auto3, extra1, extra2, extra3, club1, club2, club3, help1, help2, help3, soju1, soju2, soju3, paper1,
				paper2, paper3, etc1, etc2, etc3, reading1, reading2, reading3, special1, special2, special3, grade, award, time, book, auto);
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
