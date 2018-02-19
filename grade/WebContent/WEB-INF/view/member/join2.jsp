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
            <div class="join01_02">
            	<c:import url="/WEB-INF/view/main/side.jsp"/>
            	<div class="popup_cover" id="joinPopup1"></div>
                <div class="completion_popup_wrap" id="joinPopup2">
                    <div class="name">
                        <span id="popupId"></span>님
                    </div>
                    <div class="com_popup_logo">
                        <img src="/img/logo.png">
                    </div>
                    <div class="com_txt">회원 가입을 환영합니다 <br>
                        <span>아래 확인버튼을 누르시면 메인페이지로이동합니다.</span>
                    </div>
                    <div class="confirm_btn" onclick="location.href='/'">확인</div>
                </div>
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
                    <section class="join_tit_wrap">
                        <div class="join_tit">
                            <div class="img">
                                <img src="/img/join/join01_01/people.png">
                            </div>
                            <div class="tit">회원가입 절차</div>
                        </div>
                        <div class="join_step">
                            1.실명확인 및 약관동의 > <span>2.회원 정보작성</span> > 3.가입완료
                        </div>
                    </section>
                    <section class="section01">
                        <form action="/member/join4" method="post" enctype="multipart/form-data" id="joinForm">
	                        <div class="info_write_wrap">
	                            <div class="info_write_tit">
	                                <div class="tit">본인정보</div>
	                                <div class="line"></div>
	                            </div>
	                            <div class="info_write_contents">
	                                <div class="info_content m0">
	                                    <div class="tit">이름</div>
<!-- 	                                    <div class="txt" id="name">심청이</div> -->
	                                    <div class="txt" id="name">${name }</div>
	                                </div>
	                                <div class="info_content id">
	                                    <div class="tit">아이디</div>
	                                    <div class="input_wrap">
		                                    <input type="text" id="id" maxlength="20" name="id" placeholder="4자~20자 영문, 숫자 조합가능">
		                                    <span class="idCheck"></span>
	                                    </div>
	                                    <div class="overlap_btn" onclick="idCheck()">중복확인</div>
	                                    <div class="txt1">4자~20자 영문, 숫자 조합가능 (공백은 입력불가)</div>
	                                </div>
	                                <div class="info_content pw">
	                                    <div class="tit">비밀번호</div>
	                                    <input type="password" id="pw" maxlength="16" name="pw" placeholder="6~16자 영문, 숫자조합 (대소문자구분)">
	                                    <div class="txt1">6~16자 영문, 숫자조합 (대소문자구분, 공백은 입력불가)</div>
	                                </div>
	                                <div class="info_content pw_c">
	                                    <div class="tit">비밀번호 확인</div>
	                                    <input type="password" id="pw1" maxlength="16" name="pw1">
	                                </div>
	                                <div class="info_content">
	                                    <div class="tit">거주지역</div>
	                                    <select id="addr1" name="addr1">
	                                        <option value="choose">도(특별, 광역시)</option>
	                                        <option>서울</option>
                                            <option>인천</option>
                                            <option>대전</option>
                                            <option>대구</option>
                                            <option>광주</option>
                                            <option>울산</option>
                                            <option>부산</option>
                                            <option>세종</option>
                                            <option>경기</option>
                                            <option>강원</option>
                                            <option>충북</option>
                                            <option>충남</option>
                                            <option>경북</option>
                                            <option>경남</option>
                                            <option>전북</option>
                                            <option>전남</option>
                                            <option>제주</option>
	                                    </select>
	                                    <select id="addr2" name="addr2">
	                                        <option value="choose">시(군,구)</option>
	                                    </select>
	                                </div>
	                                <div class="info_content">
	                                    <div class="tit">주소</div>
	                                    <input type="text" id="addr3" placeholder="대치동" maxlength="10" name="addr3">
	                                </div>
	                                <div class="info_content m1">
	                                    <div class="tit">휴대폰</div>
	                                    <c:choose>
	                                    	<c:when test="${phoneNo.length() > 0 }">
			                                    <select id="phone1" name="phone1" disabled="disabled">
			                                        <option value="choose">선택</option>
			                                        <option value="010" ${phoneNo.substring(0, 3)=='010' ? 'selected' : '' }>010</option>
			                                        <option value="011" ${phoneNo.substring(0, 3)=='011' ? 'selected' : '' }>011</option>
			                                        <option value="016" ${phoneNo.substring(0, 3)=='016' ? 'selected' : '' }>016</option>
			                                        <option value="017" ${phoneNo.substring(0, 3)=='017' ? 'selected' : '' }>017</option>
			                                        <option value="018" ${phoneNo.substring(0, 3)=='018' ? 'selected' : '' }>018</option>
			                                        <option value="019" ${phoneNo.substring(0, 3)=='019' ? 'selected' : '' }>019</option>
			                                    </select>
	                                    	</c:when>
	                                    	<c:otherwise>
			                                    <select id="phone1" name="phone1">
			                                        <option value="choose">선택</option>
			                                        <option value="010">010</option>
			                                        <option value="011">011</option>
			                                        <option value="016">016</option>
			                                        <option value="017">017</option>
			                                        <option value="018">018</option>
			                                        <option value="019">019</option>
			                                    </select>
	                                    	</c:otherwise>
	                                    </c:choose>
	                                    <div class="txt2">ㅡ</div>
	                                    <c:choose>
	                                    	<c:when test="${phoneNo.length() > 0 }">
			                                    <input type="text" id="phone2" maxlength="4" name="phone2" value="${phoneNo.substring(3, 7) }" disabled="disabled">
	                                    	</c:when>
	                                    	<c:otherwise>
			                                    <input type="text" id="phone2" maxlength="4" name="phone2">
	                                    	</c:otherwise>
	                                    </c:choose>
	                                    <div class="txt2">ㅡ</div>
	                                    <c:choose>
	                                    	<c:when test="${phoneNo.length() > 0 }">
			                                    <input type="text" id="phone3" maxlength="4" name="phone3" value="${phoneNo.substring(7) }" disabled="disabled">
	                                    	</c:when>
	                                    	<c:otherwise>
			                                    <input type="text" id="phone3" maxlength="4" name="phone3">
	                                    	</c:otherwise>
	                                    </c:choose>
	                                </div>
	                                <div class="info_content m2">
	                                    <div class="tit">E-mail</div>
	                                    <input type="text" id="email1" name="email2">
	                                    <div class="txt3">@</div>
	                                    <select id="emailSelect">
	                                        <option value="choose">직접입력</option>
	                                        <option value="naver.com">네이버</option>
	                                        <option value="google.com">구글</option>
	                                        <option value="daum.net">다음</option>
	                                        <option value="nate.com">네이트</option>
	                                        <option value="hotmail.com">핫메일</option>
	                                    </select>
	                                    <input type="text" id="email2" name="email2">
	                                </div>
	                                <div class="info_content">
	                                    <div class="tit">정보수신여부</div>
	                                    <div class="info_radio_wrap">
	                                        <div class="radio_txt">마케팅 수신 동의여부</div>
	                                        <div class="radio_wrap">
	                                            <div class="radio_tit">SMS</div>
	                                            <div class="radio_c">
                                                    <input type="radio" value="yes" name="agreeSms" id="agreeSmsY">
	                                                <div class="txt">
                                                       <label for="agreeSmsY">예</label>
                                                    </div>
                                                </div>
	                                            <div class="radio_c">
                                                    <input type="radio" value="no" name="agreeSms" id="agreeSmsN">
                                                    <div class="txt">
                                                       <label for="agreeSmsN">아니오</label>
                                                    </div>
                                                </div>
	                                        </div>
	                                        <div class="radio_wrap">
	                                            <div class="radio_tit">MAIL</div>
	                                            <div class="radio_c">
                                                    <input type="radio" value="yes" name="agreeEmail" id="agreeEmailY">
                                                    <div class="txt">
                                                        <label for="agreeEmailY">예</label>
                                                    </div>
                                                </div>
	                                            <div class="radio_c">
                                                    <input type="radio" value="no" name="agreeEmail" id="agreeEmailN">
                                                    <div class="txt">
                                                        <label for="agreeEmailN">아니오</label>
                                                    </div>
                                                </div>
	                                        </div>
	                                    </div>
	                                </div>
	                            </div>
	                        </div>
	                        <div class="info_write_wrap info_write_wrap1">
	                            <div class="info_write_tit">
	                                <div class="tit">판매자등록</div>
	                                <div class="line"></div>
	                            </div>
	                            <div class="info_write_contents">
	                                <div class="info_content wr">
	                                    <div class="info_radio_wrap">
	                                        <div class="radio_wrap">
	                                            <div class="radio_tit">판매자 등록을 하시겠습니까?</div>
	                                            <div class="radio_c">
                                                    <input type="radio" value="yes" name="sales" id="salesY">
                                                    <div class="txt">
                                                        <label for="salesY">예</label>
                                                    </div>
                                                </div>
	                                            <div class="radio_c">
                                                    <input type="radio" value="no" name="sales" id="salesN" checked="checked">
                                                    <div class="txt">
                                                        <label for="salesN">아니오</label>
                                                    </div>
                                                </div>
	                                        </div>
	                                    </div>
	                                </div>
	                                <div class="info_content">
	                                    <div class="tit">고등학교</div>
	                                    <select class="hschool_select" id="hschoolAddr" name="hschoolAddr">
	                                        <option value="choose">지역</option>
	                                        <option>서울</option>
                                            <option>인천</option>
                                            <option>대전</option>
                                            <option>대구</option>
                                            <option>광주</option>
                                            <option>울산</option>
                                            <option>부산</option>
                                            <option>세종</option>
                                            <option>경기</option>
                                            <option>강원</option>
                                            <option>충북</option>
                                            <option>충남</option>
                                            <option>경북</option>
                                            <option>경남</option>
                                            <option>전북</option>
                                            <option>전남</option>
                                            <option>제주</option>
	                                    </select>
	                                    <input class="hschool_input" type="text" placeholder="학교이름" id="hschool" name="hschool">
	                                </div>
	                                <div class="info_content bank">
	                                    <div class="tit">은행</div>
	                                    <input type="text" placeholder="은행명을 입력해주세요." id="bank" name="bank"/>
	                                </div>
	                                <div class="info_content ac">
	                                    <div class="tit">계좌번호</div>
	                                    <div class="input_wrap">
		                                    <input type="text" class="account" placeholder="숫자만 입력해주세요." id="account" name="account">
		                                    <span class="accountCheck"></span>
	                                    </div>
	                                    <div class="txt1">( 본인 명의의 계좌만 등록 가능합니다. )</div>
	                                </div>
	                                <div class="info_content">
	                                    <div class="tit">합격증 or <br> 재학증명서<br>(학생증)</div>
	                                    <div class="input_wrap1">
		                                    <input class="upload_name" value="파일선택" disabled="disabled" id="fileName">
	                                        <label for="passData">파일첨부</label>
	                                        <input type="file" id="passData" class="upload_hidden" name="passData" onchange="showImg(this)">
	                                    </div>
	                                </div>
	                                <div class="info_write_wrap1_txt">
                                        <div class="info_txt">
                                            <div class="num">
                                                ※ 1.
                                            </div>
                                            <div class="txt">
                                                '구매자'는 판매자등록의 '아니오'를 선택한 후 가입버튼을 누르면 회원가입이 완료됩니다.
                                            </div>
                                        </div>
                                        <div class="info_txt">
                                            <div class="num">
                                                ※ 2.
                                            </div>
                                            <div class="txt">
                                                '판매자'는 판매자등록의 '예'를 선택한 후 판매자정보를 입력 후 가입버튼을 누르면 회원가입 및 판매자등록이 완료됩니다.
                                            </div>
                                        </div>
                                        <div class="info_txt">
                                            <div class="num">
                                                ※ 3.
                                            </div>
                                            <div class="txt">
                                                '판매자'는 회원가입 후 로그인하여 학생부, 자소서, 면접후기, 수능성적의 자료를 올려주세요.
                                            </div>
                                        </div>
                                        <div class="info_txt m1">
                                            <div class="txt">
                                                ( - 올린 저작물을 확인 후 판매자인증이 완료되면, 판매자인증이 완료된 저작물만 화면에 게시, 판매됩니다. )
                                            </div>
                                        </div>
                                        <div class="info_txt m1">
                                            <div class="txt">
                                                ( - 판매자인증은 최대 2일이 소요됩니다. )
                                            </div>
                                        </div>
                                        <div class="info_txt">
                                            <div class="num">
                                                ※ 4.
                                            </div>
                                            <div class="txt">
												당월 1일~31일 까지 판매한 수입은 익월 10일에 일괄 입금됩니다.
                                            </div>
                                        </div>
                                        <div class="info_txt m1">
                                            <div class="txt">
                                                ( - 메인에 공지된 포인트 만큼 적립됩니다. )
                                            </div>
                                        </div>
	                                </div>
	                            </div>
	                        </div>
	                    </form>
                        <div class="btn_wrap m1">
                            <div class="btn left" onclick="history.back()">
                                <div class="txt">취소</div>
                            </div>
                            <div class="btn right" onclick="join()">
                                <div class="txt">가입</div>
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
 		// 아이디, 비번 등 특정문자 입력 방지
 		$(document).ready(function(){
 			$("input[id=id]").keyup(function(event){ 
 				if (!(event.keyCode >=37 && event.keyCode<=40)) {
 					var inputVal = $(this).val();
 					$(this).val(inputVal.replace(/[^a-z0-9]/gi,''));
 				}
 			});
 			$("input[id=email1]").keyup(function(event){ 
 				if (!(event.keyCode >=37 && event.keyCode<=40)) {
 					var inputVal = $(this).val();
 					$(this).val(inputVal.replace(/[^a-z0-9_-]/gi,''));
 				}
 			});
 			$("input[id=email2]").keyup(function(event){ 
 				if (!(event.keyCode >=37 && event.keyCode<=40)) {
 					var inputVal = $(this).val();
 					$(this).val(inputVal.replace(/[^a-z0-9.]/gi,''));
 				}
 			});
 			$("input[id=pw]").keyup(function(event){ 
 				if (!(event.keyCode >=37 && event.keyCode<=40)) {
 					var inputVal = $(this).val();
 					$(this).val(inputVal.replace(/[^a-zA-Z0-9]/gi,''));
 				}
 			});
 			$("input[id=pw1]").keyup(function(event){ 
 				if (!(event.keyCode >=37 && event.keyCode<=40)) {
 					var inputVal = $(this).val();
 					$(this).val(inputVal.replace(/[^a-zA-Z0-9]/gi,''));
 				}
 			});
 			$("input[id=phone2]").keyup(function(event){ 
 				if (!(event.keyCode >=48 && event.keyCode<=57)) {
 					var inputVal = $(this).val();
 					$(this).val(inputVal.replace(/[^0-9]/gi,''));
 				}
 			});
 			$("input[id=phone3]").keyup(function(event){ 
 				if (!(event.keyCode >=48 && event.keyCode<=57)) {
 					var inputVal = $(this).val();
 					$(this).val(inputVal.replace(/[^0-9]/gi,''));
 				}
 			});
 			$("input[id=account]").keyup(function(event){ 
 				if (!(event.keyCode >=37 && event.keyCode<=40)) {
 					var inputVal = $(this).val();
 					$(this).val(inputVal.replace(/[^0-9]/gi,''));
 				}
 			});
 		});
 		// 아이디 중복체크
    	var idCheck_ = 0;
    	function idCheck(){
    		var id = $("#id").val();
    		if(id==""){
    			alert("아이디를 입력해주세요.");
    		} else if(id.length<4){
    			alert("아이디는 4~20자로 설정해주세요.");
    		} else {
    			$.ajax({
    				type : "post",
    				url : "/member/idCheck/"+id,
    				async : false,
    				success : function(txt){
    					if(txt){
    						$(".idCheck").css("color", "green");
    						$(".idCheck").html("사용가능");
    						$(".idCheck").css("display", "block");
    						idCheck_ ++;
    					} else {
    						$(".idCheck").css("color", "red");
    						$(".idCheck").html("사용불가");
    						$(".idCheck").css("display", "block");
    						idCheck_ = 0;
    					}
    					$(".idCheck").css("font-size", "12px");
    					$(".idCheck").css("position", "absolute");
    					$(".idCheck").css("top", "7px");
    					$(".idCheck").css("right", "15px");
    				}
    			});
    		}
    	}
    	// 아이디 입력시 아이디 중복체크 다시하게 유도
    	$("#id").keydown(function(){
    		idCheck_ = 0;
    		$(".idCheck").hide();
    	});
    	// 비밀번호 체크
    	function pwCheck(pw, pw1){
    		var n = 3;
    		if(pw.length < 6){
    			return 1;
    		} else if(pw != pw1){
    			return 2;
    		} else {
    			for(var i=0; i<10; i++){
					if(pw.indexOf(i)>0)
						n++;
				}
    			console.log(n);
    			return n;
    		}
    	}
    	// 가입
    	function join(){
    		var birth = "${birthDay }";
    		var id = $("#id").val();
    		var name = $("#name").html();
    		var pw = $("#pw").val();
    		var pw1 = $("#pw1").val();
    		var pwCh = pwCheck(pw, pw1);
    		var addr1 = $("#addr1").val();
    		var addr2 = $("#addr2").val();
    		var addr3 = $("#addr3").val();
    		var addr = addr1+" "+addr2+" "+addr3;
    		var phone1 = $("#phone1").val();
    		var phone2 = $("#phone2").val();
    		var phone3 = $("#phone3").val();
    		var phone = phone1+"-"+phone2+"-"+phone3;
    		var email1 = $("#email1").val();
    		var email2 = $("#email2").val();
    		var email = email1+"@"+email2;
    		var agSms = $("#agreeSmsY").prop("checked") ? "y" : $("#agreeSmsN").prop("checked") ? "n" : false;
    		var agEmail = $("#agreeEmailY").prop("checked") ? "y" : $("#agreeEmailN").prop("checked") ? "n" : false;
    		var sales = $("#salesY").prop("checked") ? "y" : $("#salesN").prop("checked") ? "n" : false;
    		if(id == "" || pw == "" || pw1 == "" || addr1 == "choose" || addr2 == "choose" || addr3 == "" || phone1 == "choose" ||
    				phone2 == "" || phone3 == "" || email1 == "" || email2 == ""){
    			alert("입력하지 않은 항목이 있습니다.");
    		} else if(!agSms || !agEmail){
    			alert("정보수신여부를 선택해주세요.");
    		} else if(!sales){
    			alert("판매자 등록여부를 선택해주세요.");
    		} else {
    			if(idCheck_==0){
    				alert("아이디 중복체크를 해주세요.");
    			} else if(pwCh == 1){
    				alert("비밀번호는 6~16자로 설정해주세요.");
    			} else if(pwCh == 2){
    				alert("비밀번호와 확인이 일치하지 않습니다.");
    			} else if(pwCh == 3){
    				alert("비밀번호는 1자이상의 숫자를 포함해야합니다.");
    			} else {
    				if(sales == 'y'){
    					var hschoolAddr = $("#hschoolAddr").val();
    					var hschool = $("#hschool").val();
    					var bank = $("#bank").val();
    					var account = $("#account").val();
    					var passData = $("#passData").val();
    					if(hschoolAddr == "choose" || hschool == "" || bank == "choose" || account == ""){
    						alert("판매자 정보를 입력해주세요.");
    						return;
    					}
    					$("#joinForm").ajaxForm({
    		    			url : "/member/join4",
    		    			enctype : "multipart/form-data",
    		    			success : function(txt){
    		    				console.log(txt);
    		    				if(txt == 0 || txt == 1){
    		    					join2(id, name, pw, addr1, addr2, addr3, phone1, phone2, phone3, agSms, agEmail, sales, email1, email2, birth);
    		    				} else {
    		    					alert("판매자등록에 실패하였습니다.\n잠시후 다시 시도해주세요.");
    		    				}
    		    			}
    		    		});
    		    		$("#joinForm").submit();
    				} else {
	    				$.ajax({
	    					type : "post",
	    					url : "/member/join3/"+id+"/"+name+"/"+pw+"/"+addr1+"/"+addr2+"/"+addr3+"/"+phone1+"/"+phone2+"/"
	    							+phone3+"/"+agSms+"/"+agEmail+"/"+sales+"/"+birth+"?email1="+email1+"&email2="+email2,
	    					async : false,
	    					success : function(txt){
	    						if(txt){
	    							$("#joinPopup1").show();
	    				    		$("#joinPopup2").show();
	    				    		$("#popupId").html(name);
	    				    		$("body").css("overflow", "hidden");
	    						} else {
	    							alert("회원가입에 실패하였습니다.\n잠시후 다시 시도해주세요.");
	    						}
	    					}
	    				});
    				}
    			}
    		}
    	}
    	// 판매자등록 후 회원가입
    	function join2(id, name, pw, addr1, addr2, addr3, phone1, phone2, phone3, agSms, agEmail, sales, email1, email2, birth){
    		$.ajax({
				type : "post",
				url : "/member/join3/"+id+"/"+name+"/"+pw+"/"+addr1+"/"+addr2+"/"+addr3+"/"+phone1+"/"+phone2+"/"
						+phone3+"/"+agSms+"/"+agEmail+"/"+sales+"/"+birth+"?email1="+email1+"&email2="+email2,
				async : false,
				success : function(txt){
					if(txt){
						$("#joinPopup1").show();
			    		$("#joinPopup2").show();
			    		$("#popupId").html(name);
			    		$("body").css("overflow", "hidden");
					} else {
						alert("판매자등록 후 회원가입에 실패하였습니다.\n잠시후 다시 시도해주세요.");
					}
				}
			});
    	}
    	// 이메일 선택
    	$("#emailSelect").change(function(){
    		var email_ = $("#emailSelect").val();
    		if(email_=="choose"){
    			$("#email2").val("");
    			$("#email2").focus();
    			$("#email2").prop("readonly", false);
    		} else {
    			$("#email2").val(email_);
    			$("#email2").prop("readonly", true);
    		}
    	});
    	// 지역 선택
		$("#addr1").change(function(){
			var addr = $("#addr1").val();
			$.ajax({
				type : "post",
				url : "/member/addr/"+addr,
				async : false,
				success : function(txt){
					$("#addr2").html(txt);
				}
			});
		});
		// 파일 선택시 이미지 미리보기
 		function showImg(input) {
	 		var id = input.id;
	 		var name = input.value;
	 		var fileName = name.substring(name.lastIndexOf('\\')+1);
	 		name = name.substring(name.indexOf('.')+1).toLowerCase();
	 		if(name != "jpg" && name != "png" && name != "gif" && name != "jpeg"){
	 			alert(".jpg / .jpeg / .png / .gif 파일만 등록가능합니다.");
	 		} else {
	 			$("#fileName").val(fileName);
	 		}
 		}
    </script>
    
</html>