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
            <div class="sell01">
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
                                <img src="/img/notice/notice01/item01.png">
                            </div>
	                        <div class="tit">판매내역</div>
	                    </section>
	                    <section class="section01">
	                        <div class="bbs_wrap">
                                <div class="bbs_inner">
                                    <div class="bbs">
                                        <div class="tit bbs_sell">카테고리</div>
                                        <div class="tit bbs_sell">학교</div>
                                        <div class="tit bbs_sell">학과</div>
                                        <div class="tit bbs_sell">획득포인트</div>
                                        <div class="tit bbs_sell">획득일</div>
                                    </div>
                                    <c:choose>
                                        <c:when test="${sellList.size()>0 }">
                                            <c:forEach var="t" items="${sellList }">
                                                <div class="bbs">
                                                    <div class="txt bbs_sell">${t.item }</div>
                                                    <div class="txt bbs_sell">${t.schoolName }</div>
                                                    <div class="txt bbs_sell">${t.subject }</div>
                                                    <div class="txt bbs_sell">${t.point }</div>
                                                    <div class="txt bbs_sell">${t.day }</div>
                                                </div>
                                            </c:forEach>
                                        </c:when>
                                        <c:otherwise>
                                            <div class="bbs_txt">판매내역이 없습니다.</div>
                                        </c:otherwise>
                                    </c:choose>
                                </div>
	                        </div>
                            <div class="page_select_wrap">
                                <c:import url="/WEB-INF/view/member/sales/page.jsp"/>
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
   			location.href='/notice/view/'+num;
    	}
    </script>
    
</html>