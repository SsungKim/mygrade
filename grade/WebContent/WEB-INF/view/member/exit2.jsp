<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<!doctype html>
<html oncontextmenu='return false' ondragstart='return false' onselectstart='return false'>
    <head>
    	<c:import url="/WEB-INF/view/main/head.jsp"/>
    </head>
     
    <body oncontextmenu='return false' ondragstart='return false' onselectstart='return false'>
    	<c:import url="/WEB-INF/view/main/side.jsp"/>
        <div id="wrapper">
            <div class="myinfo02">
                <header class="sub_header">
                    <div class="hmenubar">
                        <img src="/img/hmenubar.png">
                    </div>
                    <c:import url="/WEB-INF/view/main/login.jsp"/>
                </header>
                <div class="page_inner">
                    <div class="main_header">
                        <div class="logo">
                            <img src="/img/logo.png" onclick="location.href='/'">
                        </div>
                    </div>
                    <div class="logo_boundry"></div>
                    <section class="section01">
                        <div class="section_tit">
                            <div class="tit">
                                회원 탈퇴
                            </div>
                            <div class="tit_line"></div>
                        </div>
                        <div class="section_txt">
                            <div class="logo">
                                <img src="/img/logo.png">
                            </div>
                            <div class="txt">
                                회원 탈퇴가 완료 돼었습니다. <br>
                                그동안 넌몇대? 를 이용해 주셔서 감사합니다.
                            </div>
                        </div>
                        <div class="confirm_btn" onclick="location.href='/logout'">
                            메인으로
                        </div>
                    </section>
                </div>
            </div>
        </div>
    </body>
</html>