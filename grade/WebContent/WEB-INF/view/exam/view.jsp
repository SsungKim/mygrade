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
            <div class="exam_view">
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
                    <div class="infomation_wrap">
                        <div class="purchase">
                            <div class="img">
                                <img src="/img/student_view/buy_img.png">
                            </div>
                            <div class="txt" onclick="buyPopup()">구매하기</div>
                        </div>
                        <div class="detail_item">
                            <div class="inner">
                                <div class="school_logo">
                                    <img src="/img/university/${exam.school }.png"/>
                                </div>
                                <div class="detail_content">
                                    <div class="department">${exam.schoolName }</div>
                                    <div class="name">${exam.subject }</div>
                                    <div class="name">
                                        ${exam.name.substring(0, 1) }
                                        <c:forEach var="i" begin="1" end="${exam.name.length()-1 }">
                                            O
                                        </c:forEach>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="detail_info_wrap">
                            <div class="info_tit">
                                <div class="img">
                                    <img src="/img/student_view/info_tit.png">
                                </div>
                                <div class="tit">기본정보</div>
                            </div>
                            <div class="info_contents">
                                <div class="content">
                                    <div class="img">
                                        <img src="/img/student_view/info01.png">
                                    </div>
                                    <div class="txt">${exam.year }</div>
                                </div>
                                <div class="content">
                                    <div class="img">
                                        <img src="/img/student_view/info02.png">
                                    </div>
                                    <div class="txt">1등급</div>
                                </div>
                            </div>
                        </div>
                        <div class="detail_info_wrap detail_info_wrap1">
                            <div class="info_tit">
                                <div class="img">
                                    <img src="/img/student_view/info_tit.png">
                                </div>
                                <div class="tit">응시정보</div>
                            </div>
                            <div class="info_contents">
                                <div class="content">
                                    <div class="img">
                                        <img src="/img/student_view/info11.png">
                                    </div>
                                    <div class="txt">${exam.examType }</div>
                                </div>
                                <div class="content">
                                    <div class="img">
                                        <img src="/img/student_view/info12.png">
                                    </div>
                                    <div class="txt">${exam.mathType }</div>
                                </div>
                                <div class="content">
                                    <div class="img">
                                        <img src="/img/student_view/info13.png">
                                    </div>
                                    <div class="txt">${exam.innerType1 }, ${exam.innerType2 }</div>
                                </div>
                                <div class="content">
                                    <div class="img">
                                        <img src="/img/student_view/info14.png">
                                    </div>
                                    <div class="txt">${exam.langType }</div>
                                </div>
                            </div>
                            <div class="certify_wrap certify_wrap1">
                                <c:forEach var="t" items="${certList }">
                                    <div class="certify">
										<div class="star">
											<img src="/img/student_view/star.png">
										</div>
										<div class="txt">${t.schoolName } ${t.certType }생</div>
										<div class="stamp">
											<img src="/img/student_view/stamp.png">
										</div>
									</div>
                                </c:forEach>
                            </div>
                        </div>
                    </div>
                    <div class="exam_view_txt">※수능성적표는 구매 하셔야 이미지가 정상적으로 보입니다.</div>
                    <div class="infomation_wrap infomation_wrap1">
                        <div class="inner blur" id="examView">
                            <c:choose>
                            	<c:when test="${login.id == 'admin' || exam.user == login.auto || buyCheck == 'buy' }">
		                            <div class="table_wrap">
		                                <div class="inner">
		                                    <div class="table">
		                                        <div class="theader">
		                                            <div class="tit_wrap">
		                                                <div class="tit">구분</div>
		                                            </div>
		                                            <div class="tit_wrap">
		                                                <div class="tit">국어</div>
		                                            </div>
		                                            <div class="tit_wrap">
		                                                <div class="tit tit1">수학</div>
		                                                <div class="tit tit1">
		                                                    <div class="in_txt" id="examMathType">${exam.mathType }</div>
		                                                </div>
		                                            </div>
		                                            <div class="tit_wrap">
		                                                <div class="tit">영어</div>
		                                            </div>
		                                            <div class="tit_wrap">
		                                                <div class="tit"><span>한</span>국사</div>
		                                            </div>
		                                            <div class="tit_wrap tit_wrap1">
		                                                <div class="tit tit1">
		                                                    <div class="in_txt" id="examExplorType">${exam.explorType.substring(0, 4) }<span>${exam.explorType.substring(5) }</span></div>
		                                                </div>
		                                                <div class="tit tit1 tit2">
		                                                    <div class="in_txt" id="examInnerType1">${exam.innerType1.substring(0, 2) }<span>${exam.innerType1.substring(2, exam.innerType1.length()-1) }</span>${exam.innerType1.substring(exam.innerType1.length()-1) }</div>
		                                                </div>
		                                                <div class="tit tit1 tit2">
		                                                    <div class="in_txt" id="examInnerType2">${exam.innerType2.substring(0, 2) }<span>${exam.innerType2.substring(2, exam.innerType2.length()-1) }</span>${exam.innerType2.substring(exam.innerType2.length()-1) }</div>
		                                                </div>
		                                            </div>
		                                            <div class="tit_wrap">
		                                                <div class="tit tit1">제2<span>외국어</span></div>
		                                                <div class="tit tit1">
		                                                    <div class="in_txt" id="examLangType">${exam.langType }</div>
		                                                </div>
		                                            </div>
		                                        </div>
		                                        <div class="tbody">
		                                            <div class="tcontents">
		                                                <div class="content">
		                                                    <div class="txt">원점수</div>
		                                                </div>
		                                                <div class="content">
		                                                    <div class="in_txt white" id="point1">${exam.point1 }</div>
		                                                </div>
		                                                <div class="content">
		                                                    <div class="white in_txt" id="point2">${exam.point2 }</div>
		                                                </div>
		                                                <div class="content">
		                                                    <div class="white in_txt"  id="point3">${exam.point3 }</div>
		                                                </div>
		                                                <div class="content">
		                                                    <div class="white in_txt" id="point4">${exam.point4 }</div>
		                                                </div>
		                                                <div class="content">
		                                                    <div class="white in_txt" id="point5"> ${exam.point5 }</div>
		                                                </div>
		                                                <div class="content">
		                                                    <div class="white in_txt" id="point6">${exam.point6 }</div>
		                                                </div>
		                                                <div class="content">
		                                                    <div class="white in_txt"  id="point7">${exam.point7 }</div>
		                                                </div>
		                                            </div>
		                                            <div class="tcontents">
		                                                <div class="content">
		                                                    <div class="txt">표준점수</div>
		                                                </div>
		                                                <div class="content">
		                                                    <div class="white in_txt" id="point8">${exam.point8 }</div>
		                                                </div>
		                                                <div class="content">
		                                                    <div class="white in_txt"  id="point9">${exam.point9 }</div>
		                                                </div>
		                                                <div class="content">
		                                                    <div class="pink in_txt"  id="point10">${exam.point10 }</div>
		                                                </div>
		                                                <div class="content">
		                                                    <div class="pink in_txt"  id="point11">${exam.point11 }</div>
		                                                </div>
		                                                <div class="content">
		                                                    <div class="white in_txt"  id="point12">${exam.point12 }</div>
		                                                </div>
		                                                <div class="content">
		                                                    <div class="white in_txt"  id="point13">${exam.point13 }</div>
		                                                </div>
		                                                <div class="content">
		                                                    <div class="white in_txt"  id="point14">${exam.point14 }</div>
		                                                </div>
		                                            </div>
		                                            <div class="tcontents">
		                                                <div class="content">
		                                                    <div class="txt">백분위</div>
		                                                </div>
		                                                <div class="content">
		                                                    <div class="white in_txt" id="point15">${exam.point15 }</div>
		                                                </div>
		                                                <div class="content">
		                                                    <div class="white in_txt"  id="point16">${exam.point16 }</div>
		                                                </div>
		                                                <div class="content">
		                                                    <div class="pink in_txt"  id="point17">${exam.point17 }</div>
		                                                </div>
		                                                <div class="content">
		                                                    <div class="pink in_txt"  id="point18">${exam.point18 }</div>
		                                                </div>
		                                                <div class="content">
		                                                    <div class="white in_txt"  id="point19">${exam.point19 }</div>
		                                                </div>
		                                                <div class="content">
		                                                    <div class="white in_txt"  id="point20">${exam.point20 }</div>
		                                                </div>
		                                                <div class="content">
		                                                    <div class="white in_txt"  id="point21">${exam.point21 }</div>
		                                                </div>
		                                            </div>
		                                            <div class="tcontents">
		                                                <div class="content">
		                                                    <div class="txt">등급</div>
		                                                </div>
		                                                <div class="content">
		                                                    <div class="white in_txt" id="point22">${exam.point22 }</div>
		                                                </div>
		                                                <div class="content">
		                                                    <div class="white in_txt"  id="point23">${exam.point23 }</div>
		                                                </div>
		                                                <div class="content">
		                                                    <div class="white in_txt" id="point24">${exam.point24 }</div>
		                                                </div>
		                                                <div class="content">
		                                                    <div class="white in_txt" id="point25">${exam.point25 }</div>
		                                                </div>
		                                                <div class="content">
		                                                    <div class="white in_txt"  id="point26">${exam.point26 }</div>
		                                                </div>
		                                                <div class="content">
		                                                    <div class="white in_txt"  id="point27">${exam.point27 }</div>
		                                                </div>
		                                                <div class="content">
		                                                    <div class="white in_txt"  id="point28">${exam.point28 }</div>
		                                                </div>
		                                            </div>
		                                        </div>
		                                    </div>
		                                </div>
		                            </div>
		                            <div class="table_wrap1">
		                                <div class="content color1">구분</div>
		                                <div class="content color2 pd10">원점수</div>
		                                <div class="content color2 pd10">표준점수</div>
		                                <div class="content color2 pd10">백분위</div>
		                                <div class="content color2 pd10 br_none">등급</div>
		                                <div class="content color1">국어</div>
		                                <div class="content color2">
		                                    <div class="in_txt">${exam.point1 }</div>
		                                </div>
		                                <div class="content color2">
		                                    <div class="in_txt"${exam.point8 }></div>
		                                </div>
		                                <div class="content color2">
		                                    <div class="in_txt">${exam.point15 }</div>
		                                </div>
		                                <div class="content color2 br_none">
		                                    <div class="in_txt">${exam.point22 }</div>
		                                </div>
		                                <div class="content color1 sel_wrap">
		                                    <div class="in_txt">${exam.mathType }</div>
		                                </div>
		                                <div class="content color2">
		                                    <div class="in_txt">${exam.point2 }</div>
		                                </div>
		                                <div class="content color2">
		                                    <div class="in_txt">${exam.point9 }</div>
		                                </div>
		                                <div class="content color2">
		                                    <div class="in_txt">${exam.point16 }</div>
		                                </div>
		                                <div class="content color2 br_none">
		                                    <div class="in_txt">${exam.point23 }</div>
		                                </div>
		                                <div class="content color1">영어</div>
		                                <div class="content color2">
		                                    <div class="in_txt">${exam.point3 }</div>
		                                </div>
		                                <div class="content color2">
		                                    <div class="in_txt pink">${exam.point10 }</div>
		                                </div>
		                                <div class="content color2">
		                                    <div class="in_txt pink">${exam.point17 }</div>
		                                </div>
		                                <div class="content color2 br_none">
		                                    <div class="in_txt">${exam.point24 }</div>
		                                </div>
		                                <div class="content color1">한국사</div>
		                                <div class="content color2">
		                                    <div class="in_txt">${exam.point4 }</div>
		                                </div>
		                                <div class="content color2">
		                                    <div class="in_txt pink">${exam.point11 }</div>
		                                </div>
		                                <div class="content color2">
		                                    <div class="in_txt pink">${exam.point18 }</div>
		                                </div>
		                                <div class="content color2 br_none">
		                                    <div class="in_txt">${exam.point25 }</div>
		                                </div>
		                                <div class="content1 color1 sel_wrap br_none">
		                                    <div class="in_txt">${exam.explorType }</div>
		                                </div>
		                                <div class="content color1 sel_wrap">
		                                    <div class="in_txt">${exam.innerType1 }</div>
		                                </div>
		                                <div class="content color2">
		                                    <div class="in_txt">${exam.point5 }</div>
		                                </div>
		                                <div class="content color2">
		                                    <div class="in_txt">${exam.point12 }</div>
		                                </div>
		                                <div class="content color2">
		                                    <div class="in_txt">${exam.point19 }</div>
		                                </div>
		                                <div class="content color2 br_none">
		                                    <div class="in_txt">${exam.point26 }</div>
		                                </div>
		                                <div class="content color1 sel_wrap">
		                                    <div class="in_txt">${exam.innerType2 }</div>
		                                </div>
		                                <div class="content color2">
		                                    <div class="in_txt">${exam.point6 }</div>
		                                </div>
		                                <div class="content color2">
		                                    <div class="in_txt">${exam.point13 }</div>
		                                </div>
		                                <div class="content color2">
		                                    <div class="in_txt">${exam.point20 }</div>
		                                </div>
		                                <div class="content color2 br_none">
		                                    <div class="in_txt">${exam.point27 }</div>
		                                </div>
		                                <div class="content color1 sel_wrap">
		                                    <div class="in_txt">${exam.langType }</div>
		                                </div>
		                                <div class="content color2">
		                                    <div class="in_txt">${exam.point7 }</div>
		                                </div>
		                                <div class="content color2">
		                                    <div class="in_txt">${exam.point14 }</div>
		                                </div>
		                                <div class="content color2">
		                                    <div class="in_txt">${exam.point21 }</div>
		                                </div>
		                                <div class="content color2 br_none">
		                                    <div class="in_txt">${exam.point28 }</div>
		                                </div>
		                            </div>
		                            <div class="check_wrap">
		                                <div class="check check1">
		                                    <input class="cir" type="radio" id="passFirst" ${exam.passCount.substring(0, 2) == '1차' ? 'checked' : '' } disabled="disabled">
		                                    <label for="passFirst">1차합격</label>
		                                </div>
		                                <div class="check check2">
		                                    <input class="cir" type="radio" id="passAdd" ${exam.passCount.substring(0, 2) == '추가' ? 'checked' : '' } disabled="disabled">
		                                    <label for="passAdd">추가합격</label>
		                                    <div class="input_wrap">
		                                        <div class="txt">( 대기번호</div>
		                                        <div class="input_txt" id="breakNum">
		                                        	${exam.passCount.substring(0, 2) == '추가' ? exam.passCount.substring(5, exam.passCount.indexOf('번')) : '' }
		                                        </div>
		                                        <div class="txt">번 )</div>
		                                    </div>
		                                </div>
		                                <div class="check check3">
		                                    <input class="cir" type="radio" id="passNo" ${exam.passCount == '불합격' ? 'checked' : '' } disabled="disabled">
		                                    <label for="passNo">불합격</label>
		                                </div>
		                            </div>
                            	</c:when>
                            	<c:otherwise>
                            		<div class="blur_img">
		                                <img src="/img/blur04.png">
		                            </div>
                            	</c:otherwise>
                            </c:choose>
                        </div>
                    </div>
                    <div class="sv_btn_wrap">
<!--                         <div class="sv_btn"> -->
<!--                             <img src="/img/student_view/btn01.png"> -->
<!--                         </div> -->
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
	 	// 로그인 체크
		$(document).ready(function(){
			if(${login == null}){
				alert("세션이 만료되었습니다.\n로그인 페이지로 이동합니다.");
				return;
			}
		});
 		// 구매하기 팝업
 	 	function buyPopup(){
 	 		if(${login == null}){
 	 			alert("로그인 후 구매 가능합니다.");
 	 			location.href="/member/login";
 	 			return;
 	 		}
 	 		if(${exam.user == login.auto }){
 				alert("본인 자료는 구매할 수 없습니다.");
 				return;
 			}
 	 		$("#popup_cover").show();
 	 		$("#popup_buy").show();
 	 		$("body").css("overflow", "hidden");
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
	 				if(buyList[i].item == "정시성적"){
	 					if(buyList[i].target == ${itemNum }){
	 						$(".blur").css("filter", "none");
	 					}
	 				}
	 			}
	 		}
	 		if(${exam.user == login.auto }){
	 			$(".blur").css("filter", "none");
	 		}
	 	});
    </script>
    
</html>