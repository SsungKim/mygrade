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
            <div class="student_add">
            	<c:import url="/WEB-INF/view/main/side.jsp"/>
                <header class="sub_header">
                    <div class="hmenubar">
                        <img src="/img/hmenubar.png">
                    </div>
                    <c:import url="/WEB-INF/view/main/login.jsp"/>
                </header>
                <div class="main_header">
                    <div class="logo">
                        <img src="/img/logo.png" onclick="location.href='/'">
                    </div>
                </div>
                <div class="page_inner">
                	<div class="sv_txt_wrap">
                        <div class="sv_txt">
							※학생부 등록은 최대 50장 까지 가능합니다.(순서대로 올려주세요)
	                    </div>
	                    <div class="sv_txt">
							※학생부를 이미지파일로 첨부하면 확인후 학생부인증 으로 표시됩니다.<br>&nbsp;&nbsp;&nbsp;올린 학생부는 인증확인용으로만 사용되며 노출되지 않습니다.
	                    </div>
	                    <div class="sv_txt">
							※학생부 이미지 첨부 시 우측 상단의 등록하기 버튼을 클릭하셔야 이미지 등록이 완료됩니다.
	                    </div>
                    </div>
                    <div class="sv_tit1">
                        <div class="img">
                            <img src="/img/student_view/info_tit.png">
                        </div>
                        <div class="txt">학생부 파일첨부</div>
                    </div>
	                <div class="student_view_slider_wrap">
	                	<div class="confirm_btn" onclick="uploadRecord()">등록하기</div>
						<div class="sv_tit">
					    	<img src="/img/student_view/stu_pic_tit01.png">
						</div>
						<div class="student_view_slider">
						    <div class="sv_slider_inner">
					    		<form id="recordForm" action="/record/uploadFile" enctype="multipart/form-data" method="post">
					     			<c:forEach var="t" begin="1" end="50">
										<div class="sv_slide no_img" id="viewrecord${t }">
											<label for="record${t }">
					    						<img src="/img/student_add/plus.png">
											</label>
											<input type="file" id="record${t }" name="record${t }" onchange="showImg(this)">
											<div class="txt">${t }P</div>
										</div>
									</c:forEach>
					        	</form>
					        </div>
					    </div>
					    <div class="sv_arrow sv_arrow_prev">
					        <img src="/img/student_view/arrow_prev.png">
					    </div>
					    <div class="sv_arrow sv_arrow_next">
					        <img src="/img/student_view/arrow_next.png">
					    </div>
					</div>
                    <div class="confirm_btn1" onclick="uploadRecord()">등록하기</div>
				</div>
        		<form action="/record/uploadRecord2" method="post" id="recordData">
	                <c:import url="/WEB-INF/view/admin/uploadAdminWrap.jsp"/>
                    <div class="sv_tit1 sv_tit2">
                        <div class="img">
                            <img src="/img/student_view/info_tit.png">
                        </div>
                        <div class="txt">기본 정보</div>
                    </div>
	                <div class="infomation_wrap">
	                    <div class="inner">
	                        <div class="iw_tit">
	                            <div class="img">
	                                <img src="/img/student_view/info_tit.png">
	                            </div>
	                            <div class="txt">기본 정보</div>
	                        </div>
	                        <div class="id_container1">
	                            <div class="input_wrapper">
                                    <div class="input_wrapper_inner">
                                        <div class="input_wrap">
                                            <div class="tit">
                                                <img src="/img/student_view/info02.png">
                                            </div>
                                            <input type="text" placeholder="예) 1" id="grade" name="grade">
                                            <div class="txt">등급</div>
                                        </div>
                                        <div class="input_wrap">
                                            <div class="tit">
                                                <img src="/img/student_view/info05.png">
                                            </div>
                                            <input type="text" placeholder="예) 1" id="award" name="award">
                                            <div class="txt">개</div>
                                        </div>
                                    </div>
	                            </div>
	                            <div class="input_wrapper input_wrapper1">
                                    <div class="input_wrapper_inner">
                                        <div class="input_wrap">
                                            <div class="tit">
                                                <img src="/img/student_view/info06.png">
                                            </div>
                                            <input type="text" placeholder="예) 서울네모고등" id="hschool" name="hschool">
                                            <div class="txt">학교</div>
                                        </div>
                                        <div class="input_wrap">
                                            <div class="tit">
                                                <img src="/img/student_view/info04.png">
                                            </div>
                                            <input type="text" placeholder="예) 41" id="time" name="time">
                                            <div class="txt">시간</div>
                                        </div>
                                        <div class="input_wrap">
                                            <div class="tit">
                                                <img src="/img/student_view/info03.png">
                                            </div>
                                            <input type="text" placeholder="예) 52" id="book" name="book">
                                            <div class="txt">권</div>
                                        </div>
                                    </div>
	                            </div>
	                        </div>
	                    </div>
	                    <div class="boundry"></div>
	                </div>
	                <div class="page_inner" id="introDivWrap">
	                    <div class="detail_container">
	                        <div class="dc_tit">
	                            <div class="img">
	                                <img src="/img/student_view/info_tit.png">
	                            </div>
	                            <div class="txt">상세정보</div>
	                        </div>
	                        <div class="dc_contents">
	                            <div class="contents_tit">
	                                <div class="dot">
	                                    <img src="/img/student_view/dot.png">
	                                </div>
	                                <div class="txt">수상경력<span> (수상내역을 적어주세요)</span></div>
	                            </div>
	                            <div class="contents_inner">
	                            	<c:forEach var="t" begin="1" end="3">
	                            		<div class="content">
		                                    <div class="tit">
		                                        <img src="/img/student_view/sub_tit0${t }.png">
		                                    </div>
		                                    <div class="txt_box">
		                                        <textarea placeholder="내용을 입력해주세요." id="award${t }" name="award${t }"></textarea>
		                                    </div>
		                                </div>
	                            	</c:forEach>
	                            </div>
	                        </div>
	                        <div class="dc_contents">
	                            <div class="contents_tit">
	                                <div class="dot">
	                                    <img src="/img/student_view/dot.png">
	                                </div>
	                                <div class="txt">진로희망사항</div>
	                            </div>
	                            <div class="contents_inner">
	                            	<c:forEach var="t" begin="1" end="3">
	                            		<div class="content">
		                                    <div class="tit">
		                                        <img src="/img/student_view/sub_tit0${t }.png">
		                                    </div>
		                                    <div class="txt_box">
		                                        <textarea placeholder="내용을 입력해주세요." id="career${t }" name="career${t }"></textarea>
		                                    </div>
		                                </div>
	                            	</c:forEach>
	                            </div>
	                        </div>
	                        <div class="dc_contents">
	                            <div class="contents_tit">
	                                <div class="dot">
	                                    <img src="/img/student_view/dot.png">
	                                </div>
	                                <div class="txt">
	                                	창의적체험활동
	                                	<span> (활동내역을 적어주세요. 만약 활동내역에 해당사항이 없을 경우 빈칸으로 남겨두면 됩니다)</span>
                                	</div>
	                            </div>
	                            <div class="contents_inner">
	                            	<c:forEach var="t" begin="1" end="3">
	                            		<div class="content">
		                                    <div class="tit">
		                                        <img src="/img/student_view/sub_tit0${t }.png">
		                                    </div>
		                                    <div class="txt_box1">
		                                        <div class="txt_wrap">
		                                            <div class="tit">자율활동</div>
		                                            <div class="txt">
		                                                <textarea placeholder="내용을 입력해주세요." onkeyup="aaa(this)" id="autonomous${t }" name="autonomous${t }"></textarea>
		                                            </div>
		                                        </div>
		                                        <div class="txt_wrap">
		                                            <div class="tit">동아리활동</div>
		                                            <div class="txt">
		                                                <textarea placeholder="내용을 입력해주세요." onkeyup="aaa(this)" id="extra${t }" name="extra${t }"></textarea>
		                                            </div>
		                                        </div>
		                                        <div class="txt_wrap">
		                                            <div class="tit">자율동아리</div>
		                                            <div class="txt">
		                                                <textarea placeholder="내용을 입력해주세요." onkeyup="aaa(this)" id="club${t }" name="club${t }"></textarea>
		                                            </div>
		                                        </div>
		                                        <div class="txt_wrap">
		                                            <div class="tit">봉사활동</div>
		                                            <div class="txt">
		                                                <textarea placeholder="내용을 입력해주세요." onkeyup="aaa(this)" id="help${t }" name="help${t }"></textarea>
		                                            </div>
		                                        </div>
		                                        <div class="txt_wrap">
		                                            <div class="tit">진로활동</div>
		                                            <div class="txt">
		                                                <textarea placeholder="내용을 입력해주세요." onkeyup="aaa(this)" id="soju${t }" name="soju${t }"></textarea>
		                                            </div>
		                                        </div>
		                                        <div class="txt_wrap">
		                                            <div class="tit">R&E, 연구보고서, 소논문</div>
		                                            <div class="txt">
		                                                <textarea placeholder="내용을 입력해주세요." onkeyup="aaa(this)" id="paper${t }" name="paper${t }"></textarea>
		                                            </div>
		                                        </div>
		                                        <div class="txt_wrap">
		                                            <div class="tit">기타활동</div>
		                                            <div class="txt">
		                                                <textarea placeholder="내용을 입력해주세요." onkeyup="aaa(this)" id="etc${t }" name="etc${t }"></textarea>
		                                            </div>
		                                        </div>
		                                    </div>
		                                </div>
	                            	</c:forEach>
	                            </div>
	                        </div>
	                        <div class="dc_contents">
	                            <div class="contents_tit">
	                                <div class="dot">
	                                    <img src="/img/student_view/dot.png">
	                                </div>
	                                <div class="txt">독서활동<span> (독서활동과 과목별독서활동을 적어주세요)</span></div>
	                            </div>
	                            <div class="contents_inner">
	                            	<c:forEach var="t" begin="1" end="3">
	                            		<div class="content">
		                                    <div class="tit">
		                                        <img src="/img/student_view/sub_tit0${t }.png">
		                                    </div>
		                                    <div class="txt_box">
		                                        <textarea placeholder="내용을 입력해주세요." id="reading${t }" name="reading${t }"></textarea>
		                                    </div>
		                                </div>
	                            	</c:forEach>
	                            </div>
	                        </div>
	                        <div class="dc_contents">
	                            <div class="contents_tit">
	                                <div class="dot">
	                                    <img src="/img/student_view/dot.png">
	                                </div>
	                                <div class="txt">
										세부능력 특기사항
										<span> (세부능력특기사항 중 좋은 기록이라고 생각하는 내용 몇 과목을 적어주세요. )</span>
	                                </div>
	                            </div>
	                            <div class="contents_inner">
	                            	<c:forEach var="t" begin="1" end="3">
	                            		<div class="content">
		                                    <div class="tit">
		                                        <img src="/img/student_view/sub_tit0${t }.png">
		                                    </div>
		                                    <div class="txt_box">
		                                        <textarea placeholder="내용을 입력해주세요." id="special${t }" name="special${t }"></textarea>
		                                    </div>
		                                </div>
	                            	</c:forEach>
	                            </div>
	                        </div>
	                    </div>
	                    <div class="sv_btn_wrap">
	                        <div class="sv_btn">
	                            <img src="/img/student_add/btn01.png" onclick="history.back()">
	                        </div>
	                        <div class="sv_btn">
	                            <img src="/img/student_add/btn02.png" onclick="recordSave()">
	                        </div>
	                    </div>
	                </div>
	            </form>
            </div>
            <footer>
            	<c:import url="/WEB-INF/view/main/footer.jsp"/>
            </footer>
        </div>
    </body>
    
    <script>
    	// 관리자일경우 입력란 보이기
    	$(document).ready(function(){
    		if(${login.id == 'admin' }){
    			$("#adminWrap").show();
    		}
    	});
	 	// 항목들 숫자만 입력가능
		$(document).ready(function(){
			$("input[id=grade]").keyup(function(event){ 
				if (!(event.keyCode >=48 && event.keyCode<=57)) {
					var inputVal = $(this).val();
					$(this).val(inputVal.replace(/[^0-9]/gi,''));
				}
			});
			$("input[id=book]").keyup(function(event){ 
				if (!(event.keyCode >=48 && event.keyCode<=57)) {
					var inputVal = $(this).val();
					$(this).val(inputVal.replace(/[^0-9]/gi,''));
				}
			});
			$("input[id=time]").keyup(function(event){ 
				if (!(event.keyCode >=48 && event.keyCode<=57)) {
					var inputVal = $(this).val();
					$(this).val(inputVal.replace(/[^0-9]/gi,''));
				}
			});
			$("input[id=award]").keyup(function(event){ 
				if (!(event.keyCode >=48 && event.keyCode<=57)) {
					var inputVal = $(this).val();
					$(this).val(inputVal.replace(/[^0-9]/gi,''));
				}
			});
		});
		// 로그인 체크
		function loginCheck(){
			if(${login == null}){
				alert("세션이 만료되었습니다.\n로그인 페이지로 이동합니다.");
				location.href='/member/login';
				return false;
			}
			return true;
		}
		// 학생부 등록
    	var recordNum = 0;
    	function uploadRecord(){
    		if(!loginCheck()){
    			return;
    		}
    		var recordCount = 0;
    		for(var i=1; i<=50; i++){
    			if($("#record"+i).val() == ""){
    				recordCount++;
    			}
    		}
    		if(recordCount == 50){
    			alert("등록된 학생부가 없습니다.");
    			return;
    		}
    		$("#recordForm").ajaxForm({
    			url : "/record/uploadFile",
    			enctype : "multipart/form-data",
    			success : function(txt){
    				if(txt){
    					alert("등록되었습니다.");
    					recordNum++;
    				} else {
    					alert("등록에 실패하였습니다.\n잠시후 다시 시도해주세요.");
    				}
    			}
    		});
    		$("#recordForm").submit();
    	}
    	// 파일 선택시 이미지 미리보기
 		function showImg(input) {
	 		var id = input.id;
	 		var name = input.value;
	 		name = name.substring(name.indexOf('.')+1).toLowerCase();
	 		if(name != "jpg" && name != "png" && name != "gif" && name != "jpeg"){
	 			alert(".jpg / .jpeg / .png / .gif 파일만 등록가능합니다.");
	 		} else {
	 		    if (input.files && input.files[0]) {
	 		        var reader = new FileReader();
	 		        reader.onload = function (e) {
	 		        	$("#view"+id).css("background-image", "url('"+e.target.result+"')");
	 		        	$("#view"+id).css({"background-size" : "100%", "background-position" : "center", "background-repeat" : "no-repeat"});
	 		        }
	 		        reader.readAsDataURL(input.files[0]);
	 		    }
	 		}
 		}
    	// 학생부, 자소서 이전, 다음 클릭
    	$(document).ready(function(){
    		var sn = 0;
    		var slideSize = $("#viewrecord1")[0].clientWidth+24;
    		if(slideSize < 200){
    			slideSize = 230;
    		}
    		console.log(slideSize);
    	    $(".sv_arrow_next").click(function(){
    	        sn++;
    	        $(".sv_slider_inner").stop().animate({
    	            left: -slideSize * sn
    	        });
    	        check(0, sn);
    	        check2(0, sn);
    	    });
    	    $(".sv_arrow_prev").click(function(){
    	        sn--;
    	        $(".sv_slider_inner").stop().animate({
    	            left: -slideSize * sn
    	        });
    	        if(sn == 0){
    	    		$(".sv_arrow_prev").hide();
    	    	} else if(sn > 0){
    	    		$(".sv_arrow_prev").show();
    	    	}
    	        check(0, sn);
    	        check2(0, sn);
    	    });
    	    
    	    var sn1 = 0;
    	    $(".sv_arrow_next1").click(function(){
    	        sn1++;
    	        $(".sv_slider_inner1").stop().animate({
    	            left: -slideSize * sn1
    	        });
    	        check(1, sn1);
    	        check2(1, sn1);
    	    });
    	    $(".sv_arrow_prev1").click(function(){
    	        sn1--;
    	        $(".sv_slider_inner1").stop().animate({
    	            left: -slideSize * sn1
    	        });
    	        check(1, sn1);
    	        check2(1, sn1);
    	    });
    	});
    	// 이전 클릭 체크
    	function check(type, sn){
    		if(type==0){
	    		if(sn == 0){
		    		$(".sv_arrow_prev").hide();
		    	} else if(sn > 0){
		    		$(".sv_arrow_prev").show();
		    	}
    		} else {
    			if(sn == 0){
    	    		$(".sv_arrow_prev1").hide();
    	    	} else if(sn > 0){
    	    		$(".sv_arrow_prev1").show();
    	    	}
    		}
    	}
    	// 다음 클릭 체크
    	function check2(type, sn){
    		var end = 46;
    		var slideSize = $("#viewrecord1")[0].clientWidth+24;
    		if(slideSize < 200){
    			end = 24;
    		}
    		if(type==0){
	    		if(sn == end){
		    		$(".sv_arrow_next").hide();
		    	} else if(sn < end){
		    		$(".sv_arrow_next").show();
		    	}
    		} else {
    			if(sn == end){
    	    		$(".sv_arrow_next1").hide();
    	    	} else if(sn < end){
    	    		$(".sv_arrow_next1").show();
    	    	}
    		}
    	}
    	// 학생부 전체 저장
    	function recordSave(){
    		loginCheck();
   			var addr = $("#addr").val();
   			var school = $("#school").val();
   			var subject = $("#subject").val();
   			var type = $("#type").val();
   			var year = $("#year").val();
   			var admission = $("#admission").val();
   			var typical = $("#typical").val();
   			var hschool = $("#hschool").val();
   			var pass = $("#passY").prop("checked") ? "합격" : $("#passN").prop("checked") ? "불합격" : false;
   			var award1 = $("#award1").val();
   			award1 = award1.replace(/\n/g, "<br>");
   			var award2 = $("#award2").val();
   			award2 = award2.replace(/\n/g, "<br>");
   			var award3 = $("#award3").val();
   			award3 = award3.replace(/\n/g, "<br>");
   			var career1 = $("#career1").val();
   			career1 = career1.replace(/\n/g, "<br>");
   			var career2 = $("#career2").val();
   			career2 = career2.replace(/\n/g, "<br>");
   			var career3 = $("#career3").val();
   			career3 = career3.replace(/\n/g, "<br>");
   			var autonomous1 = $("#autonomous1").val();
   			autonomous1 = autonomous1.replace(/\n/g, "<br>");
   			var extra1 = $("#extra1").val();
   			extra1 = extra1.replace(/\n/g, "<br>");
   			var club1 = $("#club1").val();
   			club1 = club1.replace(/\n/g, "<br>");
   			var help1 = $("#help1").val();
   			help1 = help1.replace(/\n/g, "<br>");
   			var soju1 = $("#soju1").val();
   			soju1 = soju1.replace(/\n/g, "<br>");
   			var paper1 = $("#paper1").val();
   			paper1 = paper1.replace(/\n/g, "<br>");
   			var etc1 = $("#etc1").val();
   			etc1 = etc1.replace(/\n/g, "<br>");
   			var autonomous2 = $("#autonomous2").val();
   			autonomous2 = autonomous2.replace(/\n/g, "<br>");
   			var extra2 = $("#extra2").val();
   			extra2 = extra2.replace(/\n/g, "<br>");
   			var club2 = $("#club2").val();
   			club2 = club2.replace(/\n/g, "<br>");
   			var help2 = $("#help2").val();
   			help2 = help2.replace(/\n/g, "<br>");
   			var soju2 = $("#soju2").val();
   			soju2 = soju2.replace(/\n/g, "<br>");
   			var paper2 = $("#paper2").val();
   			paper2 = paper2.replace(/\n/g, "<br>");
   			var etc2 = $("#etc2").val();
   			etc2 = etc2.replace(/\n/g, "<br>");
   			var autonomous3 = $("#autonomous3").val();
   			autonomous3 = autonomous3.replace(/\n/g, "<br>");
   			var extra3 = $("#extra3").val();
   			extra3 = extra3.replace(/\n/g, "<br>");
   			var club3 = $("#club3").val();
   			club3 = club3.replace(/\n/g, "<br>");
   			var help3 = $("#help3").val();
   			help3 = help3.replace(/\n/g, "<br>");
   			var soju3 = $("#soju3").val();
   			soju3 = soju3.replace(/\n/g, "<br>");
   			var paper3 = $("#paper3").val();
   			paper3 = paper3.replace(/\n/g, "<br>");
   			var etc3 = $("#etc3").val();
   			etc3 = etc3.replace(/\n/g, "<br>");
   			var reading1 = $("#reading1").val();
   			reading1 = reading1.replace(/\n/g, "<br>");
   			var reading2 = $("#reading2").val();
   			reading2 = reading2.replace(/\n/g, "<br>");
   			var reading3 = $("#reading3").val();
   			reading3 = reading3.replace(/\n/g, "<br>");
   			var special1 = $("#special1").val();
   			special1 = special1.replace(/\n/g, "<br>");
   			var special2 = $("#special2").val();
   			special2 = special2.replace(/\n/g, "<br>");
   			var special3 = $("#special3").val();
   			special3 = special3.replace(/\n/g, "<br>");
   			var grade = $("#grade").val();
   			var award = $("#award").val();
   			var time = $("#time").val();
   			var book = $("#book").val();
   			if(${login.id == 'admin' }){
	   			if(addr == "choose" || school == "choose" || subject == "" || type == "choose" || year == "" || admission == "" || typical == "" ||
	   					hschool == "" || !pass || award1 == "" || award2 == "" || award3 == "" || career1 == "" || career2 == "" || career3 == "" ||
	   					autonomous1 == "" || autonomous2 == "" || autonomous3 == "" || extra1 == "" || extra2 == "" || extra3 == "" ||
	   					help1 == "" || help2 == "" || help3 == "" || soju1 == "" || soju2 == "" || soju3 == "" || paper1 == "" || paper2 == "" ||
	   					paper3 == "" || etc1 == "" || etc2 == "" || etc3 == "" || reading1 == "" || reading2 == "" || reading3 == "" ||
	   					special1 == "" || special2 == "" || special3 == "" || grade == "" || award == "" || time == "" || book == ""){
	   				alert("입력하지 않은 항목이 있습니다.");
	   				return;
	   			}
   			} else {
   				if(hschool == "" || award1 == "" || award2 == "" || award3 == "" || career1 == "" || career2 == "" || career3 == "" ||
	   					autonomous1 == "" || autonomous2 == "" || autonomous3 == "" || extra1 == "" || extra2 == "" || extra3 == "" ||
	   					help1 == "" || help2 == "" || help3 == "" || soju1 == "" || soju2 == "" || soju3 == "" || paper1 == "" || paper2 == "" ||
	   					paper3 == "" || etc1 == "" || etc2 == "" || etc3 == "" || reading1 == "" || reading2 == "" || reading3 == "" ||
	   					special1 == "" || special2 == "" || special3 == "" || grade == "" || award == "" || time == "" || book == ""){
	   				alert("입력하지 않은 항목이 있습니다.");
	   				return;
	   			}
   			}
   			$("#recordData").submit();
   			return;
   			$("#recordData").ajaxForm({
       			url : "/record/uploadRecord",
       			enctype : "multipart/form-data",
       			success : function(txt){
       				if(txt){
       					alert("등록되었습니다.");
       					location.href="/member/myData/${login.auto }";
       				} else {
       					alert("등록에 실패하였습니다.\n잠시후 다시 시도해주세요.");
       				}
       			}
       		});
       		$("#recordData").submit();
    	}
	</script>
    
</html>