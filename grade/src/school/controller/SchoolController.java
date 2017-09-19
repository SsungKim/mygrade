package school.controller;

import java.text.*;
import java.util.*;

import javax.servlet.http.*;

import org.springframework.beans.factory.annotation.*;
import org.springframework.stereotype.*;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.*;
import org.springframework.web.servlet.*;

import school.service.*;

@Controller
@RequestMapping("/school")
public class SchoolController {
	@Autowired
	SchoolService ss;

	@RequestMapping("")
	public ModelAndView school(HttpSession session){
		ModelAndView mav = new ModelAndView("/school/school.jsp");
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy");
		String s = sdf.format(System.currentTimeMillis());
		int year = Integer.parseInt(s);
		mav.addObject("year", year);
		return mav;
	}
	
	// 대학추가
	@RequestMapping("/addSchool/{num}")
	@ResponseBody
	public ModelAndView addSchool(@PathVariable(name="num")String num){
		ModelAndView mav = new ModelAndView("/school/addSchool.jsp");
		mav.addObject("num", num);
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy");
		String s = sdf.format(System.currentTimeMillis());
		int year = Integer.parseInt(s);
		mav.addObject("year", year);
		return mav;
	}
	
	// 대학삭제
	@RequestMapping("/deleteSchool")
	@ResponseBody
	public ModelAndView deleteSchool(){
		ModelAndView mav = new ModelAndView("/school/deleteSchool.jsp");
		return mav;
	}
	
	// 대학 db 삭제
	@RequestMapping("/deleteSchool2/{user}")
	@ResponseBody
	public boolean deleteSchool2(@PathVariable(name="user")String user){
		return ss.deleteSchool(user);
	}
	
	// 대학 등록
	@RequestMapping("/uploadSchool")
	@ResponseBody
	public int uploadSchool(HttpSession session, @RequestParam(name="addr")String addr, @RequestParam(name="school")String school,
			@RequestParam(name="subject")String subject, @RequestParam(name="year")String year, @RequestParam(name="admission")String admission,
			@RequestParam(name="typical")String typical, @RequestParam(name="hschool")String hschool, @RequestParam(name="pass")String pass,
			@RequestParam(name="type")String type, @RequestParam(name="passData", required=false)MultipartFile file){
		String uuid = "";
		boolean b = true;
		if(file != null){
			uuid = ss.passData(file);
			b = ss.uploadData(session, school, uuid);
		}
		if(b){
			return ss.uploadSchool(session, addr, school, subject, year, admission, typical, hschool, pass, type);
		} else {
			return 1;
		}
	}
	
	// 학교 리스트
	@RequestMapping("/schoolList/{user}")
	@ResponseBody
	public List<HashMap> schoolList(@PathVariable(name="user")String user){
		return ss.schoolList(user);
	}
	
	// 합격증 리스트
	@RequestMapping("/schoolData/{user}")
	@ResponseBody
	public List<HashMap> schoolData(@PathVariable(name="user")String user){
		return ss.schoolData(user);
	}
}
