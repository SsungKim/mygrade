<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<!doctype html>
<html oncontextmenu='return false' ondragstart='return false' onselectstart='return false'>
    <head>
    	<c:import url="/WEB-INF/view/main/head.jsp"/>
    </head>
     
    <body>
        <div id="wrapper">
            <div class="intro02">
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
                <div class="infomation_wrap infomation_wrap1">
                    <div class="inner">
                        <div class="infomation_txt1">
<!-- 							※ 핵심정보는 구매자가 구매해야 보입니다. -->
                        </div>
                        <div class="confirm_btn" onclick="infoSubmit()">등록하기</div>
                        <div class="detail_info">
                            <div class="detail_info_tit">기본 정보</div>
                            <div class="info">
                                <div class="img">
                                    <img src="/img/student_view/info01.png">
                                </div>
                                <select id="year">
                                    <option value="choose">선택</option>
                                    <option ${info.year == '2017년' ? 'selected' : '' }>2017년</option>
                                    <option ${info.year == '2016년' ? 'selected' : '' }>2016년</option>
                                    <option ${info.year == '2015년' ? 'selected' : '' }>2015년</option>
                                </select>
                                <div class="txt">입학</div>
                            </div>
                            <div class="info">
                                <div class="img">
                                    <img src="/img/student_view/info02.png">
                                </div>
                                <input type="text" placeholder="1" id="grade" value="${info.grade }"> 
                                <div class="txt">등급</div>
                            </div>
                        </div>
                        <div class="detail_boundry"></div>
                        <div class="detail_info">
                            <div class="detail_info_tit">핵심 정보</div>
                            <div class="info">
                                <div class="img">
                                    <img src="/img/student_view/info06.png">
                                </div>
                                <input type="text" placeholder="서울네모" id="hschool" value="${info.hschool }"> 
                                <div class="txt">고등학교</div>
                            </div>
                            <div class="info">
                                <div class="img">
                                    <img src="/img/student_view/info04.png">
                                </div>
                                <input type="text" placeholder="1" id="time" value="${info.time }"> 
                                <div class="txt">시간</div>
                            </div>
                            <div class="info">
                                <div class="img">
                                    <img src="/img/student_view/info03.png">
                                </div>
                                <input type="text" placeholder="1" id="book" value="${info.book }"> 
                                <div class="txt">권</div>
                            </div>
                            <div class="info">
                                <div class="img">
                                    <img src="/img/student_view/info05.png">
                                </div>
                                <input type="text" placeholder="1" id="awards" value="${info.awards }"> 
                                <div class="txt">개</div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="page_inner" id="introDivWrap">
                    <div class="txtarea_wrap">
                        <div class="img">
                            <img src="/img/intro/intro_tit01.png">
                        </div>
                        <div class="tit">
                            ※ 고등학교 재학기간 중 학업에 기울인 노력과 학습 경험에 대해, 배우고 느낀 점을 중심으로 기술해 주시기 바랍니다( 1000자 이내 ).
                        </div>
                        <textarea placeholder="내용을 입력하세요." id="content1" maxlength="1000">${intro.content1 }</textarea>
                    </div>
                    <div class="txtarea_wrap">
                        <div class="img">
                            <img src="/img/intro/intro_tit02.png">
                        </div>
                        <div class="tit">
                            ※ 고등학교 재학기간 중 본인이 의미를 두고 노력했던 교내 활동을 배우고 느낀점을 중심으로 3개 이내로 기술해 주시기 바랍니다.<br> 단, 교외 활동 중 학교장의 허락을 받고 참여한 활동은 포함됩니다 ( 1,500자 이내 ).
                        </div>
                        <textarea placeholder="내용을 입력하세요." id="content2" maxlength="1500">${intro.content2 }</textarea>
                    </div>
                    <div class="txtarea_wrap">
                        <div class="img">
                            <img src="/img/intro/intro_tit03.png">
                        </div>
                        <div class="tit">
                            ※ 학교 생활 중 배려, 나눔, 협력, 갈등 관리 등을 실천한 사례를 들고, 그 과정을 통해 배우고 느낀 점을 기술해 주시기 바랍니다 ( 1,000자 이내 ).
                        </div> 
                        <textarea placeholder="내용을 입력하세요." id="content3" maxlength="1000">${intro.content3 }</textarea>
                    </div>
                    <div class="txtarea_wrap">
                        <div class="img">
                            <img src="/img/intro/intro_tit04.png">
                        </div>
                        <div class="tit">
                            ※ 지원 동기 등 학생을 종합적으로 판단하기 위해 필요한 경우 대학별로 1 개의 자율 문항을 추가하여 활용하시기 바랍니다<br> ( 글자 수는 1,000자 또는 1,500자 이내로 하고 대학에서 선택 ).
                        </div>
                        <select id="univ">
                            <option value="choose">대학을 선택하세요</option>
                            <c:forEach var="t" items="${schoolList }">
                            	<option value="${t.school }" ${t.school == intro.school ? 'selected' : '' }>${t.univ }</option>
                            </c:forEach>
                        </select>
                        <input type="text" placeholder="제목을 입력하세요." id="title" maxlength="100" value="${intro.title }">
                        <textarea class="txta1" placeholder="내용을 입력하세요." id="content4" maxlength="1500">${intro.content4 }</textarea>
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
    	// 자소서 등록
    	function upload(){
    		if(!loginCheck()){
    			return;
    		}
    		var content1 = $("#content1").val();
    		var content2 = $("#content2").val();
    		var content3 = $("#content3").val();
    		var content4 = $("#content4").val();
    		var title = $("#title").val();
    		var univ = $("#univ").val();
    		if(content1.length == 0 || content2.length == 0 || content3.length == 0 || content4.length == 0 || title.length == 0 ||
    				univ == "choose"){
    			alert("입력하지 않은 항목이 있습니다.");
    			return;
    		}
    		content1 = content1.replace(/\n/g, "<br>");
    		content2 = content2.replace(/\n/g, "<br>");
    		content3 = content3.replace(/\n/g, "<br>");
    		content4 = content4.replace(/\n/g, "<br>");
    		$.ajax({
    			type : "post",
    			url : "/intro/uploadIntro/${login.auto }/"+univ+"/"+content1+"/"+content2+"/"+content3+"/"+title+"/"+content4,
    			async : false,
    			success : function(txt){
    				if(txt){
    					alert("등록되었습니다.");
    					location.href='/member/myData/${login.auto }';
    				} else {
    					alert("등록에 실패하였습니다.\n잠시후 다시 시도해주세요.");
    				}
    			}
    		});
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
	</script>
    
</html>