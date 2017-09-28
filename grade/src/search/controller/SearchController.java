package search.controller;

import java.util.*;

import org.springframework.beans.factory.annotation.*;
import org.springframework.stereotype.*;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.*;

import search.service.*;

@Controller
@RequestMapping("/search")
public class SearchController {
	@Autowired
	SearchService ss;

	// 메인에서 검색
	@RequestMapping("/{type}/{word}")
	public ModelAndView search(@PathVariable(name="type")String type, @PathVariable(name="word")String word){
		ModelAndView mav = new ModelAndView("/search/search.jsp");
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
		List<HashMap> searchList = ss.searchList(wordList, 1);
		mav.addObject("searchList", searchList);
//		mav.addObject("searchType", "record");
		mav.addObject("searchType", "interview");
		mav = pageInner(mav, 1, wordList);
		return mav;
	}
	
	// 페이지 처리
	public ModelAndView pageInner(ModelAndView mav, int select, List<HashMap> wordList){
		int page = ss.searchPage(wordList);
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
	
	// 항목이동
	@RequestMapping("/{searchType}/{word}/{type}")
	public ModelAndView search2(@PathVariable(name="searchType")String searchType, @PathVariable(name="word")String word, @PathVariable(name="type")String type){
		ModelAndView mav = new ModelAndView("/search/search.jsp");
		mav.addObject("word", word);
		mav.addObject("searchType", type);
		List<HashMap> wordList = new Vector<>();
		if(type.equals("학교")){
			word = ss.wordSearchChange(word);
			wordList = ss.word(word);
		} else {
			HashMap m = new HashMap();
			m.put("num", word);
			wordList.add(m);
		}
		mav.addObject("sType", searchType);
		List<HashMap> searchList = ss.searchList2(wordList, 1, type);
		mav.addObject("searchList", searchList);
		mav = pageInner2(mav, 1, wordList, type);
		return mav;
	}
	
	// 페이지 처리
	public ModelAndView pageInner2(ModelAndView mav, int select, List<HashMap> wordList, String type){
		int page = ss.searchPage2(wordList, type);
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
	
	// 상세검색 페이지이동
	@RequestMapping("/{searchType}/{word}/{type}/{page}")
	public ModelAndView search4(@PathVariable(name="searchType")String searchType, @PathVariable(name="word")String word,
													@PathVariable(name="type")String type, @PathVariable(name="page")int page){
		ModelAndView mav = new ModelAndView("/search/search.jsp");
		mav.addObject("word", word);
		mav.addObject("searchType", type);
		List<HashMap> wordList = new Vector<>();
		if(searchType.equals("학교")){
			word = ss.wordSearchChange(word);
			wordList = ss.word(word);
		} else {
			HashMap m = new HashMap();
			m.put("num", word);
			wordList.add(m);
		}
		mav.addObject("sType", searchType);
		List<HashMap> searchList = ss.searchList2(wordList, page, type);
		mav.addObject("searchList", searchList);
		mav = pageInner2(mav, page, wordList, type);
		return mav;
	}
	
	
	
	
	
	
	
	
	// 상세검색
//	@RequestMapping("/{word}/{word2}/{location}/{passCount}/{searchType}")
//	public ModelAndView search2(@PathVariable(name="word")String word, @PathVariable(name="word2")String word2,
//													@PathVariable(name="location")String location, @PathVariable(name="passCount")String passCount,
//													@PathVariable(name="searchType")String searchType){
//		ModelAndView mav = new ModelAndView("/search/search.jsp");
//		mav.addObject("word", word);
//		mav.addObject("word2", word2.equals("00") ? "" : word2);
////		word = ss.word(word);
//		mav.addObject("location", location);
//		mav.addObject("passCount", passCount);
//		List<HashMap> searchList = ss.searchList2(word, word2, location, passCount, 1, searchType);
//		mav.addObject("searchList", searchList);
//		mav.addObject("searchType", searchType);
//		mav = pageInner2(mav, 1, word, word2, location, passCount, searchType);
//		return mav;
//	}
	
	// 페이지 처리2
//	public ModelAndView pageInner2(ModelAndView mav, int select, String word, String word2, String location, String passCount,
//															String searchType){
//		int page = ss.searchPage2(word, word2, location, passCount, searchType);
//		int first = 1;
//		int last = page;
//		int start = select > first ? (select/10)*10+1 : first;
//		int end = start+9 < last ? start+9 : last;
//		int prev = (start/10)*10-10+1;
//		int next = (start/10)*10+10+1;
//		mav.addObject("select", select);
//		mav.addObject("first", first);
//		mav.addObject("last", last);
//		mav.addObject("start", start);
//		mav.addObject("end", end);
//		mav.addObject("prev", prev);
//		mav.addObject("next", next);
//		return mav;
//	}
}
