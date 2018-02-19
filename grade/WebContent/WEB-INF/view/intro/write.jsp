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
        	<form action="/intro/uploadIntro" id="introForm" method="post">
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
	                <c:import url="/WEB-INF/view/admin/uploadAdminWrap.jsp"/>
	                <div class="infomation_wrap">
	                    <div class="inner">
	                        <div class="iw_tit">
	                            <div class="img">
	                                <img src="/img/student_view/info_tit.png">
	                            </div>
	                            <div class="txt">
	                                 자기소개서 작성
	                            </div>
	                        </div>
	                        <div class="uni_sel_wrap" id="chooseUniv">
	                            <select id="univ" name="univ">
	                                <option value="choose">대학을 선택하세요.</option>
	                                <c:forEach var="t" items="${schoolList }">
	                                	<option value="${t.school }">${t.schoolName }</option>
	                                </c:forEach>
	                            </select>
	                        </div>
	                    </div>
	                </div>
	                <div class="page_inner" id="introDivWrap">
                        <div class="iw_tit1">
                            <div class="img">
                                <img src="/img/student_view/info_tit.png">
                            </div>
                            <div class="txt">
                                 자기소개서1
                            </div>
                        </div>
	                    <div class="txtarea_wrap">
	                        <div class="img">
	                            <img src="/img/intro/intro_tit01.png">
	                        </div>
                            <div class="txta_wrap">
                                <div class="tit">
                                    ※ 고등학교 재학기간 중 학업에 기울인 노력과 학습 경험에 대해, 배우고 느낀 점을 중심으로 기술해 주시기 바랍니다( 1000자 이내 ).
                                </div>
	                           <textarea placeholder="내용을 입력하세요." id="content1" maxlength="1000" name="content1"></textarea>
                            </div>
	                    </div>
                        <div class="iw_tit1">
                            <div class="img">
                                <img src="/img/student_view/info_tit.png">
                            </div>
                            <div class="txt">
                                 자기소개서2
                            </div>
                        </div>
	                    <div class="txtarea_wrap">
	                        <div class="img">
	                            <img src="/img/intro/intro_tit02.png">
	                        </div>
                            <div class="txta_wrap">
                                <div class="tit">
                                    ※ 고등학교 재학기간 중 본인이 의미를 두고 노력했던 교내 활동을 배우고 느낀점을 중심으로 3개 이내로 기술해 주시기 바랍니다.<br> 단, 교외 활동 중 학교장의 허락을 받고 참여한 활동은 포함됩니다 ( 1,500자 이내 ).
                                </div>
	                           <textarea placeholder="내용을 입력하세요." id="content2" maxlength="1500" name="content2"></textarea>
                            </div>
	                    </div>
                        <div class="iw_tit1">
                            <div class="img">
                                <img src="/img/student_view/info_tit.png">
                            </div>
                            <div class="txt">
                                 자기소개서3
                            </div>
                        </div>
	                    <div class="txtarea_wrap">
	                        <div class="img">
	                            <img src="/img/intro/intro_tit03.png">
	                        </div>
                            <div class="txta_wrap">
                                <div class="tit">
                                    ※ 학교 생활 중 배려, 나눔, 협력, 갈등 관리 등을 실천한 사례를 들고, 그 과정을 통해 배우고 느낀 점을 기술해 주시기 바랍니다 ( 1,000자 이내 ).
                                </div>
	                           <textarea placeholder="내용을 입력하세요." id="content3" maxlength="1000" name="content3"></textarea>
                            </div>
	                    </div>
                        <div class="iw_tit1">
                            <div class="img">
                                <img src="/img/student_view/info_tit.png">
                            </div>
                            <div class="txt">
                                 자기소개서4
                            </div>
                        </div>
	                    <div class="txtarea_wrap txtarea_wrap4">
	                        <div class="img">
	                            <img src="/img/intro/intro_tit04.png">
	                        </div>
                            <div class="txta_wrap">
                                <div class="tit">
                                    ※ 지원 동기 등 학생을 종합적으로 판단하기 위해 필요한 경우 대학별로 1 개의 자율 문항을 추가하여 활용하시기 바랍니다<br> ( 글자 수는 1,000자 또는 1,500자 이내로 하고 대학에서 선택 ).
                                </div>
                                <input type="text" placeholder="질문을 입력하세요." id="title" maxlength="100" name="title">
	                           <textarea class="txta1" placeholder="내용을 입력하세요." id="content4" maxlength="1500" name="content4"></textarea>
                            </div>
	                    </div>
	                    <div class="sv_btn_wrap">
	                        <div class="sv_btn" onclick="history.back()">
	                            <img src="/img/student_add/btn01.png">
	                        </div>
	                        <div class="sv_btn" onclick="upload()">
	                            <img src="/img/student_add/btn02.png">
	                        </div>
	                    </div>
	                </div>
	            </div>
            </form>
            <footer>
            	<c:import url="/WEB-INF/view/main/footer.jsp"/>
            </footer>
        </div>
    </body>
    
    <script>
	 	// 학교등록부터 하게끔 유도
		$(document).ready(function(){
			if(${login.admin == '판매자' || login.admin == '구매자'}){
	    		$.ajax({
	    			type : "post",
	    			url : "/member/schoolCheck/${login.auto }",
	    			async : false,
	    			success : function(txt){
	    				if(txt){
	    					alert("학교등록을 먼저 진행해주세요.");
	    					location.href="/school";
	    				}
	    			}
	    		});
			}
		});
    	// 관리자일경우 입력란 보이기
    	$(document).ready(function(){
    		loginCheck();
    		if(${login.id == 'admin' }){
    			$("#adminWrap").show();
    			$("#chooseUniv").hide();
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
    		var addr = $("#addr").val();
    		var school = $("#school").val();
    		var subject = $("#subject").val();
    		var type = $("#typeY").val();
    		var year = $("#year").val();
    		var admission = $("#admission").val();
    		var typical = $("#typical").val();
    		var pass = $("#passY").prop("checked") ? "합격" : $("#passN").prop("checked") ? "불합격" : false;
    		if(${login.id == 'admin' }){
    			if(addr == "choose" || school == "choose" || subject == "" || type == "choose" || year == "" || admission == "" ||
    					typical == "" || !pass){
    				alert("입력하지 않은 항목이 있습니다.");
    				return;
    			}
    		} else {
    			if(univ == "choose"){
    				alert("입력하지 않은 항목이 있습니다.");
    				return;
    			}
    		}
    		if(content1.length == 0 || content2.length == 0 || content3.length == 0 || content4.length == 0 || title.length == 0){
    			alert("입력하지 않은 항목이 있습니다.");
    			return;
    		}
    		$("#introForm").submit();
    		return;
    		$("#introForm").ajaxForm({
    			url : "/intro/uploadIntro",
    			success : function(txt){
    				if(txt){
    					alert("등록되었습니다.");
    					location.href="/member/myData/${login.auto }";
    				} else {
    					alert("등록에 실패하였습니다.\n잠시후 다시 시도해주세요.");
    				}
    			}
    		});
    		$("#introForm").submit();
    	}
	</script>
    
</html>