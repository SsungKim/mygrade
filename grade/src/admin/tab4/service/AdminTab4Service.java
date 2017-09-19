package admin.tab4.service;

import java.util.*;

import org.apache.ibatis.session.*;
import org.springframework.beans.factory.annotation.*;
import org.springframework.stereotype.*;
import org.springframework.web.servlet.*;

@Component
public class AdminTab4Service {
	@Autowired
	SqlSessionFactory fac;

	// cert List
	public List<HashMap> certList(int page) {
		SqlSession ss = fac.openSession();
		List<HashMap> list = ss.selectList("admin.certList", (page-1)*20);
		for(int i=0; i<list.size(); i++){
			HashMap m = list.get(i);
			HashMap mm = ss.selectOne("school.word2", m.get("school"));
			m.put("schoolName", mm.get("name"));
			list.set(i, m);
		}
		List<HashMap> cert = ss.selectList("admin.certAll");
		for(int i=0; i<list.size(); i++){
			for(int j=0; j<cert.size(); j++){
				HashMap m = list.get(i);
				HashMap m2 = cert.get(j);
				if(m.get("id").toString().equals(m2.get("id").toString())){
					if(m.get("school").toString().equals(m2.get("school").toString())){
						list.remove(i);
						if(i>0)
							i--;
					}
				}
			}
		}
		ss.close();
		return list;
	}

	// cert page
	public int certPage() {
		SqlSession ss = fac.openSession();
		int page = ss.selectOne("admin.certCount");
		ss.close();
		return page%20==0 ? page/20 : page/20+1;
	}

	// cert page inner method
	public ModelAndView certPageInner(ModelAndView mav, int select){
		int page = certPage();
		int first = 1;
		int last = page;
		int start = select > first ? select%10 == 0 ? (select/10)*10-10+1 : (select/10)*10+1 : first;
		int end = start+9 < last ? start+9 : last;
		int prev = select%10 == 0 ? (select/10)*10-20+1 : (start/10)*10-10+1;
		int next = (start/10)*10+10+1;
		mav.addObject("select4", select);
		mav.addObject("first4", first);
		mav.addObject("last4", last);
		mav.addObject("start4", start);
		mav.addObject("end4", end);
		mav.addObject("prev4", prev);
		mav.addObject("next4", next);
		return mav;
	}
	
	// cert save
	public boolean certSave(String[] entData, String[] passData) {
		SqlSession ss = fac.openSession();
		for(int i=0; i<entData.length; i++){
			if(entData[i].equals("0")){
				break;
			}
			HashMap m = ss.selectOne("admin.schoolOne", entData[i]);
			m.put("certType", "재학");
			try{
				System.out.println(m);
				ss.insert("admin.certSave", m);
//				ss.delete("admin.schoolDelete", entData[i]);
				ss.update("admin.salesUpdate", m.get("user"));
				ss.commit();
			} catch(Exception e){
				e.printStackTrace();
				ss.rollback();
				ss.close();
				return false;
			}
		}
		for(int i=0; i<passData.length; i++){
			if(passData[i].equals("0")){
				break;
			}
			HashMap m = ss.selectOne("admin.schoolOne", passData[i]);
			m.put("certType", "합격");
			try{
				ss.insert("admin.certSave", m);
//				ss.delete("admin.schoolDelete", passData[i]);
				ss.commit();
			} catch(Exception e){
				ss.rollback();
				ss.close();
				return false;
			}
		}
		ss.close();
		return true;
	}

	// certEndList
	public List<HashMap> certEndList(int page) {
		SqlSession ss = fac.openSession();
		List<HashMap> list = ss.selectList("admin.certEndList", (page-1)*20);
		for(int i=0; i<list.size(); i++){
			HashMap m = list.get(i);
			HashMap mm = ss.selectOne("school.word2", m.get("school"));
			m.put("schoolName", mm.get("name"));
			list.set(i, m);
		}
		ss.close();
		return list;
	}
	
	// certEndPage
	public int certEndPage(){
		SqlSession ss = fac.openSession();
		int page = ss.selectOne("admin.certEndCount");
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
		mav.addObject("select4", select);
		mav.addObject("first4", first);
		mav.addObject("last4", last);
		mav.addObject("start4", start);
		mav.addObject("end4", end);
		mav.addObject("prev4", prev);
		mav.addObject("next4", next);
		return mav;
	}
	
	
}
