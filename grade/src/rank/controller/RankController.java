package rank.controller;

import java.util.*;

import org.mvel2.integration.impl.*;
import org.springframework.beans.factory.annotation.*;
import org.springframework.stereotype.*;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.*;

import rank.service.*;

@Controller
@RequestMapping("/rank")
public class RankController {
	@Autowired
	RankService rs;

	// rank
	@RequestMapping("/{user}")
	public ModelAndView rank(@PathVariable(name="user")String user){
		ModelAndView mav = new ModelAndView("/rank/list.jsp");
		rs.newRankDay();
		List<HashMap> rankList = rs.rankList(user, 1);
		mav.addObject("rankList", rankList);
		mav = pageInner(mav, 1, user);
		return mav;
	}
	
	// 其捞瘤 贸府
	public ModelAndView pageInner(ModelAndView mav, int select, String user){
		int page = rs.rankPage(user);
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
	
	// write
	@RequestMapping("/write")
	public ModelAndView write(){
		ModelAndView mav = new ModelAndView("/rank/write.jsp");
		List<HashMap> rankDay = rs.rankDay();
		mav.addObject("rankDay", rankDay);
		return mav;
	}
	
	// view
	@RequestMapping("/view/{num}")
	public ModelAndView view(@PathVariable(name="num")String num){
		ModelAndView mav = new ModelAndView("/rank/view.jsp");
		HashMap view = rs.rankOne(num);
		mav.addObject("view", view);
		int people = rs.rankPeople(view.get("rankDay").toString(), view.get("grade").toString(), view.get("type").toString());
		int pk = rs.pk(view.get("rankDay").toString(), view.get("grade").toString());
		int pm = rs.pm(view.get("rankDay").toString(), view.get("grade").toString(), view.get("mathType").toString());
		int pe = rs.pe(view.get("rankDay").toString(), view.get("grade").toString());
		int ph = rs.ph(view.get("rankDay").toString(), view.get("grade").toString());
		int px1 = rs.px1(view.get("rankDay").toString(), view.get("grade").toString(), view.get("expType1").toString());
		int px2 = rs.px2(view.get("rankDay").toString(), view.get("grade").toString(), view.get("expType2").toString());
		int pf = rs.pf(view.get("rankDay").toString(), view.get("grade").toString(), view.get("langType").toString());
		int ps = rs.ps(view.get("rankDay").toString(), view.get("grade").toString(), view.get("type").toString());
		mav.addObject("people", people);
		HashMap rank = rs.rank(view.get("user").toString(), view.get("grade").toString(), view.get("rankDay").toString(), view.get("mathType").toString(),
				view.get("expType1").toString(), view.get("expType2").toString(), view.get("langType").toString(), view.get("type").toString());
		mav.addObject("rank", rank);
		HashMap hund = rs.hund(rank, pk, pm, pe, ph, px1, px2, pf, ps);
		mav.addObject("hund", hund);
		mav.addObject("pk", pk);
		mav.addObject("pm", pm);
		mav.addObject("pe", pe);
		mav.addObject("ph", ph);
		mav.addObject("px1", px1);
		mav.addObject("px2", px2);
		mav.addObject("pf", pf);
		mav.addObject("ps", ps);
		return mav;
	}
	
	// 己利 殿废
	@RequestMapping("/uploadRank/{user}/{addr}/{school}/{grade}/{rankDay}/{type}/{mathType}/{expType}/{expType1}/{expType2}/"
			+ "{langType}/{kor}/{math}/{eng}/{his}/{exp1}/{exp2}/{lang}")
	@ResponseBody
	public int uploadrank(@PathVariable(name="user")String user, @PathVariable(name="addr")String addr, @PathVariable(name="school")String school,
			@PathVariable(name="grade")String grade, @PathVariable(name="rankDay")String rankDay, @PathVariable(name="type")String type,
			@PathVariable(name="mathType")String mathType, @PathVariable(name="expType")String expType, @PathVariable(name="expType1")String expType1,
			@PathVariable(name="expType2")String expType2, @PathVariable(name="langType")String langType, @PathVariable(name="kor")String kor,
			@PathVariable(name="math")String math, @PathVariable(name="eng")String eng, @PathVariable(name="his")String his,
			@PathVariable(name="exp1")String exp1, @PathVariable(name="exp2")String exp2, @PathVariable(name="lang")String lang){
		return rs.uploadRank(user, addr, school, grade, rankDay, type, mathType, expType, expType1, expType2, langType, kor, math, eng, his, exp1, exp2, lang);
	}
	
	// 己利 其捞瘤贸府
	@RequestMapping("/{user}/{num}")
	public ModelAndView rank(@PathVariable(name="user")String user, @PathVariable(name="num")int num){
		ModelAndView mav = new ModelAndView("/rank/list.jsp");
		rs.newRankDay();
		List<HashMap> rankList = rs.rankList(user, num);
		mav.addObject("rankList", rankList);
		mav = pageInner(mav, num, user);
		return mav;
	}
}
