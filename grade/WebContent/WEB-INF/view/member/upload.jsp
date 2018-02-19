<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<!doctype html>
<html>
    <head>
    	<c:import url="/WEB-INF/view/main/head.jsp"/>
    </head>
     
    <body>
        <div id="wrapper">
            <div class="student_add">
                <header class="sub_header">
                    <div class="hmenubar">
                        <img src="/img/hmenubar.png">
                    </div>
                    <c:import url="/WEB-INF/view/main/login.jsp"/>
                </header>
                <c:import url="/WEB-INF/view/main/side.jsp"/>
                <header class="main_header">
                     <div class="logo">
                         <img src="/img/logo.png" onclick="location.href='/'">
                     </div>
                </header>
                <div class="infomation_wrap">
                    <div class="inner">
                        <div class="infomation_txt_wrap">
                            <div class="infomation_txt">
                                ※대학교는 하나만 올리셔도 상관없습니다 , 최대 6개 까지 등록 가능합니다
                            </div>
                            <div class="infomation_txt">
                                ※합격증 미등록시 학생부는 올릴 수 있으나 현재 재학중인 대학교만 인증가능하고, 합격 인증은 할 수 없습니다 <br>
                                &nbsp;&nbsp;( 합격인증 가능시 - 200p , 합격인증이 불가능할시 - 100p)
                            </div>
                            <div class="infomation_txt">
                                ※정보를 다 입력하신 뒤 오른쪽 상단에 등록하기 버튼을 클릭하신후 하단에 있는 등록버튼을 누르셔야 등록이 완료됩니다
                            </div>
                            <div class="confirm_btn">
                                등록하기
                            </div>
                        </div>
                        <div class="detail_item_slider_wrap">
                            <div class="detail_item_slider">
                                <div class="di_slider_inner">
                                    <div class="detail_item">
                                        <div class="school_logo">
                                            <select id="addr">
                                                <option value="choose">시,도 선택</option>
                                                <option>서울</option>
                                                <option>인천</option>
                                                <option>경기</option>
                                            </select>
                                            <select id="school">
                                                <option values="choose">대학선택</option>
                                                <option>서울대</option>
                                                <option>연세대</option>
                                                <option>고려대</option>
                                            </select>
                                            <input type="text" placeholder="입학전형 입력">
                                        </div>
                                        <div class="department">
                                            <input type="text" placeholder="학과입력" id="subject">
                                        </div>
                                        <div class="pass">
                                            <div class="tit">합격여부</div>
                                            <div class="radio">
                                                <input type="radio" id="yes" name="pass">
                                                <label for="yes">합격</label>
                                            </div>
                                            <div class="radio">
                                                <input type="radio" id="no" name="pass">
                                                <label for="no">불합격</label>
                                            </div>
                                        </div>
                                        <div class="add_file">
                                            <input class="upload_name" value="합격증or재학증명서 등록" disabled="disabled">
                                            <label for="ex_filename">등록</label>
                                            <input type="file" id="ex_filename" class="upload_hidden">
                                        </div>
                                        <div class="pass">
                                            <div class="tit">정/수시</div>
                                            <div class="radio">
                                                <input type="radio" id="jung" name="pass1">
                                                <label for="jung">정시</label>
                                            </div>
                                            <div class="radio">
                                                <input type="radio" id="su" name="pass1">
                                                <label for="su">수시</label>
                                            </div>
                                        </div>
                                        <div class="delete_btn_wrap" onclick="deleteSchool(${num})">
                                           <div class="delete_btn">삭제하기</div>
                                        </div>
                                    </div>
                                    <div class="detail_item">
                                        <div class="plus_txt">
                                            대학 추가하기
                                        </div>
                                        <div class="plus_btn">
                                            <img src="/img/student_view/plus.png">
                                        </div>
                                    </div>
                                    <div class="detail_item">
                                        <div class="plus_txt">
                                            대학 추가하기
                                        </div>
                                        <div class="plus_btn">
                                            <img src="/img/student_view/plus.png">
                                        </div>
                                    </div>
                                    <div class="detail_item">
                                        <div class="plus_txt">
                                            대학 추가하기
                                        </div>
                                        <div class="plus_btn">
                                            <img src="/img/student_view/plus.png">
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="di_arrow di_arrow_prev">
                                <img src="/img/student_view/arrow_prev.png">
                            </div>
                            <div class="di_arrow di_arrow_next">
                                <img src="/img/student_view/arrow_next.png">
                            </div>
                        </div>
                    </div>
                </div>
                <div class="infomation_wrap infomation_wrap1">
                    <div class="inner">
                        <div class="infomation_txt_wrap">
                            <div class="infomation_txt">
                                ※ 정시지원자는 수능성적 필수입력
                            </div>
                            <div class="infomation_txt">
                                ※ 수시지원자는 수능성적 선택입력(기억나는것만 기록 하여도 됩니다.)
                            </div>
                            <div class="confirm_btn">
                                등록하기
                            </div>
                        </div>
                        <div class="table_wrap">
                            <div class="inner">
                                <div class="tit_sel">
                                    <select>
                                        <option selected>계열선택</option>
                                        <option>문과</option>
                                        <option>이과</option>
                                        <option>예체능</option>
                                    </select>
                                    <div class="txt">
                                        (응시계열을 확인하세요!)
                                    </div>
                                </div>
                                <div class="table">
                                    <div class="theader">
                                        <div class="tit_wrap">
                                            <div class="tit">
                                                구분
                                            </div>
                                        </div>
                                        <div class="tit_wrap">
                                            <div class="tit">
                                                국어
                                            </div>
                                        </div>
                                        <div class="tit_wrap">
                                            <div class="tit tit1">
                                                수학
                                            </div>
                                            <div class="tit tit1">
                                                <select>
                                                    <option selected>선택</option>
                                                    <option>수학1</option>
                                                    <option>수학2</option>
                                                </select>
                                            </div>
                                        </div>
                                        <div class="tit_wrap">
                                            <div class="tit">
                                                영어
                                            </div>
                                        </div>
                                        <div class="tit_wrap">
                                            <div class="tit">
                                                한국사
                                            </div>
                                        </div>
                                        <div class="tit_wrap tit_wrap1">
                                            <div class="tit tit1">
                                                <select>
                                                    <option selected>탐구영역 선택</option>
                                                </select>
                                            </div>
                                            <div class="tit tit1 tit2">
                                                <select>
                                                    <option selected>선택</option>
                                                </select>
                                            </div>
                                            <div class="tit tit1 tit2">
                                                <select>
                                                    <option selected>선택</option>
                                                </select>
                                            </div>
                                        </div>
                                        <div class="tit_wrap">
                                            <div class="tit">
                                                제2외국어
                                            </div>
                                        </div>
                                    </div>
                                    <div class="tbody">
                                        <div class="tcontents">
                                            <div class="content">
                                                <div class="txt">
                                                    원점수
                                                </div>
                                            </div>
                                            <div class="content">
                                                <input class="white" type="text">
                                            </div>
                                            <div class="content">
                                                <input class="pink" type="text">
                                            </div>
                                            <div class="content">
                                                <input class="pink" type="text">
                                            </div>
                                            <div class="content">
                                                <input class="pink" type="text">
                                            </div>
                                            <div class="content">
                                                <input class="pink" type="text">
                                            </div>
                                            <div class="content">
                                                <input class="pink" type="text">
                                            </div>
                                            <div class="content">
                                                <input class="pink" type="text">
                                            </div>
                                        </div>
                                        <div class="tcontents">
                                            <div class="content">
                                                <div class="txt">
                                                    표준점수
                                                </div>
                                            </div>
                                            <div class="content">
                                                <input class="white" type="text">
                                            </div>
                                            <div class="content">
                                                <input class="pink" type="text">
                                            </div>
                                            <div class="content">
                                                <input class="pink" type="text">
                                            </div>
                                            <div class="content">
                                                <input class="pink" type="text">
                                            </div>
                                            <div class="content">
                                                <input class="pink" type="text">
                                            </div>
                                            <div class="content">
                                                <input class="pink" type="text">
                                            </div>
                                            <div class="content">
                                                <input class="pink" type="text">
                                            </div>
                                        </div>
                                        <div class="tcontents">
                                            <div class="content">
                                                <div class="txt">
                                                    백분위
                                                </div>
                                            </div>
                                            <div class="content">
                                                <input class="white" type="text">
                                            </div>
                                            <div class="content">
                                                <input class="pink" type="text">
                                            </div>
                                            <div class="content">
                                                <input class="pink" type="text">
                                            </div>
                                            <div class="content">
                                                <input class="pink" type="text">
                                            </div>
                                            <div class="content">
                                                <input class="pink" type="text">
                                            </div>
                                            <div class="content">
                                                <input class="pink" type="text">
                                            </div>
                                            <div class="content">
                                                <input class="pink" type="text">
                                            </div>
                                        </div>
                                        <div class="tcontents">
                                            <div class="content">
                                                <div class="txt">
                                                    등급
                                                </div>
                                            </div>
                                            <div class="content">
                                                <input class="white" type="text">
                                            </div>
                                            <div class="content">
                                                <input class="pink" type="text">
                                            </div>
                                            <div class="content">
                                                <input class="white" type="text">
                                            </div>
                                            <div class="content">
                                                <input class="white" type="text">
                                            </div>
                                            <div class="content">
                                                <input class="pink" type="text">
                                            </div>
                                            <div class="content">
                                                <input class="pink" type="text">
                                            </div>
                                            <div class="content">
                                                <input class="pink" type="text">
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="infomation_wrap infomation_wrap1">
                    <div class="inner">
                        <div class="infomation_txt1">
                            ※ 핵심정보는 구매자가 구매해야 보입니다.
                        </div>
                        <div class="confirm_btn">
                            등록하기
                        </div>
                        <div class="detail_info">
                            <div class="detail_info_tit">
                                기본 정보
                            </div>
                            <div class="info">
                                <div class="img">
                                    <img src="/img/student_view/info01.png">
                                </div>
                                <select id="year">
                                    <option value="choose">선택</option>
                                    <option>2017년</option>
                                    <option>2016년</option>
                                    <option>2015년</option>
                                </select>
                                <div class="txt">입학</div>
                            </div>
                            <div class="info">
                                <div class="img">
                                    <img src="/img/student_view/info02.png">
                                </div>
                                <input type="text" placeholder="1" id="grade"> 
                                <div class="txt">등급</div>
                            </div>
                        </div>
                        <div class="detail_boundry"></div>
                        <div class="detail_info">
                            <div class="detail_info_tit">
                                핵심 정보
                            </div>
                            <div class="info">
                                <div class="img">
                                    <img src="/img/student_view/info06.png">
                                </div>
                                <input type="text" placeholder="서울네모고등" id="hschool"> 
                                <div class="txt">학교</div>
                            </div>
                            <div class="info">
                                <div class="img">
                                    <img src="/img/student_view/info04.png">
                                </div>
                                <input type="text" placeholder="1" id="time"> 
                                <div class="txt">시간</div>
                            </div>
                            <div class="info">
                                <div class="img">
                                    <img src="/img/student_view/info03.png">
                                </div>
                                <input type="text" placeholder="1" id="book"> 
                                <div class="txt">권</div>
                            </div>
                            <div class="info">
                                <div class="img">
                                    <img src="/img/student_view/info05.png">
                                </div>
                                <input type="text" placeholder="1" id="awards"> 
                                <div class="txt">개</div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="page_inner">
                    <div class="student_view_txt">
						※학생부 및 자소서는 등록은 최대 50장 까지 가능합니다.(순서대로 올려주세요).
                    </div>
                    <div class="student_view_txt">
						※화질이 좋지 않거나 글씨가 보이지 않을시 입금이 되지 않습니다.
                    </div>
                    <div class="student_view_txt">
						※학생부의 맨 앞장은 개인정보이므로 흐릿하게 보입니다
                    </div>
                    <div class="student_view_txt">
						※자소서를 등록하실 때는 위에 등록한 대학교 자소서만 업로드 가능합니다.
                    </div>
                    <div class="student_view_txt">
						※사진을 다 올리신 뒤 오른쪽 상단에 등록하기 버튼을 클릭하신후 하단에 있는 등록버튼을 누르셔야 등록이 완료됩니다.
                    </div>
                    <div class="student_view_slider_wrap">
                        <div class="confirm_btn" onclick="uploadRecord()">등록하기</div>
                        <div class="sv_tit">
                            <img src="/img/student_view/stu_pic_tit01.png">
                        </div>
                        <div class="student_view_slider">
                            <div class="sv_slider_inner">
                            	<form id="recordForm" action="/member/uploadRecord" enctype="multipard/form-data" method="post">
	                            	<c:forEach var="t" begin="1" end="50">
		                                <div class="sv_slide no_img" id="viewrecord${t }">
		                                    <label for="record${t }">
		                                        <img src="/img/student_add/plus.png">
		                                    </label>
		                                    <input type="file" id="record${t }" name="record${t }" onchange="showImg(this)">
		                                    <div class="txt">${t }P</div>
		                                </div>
	                            	</c:forEach>
                            	</form>
                            </div>
                        </div>
                        <div class="sv_arrow sv_arrow_prev">
                            <img src="/img/student_view/arrow_prev.png">
                        </div>
                        <div class="sv_arrow sv_arrow_next">
                            <img src="/img/student_view/arrow_next.png">
                        </div>
                    </div>
                    <div class="student_view_slider_wrap student_view_slider_wrap1">
                        <div class="confirm_btn" onclick="uploadIntro()">등록하기</div>
                        <div class="sv_tit">
                            <img src="/img/student_view/stu_pic_tit02.png">
                        </div>
                        <div class="student_view_slider">
                            <div class="sv_slider_inner1">
                            	<form id="introForm" action="/member/uploadIntro" enctype="multipard/form-data" method="post">
	                            	<c:forEach var="t" begin="1" end="50">
		                                <div class="sv_slide no_img" id="viewintro${t }">
		                                    <label for="intro${t }">
		                                        <img src="/img/student_add/plus.png">
		                                    </label>
		                                    <input type="file" id="intro${t }" name="intro${t }" onchange="showImg(this)">
		                                    <div class="txt">${t }P</div>
		                                </div>
	                            	</c:forEach>
                            	</form>
                            </div>
                        </div>
                        <div class="sv_arrow sv_arrow_prev1">
                            <img src="/img/student_view/arrow_prev.png">
                        </div>
                        <div class="sv_arrow sv_arrow_next1">
                            <img src="/img/student_view/arrow_next.png">
                        </div>
                        <select id="school_sel">
                            <option value="choose">학교선택</option>
                            <option>학교선택</option>
                            <option>학교선택</option>
                            <option>학교선택</option>
                        </select>
                    </div>
                    <div class="confirm_btn">
                        자소서 추가
                    </div>
                    <div class="btn_wrap m1">
                        <div class="btn left" onclick="history.back()">
                            <div class="txt">취소</div>
                        </div>
                        <div class="btn right" onclick="upload()">
                            <div class="txt">등록</div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </body>
    
    <script>
    	// 항목들 숫자만 입력가능
    	$(document).ready(function(){
    		$("input[id=grade]").keyup(function(event){ 
    			if (!(event.keyCode >=48 && event.keyCode<=57)) {
    				var inputVal = $(this).val();
    				$(this).val(inputVal.replace(/[^0-9]/gi,''));
    			}
    		});
    		$("input[id=book]").keyup(function(event){ 
    			if (!(event.keyCode >=48 && event.keyCode<=57)) {
    				var inputVal = $(this).val();
    				$(this).val(inputVal.replace(/[^0-9]/gi,''));
    			}
    		});
    		$("input[id=time]").keyup(function(event){ 
    			if (!(event.keyCode >=48 && event.keyCode<=57)) {
    				var inputVal = $(this).val();
    				$(this).val(inputVal.replace(/[^0-9]/gi,''));
    			}
    		});
    		$("input[id=awards]").keyup(function(event){ 
    			if (!(event.keyCode >=48 && event.keyCode<=57)) {
    				var inputVal = $(this).val();
    				$(this).val(inputVal.replace(/[^0-9]/gi,''));
    			}
    		});
    	});
    	// 로그인 체크
    	function loginCheck(){
    		if(${login == null}){
    			alert("세션이 만료되었습니다.\n로그인 페이지로 이동합니다.");
    			location.href='/member/login';
    			return false;
    		}
    		return true;
    	}
    	// 학생부 등록
    	var recordNum = 0;
    	function uploadRecord(){
    		if(!loginCheck()){
    			return;
    		}
    		$("#recordForm").ajaxForm({
    			url : "/member/uploadRecord",
    			enctype : "multipart/form-data",
    			success : function(txt){
    				if(txt){
    					alert("등록되었습니다.");
    					recordNum++;
    				} else {
    					alert("등록에 실패하였습니다.\n잠시후 다시 시도해주세요.");
    				}
    			}
    		});
    		$("#recordForm").submit();
    	}
    	// 자소서 등록
    	var introNum = 0;
    	function uploadIntro(){
    		if(!loginCheck()){
    			return;
    		}
    		$("#introForm").ajaxForm({
    			url : "/member/uploadIntro",
    			enctype : "multipart/form-data",
    			success : function(txt){
    				if(txt){
    					alert("등록되었습니다.");
    					introNum++;
    				} else {
    					alert("등록에 실패하였습니다.\n잠시후 다시 시도해주세요.");
    				}
    			}
    		});
    		$("#introForm").submit();
    	}
    	// 전체 등록
    	function upload(){
    		if(!loginCheck()){
    			return;
    		}
    		if(recordNum == 0 || introNum == 0){
    			alert("학생부 또는 자소서를 등록해주세요.");
    			return;
    		}
    		var addr = $("#addr").val();
    		var school = $("#school").val();
    		var subject = $("#subject").val();
    		var year = $("#year").val();
    		var grade = $("#grade").val();
    		var book = $("#book").val();
    		var time = $("#time").val();
    		var awards = $("#awards").val();
    		if(addr == "choose" || school == "choose" || subject == "" || year == "choose" || grade == "" || book == "" || time == "" || awards ==  ""){
    			alert("입력하지 않은 항목이 있습니다.");
    		} else {
	    		$.ajax({
	    			type : "post",
	    			url : "/member/uploadInfo/${login.auto }/"+addr+"/"+school+"/"+subject+"/"+year+"/"+grade+"/"+book+"/"+time+"/"+awards,
	    			async : false,
	    			success : function(txt){
	    				if(txt){
	    					alert("등록되었습니다.");
	    				} else {
	    					alert("등록에 실패하였습니다.\n잠시후 다시 시도해주세요.");
	    				}
	    			}
	    		});
    		}
    	}
    	// 파일 선택시 이미지 미리보기
 		function showImg(input) {
	 		var id = input.id;
	 		var name = input.value;
	 		name = name.substring(name.indexOf('.')+1).toLowerCase();
	 		if(name != "jpg" && name != "png" && name != "gif" && name != "jpeg"){
	 			alert(".jpg / .jpeg / .png / .gif 파일만 등록가능합니다.");
	 		} else {
	 		    if (input.files && input.files[0]) {
	 		        var reader = new FileReader();
	 		        reader.onload = function (e) {
	 		        	$("#view"+id).css("background-image", "url('"+e.target.result+"')");
	 		        	$("#view"+id).css({"background-size" : "100%", "background-position" : "center", "background-repeat" : "no-repeat"});
	 		        }
	 		        reader.readAsDataURL(input.files[0]);
	 		    }
	 		}
 		}
 		// 학생부, 자소서 이전, 다음 클릭
    	$(document).ready(function(){
    		var sn = 0;
    	    $(".sv_arrow_next").click(function(){
    	        sn++;
    	        $(".sv_slider_inner").stop().animate({
    	            left: -222 * sn
    	        });
    	        check(0, sn);
    	        check2(0, sn);
    	    });
    	    $(".sv_arrow_prev").click(function(){
    	        sn--;
    	        $(".sv_slider_inner").stop().animate({
    	            left: -222 * sn
    	        });
    	        if(sn == 0){
    	    		$(".sv_arrow_prev").hide();
    	    	} else if(sn > 0){
    	    		$(".sv_arrow_prev").show();
    	    	}
    	        check(0, sn);
    	        check2(0, sn);
    	    });
    	    
    	    var sn1 = 0;
    	    $(".sv_arrow_next1").click(function(){
    	        sn1++;
    	        $(".sv_slider_inner1").stop().animate({
    	            left: -222 * sn1
    	        });
    	        check(1, sn1);
    	        check2(1, sn1);
    	    });
    	    $(".sv_arrow_prev1").click(function(){
    	        sn1--;
    	        $(".sv_slider_inner1").stop().animate({
    	            left: -222 * sn1
    	        });
    	        check(1, sn1);
    	        check2(1, sn1);
    	    });
    	});
    	// 이전 클릭 체크
    	function check(type, sn){
    		if(type==0){
	    		if(sn == 0){
		    		$(".sv_arrow_prev").hide();
		    	} else if(sn > 0){
		    		$(".sv_arrow_prev").show();
		    	}
    		} else {
    			if(sn == 0){
    	    		$(".sv_arrow_prev1").hide();
    	    	} else if(sn > 0){
    	    		$(".sv_arrow_prev1").show();
    	    	}
    		}
    	}
    	// 다음 클릭 체크
    	function check2(type, sn){
    		var end = 46;
    		if(type==0){
	    		if(sn == end){
		    		$(".sv_arrow_next").hide();
		    	} else if(sn < end){
		    		$(".sv_arrow_next").show();
		    	}
    		} else {
    			if(sn == end){
    	    		$(".sv_arrow_next1").hide();
    	    	} else if(sn < end){
    	    		$(".sv_arrow_next1").show();
    	    	}
    		}
    	}
    </script>
    
</html>