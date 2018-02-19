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
            <div class="notice01">
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
	                        <div class="tit">
	                        	<span onclick="location.href='/notice'">공지사항</span> |
	                        	<span onclick="location.href='/faq'">문의사항</span> |
                                <span class="sel" onclick="location.href='/info'">입시정보</span> |
                                <span onclick="location.href='/free'">자유게시판</span>
	                        </div>
	                    </section>
	                    <section class="section01">
	                        <div class="bbs_wrap">
	                            <div class="bbs">
	                                <div class="tit bbs_number">번호</div>
	                                <div class="tit bbs_tit">제목</div>
	                                <div class="tit bbs_name">작성자</div>
	                                <div class="tit bbs_date">작성일</div>
	                            </div>
	                            <c:choose>
	                            	<c:when test="${list.size()>0 }">
			                            <c:forEach var="t" items="${list }">
				                            <div class="bbs">
				                                <div class="txt bbs_number">${t.auto }</div>
				                                <div class="txt bbs_tit" onclick="view(${t.auto })">
				                                    <c:choose>
				                                		<c:when test="${t.title.length() > 27 }">
						                                    <span>${t.title.substring(0, 27) }...</span>
				                                		</c:when>
				                                		<c:otherwise>
						                                    <span>${t.title }</span>
				                                		</c:otherwise>
				                                	</c:choose>
				                                </div>
				                                <div class="txt bbs_name">관리자</div>
				                                <div class="txt bbs_date">${t.day }</div>
				                            </div>
			                            </c:forEach>
	                            	</c:when>
	                            	<c:otherwise>
	                            		<div class="bbs_txt">등록된 글이 없습니다.</div>
	                            	</c:otherwise>
	                            </c:choose>
	                        </div>
	                        <c:if test="${login.admin == '메인관리자' || login.admin == '중간관리자' }">
                                <div class="write_btn" onclick="location.href='/info/write'">
                                    <div class="txt">글쓰기</div>
                                </div>
	                        </c:if>
                            <div class="page_select_wrap">
                                <c:import url="/WEB-INF/view/board/info/page.jsp"/>
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
    	// 글 보기
    	function view(num){
    		if(${login == null}){
    			alert("로그인 후 이용가능합니다.");
    			location.href="/member/login";
    			return;
    		}
   			location.href='/info/view/'+num;
    	}
    </script>
    
</html>