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
            <div class="buy01">
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
	                        <div class="tit">구매내역</div>
	                    </section>
	                    <section class="section01">
	                        <div class="bbs_wrap">
	                            <div class="bbs">
	                                <div class="tit bbs_buy">카테고리</div>
	                                <div class="tit bbs_buy">아이디</div>
	                                <div class="tit bbs_buy">학교</div>
	                                <div class="tit bbs_buy">학과</div>
	                                <div class="tit bbs_buy">사용포인트</div>
	                                <div class="tit bbs_buy">사용일</div>
	                            </div>
	                            <c:choose>
	                            	<c:when test="${buyList.size()>0 }">
			                            <c:forEach var="t" items="${buyList }">
				                            <div class="bbs">
				                                <div class="txt bbs_buy">${t.item }</div>
				                                <div class="txt bbs_buy">${t.id }</div>
				                                <div class="txt bbs_buy">${t.schoolName }</div>
				                                <div class="txt bbs_buy">${t.subject }</div>
				                                <div class="txt bbs_buy">${t.point }</div>
				                                <div class="txt bbs_buy">${t.day }</div>
				                            </div>
			                            </c:forEach>
	                            	</c:when>
	                            	<c:otherwise>
	                            		<div class="bbs_txt">구매내역이 없습니다.</div>
	                            	</c:otherwise>
	                            </c:choose>
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
</html>