package admin.tab5.service;

import java.util.*;

import org.apache.ibatis.session.*;
import org.springframework.beans.factory.annotation.*;
import org.springframework.stereotype.*;
import org.springframework.web.servlet.*;

@Component
public class AdminTab5Service {
	@Autowired
	SqlSessionFactory fac;

	// certList
	public List<HashMap> certList(int page) {
		SqlSession ss = fac.openSession();
		List<HashMap> list = ss.selectList("admin.recordList", (page-1)*20);
		ss.close();
		return list;
	}
	
	// certPage
	public int certPage(){
		SqlSession ss = fac.openSession();
		int page = ss.selectOne("admin.recordCount");
		ss.close();
		return page%20==0 ? page/20 : page/20+1;
	}

	public ModelAndView certPageInner(ModelAndView mav, int select) {
		int page = certPage();
		int first = 1;
		int last = page;
		int start = select > first ? select%10 == 0 ? (select/10)*10-10+1 : (select/10)*10+1 : first;
		int end = start+9 < last ? start+9 : last;
		int prev = select%10 == 0 ? (select/10)*10-20+1 : (start/10)*10-10+1;
		int next = (start/10)*10+10+1;
		mav.addObject("select5", select);
		mav.addObject("first5", first);
		mav.addObject("last5", last);
		mav.addObject("start5", start);
		mav.addObject("end5", end);
		mav.addObject("prev5", prev);
		mav.addObject("next5", next);
		return mav;
	}
	
	// cert save
	public boolean certSave(String[] cert) {
		SqlSession ss = fac.openSession();
		for(int i=0; i<cert.length; i++){
			ss.update("admin.recordUpdate", cert[i]);
			ss.commit();
		}
		ss.close();
		return true;
	}

	// certEndList
	public List<HashMap> certEndList(int page) {
		SqlSession ss = fac.openSession();
		List<HashMap> list = ss.selectList("admin.recordEndList", (page-1)*20);
		ss.close();
		return list;
	}
	
	// certEndPage
	public int certEndPage(){
		SqlSession ss = fac.openSession();
		int page = ss.selectOne("admin.recordEndCount");
		ss.close();
		return page%20==0 ? page/20 : page/20+1;
	}

	// certEndPageInner
	public ModelAndView certEndPageInner(ModelAndView mav, int select) {
		int page = certEndPage();
		int first = 1;
		int last = page;
		int start = select > first ? (select/10)*10+1 : first;
		int end = start+9 < last ? start+9 : last;
		int prev = (start/10)*10-10+1;
		int next = (start/10)*10+10+1;
		mav.addObject("select5", select);
		mav.addObject("first5", first);
		mav.addObject("last5", last);
		mav.addObject("start5", start);
		mav.addObject("end5", end);
		mav.addObject("prev5", prev);
		mav.addObject("next5", next);
		return mav;
	}

	// recordFile
	public List<String> recordFile(String num) {
		SqlSession ss = fac.openSession();
		HashMap map = ss.selectOne("admin.recordFile", num);
		Set<String> set = map.keySet();
		Iterator<String> it = set.iterator();
		List<String> list = new Vector<>();
		int n = 0;
		while(it.hasNext()){
			n++;
			String s = it.next().toString();
			if(!s.contains("record")){
				continue;
			}
			list.add(map.get(s).toString());
		}
		ss.close();
		return list;
	}
}
