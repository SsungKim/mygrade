<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<!doctype html>
<html>
    <head>
    	<c:import url="/WEB-INF/view/main/head.jsp"/>
    </head>
    
    <body>
        <div id="wrapper">
            <c:import url="/WEB-INF/view/main/popup/buyPopup.jsp"/>
            <div class="intro01">
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
                    <div class="purchase">
                        <div class="img">
                            <img src="/img/student_view/buy_img.png">
                        </div>
                        <div class="txt">
                            <span onclick="buyPopup()">구매하기</span><br>
                            <c:if test="${intro.user == login.auto }">
                            </c:if>
                        </div>
                    </div>
                    <div class="infomation_wrap">
                        <div class="inner">
                            <div class="detail_item">
                                <div class="school_logo">
                                    <img src="/img/university/${intro.school }.png"/>
                                </div>
                                <div class="txt_wrap">
                                    <div class="name">
                                        ${intro.name.substring(0, 1) }
                                        <c:forEach var="i" begin="1" end="${intro.name.length()-1 }">
                                            O
                                        </c:forEach>
                                    </div>
                                    <div class="university">${intro.schoolName }</div>
                                    <div class="department">${intro.subject }</div>
                                </div>
                            </div>
                            <div class="detail_info_wrap">
                                <div class="detail_info">
                                    <div class="info">
                                        <div class="img">
                                            <img src="/img/student_view/info01.png">
                                        </div>
                                        <div class="txt">${intro.year }</div>
                                    </div>
<!--                                     <div class="info"> -->
<!--                                         <div class="img"> -->
<!--                                             <img src="/img/student_view/info06.png"> -->
<!--                                         </div> -->
<%--                                         <div class="txt">${intro.hschool }</div> --%>
<!--                                     </div> -->
                                    <div class="info">
                                        <div class="img">
                                            <img src="/img/student_view/info10.png">
                                        </div>
                                        <div class="txt">${intro.type }</div>
                                    </div>
                                </div>
                                <div class="detail_info">
                                    <div class="info">
                                        <div class="img">
                                            <img src="/img/student_view/info09.png">
                                        </div>
                                        <div class="txt">${intro.admission }</div>
                                    </div>
                                    <div class="info">
                                        <div class="img">
                                            <img src="/img/student_view/info15.png">
                                        </div>
                                        <div class="txt">${intro.typical }</div>
                                    </div>
                                    <div class="info">
                                        <div class="img">
                                            <img src="/img/student_view/info08.png">
                                        </div>
                                        <div class="txt">${intro.pass }</div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="infomation_wrap re_info">
                        <div class="inner">
                            <div class="detail_info_wrap">
                                <div class="detail_info">
                                    <div class="info">
                                        <div class="img">
                                            <img src="/img/student_view/info01.png">
                                        </div>
                                        <div class="txt">${intro.year }</div>
                                    </div>
<!--                                     <div class="info"> -->
<!--                                         <div class="img"> -->
<!--                                             <img src="/img/student_view/info06.png"> -->
<!--                                         </div> -->
<%--                                         <div class="txt">${intro.hschool }</div> --%>
<!--                                     </div> -->
                                    <div class="info">
                                        <div class="img">
                                            <img src="/img/student_view/info10.png">
                                        </div>
                                        <div class="txt">${intro.type }</div>
                                    </div>
                                </div>
                                <div class="detail_info">
                                    <div class="info">
                                        <div class="img">
                                            <img src="/img/student_view/info09.png">
                                        </div>
                                        <div class="txt">${intro.admission }</div>
                                    </div>
                                    <div class="info">
                                        <div class="img">
                                            <img src="/img/student_view/info15.png">
                                        </div>
                                        <div class="txt">${intro.typical }</div>
                                    </div>
                                    <div class="info">
                                        <div class="img">
                                            <img src="/img/student_view/info08.png">
                                        </div>
                                        <div class="txt">${intro.pass }</div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="student_view_txt">※자소서는 구매를 하셔야 내용이 보입니다.</div>
                    <div class="iw_tit1">
                        <div class="img">
                            <img src="/img/student_view/info_tit.png">
                        </div>
                        <div class="txt">
                             자기소개서1
                        </div>
                    </div>
                    <div class="txtarea_wrap">
                        <div class="img">
                            <img src="/img/intro/intro_tit01.png">
                        </div>
                        <div class="txta_wrap">
                            <div class="sub_tit">
    <!--                                 <div class="img"> -->
    <!--                                     <img src="/img/student_view/info_tit.png"> -->
    <!--                                 </div> -->
                                <div class="txt">
                                    ※ 고등학교 재학기간 중 본인이 의미를 두고 노력했던 교내 활동을 배우고 느낀점을 중심으로 3개 이내로 기술해 주시기 바랍니다.<br> 단, 교외 활동 중 학교장의 허락을 받고 참여한 활동은 포함됩니다 ( 1,500자 이내 ).
                                </div>
                            </div>
                            <c:choose>
                            	<c:when test="${login.id == 'admin' || intro.user == login.auto || buyCheck == 'buy' }">
		                            <div class="txtarea_txt blur" style="background-image: none; ">${intro.content1 }</div>
                            	</c:when>
                            	<c:otherwise>
                            		<div class="txtarea_txt blur"></div>
                            	</c:otherwise>
                            </c:choose>
                        </div>
                    </div>
                    <div class="iw_tit1">
                        <div class="img">
                            <img src="/img/student_view/info_tit.png">
                        </div>
                        <div class="txt">
                             자기소개서2
                        </div>
                    </div>
                    <div class="txtarea_wrap">
                        <div class="img">
                            <img src="/img/intro/intro_tit02.png">
                        </div>
                        <div class="txta_wrap">
                            <div class="sub_tit">
    <!--                                 <div class="img"> -->
    <!--                                     <img src="/img/student_view/info_tit.png"> -->
    <!--                                 </div> -->
                                <div class="txt">
                                     ※ 학교 생활 중 배려, 나눔, 협력, 갈등 관리 등을 실천한 사례를 들고, 그 과정을 통해 배우고 느낀 점을 기술해 주시기 바랍니다 ( 1,000자 이내 ).
                                </div>
                            </div>
                            <c:choose>
                            	<c:when test="${login.id == 'admin' || intro.user == login.auto  || buyCheck == 'buy' }">
		                            <div class="txtarea_txt blur" style="background-image: none; ">${intro.content2 }</div>
                            	</c:when>
                            	<c:otherwise>
                            		<div class="txtarea_txt blur"></div>
                            	</c:otherwise>
                            </c:choose>
                        </div>
                    </div>
                    <div class="iw_tit1">
                        <div class="img">
                            <img src="/img/student_view/info_tit.png">
                        </div>
                        <div class="txt">
                             자기소개서3
                        </div>
                    </div>
                    <div class="txtarea_wrap">
                        <div class="img">
                            <img src="/img/intro/intro_tit03.png">
                        </div>
                        <div class="txta_wrap">
                            <div class="sub_tit">
    <!--                                 <div class="img"> -->
    <!--                                     <img src="/img/student_view/info_tit.png"> -->
    <!--                                 </div> -->
                                <div class="txt">
                                     ※ 지원 동기 등 학생을 종합적으로 판단하기 위해 필요한 경우 대학별로 1 개의 자율 문항을 추가하여 활용하시기 바랍니다<br> ( 글자 수는 1,000자 또는 1,500자 이내로 하고 대학에서 선택 ).
                                </div>
                            </div>
                            <c:choose>
                            	<c:when test="${login.id == 'admin' || intro.user == login.auto  || buyCheck == 'buy' }">
		                            <div class="txtarea_txt blur" style="background-image: none; ">${intro.content3 }</div>
                            	</c:when>
                            	<c:otherwise>
                            		<div class="txtarea_txt blur"></div>
                            	</c:otherwise>
                            </c:choose>
                        </div>
                    </div>
                    <div class="iw_tit1">
                        <div class="img">
                            <img src="/img/student_view/info_tit.png">
                        </div>
                        <div class="txt">
                             자기소개서4
                        </div>
                    </div>
                    <div class="txtarea_wrap tw1">
                        <div class="img">
                            <img src="/img/intro/intro_tit04.png">
                        </div>
                        <div class="txta_wrap">
                            <div class="sub_tit">
    <!--                                 <div class="img"> -->
    <!--                                     <img src="/img/student_view/info_tit.png"> -->
    <!--                                 </div> -->
                                <div class="txt">
                                    ※ 지원 동기 등 학생을 종합적으로 판단하기 위해 필요한 경우 대학별로 1 개의 자율 문항을 추가하여 활용하시기 바랍니다<br>대학별 자율문항이 있는 경우만 작성하시면 됩니다.( 글자 수는 1,000자 또는 1,500자 이내 )
                                </div>
                            </div>
                            <c:choose>
                            	<c:when test="${login.id == 'admin' || intro.user == login.auto  || buyCheck == 'buy' }">
		                            <div class="txtarea_txt tat1 blur" style="background-image: none; ">${intro.title }</div>
                            	</c:when>
                            	<c:otherwise>
                            		<div class="txtarea_txt tat1 blur"></div>
                            	</c:otherwise>
                            </c:choose>
                            <c:choose>
                            	<c:when test="${login.id == 'admin' || intro.user == login.auto  || buyCheck == 'buy' }">
		                            <div class="txtarea_txt blur" style="background-image: none; ">${intro.content4 }</div>
                            	</c:when>
                            	<c:otherwise>
                            		<div class="txtarea_txt blur"></div>
                            	</c:otherwise>
                            </c:choose>
                        </div>
                    </div>
                    <div class="sv_btn_wrap">
                    	<c:if test="${intro.user == login.auto }">
	                        <div class="sv_btn" onclick="location.href='/intro/modify/${intro.auto }'">
	                            <img src="/img/student_view/btn01.png">
	                        </div>
                    	</c:if>
                        <div class="sv_btn" onclick="history.back()">
                            <img src="/img/student_view/btn02.png">
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
    	// 구매하기 팝업
    	function buyPopup(){
 	 		if(${login == null}){
 	 			alert("로그인 후 구매 가능합니다.");
 	 			location.href="/member/login";
 	 			return;
 	 		}
 	 		if(${intro.user == login.auto }){
 				alert("본인 자료는 구매할 수 없습니다.");
 				return;
 			}
 	 		$("#popup_cover").show();
 	 		$("#popup_buy").show();
 	 		$("body").css("overflow", "hidden");
 	 	}
    	// 수정하기
		function modify(){
			location.href='/intro/modify/${intro.auto }/${intro.user }';
		}
		// 구매내역 확인
	 	$(document).ready(function(){
	 		var buyList;
	 		$.ajax({
	 			type : "post",
	 			url : "/member/buyList",
	 			async : false,
	 			success : function(txt){
	 				buyList = txt;
	 			}
	 		});
	 		if(buyList.length > 0){
	 			for(var i=0; i<buyList.length; i++){
	 				if(buyList[i].item == "자소서"){
	 					if(buyList[i].target == ${itemNum }){
	 						$(".blur").css("filter", "none");
	 					}
	 				}
	 			}
	 		}
	 		if(${intro.user == login.auto }){
	 			$(".blur").css("filter", "none");
	 		}
	 	});
    </script>
    
</html>