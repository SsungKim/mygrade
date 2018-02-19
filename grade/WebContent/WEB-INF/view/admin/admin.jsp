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
            <div class="admin">
                <div class="popup_cover" id="popup_cover"></div>
                <div class="list_popup_wrap" id="chargeListTotal">
                    <div class="list_header">
                        <div class="txt">충전리스트 월별</div>
                        <div class="img" onclick="$('#popup_cover').hide(), $('#chargeListTotal').hide(), $('body').css('overflow', 'auto')">
                            <img src="/img/myinfo/close01.png">
                        </div>
                    </div>
                    <div class="list_contents">
                        <div class="list_inner">
                            <div class="sel_wrap">
                                <div class="tit">
                                    <div class="img">
                                        <img src="/img/rank/tit_dot.png">
                                    </div>
                                    <div class="txt">년도</div>
                                </div>
                                <select id="tab2Year">
                                    <option value="2017">2017년</option>
                                </select>
                            </div>
                            <div class="tab_contents" id="tab2Content2"></div>
                        </div>
                    </div>
                </div>
                <div class="file_view" id="recordView">
                    <div class="popup_slider">
                        <div class="popup_slider_inner" id="recordSlide"></div>
                        <div class="close" id="recordClose">
                            <img src="/img/admin/close.png">
                        </div>
                        <div class="pop_arrow_wrap">
                            <div class="pop_arrow pop_next" id="recordRight">
                                <img src="/img/myinfo/arrow_next.png">
                            </div>
                            <div class="pop_arrow pop_prev" id="recordLeft">
                                <img src="/img/myinfo/arrow_prev.png">
                            </div>
                        </div>
                        <div class="name" id="recordName"></div>
                    </div>
                </div>
                <div class="file_view" id="showImg">
                    <div class="popup_slider">
                        <div class="popup_slider_inner">
                            <div class="popup_slide">
                                <img id="dataImg">
                            </div>
                        </div>
                        <div class="close" onclick="$('#popup_cover').hide(), $('#showImg').hide(), $('body').css('overflow', 'auto')">
                            <img src="/img/admin/close.png">
                        </div>
                    </div>
                </div>
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
                    </div>
                    <div class="page_tit">
                        <div class="img">
                            <img src="/img/admin/tit_icon.png">
                        </div>
                        <div class="txt">넌몇대? 관리자 페이지</div>
                    </div>
                    <div class="tab_wrap">
                        <div class="tab ${login.admin == '메인관리자' ? 'tab_sel' : '' }" id="tab1" onclick="tabClick(1)">입금자 리스트</div>
                        <div class="tab" id="tab2" onclick="tabClick(2)">충전 리스트</div>
                        <div class="tab" id="tab3" onclick="tabClick(3)">사용 리스트</div>
                        <div class="tab ${login.admin == '인증관리자' ? 'tab_sel' : '' }" id="tab4" onclick="tabClick(4)">인증 리스트</div>
                        <div class="tab" id="tab5" onclick="tabClick(5)">학생부 인증</div>
                        <div class="tab" id="tab6" onclick="tabClick(6)">게시물 관리</div>
                        <div class="tab" id="tab7" onclick="tabClick(7)">회원 관리</div>
                    </div>
                    <div class="tab_view">
                    	<c:choose>
                    		<c:when test="${login.admin == '메인관리자' }">
		                    	<c:import url="/WEB-INF/view/admin/tab1.jsp"/>
                    		</c:when>
                    		<c:otherwise>
                    			<c:import url="/WEB-INF/view/admin/tab4.jsp"/>
                    		</c:otherwise>
                    	</c:choose>
                    </div>
                </div>
            </div>
            <footer>
            	<c:import url="/WEB-INF/view/main/footer.jsp"/>
            </footer>
        </div>
    </body>
    
    <script>
    	// 관리자 아닐경우 페이지 전환
    	$(document).ready(function(){
    		if(${login.admin != '메인관리자' && login.admin != '인증관리자' }){
    			alert("접근 권한이 없습니다.");
    			location.href="/";
    		}
    	});
    	// 탭 클릭
	    function tabClick(num){
	    	$(".tab").removeClass("tab_sel");
	    	$("#tab"+num).addClass(" tab_sel");
	    	$.ajax({
	    		type : "post",
	    		url : "/admin/tab/"+num,
	    		async : false,
	    		success : function(txt){
	    			$(".tab_view").html(txt);
	    		}
	    	});
	    }
	    // 관리자 타입별 탭 노출
	    $(document).ready(function(){
	    	for(var i=1; i<8; i++){
	    		$("#tab"+i).css("display", "inline-block");
	    		if(${login.admin == '인증관리자' }){
	    			if(i != 4 && i != 5){
	    				$("#tab"+i).hide();
	    			}
	    		}
	    	}
	    });
    </script>
    
</html>