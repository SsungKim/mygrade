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
            <div class="rank_list">
            	<c:import url="/WEB-INF/view/main/side.jsp"/>
            	<header class="sub_header">
                    <div class="hmenubar">
                        <img src="/img/hmenubar.png">
                    </div>
                    <c:import url="/WEB-INF/view/main/login.jsp"/>
                </header>
	            <div class="page_inner">
                    <header class="main_header">
                         <div class="logo">
                             <img src="/img/logo.png" onclick="location.href='/'">
                         </div>
                    </header>
	                <div class="contents">
	                    <section class="contents_tit">
                            <div class="img">
                                <img src="/img/rank/tit_dot.png">
                            </div>
	                        <div class="tit">전국등수 확인</div>
	                    </section>
	                    <section class="section01">
	                        <div class="bbs_wrap">
	                            <div class="bbs">
	                                <div class="tit bbs_number">번호</div>
	                                <div class="tit bbs_exam">모의고사</div>
	                                <div class="tit bbs_date">등록날짜</div>
	                            </div>
	                            <c:choose>
	                            	<c:when test="${rankList.size()>0 }">
			                            <c:forEach var="t" items="${rankList }">
				                            <div class="bbs">
				                                <div class="txt bbs_number">${t.auto }</div>
				                                <div class="txt bbs_exam" onclick="view(${t.auto })">
				                                	<span>${t.rankDay }</span>
				                                </div>
				                                <div class="txt bbs_date">${t.day }</div>
				                            </div>
			                            </c:forEach>
	                            	</c:when>
	                            	<c:otherwise>
	                            		<div class="bbs_txt">등록하신 모의고사가 없습니다.</div>
	                            	</c:otherwise>
	                            </c:choose>
	                        </div>
                            <div class="upload_btn">
                                <a href="/rank/write">
                                    <img src="/img/rank/btn02.png">
                                </a>
                            </div>
                            <div class="page_select_wrap">
                                <c:import url="/WEB-INF/view/rank/page.jsp"/>
                            </div>
	                    </section>
	                </div>
	            </div>
			</div>
			<footer>
            	<c:import url="/WEB-INF/view/main/footer.jsp"/>
            </footer>
		</div>
    </body>
    
    <script>
//     	// 페이지 표시
//     	$(document).ready(function(){
//     		if(${noticePage > 10}){
//     			$("#next").css("display", "block");
//     		}
//     		if(${selectPage > 10}){
//     			$("#prev").css("display", "block");
//     		}
//     		if(${end >= noticePage}){
//     			$("#next").css("display", "none");
//     		}
//     	});
//     	// 페이지 이동
//     	function page(num){
//     		location.href="/notice/page/"+num;
//     	}
//     	// 이전
//     	function prev(num){
//     		location.href="/notice/page/"+(num-10);
//     	}
//     	// 다음
//     	function next(num){
//     		location.href="/notice/page/"+(num+10);
//     	}
    	// 글 보기
    	function view(num){
   			location.href='/rank/view/'+num;
    	}
    </script>
    
</html>