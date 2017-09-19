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
            <div class="rank_add">
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
                <div class="page_inner">
                    <div class="page_tit">
                        <div class="tit">
                            <div class="img">
                                <img src="/img/rank/tit_dot.png">
                            </div>
                            <div class="txt">전국등수 확인</div>
                        </div>
                        <div class="line"></div>
                    </div>
                    <div class="form_wrap">
                        <select id="addr">
                            <option value="choose">지역선택</option>
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
                        <div class="input_wrap ml27">
                            <input type="text" placeholder="학교이름" id="school">
                            <div class="txt">고등학교</div>
                        </div>
                        <select class="ml27" id="grade">
                            <option value="choose">학년선택</option>
                            <option>1학년</option>
                            <option>2학년</option>
                            <option>3학년</option>
                        </select>
                        <select class="ml27" id="rankDay">
                            <option value="choose">회차선택</option>
                            <c:forEach var="t" items="${rankDay }">
                            	<option>${t.name }</option>
                            </c:forEach>
                        </select>
                        <select id="type">
                            <option value="choose">계열선택</option>
                            <option>인문계열 응시</option>
                            <option>자연계열 응시</option>
                        </select>
                    </div>
                    <div class="rank_add_txt">※원점수를 입력후 등록 버튼을 눌러주세요.</div>
                    <div class="rank_add_txt">※점수는 수정 불하가니 정확히 입력해주세요.</div>
                    <div class="table_wrap">
                        <div class="inner">
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
                                            <select id="mathType">
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
                                            <select id="expType">
                                                <option value="choose">탐구영역 선택</option>
                                                <option>사회탐구 영역</option>
                                                <option>과학탐구 영역</option>
                                                <option>직업탐구 영역</option>
                                            </select>
                                        </div>
                                        <div class="tit tit1 tit2">
                                            <select id="expType1">
                                                <option value="choose">선택</option>
                                            </select>
                                        </div>
                                        <div class="tit tit1 tit2">
                                            <select id="expType2">
                                                <option value="choose">선택</option>
                                            </select>
                                        </div>
                                    </div>
                                    <div class="tit_wrap">
                                        <div class="tit tit1">제2외국어</div>
                                        <div class="tit tit1">
                                            <select id="langType">
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
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="table_wrap1">
                        <div class="content color1">구분</div>
                        <div class="content color2 pd10">원점수</div>
                        <div class="content color1">국어</div>
                        <div class="content color2">
                            <input type="text" id="point1M">
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
                        <div class="content color1">영어</div>
                        <div class="content color2">
                            <input type="text" id="point3M">
                        </div>
                        <div class="content color1">한국사</div>
                        <div class="content color2">
                            <input type="text" id="point4M">
                        </div>
                        <div class="content1 color1 sel_wrap">
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
                        <div class="content color1 sel_wrap">
                            <select id="expType2M">
                                <option value="choose">선택</option>
                            </select>
                        </div>
                        <div class="content color2">
                            <input type="text" id="point6M">
                        </div>
                        <div class="content2 color1">제2외국어</div>
                        <div class="content2 color1 sel_wrap">
                            <select id="langTypeM">
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
                        <div class="content color2">
                            <input type="text" id="point7M">
                        </div>
                    </div>
                    <div class="sv_btn" id="btn_pc">
                        <img src="/img/student_add/btn02.png" onclick="uploadRank()">
                    </div>
                    <div class="sv_btn hidden" id="btn_mobile">
                        <img src="/img/student_add/btn02.png" onclick="uploadRank2()">
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
    		$("input[id=point1]").keyup(function(event){ 
    			if (!(event.keyCode >=48 && event.keyCode<=57)) {
    				var inputVal = $(this).val();
    				$(this).val(inputVal.replace(/[^0-9]/gi,''));
    			}
    		});
    		$("input[id=point2]").keyup(function(event){ 
    			if (!(event.keyCode >=48 && event.keyCode<=57)) {
    				var inputVal = $(this).val();
    				$(this).val(inputVal.replace(/[^0-9]/gi,''));
    			}
    		});
    		$("input[id=point3]").keyup(function(event){ 
    			if (!(event.keyCode >=48 && event.keyCode<=57)) {
    				var inputVal = $(this).val();
    				$(this).val(inputVal.replace(/[^0-9]/gi,''));
    			}
    		});
    		$("input[id=point4]").keyup(function(event){ 
    			if (!(event.keyCode >=48 && event.keyCode<=57)) {
    				var inputVal = $(this).val();
    				$(this).val(inputVal.replace(/[^0-9]/gi,''));
    			}
    		});
    		$("input[id=point5]").keyup(function(event){ 
    			if (!(event.keyCode >=48 && event.keyCode<=57)) {
    				var inputVal = $(this).val();
    				$(this).val(inputVal.replace(/[^0-9]/gi,''));
    			}
    		});
    		$("input[id=point6]").keyup(function(event){ 
    			if (!(event.keyCode >=48 && event.keyCode<=57)) {
    				var inputVal = $(this).val();
    				$(this).val(inputVal.replace(/[^0-9]/gi,''));
    			}
    		});
    		$("input[id=point7]").keyup(function(event){ 
    			if (!(event.keyCode >=48 && event.keyCode<=57)) {
    				var inputVal = $(this).val();
    				$(this).val(inputVal.replace(/[^0-9]/gi,''));
    			}
    		});
    		$("input[id=point1M]").keyup(function(event){ 
    			if (!(event.keyCode >=48 && event.keyCode<=57)) {
    				var inputVal = $(this).val();
    				$(this).val(inputVal.replace(/[^0-9]/gi,''));
    			}
    		});
    		$("input[id=point2M]").keyup(function(event){ 
    			if (!(event.keyCode >=48 && event.keyCode<=57)) {
    				var inputVal = $(this).val();
    				$(this).val(inputVal.replace(/[^0-9]/gi,''));
    			}
    		});
    		$("input[id=point3M]").keyup(function(event){ 
    			if (!(event.keyCode >=48 && event.keyCode<=57)) {
    				var inputVal = $(this).val();
    				$(this).val(inputVal.replace(/[^0-9]/gi,''));
    			}
    		});
    		$("input[id=point4M]").keyup(function(event){ 
    			if (!(event.keyCode >=48 && event.keyCode<=57)) {
    				var inputVal = $(this).val();
    				$(this).val(inputVal.replace(/[^0-9]/gi,''));
    			}
    		});
    		$("input[id=point5M]").keyup(function(event){ 
    			if (!(event.keyCode >=48 && event.keyCode<=57)) {
    				var inputVal = $(this).val();
    				$(this).val(inputVal.replace(/[^0-9]/gi,''));
    			}
    		});
    		$("input[id=point6M]").keyup(function(event){ 
    			if (!(event.keyCode >=48 && event.keyCode<=57)) {
    				var inputVal = $(this).val();
    				$(this).val(inputVal.replace(/[^0-9]/gi,''));
    			}
    		});
    		$("input[id=point7M]").keyup(function(event){ 
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
    	// 학년 선택시 1학년 / 2,3학년 구분
    	$(document).ready(function(){
    		$("#grade").change(function(){
    			var grade = $("#grade").val();
    			if(grade == '1학년'){
	    			var html = "<option>고1</option>"
	   				$("#expType").html(html);
	    			$("#expTypeM").html(html);
	    			var html2 = "<option value='choose'>선택</option>";
	    			html2 += "<option>일반사회</option>";
	    			html2 += "<option>도덕</option>";
	    			html2 += "<option>지리</option>";
	    			html2 += "<option>물리</option>";
	    			html2 += "<option>화학</option>";
	    			html2 += "<option>생명과학</option>";
	    			html2 += "<option>지구과학</option>";
	    			$("#expType1").html(html2);
	    			$("#expType2").html(html2);
	    			$("#expType1M").html(html2);
	    			$("#expType2M").html(html2);
	    			var html3 = "<option>해당없음</option>";
	    			$("#type").html(html3);
	    			$("#type").prop("disabled", "disabled");
	    			var html4 = "<option>해당없음</option>";
	    			$("#mathType").html(html4);
	    			$("#mathType").prop("disabled", "disabled");
	    			$("#mathTypeM").html(html4);
	    			$("#mathTypeM").prop("disabled", "disabled");
    			} else {
    				var html = "<option value='choose'>탐구영역 선택</option>";
    				html += "<option>사회탐구 영역</option>";
    				html += "<option>과학탐구 영역</option>";
    				html += "<option>직업탐구 영역</option>";
    				$("#expType").html(html);
    				$("#expTypeM").html(html);
    				var html2 = "<option value='choose'>계열선택</option>";
    				html2 += "<option>인문계열 응시</option>";
    				html2 += "<option>자연계열 응시</option>";
    				$("#type").html(html2);
    				$("#type").prop("disabled", "");
    				var html3 = "<option value='choose'>선택</option>";
    				html3 += "<option>가형</option>";
    				html3 += "<option>나형</option>";
	    			$("#mathType").html(html3);
	    			$("#mathType").prop("disabled", "");
	    			$("#mathTypeM").html(html3);
	    			$("#mathTypeM").prop("disabled", "");
    			}
    		});
    	});
		// 시험점수 탐구영역 선택
		function expChange(){
			var explorType = $("#expType").val() == "choose" ? $("#expTypeM").val() : $("#expType").val();
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
				var grade = $("#grade").val();
				html = "<option value='choose'>선택</option>";
				html += "<option>물리I</option>";
				html += "<option>화학I</option>";
				html += "<option>생명과학I</option>";
				html += "<option>지구과학I</option>";
				if(grade == "3학년"){
					html += "<option>물리II</option>";
					html += "<option>화학II</option>";
					html += "<option>생명과학II</option>";
					html += "<option>지구과학II</option>";
				}
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
			$("#expType1").html(html);
			$("#expType2").html(html);
			$("#expType1M").html(html);
			$("#expType2M").html(html);
		}
		$(document).ready(function(){
			$("#expType").change(function(){
				expChange();
			});
			$("#expTypeM").change(function(){
				expChange();
			});
		});
		// 점수 등록
		function uploadRank(){
			loginCheck();
			var addr = $("#addr").val();
			var school = $("#school").val();
			var grade = $("#grade").val();
			var rankDay = $("#rankDay").val();
			var type = $("#type").val();
			var mathType = $("#mathType").val();
			var expType = $("#expType").val();
			var expType1 = $("#expType1").val();
			var expType2 = $("#expType2").val();
			var langType = $("#langType").val();
			var kor = $("#point1").val();
			var math = $("#point2").val();
			var eng = $("#point3").val();
			var his = $("#point4").val();
			var exp1 = $("#point5").val();
			var exp2 = $("#point6").val();
			var lang = $("#point7").val();
			if(addr == "choose" || school == "" || grade == "choose" || rankDay == "choose" || type == "choose" || mathType == "choose" ||
					expType == "choose" || expType1 == "choose" || expType2 == "choose" || kor == "" || math == "" ||
					eng == "" || his == "" || exp1 == "" || exp2 == ""){
				alert("입력하지 않은 항목이 있습니다.");
				return;
			}
			if(expType1 == expType2){
				alert("탐구영역은 같을 수 없습니다.");
				return;
			}
			if(Number(kor) > 100 || Number(math) > 100 || Number(eng) > 100 || Number(his) > 100 || Number(exp1) > 100 || 
					Number(exp2) > 100 || Number(lang) > 100){
				alert("점수는 100점을 넘을 수 없습니다.");
				return;
			}
			if(Number(kor) < 0 || Number(math) < 0 || Number(eng) < 0 || Number(his) < 0 || Number(exp1) < 0 || 
					Number(exp2) < 0 || Number(lang) < 0){
				alert("점수는 0점보다 작을 수 없습니다.");
				return;
			}
			if(Number(his) > 50 || Number(exp1) > 50 || Number(exp2) > 50 || Number(lang) > 50){
				alert("한국사, 탐구영역, 제2외국어는 50점을 넘을 수 없습니다.");
				return;
			}
			if(langType == "choose")
				langType = "선택안함";
			if(lang == "")
				lang = "0";
			$.ajax({
				type : "post",
				url : "/rank/uploadRank/${login.auto }/"+addr+"/"+school+"/"+grade+"/"+rankDay+"/"+type+"/"+mathType+"/"+expType+"/"+
						expType1+"/"+expType2+"/"+langType+"/"+kor+"/"+math+"/"+eng+"/"+his+"/"+exp1+"/"+exp2+"/"+lang,
				async : false,
				success : function(txt){
					if(txt==0){
						alert("등록되었습니다.");
						location.href="/rank/${login.auto }";
					} else if(txt==1){
						alert("등록에 실패하였습니다.\n잠시후 다시 시도해주세요.");
					} else if(txt==2){
						alert("해당 회차는 이미 등록하였습니다.\n회차당 한번밖에 입력할 수 없습니다.");
					}
				}
			});
		}
		function uploadRank2(){
			loginCheck();
			var addr = $("#addr").val();
			var school = $("#school").val();
			var grade = $("#grade").val();
			var rankDay = $("#rankDay").val();
			var type = $("#type").val();
			var mathType = $("#mathTypeM").val();
			var expType = $("#expTypeM").val();
			var expType1 = $("#expType1M").val();
			var expType2 = $("#expType2M").val();
			var langType = $("#langTypeM").val();
			var kor = $("#point1M").val();
			var math = $("#point2M").val();
			var eng = $("#point3M").val();
			var his = $("#point4M").val();
			var exp1 = $("#point5M").val();
			var exp2 = $("#point6M").val();
			var lang = $("#point7M").val();
			if(addr == "choose" || school == "" || grade == "choose" || rankDay == "choose" || type == "choose" || mathType == "choose" ||
					expType == "choose" || expType1 == "choose" || expType2 == "choose" || kor == "" || math == "" ||
					eng == "" || his == "" || exp1 == "" || exp2 == ""){
				alert("입력하지 않은 항목이 있습니다.");
				return;
			}
			if(expType1 == expType2){
				alert("탐구영역은 같을 수 없습니다.");
				return;
			}
			if(Number(kor) > 100 || Number(math) > 100 || Number(eng) > 100 || Number(his) > 100 || Number(exp1) > 100 || 
					Number(exp2) > 100 || Number(lang) > 100){
				alert("점수는 100점을 넘을 수 없습니다.");
				return;
			}
			if(Number(kor) < 0 || Number(math) < 0 || Number(eng) < 0 || Number(his) < 0 || Number(exp1) < 0 || 
					Number(exp2) < 0 || Number(lang) < 0){
				alert("점수는 0점보다 작을 수 없습니다.");
				return;
			}
			if(Number(his) > 50 || Number(exp1) > 50 || Number(exp2) > 50 || Number(lang) > 50){
				alert("한국사, 탐구영역, 제2외국어는 50점을 넘을 수 없습니다.");
				return;
			}
			if(langType == "choose")
				langType = "선택안함";
			if(lang == "")
				lang = "0";
			$.ajax({
				type : "post",
				url : "/rank/uploadRank/${login.auto }/"+addr+"/"+school+"/"+grade+"/"+rankDay+"/"+type+"/"+mathType+"/"+expType+"/"+
						expType1+"/"+expType2+"/"+langType+"/"+kor+"/"+math+"/"+eng+"/"+his+"/"+exp1+"/"+exp2+"/"+lang,
				async : false,
				success : function(txt){
					if(txt==0){
						alert("등록되었습니다.");
						location.href="/rank/${login.auto }";
					} else if(txt==1){
						alert("등록에 실패하였습니다.\n잠시후 다시 시도해주세요.");
					} else if(txt==2){
						alert("해당 회차는 이미 등록하였습니다.\n회차당 한번밖에 입력할 수 없습니다.");
					}
				}
			});
		}
	</script>
    
</html>