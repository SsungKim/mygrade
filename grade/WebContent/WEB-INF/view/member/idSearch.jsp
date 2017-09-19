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
        	<div class="popup_cover" id="popup_cover" onclick="popupClose()"></div>
            <div class="search_popup_wrap" id="popup_idSearch">
                <div class="pop_header">
                    <div class="tit">
                        <div class="dot">
                            <img src="/img/admin/dot01.png">
                        </div>
                        <div class="txt">아이디찾기</div>
                    </div>
                    <div class="line"></div>
                </div>
                <div class="contents">
                    <div class="pop_logo">
                        <img src="/img/admin/pop_logo.png">
                    </div>
                    <div class="content">
                        <div class="content_tit">
                            <div class="tit">아이디 찾기</div>
                            <div class="line"></div>
                        </div>
                        <div class="txt">
                        	<div id="idSearch_id1">아이디는<br></div>
                            <span id="idSearch_id"></span> <div id="idSearch_id2">입니다.</div>
                        </div>
                        <div class="txt hidden" id="idSearch_noId">입력하신 정보와 일치하는 아이디가 없습니다.</div>
                    </div>
                </div>
                <div class="sv_btn_wrap">
                    <div class="sv_btn" onclick="location.href='/member/login'">
                        <img src="/img/main/btn01.png">
                    </div>
                    <div class="sv_btn" onclick="$('#popup_idSearch').hide(), $('#popup_pwSearch').show()">
                        <img src="/img/main/btn02.png">
                    </div>
                </div>
            </div>
            <div class="search_popup_wrap search_popup_wrap1" id="popup_pwSearch">
                <div class="pop_header">
                    <div class="tit">
                        <div class="dot">
                            <img src="/img/admin/dot01.png">
                        </div>
                        <div class="txt">비밀번호찾기</div>
                    </div>
                    <div class="line"></div>
                </div>
                <div class="contents">
                    <div class="pop_logo">
                        <img src="/img/admin/pop_logo.png">
                    </div>
                    <div class="content">
                        <div class="content_tit">
                            <div class="tit">비밀번호찾기</div>
                            <div class="line"></div>
                        </div>
                        <div class="input_wrap">
                            <input type="text" placeholder="아이디" id="pw_id">
                            <input type="text" placeholder="이름" id="pw_name">
                            <input type="text" placeholder="휴대폰번호" id="pw_phone">
                            <input type="text" placeholder="이메일" id="pw_email">
                        </div>
                    </div>
                </div>
                <div class="sv_btn_wrap">
                    <div class="sv_btn" onclick="pwSearch()">
                        <img src="/img/main/btn03.png">
                    </div>
                </div>
            </div>
            <div class="search">
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
                    <section class="section01">
                        <div class="section_tit">
                            <div class="txt">아이디 찾기</div>
                            <div class="b_b"></div>
                        </div>
                        <div class="section_txt">
	                            회원가입시 등록한 성함, 휴대전화 번호와 <br>
	                            입력한 성함, 휴대전화  번호가 같아야, 조회가 가능합니다.
                        </div>
                        <div class="join_input_wrap">
                            <div class="input">
                                <input type="text" id="name" placeholder="이름">
                            </div>
                            <div class="input">
                                <input type="text" id="phone" placeholder="휴대폰번호(-제외)">
                            </div>
                            <div class="input">
                                <input type="text" id="email" placeholder="이메일">
                            </div>
                        </div>
                        <div class="confirm_btn" onclick="idSearch()">확인</div>
                    </section>
                    <section class="section02">
                        <div class="section_tit">
                            <div class="txt">비밀번호 찾기</div>
                            <div class="b_b"></div>
                        </div>
                        <div class="confirm_btn confirm_btn1" onclick="pwSearchPopup()">비밀번호 찾기</div>
                    </section>
                </div>
            </div>
        </div>
    </body>
    
    <script>
	 	// 아이디 찾기
		function idSearch(){
	 		var name = $("#name").val();
	 		var phone = $("#phone").val();
	 		var email = $("#email").val();
	 		if(name == "" || phone == "" || email == ""){
	 			alert("올바른 정보를 입력해주세요.");
	 			return;
	 		}
	 		$.ajax({
	 			type : "post",
	 			url : "/member/idSearch/"+name+"/"+phone+"?email="+email,
	 			async : false,
	 			success : function(txt){
	 				if(txt){
	 					$("#idSearch_id").html('${searchId }');
	 					$("#idSearch_id1").show();
	 					$("#idSearch_id2").show();
	 					$("#idSearch_id2").hide();
	 				} else {
	 					$("#idSearch_id").hide();
	 					$("#idSearch_id1").hide();
	 					$("#idSearch_id2").hide();
	 					$("#idSearch_noId").show();
	 				}
 					$("#popup_cover").show();
 					$("#popup_idSearch").show();
 					$("body").css("overflow", "hidden");
	 			}
	 		});
		}
	 	// 비밀번호 찾기 팝업
	 	function pwSearchPopup(){
	 		$("#popup_cover").show();
	 		$("#popup_pwSearch").show();
	 		$("body").css("overflow", "hidden");
	 	}
	 	// 비밀번호 찾기
	 	function pwSearch(){
	 		var id = $("#pw_id").val();
	 		var name = $("#pw_name").val();
	 		var phone = $("#pw_phone").val();
	 		var email = $("#pw_email").val();
	 		if(id == "" || name == "" || phone == "" || email == ""){
	 			alert("올바른 정보를 입력해주세요.");
	 			return;
	 		} else {
	 			$.ajax({
	 				type : "post",
	 				url : "/member/pwSearch/"+id+"/"+name+"/"+phone+"?email="+email,
	 				async : false,
	 				success : function(txt){
	 					if(txt == 0){
	 						alert("임시 비밀번호가 전송되었습니다.\n메일을 확인해주세요.");
	 					} else if(txt == 1) {
	 						alert("임시 비밀번호 전송에 실패하였습니다.\n같은 증상이 반복된다면 관리자에게 문의해주세요.");
	 					} else if(txt == 2){
	 						alert("입력하신 정보와 일치하는 회원정보가 없습니다.");
	 					}
	 				}
	 			});
	 		}
	 	}
	 	// 팝업 닫기
	 	function popupClose(){
	 		$("#popup_cover").hide();
	 		$("#popup_idSearch").hide();
	 		$("#popup_pwSearch").hide();
	 		$("body").css("overflow", "auto");
	 	}
    </script>
    
</html>