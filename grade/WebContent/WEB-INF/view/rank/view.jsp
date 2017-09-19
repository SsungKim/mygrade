<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>


<!doctype html>
<html oncontextmenu='return false' ondragstart='return false' onselectstart='return false'>
    <head>
    	<c:import url="/WEB-INF/view/main/head.jsp"/>
    </head>
     
    <body>
        <div id="wrapper">
            <div class="rank_view">
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
                        <div class="sel_box">${view.addr }</div>
                        <div class="input_wrap ml27">
                            <div class="input_box">${view.school }</div>
                            <div class="txt">고등학교</div>
                        </div>
                        <div class="sel_box ml27">${view.grade }</div>
                        <div class="sel_box ml27">${view.rankDay }</div>
                        <div class="sel_box">${view.type }</div>
                    </div>
                    <div class="infomation_wrap">
                        <div class="inner" id="examView">
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
                                                    <div class="in_txt" id="examMathType">${view.mathType }</div>
                                                </div>
                                            </div>
                                            <div class="tit_wrap">
                                                <div class="tit">영어</div>
                                            </div>
                                            <div class="tit_wrap">
                                                <div class="tit"><span>한</span>국사</div>
                                            </div>
                                            <div class="tit_wrap tit_wrap1">
                                                <div class="tit tit1">
                                                    <div class="in_txt" id="examExplorType">${view.expType }</div>
                                                </div>
                                                <div class="tit tit1 tit2">
                                                    <div class="in_txt" id="examInnerType1">${view.expType1 }</div>
                                                </div>
                                                <div class="tit tit1 tit2">
                                                    <div class="in_txt" id="examInnerType2">${view.expType2 }</div>
                                                </div>
                                            </div>
                                            <div class="tit_wrap">
                                                <div class="tit tit1">제2<span>외국어</span></div>
                                                <div class="tit tit1">
                                                    <div class="in_txt" id="examLangType">${view.langType }</div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="tbody">
                                            <div class="tcontents">
                                                <div class="content">
                                                    <div class="txt">원점수</div>
                                                </div>
                                                <div class="content">
                                                    <div class="in_txt" id="point1">${view.kor }</div>
                                                </div>
                                                <div class="content">
                                                    <div class="in_txt" id="point2">${view.math }</div>
                                                </div>
                                                <div class="content">
                                                    <div class="in_txt"  id="point3">${view.eng }</div>
                                                </div>
                                                <div class="content">
                                                    <div class="in_txt" id="point4">${view.his }</div>
                                                </div>
                                                <div class="content">
                                                    <div class="in_txt" id="point5"> ${view.exp1 }</div>
                                                </div>
                                                <div class="content">
                                                    <div class="in_txt" id="point6">${view.exp2 }</div>
                                                </div>
                                                <div class="content">
                                                    <div class="in_txt"  id="point7">${view.lang }</div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="infomation_wrap infomation_wrap01">
                    <div class="inner" id="examView">
                        <div class="info_tit">
                            <div class="img">
                                <img src="/img/rank/prize.png">
                            </div>
                            <div class="txt">나의 전국등수</div>
                            <div class="print" style="display: none; ">
                                <img src="/img/rank/print.png">
                            </div>
                        </div>
                        <div class="id_wrap">
                            <div class="id_box">
                                <div class="tit">이름</div>
                                <div class="txt">${login.name }</div>
                            </div>
                            <div class="id_box">
                                <div class="tit">고등학교</div>
                                <div class="txt">
									${view.school }
                                    <span>고등학교</span>
                                </div>
                            </div>
                        </div>
                        <div class="table_wrap">
                            <div class="inner">
                                <div class="table">
                                    <div class="theader">
                                        <div class="tit_wrap half first">
                                            <div class="tit">구분</div>
                                        </div>
                                        <div class="tit_wrap">
                                            <div class="tit">국어</div>
                                        </div>
                                        <div class="tit_wrap">
                                            <div class="tit tit1">수학</div>
                                            <div class="tit tit1">
                                                <div class="in_txt" id="examMathType">${view.mathType }</div>
                                            </div>
                                        </div>
                                        <div class="tit_wrap">
                                            <div class="tit">영어</div>
                                        </div>
                                        <div class="tit_wrap">
                                            <div class="tit"><span>한</span>국사</div>
                                        </div>
                                        <div class="tit_wrap tit_wrap1">
                                            <div class="tit tit1">
                                                <div class="in_txt" id="examExplorType">${view.expType }</div>
                                            </div>
                                            <div class="tit tit1 tit2">
                                                <div class="in_txt" id="examInnerType1">${view.expType1 }</div>
                                            </div>
                                            <div class="tit tit1 tit2">
                                                <div class="in_txt" id="examInnerType2">${view.expType2 }</div>
                                            </div>
                                        </div>
                                        <div class="tit_wrap lb">
                                            <div class="tit tit1">제2<span>외국어</span></div>
                                            <div class="tit tit1">
                                                <div class="in_txt" id="examLangType">${view.langType }</div>
                                            </div>
                                        </div>
                                        <div class="tit_wrap half last">
                                            <div class="tit">총점</div>
                                        </div>
                                    </div>
                                    <div class="tbody">
                                        <div class="tcontents">
                                            <div class="content half first">
                                                <div class="txt">원점수</div>
                                            </div>
                                            <div class="content">
                                                <div class="in_txt white" id="point1">${view.kor }</div>
                                            </div>
                                            <div class="content">
                                                <div class="pink in_txt" id="point2">${view.math }</div>
                                            </div>
                                            <div class="content">
                                                <div class="pink in_txt"  id="point3">${view.eng }</div>
                                            </div>
                                            <div class="content">
                                                <div class="pink in_txt" id="point4">${view.his }</div>
                                            </div>
                                            <div class="content">
                                                <div class="pink in_txt" id="point5"> ${view.exp1 }</div>
                                            </div>
                                            <div class="content">
                                                <div class="pink in_txt" id="point6">${view.exp2 }</div>
                                            </div>
                                            <div class="content lb">
                                                <div class="pink in_txt"  id="point7">${view.lang }</div>
                                            </div>
                                            <div class="content half last">
                                                <div class="in_txt fb">${view.sum }</div>
                                            </div>
                                        </div>
                                        <div class="tcontents t2">
                                            <div class="content half first">
                                                <div class="txt">등수</div>
                                            </div>
                                            <div class="content">
                                                <div class="white in_txt" id="point8">${rank.kor }</div>
                                            </div>
                                            <div class="content">
                                                <div class="pink in_txt"  id="point9">${rank.math }</div>
                                            </div>
                                            <div class="content">
                                                <div class="pink in_txt"  id="point10">${rank.eng }</div>
                                            </div>
                                            <div class="content">
                                                <div class="pink in_txt"  id="point11">${rank.his }</div>
                                            </div>
                                            <div class="content">
                                                <div class="pink in_txt"  id="point12">${rank.exp1 }</div>
                                            </div>
                                            <div class="content">
                                                <div class="pink in_txt"  id="point13">${rank.exp2 }</div>
                                            </div>
                                            <div class="content lb">
                                                <div class="pink in_txt"  id="point14">${rank.lang }</div>
                                            </div>
                                            <div class="content half last">
                                                <div class="in_txt fb">${rank.sum }</div>
                                            </div>
                                        </div>
                                        <div class="tcontents t2">
                                            <div class="content half first">
                                                <div class="txt">백분위</div>
                                            </div>
                                            <div class="content">
                                                <div class="white in_txt" id="point15">
                                                	<fmt:formatNumber pattern="#.##" value="${hund.kor }"/>
                                                </div>
                                            </div>
                                            <div class="content">
                                                <div class="pink in_txt"  id="point16">
                                                	<fmt:formatNumber pattern="#.##" value="${hund.math }"/>
                                                </div>
                                            </div>
                                            <div class="content">
                                                <div class="pink in_txt"  id="point17">
                                                	<fmt:formatNumber pattern="#.##" value="${hund.eng }"/>
                                                </div>
                                            </div>
                                            <div class="content">
                                                <div class="pink in_txt"  id="point18">
                                                	<fmt:formatNumber pattern="#.##" value="${hund.his }"/>
                                                </div>
                                            </div>
                                            <div class="content">
                                                <div class="pink in_txt"  id="point19">
                                                	<fmt:formatNumber pattern="#.##" value="${hund.exp1 }"/>
                                                </div>
                                            </div>
                                            <div class="content">
                                                <div class="pink in_txt"  id="point20">
                                                	<fmt:formatNumber pattern="#.##" value="${hund.exp2 }"/>
                                                </div>
                                            </div>
                                            <div class="content lb">
                                                <div class="pink in_txt"  id="point21">
                                                	<fmt:formatNumber pattern="#.##" value="${hund.lang }"/>
                                                </div>
                                            </div>
                                            <div class="content half last">
                                                <div class="in_txt fb">
                                                	<fmt:formatNumber pattern="#.##" value="${hund.sum }"/>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="tcontents tlast">
                                            <div class="content half first">
                                                <div class="txt">응시자</div>
                                            </div>
                                            <div class="content">
                                                <div class="white in_txt" id="point15">${pk }</div>
                                            </div>
                                            <div class="content">
                                                <div class="pink in_txt"  id="point16">${pm }</div>
                                            </div>
                                            <div class="content">
                                                <div class="pink in_txt"  id="point17">${pe }</div>
                                            </div>
                                            <div class="content">
                                                <div class="pink in_txt"  id="point18">${ph }</div>
                                            </div>
                                            <div class="content">
                                                <div class="pink in_txt"  id="point19">${px1 }</div>
                                            </div>
                                            <div class="content">
                                                <div class="pink in_txt"  id="point20">${px2 }</div>
                                            </div>
                                            <div class="content lb">
                                                <div class="pink in_txt"  id="point21">${pf }</div>
                                            </div>
                                            <div class="content half last">
                                                <div class="in_txt fb">${ps }</div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="rank_add_txt">※총점은 국어, 수학, 탐구영역의 합계입니다.</div>
                    </div>
                </div>
                <div class="page_inner">
                    <div class="sv_btn">
                        <a onclick="history.back()">
                            <img src="/img/rank/btn01.png">
                        </a>
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
    		$("input[id=breakNum]").keyup(function(event){ 
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
    	// 파일 선택시 이미지 미리보기
 		function showImg(input) {
    		console.log(123);
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
		// 대학추가 화살표
		$(".di_arrow_prev").hide();
		var sn = 0;
		function addArrow(arrow){
			switch(arrow){
			case "left":
				sn--;
				break;
			case "right":
				sn++;
				break;
			}
			$(".di_slider_inner").stop().animate({
				left: -309 * sn
			});
			switch(sn){
			case 0:
				$(".di_arrow_prev").hide();
				$(".di_arrow_next").show();
				break;
			case 1:
			case 2:
				$(".di_arrow_prev").show();
				$(".di_arrow_next").show();
				break;
			case 3:
				$(".di_arrow_prev").show();
				$(".di_arrow_next").hide();
				break;
			}
		}
		// 대학추가
		var schoolNum = 1;
		function addSchool(num){
			if(num - schoolNum != 1){
				alert("순서대로 추가해주세요.");
				return;
			}
			$.ajax({
				type : "post",
				url : "/record/addSchool/"+num,
				async : false,
				success : function(txt){
					$("#schoolDiv"+num).html(txt);
					schoolNum++;
				}
			});
		}
		// 대학 등록
		function schoolSubmit(){
			console.log(schoolNum);
			if(!loginCheck()){
    			return;
    		}
			var check = 0;
			for(var i=1; i<=schoolNum; i++){
				var addr = $("#addr"+i).val();
				var school = $("#school"+i).val();
				var type1 = $("#type"+i).val();
				var subject = $("#subject"+i).val();
				var pass = $("#passY"+i).prop("checked") ? "y" : $("#passN"+i).prop("checked") ? "n" : false;
				var type2 = $("#typeY"+i).prop("checked") ? "정시" : $("#typeN"+i).prop("checked") ? "수시" : false;
				if(addr == "choose" || school == "choose" || type1 == "" || subject == "" || !pass || !type2){
					check++;
					break;
				}
				var filename = $("#passData"+i).val();
				console.log(filename);
				if(filename != ""){
					var extension = filename.substring(filename.lastIndexOf(".")+1).toLowerCase();
					console.log(extension);
					console.log(extension == "jpg");
					if(extension != "jpeg" && extension != "png" && extension != "bmp" && extension != "gif" && extension != "jpg" && 
							extension != "pdf"){
						alert("jpeg/jpg/png/bmp/gif/pdf 형식의 파일만 등록할 수 있습니다.");
						return;
					}
				}
			}
			if(check > 0){
				alert("입력하지 않은 항목이 있습니다.");
				return;
			}
			var successNum = new Array();
			var failNum = new Array();
			for(var i=1; i<=schoolNum; i++){
				console.log("a");
				$("#schoolForm"+i).ajaxForm({
	    			url : "/record/uploadSchool",
	    			enctype : "multipart/form-data",
	    			async : false,
	    			success : function(txt){
	    				console.log(txt);
	    				if(txt){
	    					successNum[successNum.length] = i;
	    				} else {
	    					failNum[failNum.length] = i;
	    				}
	    			}
	    		});
	    		$("#schoolForm"+i).submit();
			}
			alert("총 "+schoolNum+"장 중 "+successNum+"번째 장 성공\n"+failNum+"번째 장 실패 하였습니다.");
			$.ajax({
				type : "post",
				url : "/record/schoolList/${login.auto }",
				async : false,
				success : function(txt){
					var html = "<option value='choose'>학교선택</option>";
					for(var i=0; i<txt.length; i++){
						html += "<option>"+txt[i]+"</option>";
					}
					$("#school_sel").html(html);
				}
			});
		}
		// 대학 학격증 등록
		function dataImg(num){
			var filename = $("#passData"+num).val();
			filename = filename.substring(filename.lastIndexOf('\\')+1);
			filename = filename.substring(filename.lastIndexOf('/')+1);
        	$("#dataName"+num).val(filename);
		}
		// 기본, 핵심정보 등록
		function infoSubmit(){
			if(!loginCheck()){
    			return;
    		}
    		var year = $("#year").val();
    		var grade = $("#grade").val();
    		var hschool = $("#hschool").val();
    		var book = $("#book").val();
    		var time = $("#time").val();
    		var awards = $("#awards").val();
    		if(year == "choose" || grade == "" || hschool == "" || book == "" || time == "" || awards ==  ""){
    			alert("입력하지 않은 항목이 있습니다.");
    		} else {
	    		$.ajax({
	    			type : "post",
	    			url : "/record/uploadInfo/${login.auto }/"+year+"/"+grade+"/"+hschool+"/"+book+"/"+time+"/"+awards,
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
			var examLangType = $("#examLangType").val();
			var pointAr = new Array();
			var passCount = $("#passFirst").prop("checked") ? "1차합격" : $("#passAdd").prop("checked") ? "추가합격" : false;
			var breakNum = $("#breakNum").val();
			for(var i=0; i<28; i++){
				pointAr[i] = $("#point"+(i+1)).val();
			}
			var pointCheck = 0;
			for(var i=0; i<pointAr.length; i++){
				if(pointAr[i] == ""){
					pointCheck++;
				}
			}
			console.log(pointCheck);
			if(pointCheck == 28){
				alert("입력된 값이 없습니다.");
				return;
			}
			if(!passCount){
				alert("합격타입을 선택해주세요.");
				return;
			}
			if(passCount == "추가합격"){
				if(breakNum == ""){
					alert("대기번호를 입력해주세요.");
					return;
				}
				passCount += "("+breakNum+"번)"
			}
			$.ajax({
				type : "post",
				url : "/record/uploadExam/${login.auto }/"+examType+"/"+examMathType+"/"+examExplorType+"/"+examInnerType1+"/"+
						examInnerType2+"/"+examLangType+"/"+pointAr+"/"+passCount,
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
		
		// 페이지 로딩시 대학 자동 추가
		$(document).ready(function(){
			var schoolSize = "${schoolList.size() }";
			if(schoolSize > 1){
				var schoolList;
				$.ajax({
					type : "post",
					url : "/exam/schoolList/${login.auto }",
					async : false,
					success : function(txt){
						schoolList = txt;
					}
				});
				for(var i=2; i<=schoolSize; i++){
					$("#school_plus"+i).trigger("click");
				}
				for(var i=1; i<=schoolSize; i++){
					$("#addr"+i).val(schoolList[i-1].addr);
					$("#type"+i).val(schoolList[i-1].type);
					$("#subject"+i).val(schoolList[i-1].subject);
					schoolList[i-1].pass == "합격" ? $("#passY"+i).prop("checked", true) : $("#passN"+i).prop("checked", true);
					schoolList[i-1].pass1 == "정시" ? $("#typeY"+i).prop("checked", true) : $("#typeN"+i).prop("checked", true);
					schoolChange(i);
					$("#school"+i).val(schoolList[i-1].school);
				}
			}
		});
		
		// 대학 지역 선택
		function schoolChange(num){
			var addr = $("#addr"+num).val();
			$.ajax({
				type : "post",
				url : "/university/"+addr,
				async : false,
				success : function(txt){
					$("#school"+num).html(txt);
				}
			});
		}
	</script>
    
</html>