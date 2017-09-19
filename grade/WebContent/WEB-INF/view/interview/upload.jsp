<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<!doctype html>
<html oncontextmenu='return false' ondragstart='return false' onselectstart='return false'>
    <head>
    	<c:import url="/WEB-INF/view/main/head.jsp"/>
    </head>
     
    <body>
    	<c:import url="/WEB-INF/view/main/side.jsp"/>
        <div id="wrapper">
            <form action="/interview/uploadInterview2" method="post" id="uploadForm">
            <div class="interview01">
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
                <div class="infomation_wrap infomation_wrap1">
                    <div class="inner">
                        <select class="uni_sel" id="chooseUniv" name="univ">
                            <option value="choose">대학선택</option>
                            <c:forEach var="t" items="${schoolList }">
                            	<option value="${t.school }">${t.schoolName }</option>
                            </c:forEach>
                        </select>
                        <div class="infomation_txt">※ 면접방법</div>
                        <div class="detail_info_wrap">
                            <div class="detail_info">
                                <div class="info">
                                    <div class="img">
                                        <img src="/img/interview/interview01/info01.png">
                                    </div>
                                    <input type="text" placeholder="예) 15분 ( 준비시간 없음)" id="time" name='time'> 
                                </div>
                                <div class="info info1">
                                    <div class="img">
                                        <img src="/img/interview/interview01/info05.png">
                                    </div>
                                    <input type="text" placeholder="예) 2명" id="people" name="people"> 
                                </div>
                                <div class="info info1 fr">
                                    <div class="img">
                                        <img src="/img/interview/interview01/info06.png">
                                    </div>
                                    <input type="text" placeholder="예) 제시문 면접" id="kinds" name="kinds"> 
                                </div>
                                <div class="info">
                                    <div class="img">
                                        <img src="/img/interview/interview01/info07.png">
                                    </div>
                                    <input type="text" placeholder="예) 대기장소 대기 한명씩 면접실로 이동 면접" id="how" name="how">
                                </div>
                                <div class="info">
                                    <div class="img">
                                        <img src="/img/interview/interview01/info08.png">
                                    </div>
                                    <input type="text" placeholder="예) 대기시간이 길어 늦게 끝날 수 있음" id="tip" name="tip">
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="page_inner">
                    <div class="student_view_txt">※ 작성한 내용의 10%만 구매전 읽기가 가능합니다.</div>
                    <div class="ssw_tit">
                        <div class="img">
                            <img src="/img/student_view/info_tit.png">
                        </div>
                        <div class="tit">
                            면접후기1
                        </div>
                    </div>
                    <div class="txtarea_wrap">
                        <div class="img">
                            <img src="/img/interview/interview01/interview_tit.png">
                        </div>
                        <div class="tit">
                            ※ 질문 및 답변내용을 적어주세요
                        </div>
                        <textarea placeholder="내용을 입력하세요." id="content1" name="content1"></textarea>
                    </div>
                    <div class="ssw_tit">
                        <div class="img">
                            <img src="/img/student_view/info_tit.png">
                        </div>
                        <div class="tit">
                            면접후기2
                        </div>
                    </div>
                    <div class="txtarea_wrap">
                        <div class="img">
                            <img src="/img/interview/interview01/interview_tit01.png">
                        </div>
                        <div class="tit">
                            ※ 기타 특이사항 또는 나만의 면접 팁을 적어주세요
                        </div>
                        <textarea placeholder="내용을 입력하세요." id="content2" name="content2"></textarea>
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
    	// 등록
    	function upload(){
    		if(${login == null}){
    			alert("로그인 후 이용할 수 있습니다.");
    			location.href='/member/login';
    			return;
    		}
    		var addr = $("#addr").val();
    		var school = $("#school").val();
    		var subject = $("#subject").val();
    		var type = $("#type").val();
    		var year = $("#year").val();
    		var admission = $("#admission").val(); 
    		var typical = $("#typical").val();
    		var pass = $("#passY").prop("checked") ? "합격" : $("#passN").prop("checked") ? "불합격" : false;
    		var time = $("#time").val();
    		var people = $("#people").val();
    		var kinds = $("#kinds").val();
    		var how = $("#how").val();
    		var tip = $("#tip").val();
    		var content1 = $("#content1").val();
    		var content2 = $("#content2").val();
    		var univ = $("#chooseUniv").val();
    		if(${login.id == 'admin' }){
	    		if(addr == "choose" || school == "choose" || subject == "" || type == "choose" || year == "" || admission == "" || typical == "" ||
	    				!pass || time == "" || people == "" || kinds == "" || how == "" || tip == "" || content1 == "" || content2 == ""){
	    			alert("입력하지 않은 항목이 있습니다.");
	    			return;
	    		}
    		} else {
	    		if(univ == "choose" || time == "" || people == "" || kinds == "" || how == "" || tip == "" || content1 == "" || content2 == ""){
	    			alert("입력하지 않은 항목이 있습니다.");
	    			return;
	    		}
    		}
    		if(content1.length < 30){
    			alert("질문 및 답변내용은 30자이상 작성해주세요.");
    			return;
    		}
    		content1 = content1.replace(/\n/g, "<br>");
    		content2 = content2.replace(/\n/g, "<br>");
			addr = addr == "choose" ? "s" : addr;
			school = school == "choose" ? univ : school;
			subject = subject == "" ? "s" : subject;
			type = type == "choose" ? "s" : type;
			year = year == "" ? "s" : year;
			admission = admission == "" ? "s" : admission;
			typical = typical == "" ? "s" : typical;
			pass = pass == "choose" ? "s" : pass;
    		$("#uploadForm").submit();
    		return;
			$("#uploadForm").ajaxForm({
    			enctype : "method",
    			url : "/interview/uploadInterview/"+addr+"/"+school+"/"+subject+"/"+type+"/"+year+"/"+admission+
    					"/"+typical+"/"+pass+"/"+time+"/"+people+"/"+kinds+"/"+how+"/"+tip+"/"+content1+"/"+content2,
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
    	
    	// 대학 지역 선택
		$("#addr").change(function(){
			var addr = $("#addr").val();
			$.ajax({
				type : "post",
				url : "/university/"+addr,
				async : false,
				success : function(txt){
					$("#school").html(txt);
				}
			});
		});
    </script>
    
</html>