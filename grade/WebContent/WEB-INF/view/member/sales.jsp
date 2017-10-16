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
                            <div class="tit">판매자 관리</div>
                        </div>
                    </section>
                    <section class="section01">
                        <form action="/member/join4" method="post" enctype="multipart/form-data" id="joinForm">
                        	<input type="hidden" name="id" value="${login.id }"/>
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
                                                    <input type="radio" value="yes" name="sales" id="salesY" ${login.bank != null ? 'checked' : '' }>
	                                               <div class="txt"><label for="salesY">예</label></div>
                                                </div>
	                                            <div class="radio_c">
                                                    <input type="radio" value="no" name="sales" id="salesN" ${login.bank == null ? 'chekced' : '' }>
	                                               <div class="txt"><label for="salesN">아니오</label></div>
                                                </div>
	                                        </div>
	                                    </div>
	                                </div>
	                                <div class="info_content">
	                                    <div class="tit">고등학교</div>
	                                    <select class="hschool_select" id="hschoolAddr" name="hschoolAddr">
	                                        <option value="choose">지역</option>
	                                        <option value="서울" ${login.haddr eq '서울' ? 'selected' : '' }>서울</option>
	                                        <option value="인천" ${login.haddr eq '인천' ? 'selected' : '' }>인천</option>
	                                        <option value="세종" ${login.haddr eq '세종' ? 'selected' : '' }>세종</option>
	                                        <option value="대전" ${login.haddr eq '대전' ? 'selected' : '' }>대전</option>
	                                        <option value="대구" ${login.haddr eq '대구' ? 'selected' : '' }>대구</option>
	                                        <option value="광주" ${login.haddr eq '광주' ? 'selected' : '' }>광주</option>
	                                        <option value="울산" ${login.haddr eq '울산' ? 'selected' : '' }>울산</option>
	                                        <option value="부산" ${login.haddr eq '부산' ? 'selected' : '' }>부산</option>
	                                        <option value="경기도" ${login.haddr eq '경기도' ? 'selected' : '' }>경기도</option>
	                                        <option value="강원도" ${login.haddr eq '강원도' ? 'selected' : '' }>강원도</option>
	                                        <option value="충청도" ${login.haddr eq '충청도' ? 'selected' : '' }>충청도</option>
	                                        <option value="전라도" ${login.haddr eq '전라도' ? 'selected' : '' }>전라도</option>
	                                        <option value="경상도" ${login.haddr eq '경상도' ? 'selected' : '' }>경상도</option>
	                                        <option value="제주도" ${login.haddr eq '제주도' ? 'selected' : '' }>제주도</option>
	                                    </select>
	                                    <input class="hschool_input" type="text" placeholder="학교이름" id="hschool" name="hschool" value="${login.hschool }">
	                                </div>
	                                <div class="info_content">
	                                    <div class="tit">은행</div>
	                                    <input type="text" placeholder="은행명을 입력해주세요." id="bank" name="bank" value="${login.bank }"/>
	                                </div>
	                                <div class="info_content">
	                                    <div class="tit">계좌번호</div>
	                                    <div class="input_wrap">
		                                    <input type="text" class="account" placeholder="숫자만 입력해주세요." id="account" name="account" value="${login.account }">
		                                    <span class="accountCheck"></span>
	                                    </div>
	                                    <div class="txt1">( 본인 명의의 계좌가 아닐시 정상적으로 입금되지 않습니다. )</div>
	                                </div>
	                                <div class="info_content">
	                                    <div class="tit">합격증 or <br> 재학증명서</div>
	                                    <div class="input_wrap1">
		                                    <input class="upload_name" value="파일선택" disabled="disabled" value="${login.passData }" id="fileName">
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
                                                합격증 또는 재학증명서를 스캔 한 파일이나 사진(식별가능한) 으로 업로드해주세요
                                            </div>
                                        </div>
                                        <div class="info_txt m1">
                                            <div class="txt">
                                                ( - 합격증을 첨부하실경우 현재 재학중인 학교의 합격증을 첨부해주십시오.)
                                            </div>
                                        </div>
                                        <div class="info_txt m1">
                                            <div class="txt">
                                                ( - 업로드 하지않을시 판매자등록이 되지 않을 수 있습니다.)
                                            </div>
                                        </div>
                                        <div class="info_txt">
                                            <div class="num">
                                                ※ 2.
                                            </div>
                                            <div class="txt">
                                                당월 1일~31일 까지 판매한 수입은 익월 10일에 일괄 입금됩니다.
                                            </div>
                                        </div>
                                        <div class="info_txt m1">
                                            <div class="txt">
                                                ( - 열람된 학생부, 자소서 , 면접후기의 게시자에게는 사용된 포인트의 ( 30% ) 만큼의 포인트가 적립됩니다.)
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
                            <div class="btn right" onclick="salesSubmit()">
                                <div class="txt">등록</div>
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
 			$("input[id=account]").keyup(function(event){ 
 				if (!(event.keyCode >=37 && event.keyCode<=40)) {
 					var inputVal = $(this).val();
 					$(this).val(inputVal.replace(/[^0-9]/gi,''));
 				}
 			});
 		});
 		// 판매자 등록
 		function salesSubmit(){
 			var sales = $("#salesY").prop("checked") ? "y" : $("#salesN").prop("checked") ? "n" : false;
 			var hschoolAddr = $("#hschoolAddr").val();
			var hschool = $("#hschool").val();
			var bank = $("#bank").val();
			var account = $("#account").val();
			var passData = $("#passData").val();
			if(!sales){
				alert("판매자 여부를 선택해주세요.");
				return;
			}
			if(sales == 'y'){
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
	    					alert("판매자 등록되었습니다.\n다시 로그인 해주세요.");
	    					location.href='/logout';
	    				} else {
	    					alert("판매자등록에 실패하였습니다.\n잠시후 다시 시도해주세요.");
	    				}
	    			}
	    		});
	    		$("#joinForm").submit();
			} else {
				$.ajax({
					type : "post",
					url : "/member/salesDelete/${login.id }",
					async : false,
					success : function(txt){
						if(txt){
							alert("판매자 삭제되었습니다.\n다시 로그인 해주세요.");
							location.href='/logout';
						} else {
							alert("판매자 삭제에 실패하였습니다.\n잠시후 다시 시도해주세요.");
						}
					}
				});
			}
 		}
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