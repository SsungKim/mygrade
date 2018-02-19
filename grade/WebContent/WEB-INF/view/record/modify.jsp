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
        		<form action="/record/modifyRecord" method="post" id="recordData">
        			<input type="hidden" name="auto" value="${record.auto }"/>
	                <c:import url="/WEB-INF/view/admin/uploadRecordModify.jsp"/>
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
                                            <input type="text" placeholder="예) 1" id="grade" name="grade" value="${record.grade }">
                                            <div class="txt">등급</div>
                                        </div>
                                        <div class="input_wrap">
                                            <div class="tit">
                                                <img src="/img/student_view/info05.png">
                                            </div>
                                            <input type="text" placeholder="예) 1" id="award" name="award" value="${record.award }">
                                            <div class="txt">개</div>
                                        </div>
                                    </div>
	                            </div>
	                            <div class="input_wrapper input_wrapper1">
                                    <div class="input_wrapper_inner">
<!--                                         <div class="input_wrap"> -->
<!--                                             <div class="tit"> -->
<!--                                                 <img src="/img/student_view/info06.png"> -->
<!--                                             </div> -->
<%--                                             <input type="text" placeholder="예) 서울네모고등" id="hschool" name="hschool" value="${record.hschool }"> --%>
<!--                                             <div class="txt">학교</div> -->
<!--                                         </div> -->
                                        <div class="input_wrap">
                                            <div class="tit">
                                                <img src="/img/student_view/info04.png">
                                            </div>
                                            <input type="text" placeholder="예) 41" id="time" name="time" value="${record.time }">
                                            <div class="txt">시간</div>
                                        </div>
                                        <div class="input_wrap">
                                            <div class="tit">
                                                <img src="/img/student_view/info03.png">
                                            </div>
                                            <input type="text" placeholder="예) 52" id="book" name="book" value="${record.book }">
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
                            		<div class="content">
	                                    <div class="tit">
	                                        <img src="/img/student_view/sub_tit01.png">
	                                    </div>
	                                    <div class="txt_box">
	                                        <textarea placeholder="내용을 입력해주세요." id="award1" name="award1">${record.award1 }</textarea>
	                                    </div>
	                                </div>
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
	                            	<div class="content">
	                                    <div class="tit">
	                                        <img src="/img/student_view/sub_tit02.png">
	                                    </div>
	                                    <div class="txt_box">
	                                        <textarea placeholder="내용을 입력해주세요." id="career" name="career">${record.career }</textarea>
	                                    </div>
	                                </div>
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
	                            	<div class="content">
	                                    <div class="tit">
	                                        <img src="/img/student_view/sub_tit03.png">
	                                    </div>
	                                    <div class="txt_box1">
	                                        <div class="txt_wrap">
	                                            <div class="tit">자율활동</div>
	                                            <div class="txt">
	                                                <textarea placeholder="내용을 입력해주세요." onkeyup="aaa(this)" id="autonomous" name="autonomous">${record.autonomous }</textarea>
	                                            </div>
	                                        </div>
	                                        <div class="txt_wrap">
	                                            <div class="tit">동아리활동</div>
	                                            <div class="txt">
	                                                <textarea placeholder="내용을 입력해주세요." onkeyup="aaa(this)" id="extra" name="extra">${record.extra }</textarea>
	                                            </div>
	                                        </div>
	                                        <div class="txt_wrap">
	                                            <div class="tit">자율동아리</div>
	                                            <div class="txt">
	                                                <textarea placeholder="내용을 입력해주세요." onkeyup="aaa(this)" id="club" name="club">${record.club }</textarea>
	                                            </div>
	                                        </div>
	                                        <div class="txt_wrap">
	                                            <div class="tit">봉사활동</div>
	                                            <div class="txt">
	                                                <textarea placeholder="내용을 입력해주세요." onkeyup="aaa(this)" id="help" name="help">${record.help }</textarea>
	                                            </div>
	                                        </div>
	                                        <div class="txt_wrap">
	                                            <div class="tit">진로활동</div>
	                                            <div class="txt">
	                                                <textarea placeholder="내용을 입력해주세요." onkeyup="aaa(this)" id="soju" name="soju">${record.soju }</textarea>
	                                            </div>
	                                        </div>
	                                        <div class="txt_wrap">
	                                            <div class="tit">R&E, 연구보고서, 소논문</div>
	                                            <div class="txt">
	                                                <textarea placeholder="내용을 입력해주세요." onkeyup="aaa(this)" id="paper" name="paper">${record.paper }</textarea>
	                                            </div>
	                                        </div>
	                                        <div class="txt_wrap">
	                                            <div class="tit">기타활동</div>
	                                            <div class="txt">
	                                                <textarea placeholder="내용을 입력해주세요." onkeyup="aaa(this)" id="etc" name="etc">${record.etc }</textarea>
	                                            </div>
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
	                                <div class="txt">독서활동<span> (독서활동과 과목별독서활동을 적어주세요)</span></div>
	                            </div>
	                            <div class="contents_inner">
	                            	<div class="content">
	                                    <div class="tit">
	                                        <img src="/img/student_view/sub_tit04.png">
	                                    </div>
	                                    <div class="txt_box">
	                                        <textarea placeholder="내용을 입력해주세요." id="reading" name="reading">${record.reading }</textarea>
	                                    </div>
	                                </div>
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
	                            	<div class="content">
	                                    <div class="tit">
	                                        <img src="/img/student_view/sub_tit05.png">
	                                    </div>
	                                    <div class="txt_box">
	                                        <textarea placeholder="내용을 입력해주세요." id="special" name="special">${record.special }</textarea>
	                                    </div>
	                                </div>
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
    	// br 제거
    	$(document).ready(function(){
    		$("#award1").val($("#award1").val().replace(/[<br>]/g, ''));
    		$("#career").val($("#career").val().replace(/[<br>]/g, ''));
    		$("#autonomous").val($("#autonomous").val().replace(/[<br>]/g, ''));
    		$("#extra").val($("#extra").val().replace(/[<br>]/g, ''));
    		$("#club").val($("#club").val().replace(/[<br>]/g, ''));
    		$("#help").val($("#help").val().replace(/[<br>]/g, ''));
    		$("#soju").val($("#soju").val().replace(/[<br>]/g, ''));
    		$("#paper").val($("#paper").val().replace(/[<br>]/g, ''));
    		$("#etc").val($("#etc").val().replace(/[<br>]/g, ''));
    		$("#reading").val($("#reading").val().replace(/[<br>]/g, ''));
    		$("#special").val($("#special").val().replace(/[<br>]/g, ''));
    	});
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
					$(this).val(inputVal.replace(/[^0-9.]/gi,''));
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
   			var pass = $("#passY").prop("checked") ? "합격" : $("#passN").prop("checked") ? "불합격" : false;
   			var award1 = $("#award1").val();
   			award1 = award1.replace(/\n/g, "<br>");
   			var career = $("#career").val();
   			career = career.replace(/\n/g, "<br>");
   			var autonomous = $("#autonomous").val();
   			autonomous = autonomous.replace(/\n/g, "<br>");
   			var extra = $("#extra").val();
   			extra = extra.replace(/\n/g, "<br>");
   			var club = $("#club").val();
   			club = club.replace(/\n/g, "<br>");
   			var help = $("#help").val();
   			help = help.replace(/\n/g, "<br>");
   			var soju = $("#soju").val();
   			soju = soju.replace(/\n/g, "<br>");
   			var paper = $("#paper").val();
   			paper = paper.replace(/\n/g, "<br>");
   			var etc = $("#etc").val();
   			etc = etc.replace(/\n/g, "<br>");
   			var reading = $("#reading").val();
   			reading = reading.replace(/\n/g, "<br>");
   			var special = $("#special").val();
   			special = special.replace(/\n/g, "<br>");
   			var grade = $("#grade").val();
   			var award = $("#award").val();
   			var time = $("#time").val();
   			var book = $("#book").val();
   			if(${login.id == 'admin' }){
	   			if(addr == "choose" || school == "choose" || subject == "" || type == "choose" || year == "" || admission == "" || typical == "" ||
	   					!pass || award1 == "" || career == "" || autonomous == "" || extra == "" || help == "" || soju == "" || paper == "" || 
	   					etc == "" || reading == "" || special == "" || grade == "" || award == "" || time == "" || book == ""){
	   				alert("입력하지 않은 항목이 있습니다.");
	   				return;
	   			}
   			} else {
   				if(award1 == "" || career == "" || autonomous == "" || extra == "" || help == "" || soju == "" || paper == "" || 
	   					etc == "" || reading == "" || special == "" || grade == "" || award == "" || time == "" || book == ""){
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