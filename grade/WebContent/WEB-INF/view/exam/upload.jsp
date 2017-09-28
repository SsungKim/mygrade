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
            <div class="exam_add">
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
                <c:import url="/WEB-INF/view/admin/uploadAdminWrap.jsp"/>
                <div class="infomation_wrap">
                    <div class="inner">
                        <div class="iw_tit">
                            <div class="img">
                                <img src="/img/student_view/info_tit.png">
                            </div>
                            <div class="txt">정시지원자는 수능성적 필수입력</div>
                        </div>
                    </div>
                </div>
                <div class="page_inner">
                    <div class="table_wrap">
                        <div class="inner">
                            <div class="tit_sel">
                                <select id="examType">
                                    <option value="choose">계열선택</option>
                                    <option>인문계열 응시</option>
                                    <option>자연계열 응시</option>
                                </select>
                                <div class="txt">(응시계열을 확인하세요!)</div>
                            </div>
                            <div class="table">
                                <div class="theader">
                                    <div class="tit_wrap">
                                        <div class="tit">구분</div>
                                    </div>
                                    <div class="tit_wrap">
                                        <div class="tit">국어</div>
                                    </div>
                                    <div class="tit_wrap">
                                        <div class="tit tit1">수학</div>
                                        <div class="tit tit1">
                                            <select id="examMathType">
                                                <option value="choose">선택</option>
                                                <option>가형</option>
                                                <option>나형</option>
                                            </select>
                                        </div>
                                    </div>
                                    <div class="tit_wrap">
                                        <div class="tit">영어</div>
                                    </div>
                                    <div class="tit_wrap">
                                        <div class="tit">한국사</div>
                                    </div>
                                    <div class="tit_wrap tit_wrap1">
                                        <div class="tit tit1">
                                            <select id="examExplorType">
                                                <option value="choose">탐구영역 선택</option>
                                                <option>사회탐구 영역</option>
                                                <option>과학탐구 영역</option>
                                                <option>직업탐구 영역</option>
                                            </select>
                                        </div>
                                        <div class="tit tit1 tit2">
                                            <select id="examInnerType1">
                                                <option value="choose">선택</option>
                                            </select>
                                        </div>
                                        <div class="tit tit1 tit2">
                                            <select id="examInnerType2">
                                                <option value="choose">선택</option>
                                            </select>
                                        </div>
                                    </div>
                                    <div class="tit_wrap">
                                        <div class="tit tit1">제2외국어</div>
                                        <div class="tit tit1">
                                            <select id="examLangType">
                                                <option value="choose">선택</option>
                                                <option>독일어I</option>
                                                <option>프랑스어I</option>
                                                <option>스페인어I</option>
                                                <option>중국어I</option>
                                                <option>일본어I</option>
                                                <option>러시아어I</option>
                                                <option>아랍어I</option>
                                                <option>베트남어I</option>
                                                <option>한문</option>
                                            </select>
                                        </div>
                                    </div>
                                </div>
                                <div class="tbody">
                                    <div class="tcontents">
                                        <div class="content">
                                            <div class="txt">원점수</div>
                                        </div>
                                        <c:forEach var="t" begin="1" end="7">
	                                        <div class="content">
	                                            <input class="white" type="text" id="point${t }" maxlength="3">
	                                        </div>
                                        </c:forEach>
                                    </div>
                                    <div class="tcontents">
                                        <div class="content">
                                            <div class="txt">표준점수</div>
                                        </div>
                                        <c:forEach var="t" begin="8" end="14">
	                                        <div class="content">
	                                            <input class="${t == 10 || t == 11 ? 'pink' : 'white'}" type="text" id="point${t }" maxlength="3">
	                                        </div>
                                        </c:forEach>
                                    </div>
                                    <div class="tcontents">
                                        <div class="content">
                                            <div class="txt">백분위</div>
                                        </div>
                                        <c:forEach var="t" begin="15" end="21">
	                                        <div class="content">
	                                            <input class="${t == 17 || t == 18 ? 'pink' : 'white'}" type="text" id="point${t }" maxlength="3">
	                                        </div>
                                        </c:forEach>
                                    </div>
                                    <div class="tcontents">
                                        <div class="content">
                                            <div class="txt">등급</div>
                                        </div>
                                        <c:forEach var="t" begin="22" end="28">
	                                        <div class="content">
	                                            <input class="white" type="text" id="point${t }" maxlength="1">
	                                        </div>
                                        </c:forEach>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="tit_sel tit_sel1">
                        <select id="examType">
                            <option value="choose">계열선택</option>
                            <option>인문계열 응시</option>
                            <option>자연계열 응시</option>
                        </select>
                        <div class="txt">(응시계열을 확인하세요!)</div>
                    </div>
                    <div class="table_wrap1">
                        <div class="content color1">구분</div>
                        <div class="content color2 pd10">원점수</div>
                        <div class="content color2 pd10">표준점수</div>
                        <div class="content color2 pd10">백분위</div>
                        <div class="content color2 pd10 br_none">등급</div>
                        <div class="content color1">국어</div>
                        <div class="content color2">
                            <input type="text" id="point1M">
                        </div>
                        <div class="content color2">
                            <input type="text" id="point8M">
                        </div>
                        <div class="content color2">
                            <input type="text" id="point15M">
                        </div>
                        <div class="content color2 br_none">
                            <input type="text" id="point22M">
                        </div>
                        <div class="content color1 sel_wrap">
                            <select id="mathTypeM">
                                <option value="choose">수학</option>
                                <option>가형</option>
                                <option>나형</option>
                            </select>
                        </div>
                        <div class="content color2">
                            <input type="text" id="point2M">
                        </div>
                        <div class="content color2">
                            <input type="text" id="point9M">
                        </div>
                        <div class="content color2">
                            <input type="text" id="point16M">
                        </div>
                        <div class="content color2 br_none">
                            <input type="text" id="point23M">
                        </div>
                        <div class="content color1">영어</div>
                        <div class="content color2">
                            <input type="text" id="point3M">
                        </div>
                        <div class="content color2">
                            <input type="text" class="pink" id="point10M">
                        </div>
                        <div class="content color2">
                            <input type="text" class="pink" id="point17M">
                        </div>
                        <div class="content color2 br_none">
                            <input type="text" id="point24M">
                        </div>
                        <div class="content color1">한국사</div>
                        <div class="content color2">
                            <input type="text" id="point4M">
                        </div>
                        <div class="content color2">
                            <input type="text" class="pink" id="point11M">
                        </div>
                        <div class="content color2">
                            <input type="text" class="pink" id="point18M">
                        </div>
                        <div class="content color2 br_none">
                            <input type="text" id="point25M">
                        </div>
                        <div class="content1 color1 sel_wrap br_none">
                            <select id="expTypeM">
                                <option value="choose">탐구영역 선택</option>
                                <option>사회탐구 영역</option>
                                <option>과학탐구 영역</option>
                                <option>직업탐구 영역</option>
                            </select>
                        </div>
                        <div class="content color1 sel_wrap">
                            <select id="expType1M">
                                <option value="choose">선택</option>
                            </select>
                        </div>
                        <div class="content color2">
                            <input type="text" id="point5M">
                        </div>
                        <div class="content color2">
                            <input type="text" id="point12M">
                        </div>
                        <div class="content color2">
                            <input type="text" id="point19M">
                        </div>
                        <div class="content color2 br_none">
                            <input type="text" id="point26M">
                        </div>
                        <div class="content color1 sel_wrap">
                            <select id="expType2M">
                                <option value="choose">선택</option>
                            </select>
                        </div>
                        <div class="content color2">
                            <input type="text" id="point6M">
                        </div>
                        <div class="content color2">
                            <input type="text" id="point13M">
                        </div>
                        <div class="content color2">
                            <input type="text" id="point20M">
                        </div>
                        <div class="content color2 br_none">
                            <input type="text" id="point27M">
                        </div>
                        <div class="content color1 sel_wrap">
                            <select id="langTypeM">
                                <option value="choose">제2외국어</option>
                                <option>독일어I</option>
                                <option>프랑스어I</option>
                                <option>스페인어I</option>
                                <option>중국어I</option>
                                <option>일본어I</option>
                                <option>러시아어I</option>
                                <option>아랍어I</option>
                                <option>베트남어I</option>
                                <option>한문</option>
                            </select>
                        </div>
                        <div class="content color2">
                            <input type="text" id="point7M">
                        </div>
                        <div class="content color2">
                            <input type="text" id="point14M">
                        </div>
                        <div class="content color2">
                            <input type="text" id="point21M">
                        </div>
                        <div class="content color2 br_none">
                            <input type="text" id="point28M">
                        </div>
                    </div>
                    <div class="check_wrap">
                        <div class="uni_sel_wrap" id="chooseUniv">
                            <select id="univ1">
                                <option value="choose">대학을 선택하세요.</option>
                                <c:forEach var="t" items="${schoolList }">
                                	<option value="${t.school }">${t.schoolName }</option>
                                </c:forEach>
                            </select>
                        </div>
                        <div class="check check1">
                            <input class="cir" type="radio" id="passFirst1" name="passCount1">
                            <label for="passFirst1">1차합격</label>
                        </div>
                        <div class="check check2">
                            <input class="cir" type="radio" id="passAdd1" name="passCount1">
                            <label for="passAdd1">추가합격</label>
                            <div class="input_wrap">
                                <div class="txt">( 대기번호</div>
                                <input type="text" id="breakNum1" name="breakNum1" maxlength="8">
                                <div class="txt">번 )</div>
                            </div>
                        </div>
                        <div class="check check3">
                            <input class="cir" type="radio" id="passNo1" name="passCount1">
                            <label for="passNo1">불합격</label>
                        </div>
                    </div>
                    <div class="check_wrap" id="checkWrap1">
                        <div class="uni_sel_wrap">
                            <select id="univ2">
                                <option value="choose">대학을 선택하세요.</option>
                                <c:forEach var="t" items="${schoolList }">
                                	<option value="${t.school }">${t.schoolName }</option>
                                </c:forEach>
                            </select>
                        </div>
                        <div class="check check1">
                            <input class="cir" type="radio" id="passFirst2" name="passCount2">
                            <label for="passFirst2">1차합격</label>
                        </div>
                        <div class="check check2">
                            <input class="cir" type="radio" id="passAdd2" name="passCount2">
                            <label for="passAdd2">추가합격</label>
                            <div class="input_wrap">
                                <div class="txt">( 대기번호</div>
                                <input type="text" id="breakNum2" name="breakNum2" maxlength="8">
                                <div class="txt">번 )</div>
                            </div>
                        </div>
                        <div class="check check3">
                            <input class="cir" type="radio" id="passNo2" name="passCount2">
                            <label for="passNo2">불합격</label>
                        </div>
                    </div>
                    <div class="check_wrap" id="checkWrap2">
                        <div class="uni_sel_wrap">
                            <select id="univ3">
                                <option value="choose">대학을 선택하세요.</option>
                                <c:forEach var="t" items="${schoolList }">
                                	<option value="${t.school }">${t.schoolName }</option>
                                </c:forEach>
                            </select>
                        </div>
                        <div class="check check1">
                            <input class="cir" type="radio" id="passFirst3" name="passCount3">
                            <label for="passFirst3">1차합격</label>
                        </div>
                        <div class="check check2">
                            <input class="cir" type="radio" id="passAdd3" name="passCount3">
                            <label for="passAdd3">추가합격</label>
                            <div class="input_wrap">
                                <div class="txt">( 대기번호</div>
                                <input type="text" id="breakNum3" name="breakNum3" maxlength="8">
                                <div class="txt">번 )</div>
                            </div>
                        </div>
                        <div class="check check3">
                            <input class="cir" type="radio" id="passNo3" name="passCount3">
                            <label for="passNo3">불합격</label>
                        </div>
                    </div>
                    <div class="sv_btn_wrap">
                        <div class="sv_btn" onclick="history.back()">
                            <img src="/img/student_add/btn01.png">
                        </div>
                        <div class="sv_btn" onclick="examSubmit()">
                            <img src="/img/student_add/btn02.png">
                        </div>
                        <div class="sv_btn hidden" onclick="examSubmitM()">
                            <img src="/img/student_add/btn02.png">
                        </div>
                    </div>
                </div>
            </div>
            <footer>
            	<c:import url="/WEB-INF/view/main/footer.jsp"/>
            </footer>
        </div>
    </body>
    
    <script>
    	// 항목들 숫자만 입력가능
    	$(document).ready(function(){
    		for(var i=1; i<=28; i++){
	    		$("input[id=point"+i+"]").keyup(function(event){ 
	    			if (!(event.keyCode >=48 && event.keyCode<=57)) {
	    				var inputVal = $(this).val();
	    				$(this).val(inputVal.replace(/[^0-9]/gi,''));
	    			}
	    		});
    		}
    		$("input[id=breakNum]").keyup(function(event){ 
    			if (!(event.keyCode >=48 && event.keyCode<=57)) {
    				var inputVal = $(this).val();
    				$(this).val(inputVal.replace(/[^0-9]/gi,''));
    			}
    		});
    	});
    	// 관리자일경우 입력란 보이기
		$(document).ready(function(){
			loginCheck();
			if(${login.id == 'admin' }){
				$("#adminWrap").show();
				$("#chooseUniv").hide();
				$("#checkWrap1").hide();
				$("#checkWrap2").hide();
			}
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
		// 시험점수 탐구영역 선택
		$(document).ready(function(){
			$("#examExplorType").change(function(){
				var explorType = $("#examExplorType").val();
				var html = "";
				switch(explorType){
				case "사회탐구 영역":
					html = "<option value='choose'>선택</option>";
					html += "<option>생활과윤리</option>";
					html += "<option>윤리와사상</option>";
					html += "<option>한국지리</option>";
					html += "<option>세계지리</option>";
					html += "<option>동아시아사</option>";
					html += "<option>세계사</option>";
					html += "<option>법과정치</option>";
					html += "<option>경제</option>";
					html += "<option>사회문화</option>";
					break;
				case "과학탐구 영역":
					html = "<option value='choose'>선택</option>";
					html += "<option>물리I</option>";
					html += "<option>화학I</option>";
					html += "<option>생명과학I</option>";
					html += "<option>지구과학I</option>";
					html += "<option>물리II</option>";
					html += "<option>화학II</option>";
					html += "<option>생명과학II</option>";
					html += "<option>지구과학II</option>";
					break;
				case "직업탐구 영역":
					html = "<option value='choose'>선택</option>";
					html += "<option>농업이해</option>";
					html += "<option>농업기초기술</option>";
					html += "<option>공업일반</option>";
					html += "<option>기초제도</option>";
					html += "<option>상업경제</option>";
					html += "<option>회계원리</option>";
					html += "<option>해양의이해</option>";
					html += "<option>수산해운산업기초</option>";
					html += "<option>인간발달</option>";
					html += "<option>생활서비스산업의이해</option>";
					break;
				default :
					html = "<option value='choose'>선택</option>";	
				}
				$("#examInnerType1").html(html);
				$("#examInnerType2").html(html);
			});
			$("#expTypeM").change(function(){
				var explorType = $("#expTypeM").val();
				var html = "";
				switch(explorType){
				case "사회탐구 영역":
					html = "<option value='choose'>선택</option>";
					html += "<option>생활과윤리</option>";
					html += "<option>윤리와사상</option>";
					html += "<option>한국지리</option>";
					html += "<option>세계지리</option>";
					html += "<option>동아시아사</option>";
					html += "<option>세계사</option>";
					html += "<option>법과정치</option>";
					html += "<option>경제</option>";
					html += "<option>사회문화</option>";
					break;
				case "과학탐구 영역":
					html = "<option value='choose'>선택</option>";
					html += "<option>물리I</option>";
					html += "<option>화학I</option>";
					html += "<option>생명과학I</option>";
					html += "<option>지구과학I</option>";
					html += "<option>물리II</option>";
					html += "<option>화학II</option>";
					html += "<option>생명과학II</option>";
					html += "<option>지구과학II</option>";
					break;
				case "직업탐구 영역":
					html = "<option value='choose'>선택</option>";
					html += "<option>농업이해</option>";
					html += "<option>농업기초기술</option>";
					html += "<option>공업일반</option>";
					html += "<option>기초제도</option>";
					html += "<option>상업경제</option>";
					html += "<option>회계원리</option>";
					html += "<option>해양의이해</option>";
					html += "<option>수산해운산업기초</option>";
					html += "<option>인간발달</option>";
					html += "<option>생활서비스산업의이해</option>";
					break;
				default :
					html = "<option value='choose'>선택</option>";	
				}
				$("#expType1M").html(html);
				$("#expType2M").html(html);
			});
		});
		// 수능점수 등록
		function examSubmit(){
			if(!loginCheck()){
    			return;
    		}
			var examType = $("#examType").val();
			var examMathType = $("#examMathType").val();
			var examExplorType = $("#examExplorType").val();
			var examInnerType1 = $("#examInnerType1").val();
			var examInnerType2 = $("#examInnerType2").val();
			var examLangType = $("#examLangType").val() == "choose" ? "-" : $("#examLangType").val();
			var pointAr = new Array();
			var passCount1 = $("#passFirst1").prop("checked") ? "1차합격" : $("#passAdd1").prop("checked") ? "추가합격" : 
										$("#passNo1").prop("checked") ? "불합격" : false;
			var breakNum1 = $("#breakNum1").val();
			for(var i=0; i<28; i++){
				pointAr[i] = $("#point"+(i+1)).val() == "" ? "-" : $("#point"+(i+1)).val();
			}
			var pointCheck = 0;
			var pointCheck2 = 0;
			for(var i=0; i<pointAr.length; i++){
				if(pointAr[i] == "-"){
					pointCheck++;
				}
				if(Number(pointAr[i]) > 100){
					pointCheck2++;
				}
			}
			if(examType == "choose"){
				alert("응시계열을 선택해주세요.");
				return;
			}
			if(examMathType == "choose"){
				alert("수학과목을 선택해주세요.");
				return;
			}
			if(examExplorType == "choose"){
				alert("탐구영역을 선택해주세요.");
				return;
			}
			if(examInnerType1 == "choose" || examInnerType2 == "choose"){
				alert("탐구영역 세부과목을 선택해주세요.");
				return;
			}
			if(examInnerType1 == examInnerType2){
				alert("탐구영역 세부항목은 같을 수 없습니다.");
				return;
			}
			if(pointCheck == 28){
				alert("입력된 값이 없습니다.");
				return;
			}
			if(pointCheck2 > 0){
				alert("올바른 값을 입력해주세요.");
				return;
			}
			if(!passCount1){
				alert("합격타입을 선택해주세요.");
				return;
			}
			if(passCount1 == "추가합격"){
				if(breakNum1 == ""){
					alert("대기번호를 입력해주세요.");
					return;
				}
				passCount1 += "("+breakNum1+"번)"
			}
			if(${login.id == 'admin' }){
				var addr = $("#addr").val();
				var school = $("#school").val();
				var subject = $("#subject").val();
				var type = $("#type").val();
				var year = $("#year").val();
				var admission = $("#admission").val();
				var typical = $("#typical").val();
				var pass = $("#passY").prop("checked") ? "합격" : $("#passN").prop("checked") ? "불합격" : false;
				$.ajax({
					type : "post",
					url : "/exam/uploadExam1/"+addr+"/"+school+"/"+subject+"/"+type+"/"+year+"/"+admission+"/"+typical+"/"+pass+"/"+
							examType+"/"+examMathType+"/"+examExplorType+"/"+examInnerType1+"/"+examInnerType2+"/"+
							examLangType+"/"+pointAr+"/"+passCount1,
					async : false,
					success : function(txt){
						if(txt){
							alert("등록되었습니다.");
							location.href="/member/myData/${login.auto }";
						} else {
							alert("등록에 실패하였습니다.\n잠시후 다시 시도해주세요.");
						}
					}
				});
			} else {
				var univ1 = $("#univ1").val();
				var univ2 = $("#univ2").val();
				var univ3 = $("#univ3").val();
				var passCount2 = $("#passFirst2").prop("checked") ? "1차합격" : $("#passAdd2").prop("checked") ? "추가합격" : 
											$("#passNo2").prop("checked") ? "불합격" : false;
				var passCount3 = $("#passFirst3").prop("checked") ? "1차합격" : $("#passAdd3").prop("checked") ? "추가합격" : 
											$("#passNo3").prop("checked") ? "불합격" : false;
				var breakNum2 = $("#breakNum2").val();
				var breakNum3 = $("#breakNum3").val();
				if(univ1 == "choose"){
					alert("대학을 선택해주세요.");
					return;
				}
				if(univ2 != "choose"){
					if(!passCount2){
						alert("합격타입을 선택해주세요.");
						return;
					}
				}
				if(univ3 != "choose"){
					if(!passCount3){
						alert("합격타입을 선택해주세요.");
						return;
					}
				}
				if(passCount2 == "추가합격"){
					if(breakNum2 == ""){
						alert("대기번호를 입력해주세요.");
						return;
					}
					passCount2 += "("+breakNum2+"번)"
				}
				if(passCount3 == "추가합격"){
					if(breakNum3 == ""){
						alert("대기번호를 입력해주세요.");
						return;
					}
					passCount3 += "("+breakNum3+"번)"
				}
				if(univ1 != "choose" && univ2 != "choose"){
					if(univ1 == univ2){
						alert("대학은 같을 수 없습니다.");
						return;
					}
				}
				if(univ2 != "choose" && univ3 != "choose"){
					if(univ2 == univ3){
						alert("대학은 같을 수 없습니다.");
						return;
					}
				}
				if(univ3 != "choose" && univ1 != "choose"){
					if(univ3 == univ1){
						alert("대학은 같을 수 없습니다.");
						return;
					}
				}
				if((univ1 == "choose" && univ2 != "choose") || (univ1 == "choose" && univ3 != "choose") || (univ2 == "choose" && univ3 != "choose")){
					alert("대학은 차례대로 선택해주세요.");
					return;
				}
				if(univ2 == "choose"){
					univ2 = "s";
					passCount2 = "s";
				}
				if(univ3 == "choose"){
					univ3 = "s";
					passCount3 = "s";
				}
				$.ajax({
					type : "post",
					url : "/exam/uploadExam2/"+examType+"/"+examMathType+"/"+examExplorType+"/"+examInnerType1+"/"+examInnerType2+
							"/"+examLangType+"/"+pointAr+"/"+univ1+"/"+passCount1+"/"+univ2+"/"+passCount2+"/"+univ3+"/"+passCount3,
					async : false,
					success : function(txt){
						if(txt){
							alert("등록되었습니다.");
							location.href="/member/myData/${login.auto }";
						} else {
							alert("등록에 실패하였습니다.\n잠시후 다시 시도해주세요.");
						}
					}
				});
			}
		}
		function examSubmitM(){
			if(!loginCheck()){
    			return;
    		}
			var examType = $("#examTypeM").val();
			var examMathType = $("#mathTypeM").val();
			var examExplorType = $("#expTypeM").val();
			var examInnerType1 = $("#expType1M").val();
			var examInnerType2 = $("#expType2M").val();
			var examLangType = $("#langTypeM").val() == "choose" ? "-" : $("#langTypeM").val();
			var pointAr = new Array();
			var passCount1 = $("#passFirst1").prop("checked") ? "1차합격" : $("#passAdd1").prop("checked") ? "추가합격" : 
										$("#passNo1").prop("checked") ? "불합격" : false;
			var breakNum1 = $("#breakNum1").val();
			for(var i=0; i<28; i++){
				pointAr[i] = $("#point"+(i+1)+"M").val() == "" ? "-" : $("#point"+(i+1)+"M").val();
			}
			var pointCheck = 0;
			var pointCheck2 = 0;
			for(var i=0; i<pointAr.length; i++){
				if(pointAr[i] == "-"){
					pointCheck++;
				}
				if(Number(pointAr[i]) > 100){
					pointCheck2++;
				}
			}
			if(examType == "choose"){
				alert("응시계열을 선택해주세요.");
				return;
			}
			if(examMathType == "choose"){
				alert("수학과목을 선택해주세요.");
				return;
			}
			if(examExplorType == "choose"){
				alert("탐구영역을 선택해주세요.");
				return;
			}
			if(examInnerType1 == "choose" || examInnerType2 == "choose"){
				alert("탐구영역 세부과목을 선택해주세요.");
				return;
			}
			if(examInnerType1 == examInnerType2){
				alert("탐구영역 세부항목은 같을 수 없습니다.");
				return;
			}
			if(pointCheck == 28){
				alert("입력된 값이 없습니다.");
				return;
			}
			if(pointCheck2 > 0){
				alert("올바른 값을 입력해주세요.");
				return;
			}
			if(!passCount1){
				alert("합격타입을 선택해주세요.");
				return;
			}
			if(passCount1 == "추가합격"){
				if(breakNum1 == ""){
					alert("대기번호를 입력해주세요.");
					return;
				}
				passCount1 += "("+breakNum1+"번)"
			}
			if(${login.id == 'admin' }){
				var addr = $("#addr").val();
				var school = $("#school").val();
				var subject = $("#subject").val();
				var type = $("#type").val();
				var year = $("#year").val();
				var admission = $("#admission").val();
				var typical = $("#typical").val();
				var pass = $("#passY").prop("checked") ? "합격" : $("#passN").prop("checked") ? "불합격" : false;
				$.ajax({
					type : "post",
					url : "/exam/uploadExam1/"+addr+"/"+school+"/"+subject+"/"+type+"/"+year+"/"+admission+"/"+typical+"/"+pass+"/"+
							examType+"/"+examMathType+"/"+examExplorType+"/"+examInnerType1+"/"+examInnerType2+"/"+
							examLangType+"/"+pointAr+"/"+passCount1,
					async : false,
					success : function(txt){
						if(txt){
							alert("등록되었습니다.");
							location.href="/member/myData/${login.auto }";
						} else {
							alert("등록에 실패하였습니다.\n잠시후 다시 시도해주세요.");
						}
					}
				});
			} else {
				var univ1 = $("#univ1").val();
				var univ2 = $("#univ2").val();
				var univ3 = $("#univ3").val();
				var passCount2 = $("#passFirst2").prop("checked") ? "1차합격" : $("#passAdd2").prop("checked") ? "추가합격" : 
											$("#passNo2").prop("checked") ? "불합격" : false;
				var passCount3 = $("#passFirst3").prop("checked") ? "1차합격" : $("#passAdd3").prop("checked") ? "추가합격" : 
											$("#passNo3").prop("checked") ? "불합격" : false;
				var breakNum2 = $("#breakNum2").val();
				var breakNum3 = $("#breakNum3").val();
				if(univ1 == "choose"){
					alert("대학을 선택해주세요.");
					return;
				}
				if(univ2 != "choose"){
					if(!passCount2){
						alert("합격타입을 선택해주세요.");
						return;
					}
				}
				if(univ3 != "choose"){
					if(!passCount3){
						alert("합격타입을 선택해주세요.");
						return;
					}
				}
				if(passCount2 == "추가합격"){
					if(breakNum2 == ""){
						alert("대기번호를 입력해주세요.");
						return;
					}
					passCount2 += "("+breakNum2+"번)"
				}
				if(passCount3 == "추가합격"){
					if(breakNum3 == ""){
						alert("대기번호를 입력해주세요.");
						return;
					}
					passCount3 += "("+breakNum3+"번)"
				}
				if(univ1 != "choose" && univ2 != "choose"){
					if(univ1 == univ2){
						alert("대학은 같을 수 없습니다.");
						return;
					}
				}
				if(univ2 != "choose" && univ3 != "choose"){
					if(univ2 == univ3){
						alert("대학은 같을 수 없습니다.");
						return;
					}
				}
				if(univ3 != "choose" && univ1 != "choose"){
					if(univ3 == univ1){
						alert("대학은 같을 수 없습니다.");
						return;
					}
				}
				if((univ1 == "choose" && univ2 != "choose") || (univ1 == "choose" && univ3 != "choose") || (univ2 == "choose" && univ3 != "choose")){
					alert("대학은 차례대로 선택해주세요.");
					return;
				}
				if(univ2 == "choose"){
					univ2 = "s";
					passCount2 = "s";
				}
				if(univ3 == "choose"){
					univ3 = "s";
					passCount3 = "s";
				}
				$.ajax({
					type : "post",
					url : "/exam/uploadExam2/"+examType+"/"+examMathType+"/"+examExplorType+"/"+examInnerType1+"/"+examInnerType2+
							"/"+examLangType+"/"+pointAr+"/"+univ1+"/"+passCount1+"/"+univ2+"/"+passCount2+"/"+univ3+"/"+passCount3,
					async : false,
					success : function(txt){
						if(txt){
							alert("등록되었습니다.");
							location.href="/member/myData/${login.auto }";
						} else {
							alert("등록에 실패하였습니다.\n잠시후 다시 시도해주세요.");
						}
					}
				});
			}
		}
	</script>
    
</html>