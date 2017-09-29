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
            <div class="student_grade">
            	<c:import url="/WEB-INF/view/main/side.jsp"/>
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
<%--                         <div class="all_view"><span onclick="location.href='/search/${word }'">전체보기</span></div> --%>
                        <div class="main_search_wrap">
                        	<c:import url="/WEB-INF/view/main/searchWrap.jsp"/>
                        </div>
                    </div>
                    <div class="search_gnb_wrap">
                        <ul>
                            <li class="search_gnb">
                                <div class="inner" onclick="viewType('record')">
                                    <div class="img" ${searchType == 'record' ? 'style="background-image: url(/img/student_grade/item1_icon1.png);"' : '' }></div>
                                    <div class="txt" ${searchType == 'record' ? 'style="color: #bd4949"' : '' }>학생부</div>
                                </div>
                            </li>
                            <li class="search_gnb">
                                <div class="inner" onclick="viewType('intro')">
                                    <div class="img" ${searchType == 'intro' ? 'style="background-image: url(/img/student_grade/item2_icon1.png);"' : '' }></div>
                                    <div class="txt" ${searchType == 'intro' ? 'style="color: #bd4949"' : '' }>자소서</div>
                                </div>
                            </li>
                            <li class="search_gnb">
                                <div class="inner" onclick="viewType('interview')">
                                    <div class="img" ${searchType == 'interview' ? 'style="background-image: url(/img/student_grade/item3_icon1.png);"' : '' }></div>
                                    <div class="txt" ${searchType == 'interview' ? 'style="color: #bd4949"' : '' }>면접후기</div>
                                </div>
                            </li>
                            <li class="search_gnb">
                                <div class="inner" onclick="viewType('exam')">
                                    <div class="img" ${searchType == 'exam' ? 'style="background-image: url(/img/student_grade/item4_icon1.png);"' : '' }></div>
                                    <div class="txt" ${searchType == 'exam' ? 'style="color: #bd4949"' : '' }>정시 수능</div>
                                </div>
                            </li>
                        </ul>
                    </div>
                    <div class="detail_item_wrap" id="itemWrap">
                    	<c:choose>
                    		<c:when test="${searchType == 'record' || searchType == 'intro' }">
		                    	<c:import url="/WEB-INF/view/search/record.jsp"/>
                    		</c:when>
                    		<c:when test="${searchType == 'interview' }">
		                    	<c:import url="/WEB-INF/view/search/interview.jsp"/>
                    		</c:when>
                    		<c:when test="${searchType == 'exam' }">
		                    	<c:import url="/WEB-INF/view/search/exam.jsp"/>
                    		</c:when>
                    	</c:choose>
                    </div>
                    <div class="page_select_wrap">
                    	<c:import url="/WEB-INF/view/search/page.jsp"/>
                    </div>
                </div>
            </div>
            <footer>
            	<c:import url="/WEB-INF/view/main/footer.jsp"/>
            </footer>
        </div>
    </body>
    
    <script>
		// 특수문자 안되게 처리
// 		$(document).ready(function(){
// 			$("input[id=searchTxt]").keyup(function(event){ 
// 				if (!(event.keyCode >=37 && event.keyCode<=40)) {
// 					var inputVal = $(this).val();
// 					$(this).val(inputVal.replace(/[^a-z0-9가-힣 ]/gi,''));
// 				}
// 			});
// 			$("input[id=searchTxt2]").keyup(function(event){ 
// 				if (!(event.keyCode >=37 && event.keyCode<=40)) {
// 					var inputVal = $(this).val();
// 					$(this).val(inputVal.replace(/[^a-z0-9가-힣 ]/gi,''));
// 				}
// 			});
// 		});
		// 검색
    	function search(){
    		var searchTxt = $("#searchTxt").val();
    		var searchTxt2 = $("#searchTxt2").val();
    		if(searchTxt == "" && searchTxt2 == ""){
    			alert("검색어를 입력해주세요.");
    			return;
    		}
    		if(searchTxt.length == 1 || searchTxt2.length == 1){
    			alert("2글자 이상으로 검색해주세요.");
    			return;
    		}
    		if(searchTxt != "" && searchTxt2 != ""){
    			location.href="/search/both/"+searchTxt+"/"+searchTxt2;
    			return;
    		}
    		if(searchTxt != "" && searchTxt2 == ""){
    			location.href="/search/school/"+searchTxt;
    			return;
    		}
    		if(searchTxt == "" && searchTxt2 != ""){
    			location.href="/search/subject/"+searchTxt2;
    			return;
    		}
    	}
    	// 검색창에서 엔터
    	$("#searchTxt").keydown(function(evt){
    		if(evt.keyCode == 13){
    			search();
    		}
    	});
    	$("#searchTxt2").keydown(function(evt){
    		if(evt.keyCode == 13){
    			search();
    		}
    	});
    	// 항목보기
    	function view(num, type){
    		if(${login == null }){
    			alert("로그인 후 이용가능합니다.");
				location.href='/member/login';
				return;
    		}
    		location.href="/"+type+"/view/"+num;
    	}
    	// 보기 항목 선택
    	function viewType(type){
    		var searchType = $("#searchType").val();
    		var searchTxt = $("#searchTxt").val();
    		if(type != 'interview'){
    			alert("열람기간이 만료되었습니다.");
    			return;
    		}
    		location.href="/search/"+searchType+"/"+searchTxt+"/"+type;
    	}
    </script>
</html>