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
        	<c:import url="/WEB-INF/view/main/popup/buyPopup.jsp"/>
            <div class="student_view">
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
                        <div class="detail_item">
                            <div class="inner">
                                <div class="school_logo">
                                    <img src="/img/university/${record.school }.png"/>
                                </div>
                                <div class="department">${record.schoolName }</div>
                                <div class="name">${record.subject }</div>
                                <div class="name">
                                    ${record.name.substring(0, 1) }
                                    <c:forEach var="i" begin="1" end="${record.name.length()-1 }">
                                        O
                                    </c:forEach>
                                </div>
                            </div>
                        </div>
                        <div class="detail_info_wrap">
                            <div class="purchase">
                                <div class="img">
                                    <img src="/img/student_view/buy_img.png">
                                </div>
                                <div class="txt" onclick="buyPopup()">구매하기</div>
                            </div>
                            <div class="info_tit">
                                <div class="img">
                                    <img src="/img/student_view/info_tit.png">
                                </div>
                                <div class="tit">기본정보</div>
                            </div>
                            <div class="info_contents blur">
                                <div class="content">
                                    <div class="img">
                                        <img src="/img/student_view/info01.png">
                                    </div>
                                    <div class="txt">${record.year }</div>
                                </div>
                                <div class="content">
                                    <div class="img">
                                        <img src="/img/student_view/info09.png">
                                    </div>
                                    <div class="txt">${record.admission }</div>
                                </div>
                                <div class="content">
                                    <div class="img">
                                        <img src="/img/student_view/info06.png">
                                    </div>
                                    <div class="txt">${record.hschool }</div>
                                </div>
                                <div class="content">
                                    <div class="img">
                                        <img src="/img/student_view/info15.png">
                                    </div>
                                    <div class="txt">${record.typical }</div>
                                </div>
                                <div class="content">
                                    <div class="img">
                                        <img src="/img/student_view/info10.png">
                                    </div>
                                    <div class="txt">${record.type }</div>
                                </div>
                                <div class="content">
                                    <div class="img">
                                        <img src="/img/student_view/info08.png">
                                    </div>
                                    <div class="txt">${record.pass }</div>
                                </div>
                                <div class="content">
                                    <div class="img">
                                        <img src="/img/student_view/info02.png">
                                    </div>
                                    <div class="txt">1등급</div>
                                </div>
                                <div class="content">
                                    <div class="img">
                                        <img src="/img/student_view/info05.png">
                                    </div>
                                    <div class="txt">2개</div>
                                </div>
                                <div class="content">
                                    <div class="img">
                                        <img src="/img/student_view/info03.png">
                                    </div>
                                    <div class="txt">12권</div>
                                </div>
                                <div class="content">
                                    <div class="img">
                                        <img src="/img/student_view/info04.png">
                                    </div>
                                    <div class="txt">100시간</div>
                                </div>
                            </div>
                            <div class="certify_wrap">
                                <div class="certify">
                                    <div class="star">
                                        <img src="/img/student_view/star.png">
                                    </div>
                                    <div class="txt">테스트 합격생</div>
                                    <div class="stamp">
                                        <img src="/img/student_view/stamp.png">
                                    </div>
                                </div>
                                <div class="certify">
                                    <div class="star">
                                        <img src="/img/student_view/star.png">
                                    </div>
                                    <div class="txt">테스트 합격생</div>
                                    <div class="stamp">
                                        <img src="/img/student_view/stamp.png">
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="detail_container">
                        <div class="dc_tit">
                            <div class="img">
                                <img src="/img/student_view/info_tit.png">
                            </div>
                            <div class="txt">
                                상세정보
                            </div>
                        </div>
                        <div class="dc_contents">
                            <div class="contents_tit">
                                <div class="dot">
                                    <img src="/img/student_view/dot.png">
                                </div>
                                <div class="txt">
                                    수상경력
                                </div>
                            </div>
                            <div class="contents_inner">
                                <div class="content">
                                    <div class="tit">
                                        <img src="/img/student_view/sub_tit01.png">
                                    </div>
                                    <div class="txt_box blur">${record.award1 }</div>
                                </div>
                                <div class="content">
                                    <div class="tit">
                                        <img src="/img/student_view/sub_tit02.png">
                                    </div>
                                    <div class="txt_box blur">${record.award2 }</div>
                                </div>
                                <div class="content">
                                    <div class="tit">
                                        <img src="/img/student_view/sub_tit03.png">
                                    </div>
                                    <div class="txt_box blur">${record.award3 }</div>
                                </div>
                            </div>
                        </div>
                        <div class="dc_contents">
                            <div class="contents_tit">
                                <div class="dot">
                                    <img src="/img/student_view/dot.png">
                                </div>
                                <div class="txt">
                                    진로희망사항
                                </div>
                            </div>
                            <div class="contents_inner">
                                <div class="content">
                                    <div class="tit">
                                        <img src="/img/student_view/sub_tit01.png">
                                    </div>
                                    <div class="txt_box blur">${record.career1 }</div>
                                </div>
                                <div class="content">
                                    <div class="tit">
                                        <img src="/img/student_view/sub_tit02.png">
                                    </div>
                                    <div class="txt_box blur">${record.career2 }</div>
                                </div>
                                <div class="content">
                                    <div class="tit">
                                        <img src="/img/student_view/sub_tit03.png">
                                    </div>
                                    <div class="txt_box blur">${record.career3 }</div>
                                </div>
                            </div>
                        </div>
                        <div class="dc_contents">
                            <div class="contents_tit">
                                <div class="dot">
                                    <img src="/img/student_view/dot.png">
                                </div>
                                <div class="txt">창의적체험활동</div>
                            </div>
                            <div class="contents_inner">
                                <div class="content">
                                    <div class="tit">
                                        <img src="/img/student_view/sub_tit01.png">
                                    </div>
                                    <div class="txt_box1">
                                        <div class="txt_wrap">
                                            <div class="tit">자율활동</div>
                                            <div class="txt blur">${record.autonomous1 }</div>
                                        </div>
                                        <div class="txt_wrap">
                                            <div class="tit">동아리활동</div>
                                            <div class="txt blur">${record.extra1 }</div>
                                        </div>
                                        <div class="txt_wrap">
                                            <div class="tit">자율동아리</div>
                                            <div class="txt blur">${record.club1 }</div>
                                        </div>
                                        <div class="txt_wrap">
                                            <div class="tit">봉사활동</div>
                                            <div class="txt blur">${record.help1 }</div>
                                        </div>
                                        <div class="txt_wrap">
                                            <div class="tit">진로활동</div>
                                            <div class="txt blur">${record.soju1 }</div>
                                        </div>
                                        <div class="txt_wrap">
                                            <div class="tit">R&E, 연구보고서, 소논문</div>
                                            <div class="txt blur">${record.paper1 }</div>
                                        </div>
                                        <div class="txt_wrap">
                                            <div class="tit">기타활동</div>
                                            <div class="txt blur">${record.etc1 }</div>
                                        </div>
                                    </div>
                                </div>
                                <div class="content">
                                    <div class="tit">
                                        <img src="/img/student_view/sub_tit02.png">
                                    </div>
                                    <div class="txt_box1">
                                        <div class="txt_wrap">
                                            <div class="tit">자율활동</div>
                                            <div class="txt blur">${record.autonomous2 }</div>
                                        </div>
                                        <div class="txt_wrap">
                                            <div class="tit">동아리활동</div>
                                            <div class="txt blur">${record.extra2 }</div>
                                        </div>
                                        <div class="txt_wrap">
                                            <div class="tit">자율동아리</div>
                                            <div class="txt blur">${record.club2 }</div>
                                        </div>
                                        <div class="txt_wrap">
                                            <div class="tit">봉사활동</div>
                                            <div class="txt blur">${record.help2 }</div>
                                        </div>
                                        <div class="txt_wrap">
                                            <div class="tit">진로활동</div>
                                            <div class="txt blur">${record.soju2 }</div>
                                        </div>
                                        <div class="txt_wrap">
                                            <div class="tit">R&E, 연구보고서, 소논문</div>
                                            <div class="txt blur">${record.paper2 }</div>
                                        </div>
                                        <div class="txt_wrap">
                                            <div class="tit">기타활동</div>
                                            <div class="txt blur">${record.etc2 }</div>
                                        </div>
                                    </div>
                                </div>
                                <div class="content">
                                    <div class="tit">
                                        <img src="/img/student_view/sub_tit03.png">
                                    </div>
                                    <div class="txt_box1">
                                        <div class="txt_wrap">
                                            <div class="tit">자율활동</div>
                                            <div class="txt blur">${record.autonomous3 }</div>
                                        </div>
                                        <div class="txt_wrap">
                                            <div class="tit">동아리활동</div>
                                            <div class="txt blur">${record.extra3 }</div>
                                        </div>
                                        <div class="txt_wrap">
                                            <div class="tit">자율동아리</div>
                                            <div class="txt blur">${record.club3 }</div>
                                        </div>
                                        <div class="txt_wrap">
                                            <div class="tit">봉사활동</div>
                                            <div class="txt blur">${record.help3 }</div>
                                        </div>
                                        <div class="txt_wrap">
                                            <div class="tit">진로활동</div>
                                            <div class="txt blur">${record.soju3 }</div>
                                        </div>
                                        <div class="txt_wrap">
                                            <div class="tit">R&E, 연구보고서, 소논문</div>
                                            <div class="txt blur">${record.paper3 }</div>
                                        </div>
                                        <div class="txt_wrap">
                                            <div class="tit">기타활동</div>
                                            <div class="txt blur">${record.etc1 }</div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="dc_contents">
                            <div class="contents_tit">
                                <div class="dot">
                                    <img src="/img/student_view/dot.png">
                                </div>
                                <div class="txt">독서활동</div>
                            </div>
                            <div class="contents_inner">
                                <div class="content">
                                    <div class="tit">
                                        <img src="/img/student_view/sub_tit01.png">
                                    </div>
                                    <div class="txt_box blur">${record.reading1 }</div>
                                </div>
                                <div class="content">
                                    <div class="tit">
                                        <img src="/img/student_view/sub_tit02.png">
                                    </div>
                                    <div class="txt_box blur">${record.reading2 }</div>
                                </div>
                                <div class="content">
                                    <div class="tit">
                                        <img src="/img/student_view/sub_tit03.png">
                                    </div>
                                    <div class="txt_box blur">${record.reading3 }</div>
                                </div>
                            </div>
                        </div>
                        <div class="dc_contents">
                            <div class="contents_tit">
                                <div class="dot">
                                    <img src="/img/student_view/dot.png">
                                </div>
                                <div class="txt">
									세부능력 특기사항<span> (세부능력특기사항 중 좋은 기록이라고 생각하는 내용 몇 과목을 적어주세요. )</span>
                                </div>
                            </div>
                            <div class="contents_inner">
                                <div class="content">
                                    <div class="tit">
                                        <img src="/img/student_view/sub_tit01.png">
                                    </div>
                                    <div class="txt_box blur">${record.special1 }</div>
                                </div>
                                <div class="content">
                                    <div class="tit">
                                        <img src="/img/student_view/sub_tit02.png">
                                    </div>
                                    <div class="txt_box blur">${record.special2 }</div>
                                </div>
                                <div class="content">
                                    <div class="tit">
                                        <img src="/img/student_view/sub_tit03.png">
                                    </div>
                                    <div class="txt_box blur">${record.special3 }</div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="sv_btn_wrap">
<%--                     	<c:if test="${record.user == login.auto }"> --%>
<%-- 	                        <div class="sv_btn" onclick="location.href='/record/modify/${record.auto }'"> --%>
<!-- 	                            <img src="/img/student_view/btn01.png"> -->
<!-- 	                        </div> -->
<%--                     	</c:if> --%>
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
	 		if(${record.user == login.auto }){
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
	 				if(buyList[i].item == "학생부"){
	 					if(buyList[i].target == ${itemNum }){
	 						$(".blur").css("filter", "none");
	 					}
	 				}
	 			}
	 		}
	 		if(${record.user == login.auto }){
	 			$(".blur").css("filter", "none");
	 		}
	 	});
    </script>
    
</html>