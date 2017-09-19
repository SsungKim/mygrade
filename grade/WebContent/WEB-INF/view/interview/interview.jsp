<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<!doctype html>
<html oncontextmenu='return false' ondragstart='return false' onselectstart='return false'>
<head>
<c:import url="/WEB-INF/view/main/head.jsp" />
</head>

<body>
	<div id="wrapper">
		<div class="interview03">
			<c:import url="/WEB-INF/view/main/side.jsp" />
			<header class="sub_header">
				<div class="hmenubar">
					<img src="/img/hmenubar.png">
				</div>
				<c:import url="/WEB-INF/view/main/login.jsp" />
			</header>
			<div class="page_inner">
				<div class="main_header">
					<div class="logo">
						<img src="/img/logo.png" onclick="location.href='/'">
					</div>
					<div class="all_view">
						<span onclick="location.href='/interview'">전체보기</span>
					</div>
					<div class="detail_search_wrap">
						<div class="search_wrap">
							<select id="searchType">
								<option ${sType == '학교' ? 'selected' : '' }>학교</option>
								<option ${sType == '학과' ? 'selected' : '' }>학과</option>
							</select>
							<input class="detail_search" type="text" placeholder="상세검색" id="searchTxt" value="${word }">
							<img class="search_img" src="/img/main/search.png" onclick="search()">
						</div>
					</div>
				</div>
				<div class="detail_item_wrap">
					<c:forEach var="t" items="${interview }">
						<div class="detail_item1" onclick="view(${t.auto})">
							<div class="logo_wrap">
                                <div class="sname0">
                                	<c:choose>
                                		<c:when test="${t.schoolName.indexOf('(') > 0 }">
		                                    <span>${t.schoolName.substring(0, t.schoolName.indexOf('(')) }</span>
                                		</c:when>
                                		<c:otherwise>
		                                    <span>${t.schoolName }</span>
                                		</c:otherwise>
                                	</c:choose>
                                </div>
                                <div class="inner">
                                    <div class="school_logo">
                                        <img src="/img/university/${t.school }.png" />
                                    </div>
                                    <div class="sname">
                                    	<c:choose>
                                    		<c:when test="${t.schoolName.indexOf('(') > 0 }">
		                                        <span>${t.schoolName.substring(t.schoolName.indexOf('(')+1, t.schoolName.indexOf(')')) }</span><br>
                                    		</c:when>
                                    		<c:otherwise>
                                    			<span>${t.schoolName }</span><br>
                                    		</c:otherwise>
                                    	</c:choose>
                                        ${t.name.substring(0, 1) }
                                        <c:forEach var="i" begin="1" end="${t.name.length()-1 }">O</c:forEach>
                                        <div class="star_wrap">
                                            <c:choose>
                                                <c:when test="${t.point == 0 }">
                                                    <c:forEach var="i" begin="1" end="5">
                                                        <div class="star">
                                                            <img src="/img/interview/interview01/star02.png">
                                                        </div>
                                                    </c:forEach>
                                                </c:when>
                                                <c:when test="${t.point / t.comment >= 4.5 }">
                                                    <c:forEach var="i" begin="1" end="5">
                                                        <div class="star">
                                                            <img src="/img/interview/interview01/star01.png">
                                                        </div>
                                                    </c:forEach>
                                                </c:when>
                                                <c:when test="${t.point / t.comment >= 3.5 }">
                                                    <c:forEach var="i" begin="1" end="4">
                                                        <div class="star">
                                                            <img src="/img/interview/interview01/star01.png">
                                                        </div>
                                                    </c:forEach>
                                                    <c:forEach var="i" begin="1" end="1">
                                                        <div class="star">
                                                            <img src="/img/interview/interview01/star02.png">
                                                        </div>
                                                    </c:forEach>
                                                </c:when>
                                                <c:when test="${t.point / t.comment >= 2.5 }">
                                                    <c:forEach var="i" begin="1" end="3">
                                                        <div class="star">
                                                            <img src="/img/interview/interview01/star01.png">
                                                        </div>
                                                    </c:forEach>
                                                    <c:forEach var="i" begin="1" end="2">
                                                        <div class="star">
                                                            <img src="/img/interview/interview01/star02.png">
                                                        </div>
                                                    </c:forEach>
                                                </c:when>
                                                <c:when test="${t.point / t.comment >= 1.5 }">
                                                    <c:forEach var="i" begin="1" end="2">
                                                        <div class="star">
                                                            <img src="/img/interview/interview01/star01.png">
                                                        </div>
                                                    </c:forEach>
                                                    <c:forEach var="i" begin="1" end="3">
                                                        <div class="star">
                                                            <img src="/img/interview/interview01/star02.png">
                                                        </div>
                                                    </c:forEach>
                                                </c:when>
                                                <c:when test="${t.point / t.comment >= 0.5 }">
                                                    <c:forEach var="i" begin="1" end="1">
                                                        <div class="star">
                                                            <img src="/img/interview/interview01/star01.png">
                                                        </div>
                                                    </c:forEach>
                                                    <c:forEach var="i" begin="1" end="4">
                                                        <div class="star">
                                                            <img src="/img/interview/interview01/star02.png">
                                                        </div>
                                                    </c:forEach>
                                                </c:when>
                                                <c:otherwise>
                                                    <c:forEach var="i" begin="1" end="5">
                                                        <div class="star">
                                                            <img src="/img/interview/interview01/star02.png">
                                                        </div>
                                                    </c:forEach>
                                                </c:otherwise>
                                            </c:choose>
                                        </div>
                                    </div>
                                </div>
							</div>
							<div class="infomation">
								<div class="department">${t.subject }</div>
								<div class="txt">${t.content1.substring(0, 30) }...</div>
							</div>
						</div>
					</c:forEach>
				</div>
				<div class="page_select_wrap">
					<c:import url="/WEB-INF/view/interview/page.jsp" />
				</div>
			</div>
		</div>
		<footer>
        	<c:import url="/WEB-INF/view/main/footer.jsp"/>
        </footer>
	</div>
</body>

<script>
    	// 면접후기 보기
    	function view(num){
    		if(${login == null}){
				alert("로그인 후 이용가능합니다.");
				location.href='/member/login';
				return;
			}
    		location.href='/interview/view/'+num;
    	}
    	// 검색
    	function search(){
    		var searchType = $("#searchType").val();
    		var searchTxt = $("#searchTxt").val();
    		if(searchTxt.startsWith(" ")){
    			alert("검색어는 공백으로 시작할 수 없습니다.");
    		} else if(searchTxt == ""){
    			alert("검색어를 입력해주세요.");
    		} else if(searchTxt.length == 1) {
    			alert("2글자 이상으로 검색해주세요.");
    		} else {
	    		location.href='/interview/search/'+searchType+"/"+searchTxt;
    		}
    	}
    	// 검색창에서 엔터
    	$(document).ready(function(){
    		$("#searchTxt").keydown(function(e){
    			if(e.keyCode == 13){
    				search();
    			}
    		});
    	});
    </script>

</html>