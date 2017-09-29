package search.service;

import java.util.*;

import org.apache.ibatis.session.*;
import org.springframework.beans.factory.annotation.*;
import org.springframework.stereotype.*;

@Component
public class SearchService {
	@Autowired
	SqlSessionFactory fac;
	
	// search both
	public List<HashMap> selectBoth(List<HashMap> wordList, String subject, int page) {
		SqlSession ss = fac.openSession();
		List<HashMap> li = new Vector<>();
		for(HashMap m : wordList){
			HashMap map = new HashMap<>();
			map.put("word", "%"+m.get("num")+"%");
			map.put("subject", "%"+subject+"%");
			map.put("page", (page-1)*12);
//			List<HashMap> list = ss.selectList("search.searchrecord", map);
			List<HashMap> list = ss.selectList("search.searchinterview", map);
			for(int i=0; i<list.size(); i++){
				HashMap m2 = list.get(i);
				HashMap mm = ss.selectOne("school.word2", m2.get("school").toString());
				m2.put("schoolName", mm.get("name"));
				String content1 = m2.get("content1").toString();
				String content2 = m2.get("content2").toString();
				content1 = content1.replace(">", "&gt");
				content1 = content1.replace("<", "&lt");
				content2 = content2.replace(">", "&gt");
				content2 = content2.replace("<", "&lt");
				content1 = content1.replace("&ltbr&gt", "&nbsp;");
				content2 = content2.replace("&ltbr&gt", "&nbsp;");
				m2.put("content1", content1);
				m2.put("content2", content2);
				list.set(i, m2);
				li.add(list.get(i));
			}
		}
		ss.close();
		return li;
	}
	
	// �˻� ������
	public int searchPageBoth(List<HashMap> wordList, String subject) {
		SqlSession ss = fac.openSession();
		int count = 0;
		for(HashMap m : wordList){
			HashMap map = new HashMap();
			map.put("word", "%"+m.get("num")+"%");
			map.put("subject", "%"+subject+"%");
//			int n = ss.selectOne("search.countrecord", "%"+m.get("num")+"%");
			int n = ss.selectOne("search.countinterview", map);
			count += n;
		}
		ss.close();
		return count%12 == 0 ? count/12 : count/12+1;
	}

	// �˻�
	public List<HashMap> selectSchool(List<HashMap> wordList, int page) {
		SqlSession ss = fac.openSession();
		List<HashMap> li = new Vector<>();
		for(HashMap m : wordList){
			HashMap map = new HashMap<>();
			map.put("word", "%"+m.get("num")+"%");
			map.put("page", (page-1)*12);
//			List<HashMap> list = ss.selectList("search.searchrecord", map);
			List<HashMap> list = ss.selectList("search.searchinterview2", map);
			for(int i=0; i<list.size(); i++){
				HashMap m2 = list.get(i);
				HashMap mm = ss.selectOne("school.word2", m2.get("school").toString());
				m2.put("schoolName", mm.get("name"));
				String content1 = m2.get("content1").toString();
				String content2 = m2.get("content2").toString();
				content1 = content1.replace(">", "&gt");
				content1 = content1.replace("<", "&lt");
				content2 = content2.replace(">", "&gt");
				content2 = content2.replace("<", "&lt");
				content1 = content1.replace("&ltbr&gt", "&nbsp;");
				content2 = content2.replace("&ltbr&gt", "&nbsp;");
				m2.put("content1", content1);
				m2.put("content2", content2);
				list.set(i, m2);
				li.add(list.get(i));
			}
		}
		ss.close();
		return li;
	}

	// �˻� ������
	public int searchPageSchool(List<HashMap> wordList) {
		SqlSession ss = fac.openSession();
		int count = 0;
		for(HashMap m : wordList){
//			int n = ss.selectOne("search.countrecord", "%"+m.get("num")+"%");
			int n = ss.selectOne("search.countinterview2", "%"+m.get("num")+"%");
			count += n;
		}
		ss.close();
		return count%12 == 0 ? count/12 : count/12+1;
	}

	// �˻�
	public List<HashMap> selectSubject(String subject, int page) {
		SqlSession ss = fac.openSession();
		HashMap map = new HashMap();
		map.put("subject", "%"+subject+"%");
		map.put("page", (page-1)*12);
		List<HashMap> li = new Vector<>();
		List<HashMap> list = ss.selectList("search.searchinterview3", map);
		for(int i=0; i<list.size(); i++){
			HashMap m2 = list.get(i);
			HashMap mm = ss.selectOne("school.word2", m2.get("school").toString());
			m2.put("schoolName", mm.get("name"));
			String content1 = m2.get("content1").toString();
			String content2 = m2.get("content2").toString();
			content1 = content1.replace(">", "&gt");
			content1 = content1.replace("<", "&lt");
			content2 = content2.replace(">", "&gt");
			content2 = content2.replace("<", "&lt");
			content1 = content1.replace("&ltbr&gt", "&nbsp;");
			content2 = content2.replace("&ltbr&gt", "&nbsp;");
			m2.put("content1", content1);
			m2.put("content2", content2);
			list.set(i, m2);
			li.add(list.get(i));
		}
		ss.close();
		return li;
	}
	
	// �˻� ������
	public int searchPageSubject(String subject) {
		SqlSession ss = fac.openSession();
		int count = ss.selectOne("search.countinterview3", "%"+subject+"%");
		ss.close();
		return count%12 == 0 ? count/12 : count/12+1;
	}
	
	// �󼼰˻�
	public List<HashMap> searchList2Both(List<HashMap> wordList, String subject, int page, String type) {
		SqlSession ss = fac.openSession();
		HashMap map = new HashMap();
		List<HashMap> li = new Vector<>();
		for(HashMap m : wordList){
			map.put("word", "%"+m.get("num")+"%");
			map.put("subject", "%"+subject+"%");
			map.put("page", (page-1)*12);
			List<HashMap> list = ss.selectList("search.search"+type, map);
			for(int i=0; i<list.size(); i++){
				HashMap m2 = list.get(i);
				HashMap mm = ss.selectOne("school.word2", m2.get("school").toString());
				m2.put("schoolName", mm.get("name"));
				String content1 = m2.get("content1").toString();
				String content2 = m2.get("content2").toString();
				content1 = content1.replace(">", "&gt");
				content1 = content1.replace("<", "&lt");
				content2 = content2.replace(">", "&gt");
				content2 = content2.replace("<", "&lt");
				content1 = content1.replace("&ltbr&gt", "&nbsp;");
				content2 = content2.replace("&ltbr&gt", "&nbsp;");
				m2.put("content1", content1);
				m2.put("content2", content2);
				list.set(i, m2);
				li.add(list.get(i));
			}
		}
		ss.close();
		return li;
	}

	// �󼼰˻� ������
	public int searchPage2Both(List<HashMap> wordList, String subject, String type) {
		SqlSession ss = fac.openSession();
		int count = 0;
		for(HashMap m : wordList){
			HashMap<String, String> map = new HashMap<>();
			map.put("word", "%"+m.get("num")+"%");
			map.put("subject", "%"+subject+"%");
			int n = ss.selectOne("search.count"+type, map);
			count += n;
		}
		ss.close();
		return count%12 == 0 ? count/12 : count/12+1;
	}

	// �󼼰˻�
	public List<HashMap> searchList2School(List<HashMap> wordList, int page, String type) {
		SqlSession ss = fac.openSession();
		HashMap map = new HashMap();
		List<HashMap> li = new Vector<>();
		for(HashMap m : wordList){
			map.put("word", "%"+m.get("num")+"%");
			map.put("page", (page-1)*12);
			List<HashMap> list = ss.selectList("search.search"+type+"2", map);
			for(int i=0; i<list.size(); i++){
				HashMap m2 = list.get(i);
				HashMap mm = ss.selectOne("school.word2", m2.get("school").toString());
				m2.put("schoolName", mm.get("name"));
				String content1 = m2.get("content1").toString();
				String content2 = m2.get("content2").toString();
				content1 = content1.replace(">", "&gt");
				content1 = content1.replace("<", "&lt");
				content2 = content2.replace(">", "&gt");
				content2 = content2.replace("<", "&lt");
				content1 = content1.replace("&ltbr&gt", "&nbsp;");
				content2 = content2.replace("&ltbr&gt", "&nbsp;");
				m2.put("content1", content1);
				m2.put("content2", content2);
				list.set(i, m2);
				li.add(list.get(i));
			}
		}
		ss.close();
		return li;
	}

	// �󼼰˻� ������
	public int searchPage2School(List<HashMap> wordList, String type) {
		SqlSession ss = fac.openSession();
		int count = 0;
		for(HashMap m : wordList){
			HashMap<String, String> map = new HashMap<>();
			map.put("word", "%"+m.get("num")+"%");
			int n = ss.selectOne("search.count"+type+"2", map);
			count += n;
		}
		ss.close();
		return count%12 == 0 ? count/12 : count/12+1;
	}

	// �󼼰˻�
	public List<HashMap> searchList2Subject(String subject, int page, String type) {
		SqlSession ss = fac.openSession();
		HashMap map = new HashMap();
		map.put("subject", "%"+subject+"%");
		map.put("page", (page-1)*12);
		List<HashMap> li = new Vector<>();
		List<HashMap> list = ss.selectList("search.search"+type+"3", map);
		for(int i=0; i<list.size(); i++){
			HashMap m2 = list.get(i);
			HashMap mm = ss.selectOne("school.word2", m2.get("school").toString());
			m2.put("schoolName", mm.get("name"));
			String content1 = m2.get("content1").toString();
			String content2 = m2.get("content2").toString();
			content1 = content1.replace(">", "&gt");
			content1 = content1.replace("<", "&lt");
			content2 = content2.replace(">", "&gt");
			content2 = content2.replace("<", "&lt");
			content1 = content1.replace("&ltbr&gt", "&nbsp;");
			content2 = content2.replace("&ltbr&gt", "&nbsp;");
			m2.put("content1", content1);
			m2.put("content2", content2);
			list.set(i, m2);
			li.add(list.get(i));
		}
		ss.close();
		return li;
	}
	
	// �󼼰˻� ������
	public int searchPage2Subject(String subject, String type) {
		SqlSession ss = fac.openSession();
		int count = ss.selectOne("search.count"+type+"3", "%"+subject+"%");
		ss.close();
		return count%12 == 0 ? count/12 : count/12+1;
	}

	// ���� ��ȯ
	public List<HashMap> word(String word) {
		SqlSession ss = fac.openSession();
		List<HashMap> list = ss.selectList("search.word3", "%"+word+"%");
		ss.close();
		return list;
	}
	
	// �˻� �ܾ� ����
	public String wordSearchChange(String word2) {
		word2 = word2.toUpperCase();
		if(word2.indexOf("����") >= 0){
			word2 = word2.replace("����", "������");
		}
		if(word2.indexOf("�ܴ�") >= 0){
			word2 = word2.replace("�ܴ�", "�ܱ����");
		}
		if(word2.indexOf("����") >= 0){
			word2 = word2.replace("����", "���ڴ�");
		}
		if(word2.indexOf("����") >= 0){
			word2 = word2.replace("����", "������");
		}
		if(word2.indexOf("����") >= 0){
			word2 = word2.replace("����", "������");
		}
		if(word2.equals("��ü��")){
			word2 = word2.replace("��ü��", "�ѱ�ü�����б�");
		}
		if(word2.equals("�Ǵ�")){
			word2 = word2.replace("�Ǵ�", "�Ǳ����б�");
		}
		if(word2.equals("���")){
			word2 = word2.replace("���", "������б�");
		}
		if(word2.equals("����")){
			word2 = word2.replace("����", "���հ����б�");
		}
		if(word2.equals("����")){
			word2 = word2.replace("����", "�����ڴ��б�");
		}
		if(word2.equals("����")){
			word2 = word2.replace("����", "�������б�");
		}
		if(word2.equals("����")){
			word2 = word2.replace("����", "��������б�");
		}
		if(word2.equals("�̴�")){
			word2 = word2.replace("�̴�", "��ȭ���ڴ��б�");
		}
		if(word2.equals("�Ѵ�")){
			word2 = word2.replace("�Ѵ�", "�Ѿ��");
		}
		if(word2.equals("ȫ��")){
			word2 = word2.replace("ȫ��", "ȫ�ʹ�");
		}
		if(word2.equals("ī�̽�Ʈ")){
			word2 = word2.replace("ī�̽�Ʈ", "KAIST");
		}
		if(word2.equals("������Ʈ")){
			word2 = word2.replace("������Ʈ", "DGIST");
		}
		if(word2.equals("����Ʈ")){
			word2 = word2.replace("����Ʈ", "GIST");
		}
		if(word2.equals("���Ͻ�Ʈ")){
			word2 = word2.replace("���Ͻ�Ʈ", "UNIST");
		}
		if(word2.equals("������")){
			word2 = word2.replace("������", "POSTECH");
		}
		if(word2.equals("����")){
			word2 = word2.replace("����", "��������б�");
		}
		if(word2.equals("�ɴ�")){
			word2 = word2.replace("�ɴ�", "�ɵ��״��б�");
		}
		if(word2.equals("�ػ�")){
			word2 = word2.replace("�ػ�", "�ر�����б�");
		}
		if(word2.equals("DIMA")){
			word2 = word2.replace("DIMA", "���ƹ�ۿ������б�");
		}
		if(word2.equals("�ѿ���")){
			word2 = word2.replace("�ѿ���", "�ѱ����������б�");
		}
		if(word2.equals("���ƹ�۴�")){
			word2 = word2.replace("���ƹ�۴�", "���ƹ�ۿ������б�");
		}
		return word2;
	}
}
