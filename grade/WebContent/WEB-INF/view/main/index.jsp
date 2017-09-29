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
            <div class="main">
            	<c:import url="/WEB-INF/view/main/side.jsp"/>
            	<header class="header_t1">
                    <div class="hmenubar">
                        <img src="/img/hmenubar.png">
                    </div>
			    	<c:import url="/WEB-INF/view/main/login.jsp"/>
                </header>
                <div class="page_inner">
                    <header class="main_header">
                        <div class="logo">
                            <img src="/img/logo.png">
                        </div>
                        <div class="main_search_wrap">
                        	<c:import url="/WEB-INF/view/main/searchWrap.jsp"/>
                        </div>
                    </header>
                    <div class="main_item">
<!--                         <div class="item" onclick="location.href='/record'"> -->
                        <div class="item" onclick="alert('열람기간이 완료되었습니다.\n고2(예비고3) 학생들을 위한 오픈시기는 2017년 11월 1일입니다.\n(시기는 변동될 수 있습니다.)')">
                            <div class="tit_wrap">
                                <div class="inner">
                                    <div class="img">
                                        <img src="/img/main/item2_icon.png">
                                    </div>
                                    <div class="tit">학생부 보러가기</div>
                                </div>
                            </div>
                            <div class="content">
                                <img src="/img/main/item_contents.png">
                            </div>
                        </div>
<!--                         <div class="item" onclick="location.href='/intro'"> -->
                        <div class="item" onclick="alert('열람기간이 완료되었습니다.\n고2(예비고3) 학생들을 위한 오픈시기는 2017년 12월 1일입니다.\n(시기는 변동될 수 있습니다.)')">
                            <div class="tit_wrap">
                                <div class="inner">
                                    <div class="img">
                                        <img src="/img/main/item1_icon.png">
                                    </div>
                                    <div class="tit">자소서 보러가기</div>
                                </div>
                            </div>
                            <div class="content">
                                <img src="/img/main/item_contents.png">
                            </div>
                        </div>
                        <div class="item" onclick="location.href='/interview'">
                            <div class="tit_wrap">
                                <div class="inner">
                                    <div class="img">
                                        <img src="/img/main/item3_icon.png">
                                    </div>
                                    <div class="tit">면접후기 보러가기</div>
                                </div>
                            </div>
                            <div class="content">
                                <img src="/img/main/item_contents.png">
                            </div>
                        </div>
<!--                         <div class="item" onclick="location.href='/exam'"> -->
                        <div class="item" onclick="alert('고2(예비고3) 학생들을 위한 오픈시기는 2017년 11월 16일입니다.\n(시기는 변동될 수 있습니다.)')">
                            <div class="tit_wrap">
                                <div class="inner">
                                    <div class="img">
                                        <img src="/img/main/item5_icon.png">
                                    </div>
                                    <div class="tit">정시 수능성적 보기</div>
                                </div>
                            </div>
                            <div class="content">
                                <img src="/img/main/item_contents.png">
                            </div>
                        </div>
                    </div>
                    <div class="main_btn" onclick="rank()">
                        <div class="mb_header">
                            <div class="img">
                                <img src="/img/main/info01_icon01.png">
                            </div>
                            <div class="txt">
                                내 전국등수 확인하기
                            </div>
                        </div>
                        <div class="mb_contents mb_contents01 mb_contents_on">
                            <img src="/img/main/info01_item01.jpg">
                        </div>
                    </div>
                    <div class="main_btn">
                        <div class="mb_header" onclick="mbheader_click()">
                            <div class="txt">
                                학생부, 자소서, 면접후기, 수능성적 올리기 안내
                            </div>
                            <div class="img img1">
                                <img src="/img/main/info_icon.png">
                            </div>
                        </div>
                        <div class="mb_contents" id="mb_contents">
                            <div class="inner">
                                <div class="tit_wrap">
                                    <div class="tit_img" onclick="mbtnTit01()" id="mbtnTit01">
                                        <img src="/img/main/info_item01.png">
                                    </div>
                                    <div class="txt_wrap" id="mbtnTxt01">
                                        <div class="txt">
                                            판매자가 올린 저작물을 구매자가 구매 시 포인트가 적립됩니다.
                                        </div>
                                        <div class="txt txt1">
                                            <div class="sub_tit">
                                            학생부: 
                                            </div>
                                            <div class="sub_txt">
                                                인증학생부 18포인트, 미인증학생부 12포인트
                                            </div>
                                        </div>
                                        <div class="txt txt1">
                                            <div class="sub_tit">
                                            자소서: 
                                            </div>
                                            <div class="sub_txt">
                                                인증자소서 18포인트, 미인증자소서 12포인트
                                            </div>
                                        </div>
                                        <div class="txt txt1">
                                            <div class="sub_tit sub_tit1">
                                            면접후기: 
                                            </div>
                                            <div class="sub_txt sub_txt1">
                                                인증면접후기 15포인트, 미인증면접후기 9포인트
                                            </div>
                                        </div>
                                        <div class="txt txt1">
                                            <div class="sub_tit sub_tit1">
                                            수능성적: 
                                            </div>
                                            <div class="sub_txt sub_txt1">
                                                인증수능성적 4.5포인트, 미인증수능성적 3포인트
                                            </div>
                                        </div>
                                        <div class="txt">
                                            *1포인트=100원
                                        </div>
                                    </div>
                                </div>
                                <div class="tit_wrap">
                                    <div class="tit_img" onclick="mbtnTit02()" id="mbtnTit02">
                                        <img src="/img/main/info_item02.png">
                                    </div>
                                    <div class="txt_wrap txt_wrap1" id="mbtnTxt02">
                                        <div class="txt">
                                            <div class="sub_tit">
                                            ∙
                                            </div>
                                            <div class="sub_txt">
                                                현재 합격하여 다니고 있는 대학의 경우, 재학증명서를 제출하면 재학생 인증으로 표시됩니다. 
                                            </div>
                                        </div>
                                        <div class="txt">
                                            <div class="sub_tit">
                                            ∙
                                            </div>
                                            <div class="sub_txt">
                                                여러 개 대학을 합격 한 경우, 각 대학별로 합격증명서를 제출하면 해당 학교의 합격 인증마크가 부여됩니다. 
                                            </div>
                                        </div>
                                        <div class="txt txt1">
                                            <div class="sub_tit">
                                            예시1) 
                                            </div>
                                            <div class="sub_txt">
                                                A, B, C 대학을 합격 후 A 대학에 입학하고 A 대학 재학증명서만 제출한 경우<br>
                                                - A 대학 재학인증마크 부여
                                            </div>
                                        </div>
                                        <div class="txt txt1">
                                            <div class="sub_tit">
                                            예시2) 
                                            </div>
                                            <div class="sub_txt">
                                                C, D, E 대학에 합격 후 C 대학에 입학하고 C 대학 재학증명서와, D, E 대학 합격증명서를 모두 제출한 경우<br>
                                                - C 대학 재학인증마크, D, E 대학 합격인증마크 부여
                                            </div>
                                        </div>
                                        <div class="txt txt1">
                                            <div class="sub_tit">
                                            예시3) 
                                            </div>
                                            <div class="sub_txt">
                                                F, G 지원하고 F 대학 합격, G 대학 불합격, F 대학 재학증명서 제출 한 경우<br>
                                                - F 대학 재학인증마크 부여
                                            </div>
                                        </div>
                                        <div class="txt txt1 txt2">
                                            합격증 버리지 마세요.
                                        </div>
                                        <div class="txt txt1">
                                            합격증 인증하여 더 많은 포인트를 받아가세요.
                                        </div>
                                        <div class="txt txt1">
                                            여러 대학에 합격하고 한 대학에 등록을 해도 합격증으로 합격 인증을 하면 클릭할 확률이 높아집니다.
                                        </div>
                                    </div>
                                </div>
                                <div class="minfo_gnb_wrap">
                                    <ul>
                                    	<c:if test="${login == null }">
	                                        <li class="join_gnb" onclick="location.href='/member/join1'">
	                                            <div class="img">
	                                            </div>
	                                            <div class="txt">
	                                                회원가입
	                                            </div>
	                                        </li>
	                                        <li class="login_gnb" onclick="location.href='/member/login'">
	                                            <div class="img">
	                                            </div>
	                                            <div class="txt">
	                                                로그인
	                                            </div>
	                                        </li>
                                    	</c:if>
                                        <li class="add_gnb" onclick="upload()">
                                            <div class="img">
                                            </div>
                                            <div class="txt">
                                                자료 올리기
                                            </div>
                                        </li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="main_bottom">
                        <div class="boundry_img">
                            <img src="/img/main/boundry.png">
                        </div>
                        <div class="info_wrap">
                            <div class="info_tit">
                                <div class="back"></div>
                                <div class="img">
                                    <img src="/img/main/mainb_tit.png">
                                </div>
                            </div>
                            <div class="info_txt_wrap">
                                <div class="info_txt">
                                    <div class="num">1.</div>
                                    <div class="txt">이 홈페이지는 대학, 학과별 합격, 불합격 한 사람들의 학생부, 자소서를 열람할 수 있는 곳입니다.</div>
                                </div>
                                <div class="info_txt">
                                    <div class="num">2.</div>
                                    <div class="txt">학생부, 자소서를 열람하려면 일정 포인트가 필요하며, 포인트는 충전을 통해 얻을 수 있습니다.</div>
                                </div>
                                <div class="info_txt">
                                    <div class="num">3.</div>
                                    <div class="txt">포인트를 사용하여 열람할 경우 열람한 날짜를 1일로 이 후 15일간 제한없이 열람가능합니다.</div>
                                </div>
                            </div>
                        </div>
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
// 	    $(document).ready(function(){
// 			$("input[id=searchTxt]").keyup(function(event){ 
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
    	// 업로드
    	function upload(){
    		if(${login == null}){
    			alert("로그인 후 이용할 수 있습니다.");
    			location.href='/member/login';
    		} else {
    			location.href="/member/myData/${login.auto }";
    		}
    	}
    	// 전국등수 확인하기
    	function rank(){
    		if(${login == null}){
    			alert("로그인 후 이용할 수 있습니다.");
    			location.href="/member/login";
    		} else {
    			location.href="/rank/${login.auto }";
    		}
    	}
    </script>
</html>