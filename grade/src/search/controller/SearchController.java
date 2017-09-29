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
	
	// 메인검색 both
	@RequestMapping("/both/{word1}/{word2}")
	public ModelAndView searchBoth(@PathVariable(name="word1")String word1, @PathVariable(name="word2")String word2){
		ModelAndView mav = new ModelAndView("/search/search.jsp");
		mav.addObject("word", word1);
		mav.addObject("word2", word2);
		List<HashMap> wordList = new Vector<>();
		word1 = ss.wordSearchChange(word1);
		wordList = ss.word(word1);
		List<HashMap> searchList = ss.selectBoth(wordList, word2, 1);
		mav.addObject("searchList", searchList);
		mav.addObject("searchType", "interview");
		mav = pageInnerBoth(mav, 1, wordList, word2);
		return mav;
	}
	
	// 페이지 처리
	public ModelAndView pageInnerBoth(ModelAndView mav, int select, List<HashMap> wordList, String subject){
		int page = ss.searchPageBoth(wordList, subject);
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
	
	// 메인검색 school
	@RequestMapping("/school/{word1}")
	public ModelAndView searchSchool(@PathVariable(name="word1")String word1){
		ModelAndView mav = new ModelAndView("/search/search.jsp");
		mav.addObject("word", word1);
		List<HashMap> wordList = new Vector<>();
		word1 = ss.wordSearchChange(word1);
		wordList = ss.word(word1);
		List<HashMap> searchList = ss.selectSchool(wordList, 1);
		mav.addObject("searchList", searchList);
		mav.addObject("searchType", "interview");
		mav = pageInnerSchool(mav, 1, wordList);
		return mav;
	}
	
	// 페이지 처리
	public ModelAndView pageInnerSchool(ModelAndView mav, int select, List<HashMap> wordList){
		int page = ss.searchPageSchool(wordList);
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
	
	// 메인검색 subject
	@RequestMapping("/subject/{word1}")
	public ModelAndView searchSubject(@PathVariable(name="word1")String word1){
		ModelAndView mav = new ModelAndView("/search/search.jsp");
		mav.addObject("word2", word1);
		List<HashMap> wordList = new Vector<>();
		word1 = ss.wordSearchChange(word1);
		wordList = ss.word(word1);
		List<HashMap> searchList = ss.selectSubject(word1, 1);
		mav.addObject("searchList", searchList);
		mav.addObject("searchType", "interview");
		mav = pageInnerSubject(mav, 1, word1);
		return mav;
	}
	
	// 페이지 처리
	public ModelAndView pageInnerSubject(ModelAndView mav, int select, String subject){
		int page = ss.searchPageSubject(subject);
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
	@RequestMapping("/{searchType}/{word}/{word2}/{type}")
	public ModelAndView search2(@PathVariable(name="searchType")String searchType, @PathVariable(name="word")String word, 
													@PathVariable(name="word2")String word2, @PathVariable(name="type")String type){
		ModelAndView mav = new ModelAndView("/search/search.jsp");
		mav.addObject("word", word);
		mav.addObject("word2", word2);
		mav.addObject("searchType", type);
		word = ss.wordSearchChange(word);
		List<HashMap> wordList = ss.word(word);
		List<HashMap> searchList = new Vector<>();
		switch(searchType){
		case "both":
			searchList = ss.searchList2Both(wordList, word2, 1, type);
			mav = pageInner2Both(mav, 1, wordList, word2, type);
			break;
		case "school":
			searchList = ss.searchList2School(wordList, 1, type);
			mav = pageInner2School(mav, 1, wordList, type);
			break;
		case "subject":
			searchList = ss.searchList2Subject(word2, 1, type);
			mav = pageInner2Subject(mav, 1, word2, type);
			break;
		}
		mav.addObject("searchList", searchList);
		return mav;
	}
	
	// 페이지 처리
	public ModelAndView pageInner2Both(ModelAndView mav, int select, List<HashMap> wordList, String subject, String type){
		int page = ss.searchPage2Both(wordList, subject, type);
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
	public ModelAndView pageInner2School(ModelAndView mav, int select, List<HashMap> wordList, String type){
		int page = ss.searchPage2School(wordList, type);
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
	public ModelAndView pageInner2Subject(ModelAndView mav, int select, String subject, String type){
		int page = ss.searchPage2Subject(subject, type);
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
	@RequestMapping("/{searchType}/{word}/{word2}/{type}/{page}")
	public ModelAndView search4(@PathVariable(name="searchType")String searchType, @PathVariable(name="word")String word,
			@PathVariable(name="word2")String word2, @PathVariable(name="type")String type, @PathVariable(name="page")int page){
		ModelAndView mav = new ModelAndView("/search/search.jsp");
		mav.addObject("word", word);
		mav.addObject("word2", word2);
		mav.addObject("searchType", type);
		word = ss.wordSearchChange(word);
		List<HashMap> wordList = ss.word(word);
		mav.addObject("sType", searchType);
		List<HashMap> searchList = new Vector<>();
		switch(searchType){
		case "both":
			searchList = ss.searchList2Both(wordList, word2, 1, type);
			mav = pageInner2Both(mav, 1, wordList, word2, type);
			break;
		case "school":
			searchList = ss.searchList2School(wordList, 1, type);
			mav = pageInner2School(mav, 1, wordList, type);
			break;
		case "subject":
			searchList = ss.searchList2Subject(word2, 1, type);
			mav = pageInner2Subject(mav, 1, word2, type);
			break;
		}
		mav.addObject("searchList", searchList);
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
