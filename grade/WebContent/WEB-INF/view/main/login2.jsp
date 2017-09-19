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
            <div class="join">
            	<c:import url="/WEB-INF/view/main/side.jsp"/>
                <header class="sub_header">
                    <div class="hmenubar">
                        <img src="/img/hmenubar.png">
                    </div>
                    <c:import url="/WEB-INF/view/main/login.jsp"/>
                </header>
                <div class="page_inner">
                    <div class="logo">
                        <img src="/img/logo.png" onclick="location.href='/'">
                    </div>
                    <section class="section01">
                        <div class="join_input_wrap">
                            <div class="input">
                                <input type="text" id="id" placeholder="아이디" value="${saveId }">
                            </div>
                            <div class="input">
                                <input type="password" id="pw" placeholder="비밀번호">
                            </div>
                        </div>
                        <div class="confirm_btn" onclick="login()">로그인</div>
                        <div class="idpw_search">
                            <div class="txt" onclick="location.href='/member/search'">
                                <span>아이디</span>
                            </div>
                            <div class="txt">/</div>
                            <div class="txt" onclick="location.href='/member/search'">
                                <span>비밀번호 찾기</span>
                            </div>
                        </div>
                        <div class="id_check_box">
                            <input type="checkbox" name="pre" value="auto" id="autoLogin">
                            <label for="autoLogin" class="mr55">자동 로그인</label>
                            <input type="checkbox" class="checkbox" name="pre" value="save" id="saveId">
                            <label for="saveId">아이디 저장</label>
                        </div>
                    </section>
                    <section class="section02">
                        <div class="section_tit">
                            <div class="img">
                                <img src="/img/sub_logo.png">
                            </div>
                            <div class="tit">회원가입</div>
                        </div>
                        <div class="join_btn" onclick="location.href='/member/join1'">
                            <div class="img">
                                <img src="/img/join/join01_01/people.png">
                            </div>
                            <div class="txt">회원가입 하기</div>
                        </div>
                    </section>
                    <section class="section03">
                        <div class="idpw_search">
                            <div class="txt">
                                <span onclick="idSearch()">아이디찾기</span>
                                <div class="b_r"></div>
                            </div>
                            <div class="txt">
                                <span onclick="pwSearch()">비밀번호찾기</span>
                                <div class="b_r"></div>
                            </div>
                            <div class="txt">
                                <span onclick="location.href='/member/join1'">회원가입</spaN>
                            </div>
                        </div>
                    </section>
                </div>
            </div>
            <footer>
            	<c:import url="/WEB-INF/view/main/footer.jsp"/>
            </footer>
        </div>
    </body>
    
    <script>
    	// 로그인
    	function login(){
    		var id = $("#id").val();
    		var pw = $("#pw").val();
    		var auto = $("#autoLogin").prop("checked") ? true : false;
    		var save = $("#saveId").prop("checked") ? true : false;
    		if(id.length == 0 || pw.length == 0){
    			alert("아이디 / 비밀번호를 확인해주세요.");
    		} else {
    			$.ajax({
    				type : "post",
    				url : "/login/"+id+"/"+pw+"/"+auto+"/"+save,
    				async : false,
    				success : function(num){
    					if(num == 0){
    						location.href="/";
    					} else if(num == 1){
    						alert("탈퇴한 회원입니다.");
    					} else {
    						alert("아이디 / 비밀번호를 확인해주세요.");
    					}
    				}
    			});
    		}
    	}
    	// 비밀번호 입력란에서 엔터
    	$("#pw").keydown(function(e){
    		if(e.keyCode == 13){
    			login();
    		}
    	});
    	$(document).ready(function(){
    		// 자동로그인 체크시 아이디저장 체크해제
    		$("#autoLogin").change(function(){
    			var auto = $("#autoLogin").prop("checked") ? true : false;
    			if(auto){
    				$("#saveId").prop("checked", false);
    			}
    		});
    		// 아이디저장 체크시 자동로그인 체크해제
    		$("#saveId").change(function(){
    			var save = $("#saveId").prop("checked") ? true : false;
    			if(save){
    				$("#autoLogin").prop("checked", false);
    			}
    		});
    		// 아이디저장 상태일 시 아이디저장 체크
    		if($("#id").val() != ""){
    			$("#saveId").prop("checked", true);
    		}
    	});
    </script>
    
</html>