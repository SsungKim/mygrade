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
                        <div class="main_search_wrap">
							<div class="all_view">
								<span onclick="location.href='/intro'">전체보기</span>
							</div>
							<c:import url="/WEB-INF/view/main/searchWrap.jsp"/>
						</div>
                    </div>
                    <div class="detail_item_wrap">
                    	<c:forEach var="t" items="${introList }">
	                        <div class="detail_item" onclick="view(${t.auto})">
                                <div class="inner">
                                    <div class="school_logo">
                                        <img src="/img/university/${t.school }.png"/>
                                    </div>
                                    <div class="department">${t.schoolName }</div>
                                    <div class="infomation">
                                        <div class="name">${t.subject }</div>
                                        <div class="name">
                                            ${t.name.substring(0, 1) }
                                            <c:forEach var="i" begin="1" end="${t.name.length()-1 }">
                                                O
                                            </c:forEach>
                                        </div>
                                        <div class="entrance_wrap">
                                            <div class="img">
                                                <img src="/img/student_grade/entrance_img.png">
                                            </div>
                                            <div class="txt">${t.year }</div>
                                        </div>
                                    </div>
                                </div>
	                        </div>
                    	</c:forEach>
                    </div>
                    <div class="page_select_wrap">
                    	<c:import url="/WEB-INF/view/intro/page.jsp"/>
                    </div>
                </div>
            </div>
            <footer>
            	<c:import url="/WEB-INF/view/main/footer.jsp"/>
            </footer>
        </div>
    </body>
    
    <script>
	 	// 접근제한
		$(document).ready(function(){
			if(${login.id != 'admin' }){
				alert('열람기간이 완료되었습니다.\n고2(예비고3) 학생들을 위한 오픈시기는 2018년 1월 1일입니다.\n(시기는 변동될 수 있습니다.)');
				location.href='/';
				return;
			}
		});
		// 특수문자 안되게 처리
	    $(document).ready(function(){
			$("input[id=searchTxt]").keyup(function(event){ 
				if (!(event.keyCode >=37 && event.keyCode<=40)) {
					var inputVal = $(this).val();
					$(this).val(inputVal.replace(/[^a-z0-9가-힣 ]/gi,''));
				}
			});
		});
		// 보기 페이지 이동
		function view(num,){
			if(${login == null}){
				alert("로그인 후 이용가능합니다.");
				location.href='/member/login';
				return;
			}
			location.href='/intro/view/'+num;
		}
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
    			location.href="/intro/search/both/"+searchTxt+"/"+searchTxt2;
    			return;
    		}
    		if(searchTxt != "" && searchTxt2 == ""){
    			location.href="/intro/search/school/"+searchTxt;
    			return;
    		}
    		if(searchTxt == "" && searchTxt2 != ""){
    			location.href="/intro/search/subject/"+searchTxt2;
    			return;
    		}
		}
		// 입력창에서 엔터
		$(document).ready(function(){
			$("#searchTxt").keydown(function(e){
				if(e.keyCode == 13){
					search();
				}
			});
			$("#searchTxt2").keydown(function(e){
				if(e.keyCode == 13){
					search();
				}
			});
		});
    </script>
</html>