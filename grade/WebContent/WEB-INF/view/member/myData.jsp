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
        <div class="myinfo03">
        	<c:import url="/WEB-INF/view/main/side.jsp"/>
            <header class="sub_header">
                <div class="hmenubar">
                    <img src="/img/hmenubar.png">
                </div>
                <c:import url="/WEB-INF/view/main/login.jsp"/>
            </header>
            <div class="page_inner">
                <div class="logo">
                    <img src="/img/logo.png" onclick="location.href='/'">
                </div>
                <div class="logo_boundry"></div>
                <section class="section01">
                    <div class="item_wrap">
                        <div class="ssw_tit">
                            <div class="img">
                                <img src="/img/student_view/info_tit.png">
                            </div>
                            <div class="tit">학생부</div>
                        </div>
                        <div class="confirm_btn" onclick="location.href='/record/upload'">등록하기</div>
                        <div class="item">
                            <div class="tit_img">
                                <img src="/img/myinfo/stu_pic_tit01.png">
                            </div>
                            <c:choose>
                            	<c:when test="${recordList.size() > 0 }">
		                            <div class="item_slider_wrap">
		                                <div class="item_slider_inner" id="recordSlider">
		                                	<c:forEach var="t" items="${recordList }">
			                                    <div class="item_slide" onclick="view('record', ${t.auto })">
                                                    <div class="school_logo">
                                                        <img src="/img/university/${t.school }.png"/>
                                                    </div>
                                                    <div class="department">${t.schoolName }</div>
                                                    <div class="infomation">
			                                            <div class="name">${t.subject }</div>
			                                            <div class="name">
			                                            	${t.name.substring(0, 1) }
			                                            	<c:forEach var="i" begin="1" end="${t.name.length() - 1 }">
			                                            		O
			                                            	</c:forEach>
			                                            </div>
			                                            <div class="entrance_wrap">
			                                                <div class="img">
			                                                    <img src="/img/myinfo/entrance_img.png">
			                                                </div>
			                                                <div class="txt">${t.year }</div>
			                                            </div>
			                                        </div>
			                                    </div>
		                                	</c:forEach>
		                                </div>
		                            </div>
		                            <div class="item_arrow item_arrow_prev" id="record_left" onclick="arrow(this)">
		                                <img src="/img/myinfo/arrow_prev.png">
		                            </div>
		                            <div class="item_arrow item_arrow_next" id="record_right" onclick="arrow(this)">
		                                <img src="/img/myinfo/arrow_next.png">
		                            </div>
                            	</c:when>
                            	<c:otherwise>
		                            <div class="empty_txt">등록하신 학생부가 없습니다.</div>
                            	</c:otherwise>
                            </c:choose>
                        </div>
                    </div>
                    
                    <div class="item_wrap">
                        <div class="ssw_tit">
                            <div class="img">
                                <img src="/img/student_view/info_tit.png">
                            </div>
                            <div class="tit">자소서</div>
                        </div>
                        <div class="confirm_btn" onclick="location.href='/intro/upload'">등록하기</div>
                        <div class="item">
                            <div class="tit_img">
                                <img src="/img/myinfo/stu_pic_tit02.png">
                            </div>
                            <c:choose>
                            	<c:when test="${introList.size() > 0 }">
		                       		<div class="item_slider_wrap">
		                                <div class="item_slider_inner1" id="introSlider">
		                                	<c:forEach var="t" items="${introList }">
			                                    <div class="item_slide" onclick="view('intro', ${t.auto })">
			                                        <div class="school_logo">
			                                        	<img src="/img/university/${t.school }.png"/>
			                                        </div>
			                                        <div class="department">${t.schoolName }</div>
			                                        <div class="infomation">
			                                            <div class="name">${t.subject }</div>
			                                            <div class="name">
			                                            	${t.name.substring(0, 1) }
			                                            	<c:forEach var="i" begin="1" end="${t.name.length() - 1 }">
			                                            		O
			                                            	</c:forEach>
			                                            </div>
			                                            <div class="entrance_wrap">
			                                                <div class="img">
			                                                    <img src="/img/myinfo/entrance_img.png">
			                                                </div>
			                                                <div class="txt">${t.year }</div>
			                                            </div>
			                                        </div>
			                                    </div>
		                                	</c:forEach>
		                                </div>
		                            </div>
		                            <div class="item_arrow item_arrow_prev1" id='intro_left' onclick="arrow(this)">
		                                <img src="/img/myinfo/arrow_prev.png">
		                            </div>
		                            <div class="item_arrow item_arrow_next1" id="intro_right" onclick="arrow(this)">
		                                <img src="/img/myinfo/arrow_next.png">
		                            </div>
                            	</c:when>
                            	<c:otherwise>
		                            <div class="empty_txt">등록하신 자소서가 없습니다.</div>
                            	</c:otherwise>
                            </c:choose>
                        </div>
                    </div>
                    <div class="item_wrap">
                        <div class="ssw_tit">
                            <div class="img">
                                <img src="/img/student_view/info_tit.png">
                            </div>
                            <div class="tit">면접후기</div>
                        </div>
                        <div class="confirm_btn" onclick="location.href='/interview/upload'">등록하기</div>
                        <div class="item">
                            <div class="tit_img">
                                <img src="/img/myinfo/interview_tit.png">
                            </div>
                            <c:choose>
                            	<c:when test="${interviewList.size() > 0 }">
		                   			<div class="item_slider_wrap">
		                                <div class="item_slider_inner2" id="interviewSlider">
		                                	<c:forEach var="t" items="${interviewList }">
			                                    <div class="item_slide" onclick="view('interview', ${t.auto })">
			                                        <div class="school_logo">
			                                        	<img src="/img/university/${t.school }.png"/>
			                                        </div>
			                                        <div class="department">${t.subject }</div>
			                                        <div class="infomation">
			                                            <div class="name">${t.name.substring(0, 1) }
			                                            	<c:forEach var="i" begin="1" end="${t.name.length()-1 }">
						                                		O
						                                	</c:forEach>
			                                            </div>
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
			                                            <div class="grade_wrap">
			                                                <div class="img">
			                                                    <img src="/img/myinfo/reply.png">
			                                                </div>
			                                                <div class="txt">${t.comment }개</div>
			                                            </div>
			                                        </div>
			                                    </div>
		                                	</c:forEach>
		                                </div>
		                            </div>
		                            <div class="item_arrow item_arrow_prev2" id="interview_left" onclick="arrow(this)">
		                                <img src="/img/myinfo/arrow_prev.png">
		                            </div>
		                            <div class="item_arrow item_arrow_next2" id="interview_right" onclick="arrow(this)">
		                                <img src="/img/myinfo/arrow_next.png">
		                            </div>
                            	</c:when>
                            	<c:otherwise>
	                          		<div class="empty_txt">등록하신 면접후기가 없습니다.</div>
                            	</c:otherwise>
                            </c:choose>
                        </div>
                    </div>
                    <div class="item_wrap">
                        <div class="ssw_tit">
                            <div class="img">
                                <img src="/img/student_view/info_tit.png">
                            </div>
                            <div class="tit">정시성적</div>
                        </div>
                        <div class="confirm_btn" onclick="location.href='/exam/upload'">등록하기</div>
                        <div class="item">
                            <div class="tit_img">
                                <img src="/img/myinfo/stu_pic_tit03.png">
                            </div>
                            <c:choose>
                            	<c:when test="${examList.size() > 0 }">
		                       		<div class="item_slider_wrap">
		                                <div class="item_slider_inner1" id="examSlider">
		                                	<c:forEach var="t" items="${examList }">
			                                    <div class="item_slide" onclick="view('exam', ${t.auto })">
                                                    <div class="is_inner">
                                                        <div class="school_logo">
                                                            <img src="/img/university/${t.school }.png"/>
                                                        </div>
                                                        <div class="department">${t.schoolName }</div>
                                                        <div class="infomation">
			                                            <div class="name">${t.subject }</div>
			                                            <div class="name">
			                                            	${t.name.substring(0, 1) }
			                                            	<c:forEach var="i" begin="1" end="${t.name.length() - 1 }">
			                                            		O
			                                            	</c:forEach>
			                                            </div>
			                                            <div class="entrance_wrap">
			                                                <div class="img">
			                                                    <img src="/img/myinfo/entrance_img.png">
			                                                </div>
			                                                <div class="txt">${t.year }</div>
			                                            </div>
			                                        </div>
                                                    </div>
			                                    </div>
		                                	</c:forEach>
		                                </div>
		                            </div>
		                            <div class="item_arrow item_arrow_prev1" id='exam_left' onclick="arrow(this)">
		                                <img src="/img/myinfo/arrow_prev.png">
		                            </div>
		                            <div class="item_arrow item_arrow_next1" id="exam_right" onclick="arrow(this)">
		                                <img src="/img/myinfo/arrow_next.png">
		                            </div>
                            	</c:when>
                            	<c:otherwise>
		                            <div class="empty_txt">등록하신 정시성적이 없습니다.</div>
                            	</c:otherwise>
                            </c:choose>
                        </div>
                    </div>
                </section>
            </div>
        </div>
        <footer>
        	<c:import url="/WEB-INF/view/main/footer.jsp"/>
        </footer>
    </div>
</body>

<script>
	// 학생부보기
	function view(type, num){
		location.href="/"+type+"/view/"+num;
	}
	// 화살표
	var recordSize = "${recordList.size() }";
	var introSize = "${introList.size() }";
	var interviewSize = "${interviewList.size() }";
	var examSize = "${examList.size() }";
	$(document).ready(function(){
		// 학생부
		if(Number(recordSize) > 4){
			$("#record_right").show();
		}
		// 자소서
		if(Number(introSize) > 4){
			$("#intro_right").show();
		}
		// 면접후기
		if(Number(interviewSize) > 4){
			$("#interview_right").show();
		}
		// 정시성적
		if(Number(examSize) > 4){
			$("#exam_right").show();
		}
	});
	// 화살표 클릭
	var recordNum = 0;
	var introNum = 0;
	var interviewNum = 0;
	var examNum = 0;
	var num = 0;
	function arrow(element){
		var id = element.id;
		var type = id.substring(0, id.indexOf('_'));
		var arr = id.substring(id.indexOf('_')+1);
		console.log(type);
		switch(type){
		case "record":
			if(arr == "left"){
				recordNum--;
			} else {
				recordNum++;
			}
			num = recordNum;
			break;
		case "intro":
			if(arr == "left"){
				introNum--;
			} else {
				introNum++;
			}
			num = introNum;
			break;
		case "interview":
			if(arr == "left"){
				interviewNum--;
			} else {
				interviewNum++;
			}
			num = interviewNum;
			break;
		case "exam":
			if(arr == "left"){
				examNum--;
			} else {
				examNum++;
			}
			num = examNum;
			break;
		}
		$("#"+type+"Slider").stop().animate({
			left: -218*num
		});
		switch(type){
		case "record":
			if(recordNum+4 == Number(recordSize)){
				$("#record_right").hide();
				$("#record_left").show();
			} else if(recordNum == 0){
				$("#record_left").hide();
				$("#record_right").show();
			} else {
				$("#record_left").show();
				$("#record_right").show();
			}
			break;
		case "intro":
			if(introNum+4 == Number(introSize)){
				$("#intro_right").hide();
				$("#intro_left").show();
			} else if(introNum == 0){
				$("#intro_left").hide();
				$("#intro_right").show();
			} else {
				$("#intro_left").show();
				$("#intro_right").show();
			}
			break;
		case "interview":
			if(interviewNum+4 == Number(interviewSize)){
				$("#interview_right").hide();
				$("#interview_left").show();
			} else if(interviewNum == 0){
				$("#interview_left").hide();
				$("#interview_right").show();
			} else {
				$("#interview_left").show();
				$("#interview_right").show();
			}
			break;
		case "exam":
			if(examNum+4 == Number(examSize)){
				$("#exam_right").hide();
				$("#exam_left").show();
			} else if(examNum == 0){
				$("#exam_left").hide();
				$("#exam_right").show();
			} else {
				$("#exam_left").show();
				$("#exam_right").show();
			}
			break;
		}
	}
</script>

</html>