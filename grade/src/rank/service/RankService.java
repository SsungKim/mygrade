package rank.service;

import java.text.*;
import java.util.*;

import org.apache.ibatis.session.*;
import org.springframework.beans.factory.annotation.*;
import org.springframework.stereotype.*;

@Component
public class RankService {
	@Autowired
	SqlSessionFactory fac;

	// 모의고사 날짜 저장
	public void newRankDay() {
		SqlSession ss = fac.openSession();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-M");
		String s = sdf.format(System.currentTimeMillis());
		String year = s.substring(0, s.indexOf("-"));
		String month = s.substring(s.indexOf("-")+1);
		String day = year+"년 "+month+"월 모의고사";
		List<HashMap> list = ss.selectList("rank.rankDay");
		int check = 0;
		if(list.size()>0){
			for(HashMap m : list){
				if(m.get("name").toString().equals(day)){
					check++;
				}
			}
		}
		if(check == 0){
			if(month.equals("3") || month.equals("6") || month.equals("9") || month.equals("11")){
				try{
					ss.insert("rank.newRankDay", day);
					ss.commit();
				} catch(Exception e){
					e.printStackTrace();
					ss.rollback();
				}
			}
		}
		ss.close();
	}

	// 모의고사 날짜
	public List<HashMap> rankDay() {
		SqlSession ss = fac.openSession();
		List<HashMap> list = ss.selectList("rank.rankDay");
		ss.close();
		return list;
	}

	// 점수 등록
	public int uploadRank(String user, String addr, String school, String grade, String rankDay, String type,
			String mathType, String expType, String expType1, String expType2, String langType, String kor, String math,
			String eng, String his, String exp1, String exp2, String lang) {
		SqlSession ss = fac.openSession();
		HashMap map = new HashMap();
		map.put("user", user);
		map.put("addr", addr);
		map.put("school", school);
		map.put("grade", grade);
		map.put("rankDay", rankDay);
		map.put("type", type);
		map.put("mathType", mathType);
		map.put("expType", expType);
		map.put("expType1", expType1);
		map.put("expType2", expType2);
		map.put("langType", langType);
		map.put("kor", kor);
		map.put("math", math);
		map.put("eng", eng);
		map.put("his", his);
		map.put("exp1", exp1);
		map.put("exp2", exp2);
		map.put("lang", lang);
		int sum = Integer.parseInt(kor)+Integer.parseInt(math)+Integer.parseInt(exp1)+Integer.parseInt(exp2);
		map.put("sum", sum);
		List<HashMap> list = new Vector<>();
		if(!user.equals("1")){
			list = ss.selectList("rank.rankOneDay", map);
		}
		if(list.size() == 0){
			HashMap tmp = (HashMap) map.clone();
			try{
				for(int i=0; i<10; i++){
					int r1 = (int)(Math.random()*10)-4;
					int kor2 = Integer.parseInt(kor) > 95 ? Integer.parseInt(kor)+r1 > 100 ? Integer.parseInt(kor) : Integer.parseInt(kor)+r1 : 
						Integer.parseInt(kor) < 4 ? Integer.parseInt(kor)+r1 < 0 ? Integer.parseInt(kor) : Integer.parseInt(kor)+r1 : Integer.parseInt(kor)+r1;
					int r2 = (int)(Math.random()*10)-4;
					int math2 = Integer.parseInt(math) > 95 ? Integer.parseInt(math)+r2 > 100 ? Integer.parseInt(math) : Integer.parseInt(math)+r2 : 
						Integer.parseInt(math) < 4 ? Integer.parseInt(math)+r2 < 0 ? Integer.parseInt(math) : Integer.parseInt(math)+r2 : Integer.parseInt(math)+r2;
					int r3 = (int)(Math.random()*10)-4;
					int eng2 = Integer.parseInt(eng) > 95 ? Integer.parseInt(eng)+r3 > 100 ? Integer.parseInt(eng) : Integer.parseInt(eng)+r3 : 
						Integer.parseInt(eng) < 4 ? Integer.parseInt(eng)+r3 < 0 ? Integer.parseInt(eng) : Integer.parseInt(eng)+r3 : Integer.parseInt(eng)+r3;
					int r4 = (int)(Math.random()*10)-4;
					int his2 = Integer.parseInt(his) > 45 ? Integer.parseInt(his)+r4 > 50 ? Integer.parseInt(his) : Integer.parseInt(his)+r4 : 
						Integer.parseInt(his) < 4 ? Integer.parseInt(his)+r4 < 0 ? Integer.parseInt(his) : Integer.parseInt(his)+r4 : Integer.parseInt(his)+r4;
					int r5 = (int)(Math.random()*10)-4;
					int exp12 = Integer.parseInt(exp1) > 45 ? Integer.parseInt(exp1)+r5 > 50 ? Integer.parseInt(exp1) : Integer.parseInt(exp1)+r5 : 
						Integer.parseInt(exp1) < 4 ? Integer.parseInt(exp1)+r5 < 0 ? Integer.parseInt(exp1) : Integer.parseInt(exp1)+r5 : Integer.parseInt(exp1)+r5;
					int r6 = (int)(Math.random()*10)-4;
					int exp22 = Integer.parseInt(exp2) > 45 ? Integer.parseInt(exp2)+r6 > 50 ? Integer.parseInt(exp2) : Integer.parseInt(exp2)+r6 : 
						Integer.parseInt(exp2) < 4 ? Integer.parseInt(exp2)+r6 < 0 ? Integer.parseInt(exp2) : Integer.parseInt(exp2)+r6 : Integer.parseInt(exp2)+r6;
					int r7 = (int)(Math.random()*10)-4;
					int lang2 = 0;
					if(!lang.equals("0"))
						lang2 = Integer.parseInt(lang) > 45 ? Integer.parseInt(lang)+r7 > 50 ? Integer.parseInt(lang) : Integer.parseInt(lang)+r7 : 
							Integer.parseInt(lang) < 4 ? Integer.parseInt(lang)+r7 < 0 ? Integer.parseInt(lang) : Integer.parseInt(lang)+r7 : Integer.parseInt(lang)+r7;
					map.put("kor", kor2);
					map.put("math", math2);
					map.put("eng", eng2);
					map.put("his", his2);
					map.put("exp1", exp12);
					map.put("exp2", exp22);
					map.put("lang", lang2);
					int sum2 = kor2 + math2 + exp12 + exp22;
					map.put("sum", sum2);
					ss.insert("rank.newRank", map);
				}
				ss.insert("rank.newRank", tmp);
				ss.commit();
				ss.close();
				return 0;
			} catch(Exception e){
				e.printStackTrace();
				ss.rollback();
				ss.close();
				return 1;
			}
		} else {
			return 2;
		}
	}

	// 점수 리스트
	public List<HashMap> rankList(String user, int page) {
		SqlSession ss = fac.openSession();
		HashMap map = new HashMap();
		map.put("user", user);
		map.put("page", (page-1)*10);
		List<HashMap> list = ss.selectList("rank.rankList", map);
		List<HashMap> list2 = new Vector<>();
		if(list.size() > 0){
			list2.add(list.get(0));
			for(int i=0; i<list.size(); i++){
				for(int j=1; j<list2.size(); j++){
					HashMap m = list.get(i);
					HashMap m2 = list2.get(j);
					if(!m.get("rankDay").toString().equals(m2.get("rankDay").toString()) && !m.get("user").toString().equals(m2.get("uesr").toString())){
						list2.add(m);
					}
				}
			}
		}
		ss.close();
		return list2;
	}

	// 점수 갯수
	public int rankPage(String user) {
		SqlSession ss = fac.openSession();
		int n = ss.selectOne("rank.rankCount", user);
		n = n/11;
		ss.close();
		return n%10 == 0 ? n/10 : n/10+1;
	}

	// 점수 보기
	public HashMap rankOne(String num) {
		SqlSession ss = fac.openSession();
		HashMap map = ss.selectOne("rank.rankOne", num);
		ss.close();
		return map;
	}

	// 응시자 수
	public int rankPeople(String rankDay, String grade, String type) {
		SqlSession ss = fac.openSession();
		HashMap<String, String> map = new HashMap<>();
		map.put("rankDay", rankDay);
		map.put("grade", grade);
		map.put("type", type);
		int people = ss.selectOne("rank.rankPeople", map);
		ss.close();
		return people;
	}

	// 등수 계산
	public HashMap rank(String user, String grade, String rankDay, String mathType, String expType1, String expType2,
			String langType, String examType) {
		SqlSession ss = fac.openSession();
		HashMap map = new HashMap<>();
		map.put("grade", grade);
		map.put("rankDay", rankDay);
		map.put("mathType", mathType);
		map.put("expType1", expType1);
		map.put("expType2", expType2);
		map.put("langType", langType);
		map.put("type", examType);
		List<HashMap> kor = ss.selectList("rank.korRank", map);
		List<HashMap> math = ss.selectList("rank.mathRank", map);
		List<HashMap> eng = ss.selectList("rank.engRank", map);
		List<HashMap> his = ss.selectList("rank.hisRank", map);
		List<HashMap> exp1 = ss.selectList("rank.exp1Rank", map);
		List<HashMap> exp2 = ss.selectList("rank.exp2Rank", map);
		List<HashMap> lang = ss.selectList("rank.langRank", map);
		List<HashMap> sum = ss.selectList("rank.sumRank", map);
		HashMap rank = new HashMap();
		List<HashMap> rankList = rankList(user, 1);
		for(HashMap m : kor){
			if(m.get("user").toString().equals(user) && m.get("kor").toString().equals(rankList.get(0).get("kor").toString())){
				rank.put("kor", m.get("rank").toString());
				break;
			}
		}
		for(HashMap m : math){
			if(m.get("user").toString().equals(user) && m.get("math").toString().equals(rankList.get(0).get("math").toString())){
				rank.put("math", m.get("rank").toString());
				break;
			}
		}
		for(HashMap m : eng){
			if(m.get("user").toString().equals(user) && m.get("eng").toString().equals(rankList.get(0).get("eng").toString())){
				rank.put("eng", m.get("rank").toString());
				break;
			}
		}
		for(HashMap m : his){
			if(m.get("user").toString().equals(user) && m.get("his").toString().equals(rankList.get(0).get("his").toString())){
				rank.put("his", m.get("rank").toString());
				break;
			}
		}
		for(HashMap m : exp1){
			if(m.get("user").toString().equals(user) && m.get("exp1").toString().equals(rankList.get(0).get("exp1").toString())){
				rank.put("exp1", m.get("rank").toString());
				break;
			}
		}
		for(HashMap m : exp2){
			if(m.get("user").toString().equals(user) && m.get("exp2").toString().equals(rankList.get(0).get("exp2").toString())){
				rank.put("exp2", m.get("rank").toString());
				break;
			}
		}
		for(HashMap m : lang){
			if(m.get("user").toString().equals(user) && m.get("lang").toString().equals(rankList.get(0).get("lang").toString())){
				rank.put("lang", m.get("rank").toString());
				if(m.get("lang").toString().equals("0")){
					rank.put("lang", "0");
				}
				break;
			}
		}
		for(HashMap m : sum){
			if(m.get("user").toString().equals(user) && m.get("sum").toString().equals(rankList.get(0).get("sum").toString())){
				rank.put("sum", m.get("rank").toString());
				break;
			}
		}
		ss.close();
		return rank;
	}
	
	// rankData
	public HashMap rankData(HashMap rank, List<HashMap> list, String type, String user){
		for(HashMap m : list){
			if(m.get("user").toString().equals(user)){
				rank.put(type, m.get("rank").toString());
			}
		}
		return rank;
	}

	// 백분위
	public HashMap hund(HashMap rank, int pk, int pm, int pe, int ph, int px1, int px2, int pf, int ps) {
		HashMap map = new HashMap();
		int kor = Integer.parseInt(rank.get("kor").toString());
		int math = Integer.parseInt(rank.get("math").toString());
		int eng = Integer.parseInt(rank.get("eng").toString());
		int his = Integer.parseInt(rank.get("his").toString());
		int exp1 = Integer.parseInt(rank.get("exp1").toString());
		int exp2 = Integer.parseInt(rank.get("exp2").toString());
		int lang = Integer.parseInt(rank.get("lang").toString());
		int sum = Integer.parseInt(rank.get("sum").toString());
		double kor2 = 100 - kor*100.0/pk;
		double math2 = 100 - math*100.0/pm;
		double eng2 = 100 - eng*100.0/pe;
		double his2 = 100 - his*100.0/ph;
		double exp12 = 100 - exp1*100.0/px1;
		double exp22 = 100 - exp2*100.0/px2;
		double lang2 = 0.0;
		if(pf != 0){
			lang2 = 100 - lang*100.0/pf;
		} else {
			lang2 = 0;
		}
		double sum2 = 100 - sum*100.0/ps;
		map.put("kor", kor2);
		map.put("math", math2);
		map.put("eng", eng2);
		map.put("his", his2);
		map.put("exp1", exp12);
		map.put("exp2", exp22);
		map.put("lang", lang2);
		map.put("sum", sum2);
		if(kor == 1){
			map.put("kor", 100);
		}
		if(math == 1){
			map.put("math", 100);
		}
		if(eng == 1){
			map.put("eng", 100);
		}
		if(his == 1){
			map.put("his", 100);
		}
		if(exp1 == 1){
			map.put("exp1", 100);
		}
		if(exp2 == 1){
			map.put("exp2", 100);
		}
		if(lang == 1){
			map.put("lang", 100);
		}
		if(sum == 1){
			map.put("sum", 100);
		}
		return map;
	}

	// 국어 응시자수
	public int pk(String rankDay, String grade) {
		SqlSession ss = fac.openSession();
		HashMap<String, String> map = new HashMap<>();
		map.put("rankDay", rankDay);
		map.put("grade", grade);
		int n = ss.selectOne("rank.countKor", map);
		ss.close();
		return n;
	}
	// 수학 응시자수
	public int pm(String rankDay, String grade, String mathType) {
		SqlSession ss = fac.openSession();
		HashMap<String, String> map = new HashMap<>();
		map.put("rankDay", rankDay);
		map.put("grade", grade);
		map.put("mathType", mathType);
		int n = ss.selectOne("rank.countMath", map);
		ss.close();
		return n;
	}
	// 영어 응시자수
	public int pe(String rankDay, String grade) {
		SqlSession ss = fac.openSession();
		HashMap<String, String> map = new HashMap<>();
		map.put("rankDay", rankDay);
		map.put("grade", grade);
		int n = ss.selectOne("rank.countEng", map);
		ss.close();
		return n;
	}
	// 한국사 응시자수
	public int ph(String rankDay, String grade) {
		SqlSession ss = fac.openSession();
		HashMap<String, String> map = new HashMap<>();
		map.put("rankDay", rankDay);
		map.put("grade", grade);
		int n = ss.selectOne("rank.countHis", map);
		ss.close();
		return n;
	}
	// 탐구1 응시자수
	public int px1(String rankDay, String grade, String expType1) {
		SqlSession ss = fac.openSession();
		HashMap<String, String> map = new HashMap<>();
		map.put("rankDay", rankDay);
		map.put("grade", grade);
		map.put("expType1", expType1);
		int n = ss.selectOne("rank.countExp1", map);
		ss.close();
		return n;
	}
	// 탐구2 응시자수
	public int px2(String rankDay, String grade, String expType2) {
		SqlSession ss = fac.openSession();
		HashMap<String, String> map = new HashMap<>();
		map.put("rankDay", rankDay);
		map.put("grade", grade);
		map.put("expType2", expType2);
		int n = ss.selectOne("rank.countExp2", map);
		ss.close();
		return n;
	}
	// 제2외국어 응시자수
	public int pf(String rankDay, String grade, String langType) {
		SqlSession ss = fac.openSession();
		HashMap<String, String> map = new HashMap<>();
		map.put("rankDay", rankDay);
		map.put("grade", grade);
		map.put("langType", langType);
		int n = ss.selectOne("rank.countLang", map);
		if(langType.equals("선택안함")){
			n = 0;
		}
		ss.close();
		return n;
	}
	// 합계 응시자수
	public int ps(String rankDay, String grade, String type) {
		SqlSession ss = fac.openSession();
		HashMap<String, String> map = new HashMap<>();
		map.put("rankDay", rankDay);
		map.put("grade", grade);
		map.put("type", type);
		int n = ss.selectOne("rank.countSum", map);
		ss.close();
		return n;
	}
}
