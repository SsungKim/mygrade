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
	                        	<span class="sel" onclick="location.href='/faq'">문의사항</span>
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
                                    <c:when test="${listNew.size() > 0}">
                                        <c:forEach var="t" items="${listNew}">
                                            <div class="bbs bbs_new">
                                                <div class="txt bbs_number">
                                                    <img src="/img/notice/notice01/new.png">
                                                </div>
                                                <div class="txt bbs_tit" onclick="view('${t.auto }', '${t.writer }')">
                                                    <c:choose>
                                                        <c:when test="${t.title.length() > 27 }">
                                                            <span>${t.title.substring(0, 27) }...</span>
                                                        </c:when>
                                                        <c:otherwise>
                                                            <span>${t.title }</span>
                                                        </c:otherwise>
                                                    </c:choose>
                                                </div>
                                                <div class="txt bbs_name">${t.writer }</div>
                                                <div class="txt bbs_date">${t.day }</div>
                                            </div>
                                        </c:forEach>
                                    </c:when>
	                            	<c:when test="${list.size()>0 }">
			                            <c:forEach var="t" items="${list }">
				                            <div class="bbs">
				                                <div class="txt bbs_number">${t.auto }</div>
				                                <div class="txt bbs_tit" onclick="view('${t.auto }', '${t.writer }')">
				                                    <c:choose>
				                                		<c:when test="${t.title.length() > 27 }">
						                                    <span>${t.title.substring(0, 27) }...</span>
				                                		</c:when>
				                                		<c:otherwise>
						                                    <span>${t.title }</span>
				                                		</c:otherwise>
				                                	</c:choose>
				                                </div>
				                                <div class="txt bbs_name">${t.writer }</div>
				                                <div class="txt bbs_date">${t.day }</div>
				                            </div>
			                            </c:forEach>
	                            	</c:when>
	                            	<c:otherwise>
	                            		<div class="bbs_txt">등록된 글이 없습니다.</div>
	                            	</c:otherwise>
	                            </c:choose>
	                            
	                        </div>
	                        <c:if test="${login != null }">
                                <div class="write_btn" onclick="location.href='/faq/write'">
                                    <div class="txt">글쓰기</div>
                                </div>
	                        </c:if>
                            <div class="page_select_wrap">
                                <c:import url="/WEB-INF/view/board/faq/page.jsp"/>
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
    	function view(num, writer){
    		var id = '${login.id }';
    		if(id != writer && ${login.id != 'admin' }){
    			alert("비공개 글입니다.");
    			return;
    		}
   			location.href='/faq/view/'+num;
    	}
    </script>
    
</html>