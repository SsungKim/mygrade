<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<!doctype html>
<html oncontextmenu='return false' ondragstart='return false' onselectstart='return false'>
    <head>
    	<c:import url="/WEB-INF/view/main/head.jsp"/>
    </head>
    
    <body oncontextmenu='return false' ondragstart='return false' onselectstart='return false'>
    	<c:import url="/WEB-INF/view/main/side.jsp"/>
        <div id="wrapper">
            <div class="myinfo01">
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
                    <div class="logo_boundry"></div>
                    <section class="section01">
                        <div class="section_tit">
                            <div class="tit">
								회원 탈퇴
							</div>
                            <div class="tit_line"></div>
                        </div>
                        <div class="section_txt">
                            <div class="logo">
                                <img src="/img/logo.png">
                            </div>
                            <div class="txt">
                                회원님께서 탈퇴하신다니 무척 안타깝습니다. <br>
                                그동안 불편하셨던 점이나 시정요청 사항을 알려주시면 향후 개선하도록 노력하겠습니다.
                            </div>
                        </div>
                    </section>
                    <section class="section02">
                        <div class="section_tit">
                            <div class="dot"></div>
                            <div class="txt">회원탈퇴시 아래사항을 숙지하시기 바랍니다.</div>
                        </div>
                        <div class="section_txt">
                            <div class="txt">
                                <div class="dot">
                                    ·
                                </div>
                                <div class="t">
                                    회원탈퇴 시 고객님의 정보는 '넌몇대' 개인정보보호정책에 따라 관리됩니다.
                                </div>
                            </div>
                            <div class="txt">
                                <div class="dot">
                                    ·
                                </div>
                                <div class="t">
                                    재가입 안내회원탈퇴 후 재가입 시에는 신규가입으로 처리되며, 탈퇴하신 ID 는 다시 사용하실 수 없습니다.
                                </div>
                            </div>
                        </div>
                    </section>
                    <section class="section03">
                        <div class="section_tit">
                            <div class="dot"></div>
                            <div class="txt">회원탈퇴 사유</div>
                        </div>
                        <div class="radio_wrap">
                            <div class="radio">
                                <input type="radio" name="withdrawa" id="type1">
                                <div class="txt">
									<label for="type1">서비스불만</label>
                                </div>
                            </div>
                            <div class="radio">
                                <input type="radio" name="withdrawa" id="type2">
                                <div class="txt">
									<label for="type2">고객센터 처리불만</label>
                                </div>
                            </div>
                            <div class="radio">
                                <input type="radio" name="withdrawa" id="type3">
                                <div class="txt">
									<label for="type3">개인정보 유출</label>
                                </div>
                            </div>
                            <div class="radio">
                                <input type="radio" name="withdrawa" id="type4">
                                <div class="txt">
									<label for="type4">이용빈도 낮음</label>
                                </div>
                            </div>
                            <div class="radio">
                                <input type="radio" name="withdrawa" id="type5">
                                <div class="txt">
									<label for="type5">기타 (아래에 내용을 적어주세요)</label>
                                </div>
                            </div>
                        </div>
                        <textarea placeholder="기타 (내용을 적어주세요)" id="etcTxt"></textarea>
                        <div class="password_wrap">
                            <div class="txt">비밀번호 입력</div>
                            <input type="password" maxlength="16" id="exitPw">
                        </div>
                    </section>
                    <div class="btn_wrap m1">
                        <div class="btn left" onclick="history.back()">
                            <div class="txt">취소</div>
                        </div>
                        <div class="btn right" onclick="exit()">
                            <div class="txt">탈퇴</div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </body>
    
    <script>
    	// 탈퇴
    	function exit(){
    		var exitPw = $("#exitPw").val();
    		var type = $("#type1").prop("checked") ? "서비스불만" : $("#type2").prop("checked") ? "고객센터처리불만" : $("#type3").prop("checked") ?
    				"개인정보유출" : $("#type4").prop("checked") ? "이용빈도낮음" : $("#type5").prop("checked") ? "기타" : false;
    		var txt = $("#etcTxt").val() == "" ? "-" : $("#etcTxt").val();
    		if(!type){
    			alert("사유를 선택해주세요.");
    		} else if(exitPw.length < 1){
    			alert("비밀번호를 입력해주세요.");
    		} else if(exitPw != "${login.pw}"){
    			alert("비밀번호가 일치하지 않습니다.");
    		} else {
	    		$.ajax({
		    		type : "post",
		    		url : "/member/exit2/${login.id }/"+type+"/"+txt,
		    		async : false,
		    		success : function(txt){
		    			if(txt){
		    				location.href="/member/exit3";
		    			} else {
		    				alert("탈퇴에 실패하였습니다.\n관리자에게 문의바랍니다.");
		    				location.reload();
		    			}
		    		}
	    		});
    		}
    	}
    </script>
    
</html>