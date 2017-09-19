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
                        <div class="sg_search_wrap">
                        	<select id="searchType">
                        		<option ${sType == '학교' ? 'selected' : '' }>학교</option>
								<option ${sType == '학과' ? 'selected' : '' }>학과</option>
                        	</select>
                            <input class="sg_search" type="text" placeholder="학교나 학과를 검색해주세요" id="searchTxt" maxlength="35" value="${word }">
                            <div class="img" onclick="search2()">
                                <img src="/img/main/search.png">
                            </div>
                        </div>
<%--                         <c:if test="${login.id == 'admin' }"> --%>
<!-- 	                        <div class="detail_search_wrap"> -->
<!-- 	                            <select class="detail detail_select" id="location"> -->
<!-- 	                                <option value="choose">고등학교지역</option> -->
<%-- 	                                <option value="서울" ${location eq '서울' ? 'selected' : '' }>서울</option> --%>
<%-- 	                                <option value="인천" ${location eq '인천' ? 'selected' : '' }>인천</option> --%>
<%-- 	                                <option value="세종" ${location eq '세종' ? 'selected' : '' }>세종</option> --%>
<%-- 	                                <option value="대전" ${location eq '대전' ? 'selected' : '' }>대전</option> --%>
<%-- 	                                <option value="대구" ${location eq '대구' ? 'selected' : '' }>대구</option> --%>
<%-- 	                                <option value="광주" ${location eq '광주' ? 'selected' : '' }>광주</option> --%>
<%-- 	                                <option value="울산" ${location eq '울산' ? 'selected' : '' }>울산</option> --%>
<%-- 	                                <option value="부산" ${location eq '부산' ? 'selected' : '' }>부산</option> --%>
<%-- 	                                <option value="경기도" ${location eq '경기도' ? 'selected' : '' }>경기도</option> --%>
<%-- 	                                <option value="강원도" ${location eq '강원도' ? 'selected' : '' }>강원도</option> --%>
<%-- 	                                <option value="충청도" ${location eq '충청도' ? 'selected' : '' }>충청도</option> --%>
<%-- 	                                <option value="전라도" ${location eq '전라도' ? 'selected' : '' }>전라도</option> --%>
<%-- 	                                <option value="경상도" ${location eq '경상도' ? 'selected' : '' }>경상도</option> --%>
<%-- 	                                <option value="제주도" ${location eq '제주도' ? 'selected' : '' }>제주도</option> --%>
<!-- 	                            </select> -->
<!-- 	                            <select class="detail detail_select" id="passCount"> -->
<!-- 	                                <option value="choose">전체</option> -->
<%-- 	                                <option ${passCount eq '현역' ? 'selected' : '' }>현역</option> --%>
<%-- 	                                <option ${passCount eq '재수' ? 'selected' : '' }>재수</option> --%>
<!-- 	                            </select> -->
<!-- 	                            <div class="detail search_wrap"> -->
<%-- 	                                <input class="detail_search" type="text" placeholder="고등학교검색" id="searchTxt2" maxlength="15" value="${word2 }"> --%>
<!-- 	                                <img class="search_img" src="/img/main/search.png" onclick="search2()"> -->
<!-- 	                            </div> -->
<!-- 	                        </div> -->
<%--                         </c:if> --%>
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
		$(document).ready(function(){
			$("input[id=searchTxt]").keyup(function(event){ 
				if (!(event.keyCode >=37 && event.keyCode<=40)) {
					var inputVal = $(this).val();
					$(this).val(inputVal.replace(/[^a-z0-9가-힣 ]/gi,''));
				}
			});
			$("input[id=searchTxt2]").keyup(function(event){ 
				if (!(event.keyCode >=37 && event.keyCode<=40)) {
					var inputVal = $(this).val();
					$(this).val(inputVal.replace(/[^a-z0-9가-힣 ]/gi,''));
				}
			});
		});
		// 검색
    	function search(){
			var searchType = $("#searchType").val();
    		var searchTxt = $("#searchTxt").val();
    		if(searchTxt == ""){
    			alert("검색어를 입력해주세요.");
    		} else if(searchTxt.length == 1) {
    			alert("2글자 이상으로 검색해주세요.");
    		} else {
	    		location.href="/search/"+searchType+"/"+searchTxt;
    		}
    	}
    	// 검색창에서 엔터
    	$("#searchTxt").keydown(function(evt){
    		if(evt.keyCode == 13){
    			search2();
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
    	// 상세검색
    	function search2(){
    		var searchType = $("#searchType").val();
    		var searchTxt = $("#searchTxt").val();
//     		var searchTxt2 = $("#searchTxt2").val() == "" ? "00" : $("#searchTxt2").val();
//     		var loc = $("#location").val();
//     		var passCount = $("#passCount").val();
    		if(searchTxt == ""){
    			alert("검색어를 입력해주세요.");
    		} else if(searchTxt.length == 1) {
    			alert("2글자 이상으로 검색해주세요.");
    		} else {
    			location.href="/search/"+searchType+"/"+searchTxt+"/${searchType }";
    		}
    	}
    	// 상세검색창에서 엔터
    	$("#searchTxt2").keydown(function(e){
    		if(e.keyCode == 13){
    			search2();
    		}
    	});
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