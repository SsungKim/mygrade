<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<html oncontextmenu='return false' ondragstart='return false' onselectstart='return false'>
    <head>
        <c:import url="/WEB-INF/view/main/head.jsp"/>
    </head>
    <body>
        <div id="wrapper">
            <div class="school_add">
            	<c:import url="/WEB-INF/view/main/side.jsp"/>
                <header class="sub_header">
                    <div class="hmenubar">
                        <img src="/img/hmenubar.png">
                    </div>
                    <c:import url="/WEB-INF/view/main/login.jsp"/>
                </header>
                <div class="main_header">
                    <div class="logo">
                        <img src="/img/logo.png" onclick="location.href='/'">
                    </div>
                </div>
                <div class="container">
                    <div class="page_inner">
                        <div class="school_txt_wrap">
                            <div class="school_txt">
                                <div class="tit">※</div>
                                <div class="txt">
                                    대학교는 하나만 올리셔도 상관없습니다 , 최대 6개 까지 등록 가능합니다
                                </div>
                            </div>
                            <div class="school_txt">
                                <div class="tit">※</div>
                                <div class="txt">
                                    합격증 미등록시 학생부는 올릴 수 있으나 현재 재학중인 대학교만 인증가능하고, 합격 인증은 할 수 없습니다 <br>
                                    ( 합격인증 가능시 - 200p , 합격인증이 불가능할시 - 100p )
                                </div>
                            </div>
                        </div>
                       	<div class="contents" id="schoolContent">
                            <div class="content">
                       		<form action="/school/uploadSchool" method="post" enctype="multipart/form-data" id="schoolForm1">
                                <select id="addr1" name="addr" onchange="schoolChange(this)">
                                    <option value="choose">시,도 선택</option>
                                    <option>서울</option>
                                    <option>인천</option>
                                    <option>대전</option>
                                    <option>대구</option>
                                    <option>광주</option>
                                    <option>울산</option>
                                    <option>부산</option>
                                    <option>세종</option>
                                    <option>경기</option>
                                    <option>강원</option>
                                    <option>충북</option>
                                    <option>충남</option>
                                    <option>경북</option>
                                    <option>경남</option>
                                    <option>전북</option>
                                    <option>전남</option>
                                    <option>제주</option>
                                </select>
                                <select id="school1" name="school">
                                    <option value="choose">대학선택</option>
                                </select>
                                <input type="text" placeholder="학과입력" id="subject1" name="subject">
                                <select id="year1" name="year">
                                    <option value="choose">입학년도 선택</option>
                                    <c:forEach var="t" begin="0" end="4">
                                    	<option>${year - t }년</option>
                                    </c:forEach>
                                </select>
                                <input type="text" placeholder="입학전형 입력" id="admission1" name="admission">
                                <input type="text" placeholder="전형명 입력" id="typical1" name="typical">
                                <div class="hschool">
                                    <input type="text" placeholder="고등학교 입력" id="hschool1" name="hschool">
                                    <div class="txt">고등학교</div>
                                </div>
                                <div class="pass">
                                    <div class="tit">합격여부</div>
                                    <div class="radio">
                                        <input type="radio" id="passY1" name="pass" value="합격">
                                        <label for="passY1">합격</label>
                                    </div>
                                    <div class="radio">
                                        <input type="radio" id="passN1" name="pass" value="불합격">
                                        <label for="passN1">불합격</label>
                                    </div>
                                </div>
                                <div class="add_file">
                                    <input class="upload_name" value="합격증or재학증명서 등록" disabled="disabled" id="dataName1">
                                    <label for="passData1">등록</label>
                                    <input type="file" id="passData1" class="upload_hidden" name="passData" onchange="dataChange(this)">
                                </div>
                                <div class="pass">
                                    <div class="tit">정/수시</div>
                                    <div class="radio">
                                        <input type="radio" id="typeY1" name="type" value="정시">
                                        <label for="typeY1">정시</label>
                                    </div>
                                    <div class="radio">
                                        <input type="radio" id="typeN1" name="type" value="수시">
                                        <label for="typeN1">수시</label>
                                    </div>
                                </div>
                                <div class="clear_btn">
                                    <img src="/img/school/btn01.png" style="display: none; ">
                                </div>
                            </form>
                            </div>
	                        <div class="content" id="addSchool">
                        		<div class="center_txt">대학 추가하기</div>
                        		<div class="plus">
                        			<img src="/img/student_add/plus.png" onclick="addSchool()"/>
                        		</div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="sv_btn_wrap">
                    <div class="sv_btn" onclick="history.back()">
                        <img src="/img/student_add/btn01.png">
                    </div>
                    <div class="sv_btn" onclick="uploadSchool()">
                        <img src="/img/student_add/btn02.png">
                    </div>
                </div>
            </div>
            <footer>
            	<c:import url="/WEB-INF/view/main/footer.jsp"/>
            </footer>
        </div>
    </body>
</html>

<script>
	//로그인 체크
	function loginCheck(){
		if(${login == null}){
			alert("세션이 만료되었습니다.\n로그인 페이지로 이동합니다.");
			location.href='/member/login';
			return false;
		}
		return true;
	}
	//대학 지역 선택
	function schoolChange(elem){
		var id = elem.id;
		id = id.substring(id.indexOf("r")+1);
		var addr = $("#addr"+id).val();
		$.ajax({
			type : "post",
			url : "/university/"+addr,
			async : false,
			success : function(txt){
				$("#school"+id).html(txt);
			}
		});
	}
	var schoolNum = 1;
	// 학교 추가
	function addSchool(){
		schoolNum++;
		$.ajax({
			type : "post",
			url : "/school/addSchool/"+schoolNum,
			async : false,
			success : function(txt){
				$("#addSchool").remove();
				$("#schoolContent").append(txt);
				if(schoolNum == 6){
					$("#addSchool").remove();
					return;
				}
				$.ajax({
					type : "post",
					url : "/school/deleteSchool",
					async : false,
					success : function(txt){
						$("#schoolContent").append(txt);
					}
				});
			}
		});
	}
	//학교 삭제
	function deleteSchool(num){
		if(schoolNum != num){
			alert("마지막 항목부터 삭제해주세요.");
			return;
		}
		$("#schoolDiv"+num).remove();
		if(schoolNum == 6){
			$.ajax({
				type : "post",
				url : "/school/deleteSchool",
				async : false,
				success : function(txt){
					$("#schoolContent").append(txt);
				}
			});
		}
		schoolNum--;
	}
	// 합격증 등록
	function dataChange(input){
		var id = input.id;
		id = id.substring(id.lastIndexOf("a")+1);
 		var name = input.value;
 		name = name.substring(name.lastIndexOf("\\")+1);
 		$("#dataName"+id).val(name);
	}
	// 학교 최종 등록
	var uploadCount = 0;
	var successSchool = new Array();
	var failSchool = new Array();
	function uploadSchool(){
		loginCheck();
		for(var i=1; i<=schoolNum; i++){
			var addr = $("#addr"+i).val();
			var school = $("#school"+i).val();
			var subject = $("#subject"+i).val();
			var year = $("#year"+i).val();
			var admission = $("#admission"+i).val();
			var typical = $("#typical"+i).val();
			var hschool = $("#hschool"+i).val();
			var pass = $("#passY"+i).prop("checked") ? "합격" : $("#passN"+i).prop("checked") ? "불합격" : false;
			var type = $("#typeY"+i).prop("checked") ? "정시" : $("#typeN"+i).prop("checked") ? "수시" : false;
			if(addr == "choose" || school == "choose" || subject == "" || year == "choose" || admission == "" || typical == "" ||
					hschool == "" || !pass || !type){
				alert("입력하지 않은 항목이 있습니다.");
				return;
			}
		}
		$.ajax({
			type : "post",
			url : "/school/deleteSchool2/${login.auto }",
			async : false,
			success : function(txt){
				if(txt){
					for(var i=1; i<=schoolNum; i++){
						$("#schoolForm"+i).ajaxForm({
			       			url : "/school/uploadSchool",
			       			enctype : "multipart/form-data",
			       			async : false,
			       			success : function(txt){
			       				if(txt == 0){
			       					successSchool[successSchool.length] = i;
			       				} else if(txt == 1){
			       					alert("등록에 실패하였습니다.\n잠시후 다시 시도해주세요.");
			       					return;
			       				} else {
			       					failSchool[failSchool.length] = i;
			       				}
			       			}
			       		});
			       		$("#schoolForm"+i).submit();
					}
					if(successSchool.length + failSchool.length == schoolNum){
						alert(successSchool+"번째 학교 등록완료.\n"+failSchool+"번째 학교 중복으로 등록실패");
						location.href="/member/info";
					} else {
						alert("등록에 실패하였습니다.\n잠시후 다시 시도해주세요.");
					}
				} else {
					alert("등록된 학교가 없습니다.");
				}
			}
		});
	}
	// 학교 리스트
	var schoolList;
	$(document).ready(function(){
		$.ajax({
			type : "post",
			url : "/school/schoolList/${login.auto }",
			async : false,
			success : function(txt){
				schoolList = txt;
				for(var i=0; i<schoolList.length-1; i++){
					addSchool();
				}
				for(var i=1; i<=schoolList.length; i++){
					$("#addr"+i).val(schoolList[i-1].addr);
					var school = "<option value='"+schoolList[i-1].school+"'>"+schoolList[i-1].schoolName+"</option>";
					$("#school"+i).html(school);
					$("#subject"+i).val(schoolList[i-1].subject);
					$("#year"+i).val(schoolList[i-1].year);
					$("#admission"+i).val(schoolList[i-1].admission);
					$("#typical"+i).val(schoolList[i-1].typical);
					$("#hschool"+i).val(schoolList[i-1].hschool);
					schoolList[i-1].pass == "합격" ? $("#passY"+i).prop("checked", true) : $("#passN"+i).prop("checked", true);
					schoolList[i-1].type == "정시" ? $("#typeY"+i).prop("checked", true) : $("#typeN"+i).prop("checked", true);
				}
				$.ajax({
					type : "post",
					url : "/school/schoolData/${login.auto }",
					async : false,
					success : function(txt){
						for(var i=1; i<=schoolList.length; i++){
							for(var j=0; j<txt.length; j++){
								if(schoolList[i-1].school == txt[j].school){
									$("#dataName"+i).val(txt[j].uuid);
								}
							}
						}
					}
				});
			}
		});
	});
</script>