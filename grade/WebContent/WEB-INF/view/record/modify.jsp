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
                                        <div class="input_wrap">
                                            <div class="tit">
                                                <img src="/img/student_view/info06.png">
                                            </div>
                                            <input type="text" placeholder="예) 서울네모고등" id="hschool" name="hschool" value="${record.hschool }">
                                            <div class="txt">학교</div>
                                        </div>
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
	                                        <img src="/img/student_view/sub_tit03.png">
	                                    </div>
	                                    <div class="txt_box">
	                                        <textarea placeholder="내용을 입력해주세요." id="award1" name="award1">${record.award1 }</textarea>
	                                    </div>
	                                </div>
                            		<div class="content">
	                                    <div class="tit">
	                                        <img src="/img/student_view/sub_tit03.png">
	                                    </div>
	                                    <div class="txt_box">
	                                        <textarea placeholder="내용을 입력해주세요." id="award2" name="award2">${record.award2 }</textarea>
	                                    </div>
	                                </div>
                            		<div class="content">
	                                    <div class="tit">
	                                        <img src="/img/student_view/sub_tit03.png">
	                                    </div>
	                                    <div class="txt_box">
	                                        <textarea placeholder="내용을 입력해주세요." id="award3" name="award3">${record.award3 }</textarea>
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
	                                        <img src="/img/student_view/sub_tit01.png">
	                                    </div>
	                                    <div class="txt_box">
	                                        <textarea placeholder="내용을 입력해주세요." id="career1" name="career1">${record.career1 }</textarea>
	                                    </div>
	                                </div>
	                            	<div class="content">
	                                    <div class="tit">
	                                        <img src="/img/student_view/sub_tit02.png">
	                                    </div>
	                                    <div class="txt_box">
	                                        <textarea placeholder="내용을 입력해주세요." id="career2" name="career2">${record.career2 }</textarea>
	                                    </div>
	                                </div>
	                            	<div class="content">
	                                    <div class="tit">
	                                        <img src="/img/student_view/sub_tit03.png">
	                                    </div>
	                                    <div class="txt_box">
	                                        <textarea placeholder="내용을 입력해주세요." id="career3" name="career3">${record.career3 }</textarea>
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
	                                        <img src="/img/student_view/sub_tit01.png">
	                                    </div>
	                                    <div class="txt_box1">
	                                        <div class="txt_wrap">
	                                            <div class="tit">자율활동</div>
	                                            <div class="txt">
	                                                <textarea placeholder="내용을 입력해주세요." onkeyup="aaa(this)" id="autonomous1" name="autonomous1">${record.autonomous1 }</textarea>
	                                            </div>
	                                        </div>
	                                        <div class="txt_wrap">
	                                            <div class="tit">동아리활동</div>
	                                            <div class="txt">
	                                                <textarea placeholder="내용을 입력해주세요." onkeyup="aaa(this)" id="extra1" name="extra1">${record.extra1 }</textarea>
	                                            </div>
	                                        </div>
	                                        <div class="txt_wrap">
	                                            <div class="tit">자율동아리</div>
	                                            <div class="txt">
	                                                <textarea placeholder="내용을 입력해주세요." onkeyup="aaa(this)" id="club1" name="club1">${record.club1 }</textarea>
	                                            </div>
	                                        </div>
	                                        <div class="txt_wrap">
	                                            <div class="tit">봉사활동</div>
	                                            <div class="txt">
	                                                <textarea placeholder="내용을 입력해주세요." onkeyup="aaa(this)" id="help1" name="help1">${record.help1 }</textarea>
	                                            </div>
	                                        </div>
	                                        <div class="txt_wrap">
	                                            <div class="tit">진로활동</div>
	                                            <div class="txt">
	                                                <textarea placeholder="내용을 입력해주세요." onkeyup="aaa(this)" id="soju1" name="soju1">${record.soju1 }</textarea>
	                                            </div>
	                                        </div>
	                                        <div class="txt_wrap">
	                                            <div class="tit">R&E, 연구보고서, 소논문</div>
	                                            <div class="txt">
	                                                <textarea placeholder="내용을 입력해주세요." onkeyup="aaa(this)" id="paper1" name="paper1">${record.paper1 }</textarea>
	                                            </div>
	                                        </div>
	                                        <div class="txt_wrap">
	                                            <div class="tit">기타활동</div>
	                                            <div class="txt">
	                                                <textarea placeholder="내용을 입력해주세요." onkeyup="aaa(this)" id="etc1" name="etc1">${record.etc1 }</textarea>
	                                            </div>
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
	                                            <div class="txt">
	                                                <textarea placeholder="내용을 입력해주세요." onkeyup="aaa(this)" id="autonomous2" name="autonomous2">${record.autonomous2 }</textarea>
	                                            </div>
	                                        </div>
	                                        <div class="txt_wrap">
	                                            <div class="tit">동아리활동</div>
	                                            <div class="txt">
	                                                <textarea placeholder="내용을 입력해주세요." onkeyup="aaa(this)" id="extra2" name="extra2">${record.extra2 }</textarea>
	                                            </div>
	                                        </div>
	                                        <div class="txt_wrap">
	                                            <div class="tit">자율동아리</div>
	                                            <div class="txt">
	                                                <textarea placeholder="내용을 입력해주세요." onkeyup="aaa(this)" id="club2" name="club2">${record.club2 }</textarea>
	                                            </div>
	                                        </div>
	                                        <div class="txt_wrap">
	                                            <div class="tit">봉사활동</div>
	                                            <div class="txt">
	                                                <textarea placeholder="내용을 입력해주세요." onkeyup="aaa(this)" id="help2" name="help2">${record.help2 }</textarea>
	                                            </div>
	                                        </div>
	                                        <div class="txt_wrap">
	                                            <div class="tit">진로활동</div>
	                                            <div class="txt">
	                                                <textarea placeholder="내용을 입력해주세요." onkeyup="aaa(this)" id="soju2" name="soju2">${record.soju2 }</textarea>
	                                            </div>
	                                        </div>
	                                        <div class="txt_wrap">
	                                            <div class="tit">R&E, 연구보고서, 소논문</div>
	                                            <div class="txt">
	                                                <textarea placeholder="내용을 입력해주세요." onkeyup="aaa(this)" id="paper2" name="paper2">${record.paper2 }</textarea>
	                                            </div>
	                                        </div>
	                                        <div class="txt_wrap">
	                                            <div class="tit">기타활동</div>
	                                            <div class="txt">
	                                                <textarea placeholder="내용을 입력해주세요." onkeyup="aaa(this)" id="etc2" name="etc2">${record.etc2 }</textarea>
	                                            </div>
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
	                                            <div class="txt">
	                                                <textarea placeholder="내용을 입력해주세요." onkeyup="aaa(this)" id="autonomous3" name="autonomous3">${record.autonomous3 }</textarea>
	                                            </div>
	                                        </div>
	                                        <div class="txt_wrap">
	                                            <div class="tit">동아리활동</div>
	                                            <div class="txt">
	                                                <textarea placeholder="내용을 입력해주세요." onkeyup="aaa(this)" id="extra3" name="extra3">${record.extra3 }</textarea>
	                                            </div>
	                                        </div>
	                                        <div class="txt_wrap">
	                                            <div class="tit">자율동아리</div>
	                                            <div class="txt">
	                                                <textarea placeholder="내용을 입력해주세요." onkeyup="aaa(this)" id="club3" name="club3">${record.club3 }</textarea>
	                                            </div>
	                                        </div>
	                                        <div class="txt_wrap">
	                                            <div class="tit">봉사활동</div>
	                                            <div class="txt">
	                                                <textarea placeholder="내용을 입력해주세요." onkeyup="aaa(this)" id="help3" name="help3">${record.help3 }</textarea>
	                                            </div>
	                                        </div>
	                                        <div class="txt_wrap">
	                                            <div class="tit">진로활동</div>
	                                            <div class="txt">
	                                                <textarea placeholder="내용을 입력해주세요." onkeyup="aaa(this)" id="soju3" name="soju3">${record.soju3 }</textarea>
	                                            </div>
	                                        </div>
	                                        <div class="txt_wrap">
	                                            <div class="tit">R&E, 연구보고서, 소논문</div>
	                                            <div class="txt">
	                                                <textarea placeholder="내용을 입력해주세요." onkeyup="aaa(this)" id="paper3" name="paper3">${record.paper3 }</textarea>
	                                            </div>
	                                        </div>
	                                        <div class="txt_wrap">
	                                            <div class="tit">기타활동</div>
	                                            <div class="txt">
	                                                <textarea placeholder="내용을 입력해주세요." onkeyup="aaa(this)" id="etc3" name="etc3">${record.etc3 }</textarea>
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
	                                        <img src="/img/student_view/sub_tit01.png">
	                                    </div>
	                                    <div class="txt_box">
	                                        <textarea placeholder="내용을 입력해주세요." id="reading1" name="reading1">${record.reading1 }</textarea>
	                                    </div>
	                                </div>
	                            	<div class="content">
	                                    <div class="tit">
	                                        <img src="/img/student_view/sub_tit02.png">
	                                    </div>
	                                    <div class="txt_box">
	                                        <textarea placeholder="내용을 입력해주세요." id="reading2" name="reading2">${record.reading2 }</textarea>
	                                    </div>
	                                </div>
	                            	<div class="content">
	                                    <div class="tit">
	                                        <img src="/img/student_view/sub_tit03.png">
	                                    </div>
	                                    <div class="txt_box">
	                                        <textarea placeholder="내용을 입력해주세요." id="reading3" name="reading3">${record.reading3 }</textarea>
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
	                                        <img src="/img/student_view/sub_tit01.png">
	                                    </div>
	                                    <div class="txt_box">
	                                        <textarea placeholder="내용을 입력해주세요." id="special1" name="special1">${record.special1 }</textarea>
	                                    </div>
	                                </div>
	                            	<div class="content">
	                                    <div class="tit">
	                                        <img src="/img/student_view/sub_tit02.png">
	                                    </div>
	                                    <div class="txt_box">
	                                        <textarea placeholder="내용을 입력해주세요." id="special2" name="special2">${record.special2 }</textarea>
	                                    </div>
	                                </div>
	                            	<div class="content">
	                                    <div class="tit">
	                                        <img src="/img/student_view/sub_tit03.png">
	                                    </div>
	                                    <div class="txt_box">
	                                        <textarea placeholder="내용을 입력해주세요." id="special3" name="special3">${record.special3 }</textarea>
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
    		$("#award2").val($("#award2").val().replace(/[<br>]/g, ''));
    		$("#award3").val($("#award3").val().replace(/[<br>]/g, ''));
    		$("#career1").val($("#career1").val().replace(/[<br>]/g, ''));
    		$("#career2").val($("#career2").val().replace(/[<br>]/g, ''));
    		$("#career3").val($("#career3").val().replace(/[<br>]/g, ''));
    		$("#autonomous1").val($("#autonomous1").val().replace(/[<br>]/g, ''));
    		$("#autonomous2").val($("#autonomous2").val().replace(/[<br>]/g, ''));
    		$("#autonomous3").val($("#autonomous3").val().replace(/[<br>]/g, ''));
    		$("#extra1").val($("#extra1").val().replace(/[<br>]/g, ''));
    		$("#extra2").val($("#extra2").val().replace(/[<br>]/g, ''));
    		$("#extra3").val($("#extra3").val().replace(/[<br>]/g, ''));
    		$("#club1").val($("#club1").val().replace(/[<br>]/g, ''));
    		$("#club2").val($("#club2").val().replace(/[<br>]/g, ''));
    		$("#club3").val($("#club3").val().replace(/[<br>]/g, ''));
    		$("#help1").val($("#help1").val().replace(/[<br>]/g, ''));
    		$("#help2").val($("#help2").val().replace(/[<br>]/g, ''));
    		$("#help3").val($("#help3").val().replace(/[<br>]/g, ''));
    		$("#soju1").val($("#soju1").val().replace(/[<br>]/g, ''));
    		$("#soju2").val($("#soju2").val().replace(/[<br>]/g, ''));
    		$("#soju3").val($("#soju3").val().replace(/[<br>]/g, ''));
    		$("#paper1").val($("#paper1").val().replace(/[<br>]/g, ''));
    		$("#paper2").val($("#paper2").val().replace(/[<br>]/g, ''));
    		$("#paper3").val($("#paper3").val().replace(/[<br>]/g, ''));
    		$("#etc1").val($("#etc1").val().replace(/[<br>]/g, ''));
    		$("#etc2").val($("#etc2").val().replace(/[<br>]/g, ''));
    		$("#etc3").val($("#etc3").val().replace(/[<br>]/g, ''));
    		$("#reading1").val($("#reading1").val().replace(/[<br>]/g, ''));
    		$("#reading2").val($("#reading2").val().replace(/[<br>]/g, ''));
    		$("#reading3").val($("#reading3").val().replace(/[<br>]/g, ''));
    		$("#special1").val($("#special1").val().replace(/[<br>]/g, ''));
    		$("#special2").val($("#special2").val().replace(/[<br>]/g, ''));
    		$("#special3").val($("#special3").val().replace(/[<br>]/g, ''));
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