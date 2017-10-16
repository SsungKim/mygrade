<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!doctype html>
<html>
    <head>
    	<c:import url="/WEB-INF/view/main/head.jsp"/>
    </head>
     
    <body>
    	<div class="popup_cover" id="passPopup1"></div>
    	<div class="charging_popup_wrap" id="chargePopup">
            <div class="popup_inner">
                <div class="popup_tit">
                    <div class="txt">포인트 충전</div>
                    <div class="img">
                        <img src="/img/myinfo/close01.png" onclick="$('#passPopup1').hide(), $('#chargePopup').hide(), $('body').css('overflow', 'auto')">
                    </div>
                </div>
                <div class="popup_contents">
                    <div class="present_point">
                        <div class="tit">현재 나의 포인트</div>
                        <div class="point">
                            <div class="txt">${login.point }</div>
                            <div class="img">
                                <img src="/img/myinfo/point.png">
                            </div>
                        </div>
                    </div>
                    <div class="radio_wrap">
                        <div class="inner">
                            <div class="tit">충전포인트</div>
                            <div class="radio">
                                <input type="radio" id="point1" name="charging">
                                <label for="point1">1만원</label>
                            </div>
                            <div class="radio">
                                <input type="radio" id="point2" name="charging">
                                <label for="point2">3만원</label>
                            </div>
                            <div class="radio">
                                <input type="radio" id="point3" name="charging">
                                <label for="point3">5만원</label>
                            </div>
                            <div class="radio">
                                <input type="radio" id="point4" name="charging">
                                <label for="point4">7만원</label>
                            </div>
                            <div class="radio">
                                <input type="radio" id="point5" name="charging">
                                <label for="point5">10만원</label>
                            </div>
                        </div>
                    </div>
                    <div class="radio_wrap radio_wrap1">
                        <div class="inner">
                            <div class="tit">결제수단</div>
                            <div class="radio">
                                <input type="radio" id="payment1" name="payment">
                                <label for="payment1">신용카드</label>
                            </div>
                            <div class="radio">
                                <input type="radio" id="payment2" name="payment">
                                <label for="payment2">핸드폰 소액결제</label>
                            </div>
                        </div>
                    </div>
                    <div class="tab_wrap">
                        <div class="tab_inner">
                            <div class="tab_tit_wrap">
                                <div class="tab_tit sel">이용안내
                                </div>
                                <div class="tab_tit">유의사항 및 환불정책</div>
                            </div>
                            <div class="tab_contents">
                                <div class="contents_tit">포인트 이용안내</div>
                                <div class="contents_txt">
                                    <div class="txt_tit">1) 학생부 전체 열람 하기</div>
                                    <div class="txt">
                                        학생부: 한 건당 40포인트<br>
                                        학생부 한 건 당 40포인트 입니다.<br>
                                        예를 들어 2개의 학생부 전체 보기를 원하면 80포인트가 필요합니다. <br>
                                        (합격, 불합격 학생부 모두 동일 합니다.)

                                    </div>
                                    <div class="txt">
                                        학생부(합격인증마크): 한 건당 60포인트<br>
                                        학생부(합격인증마크) 한 건 당 60포인트 입니다.<br>
                                        예를 들어 2개의 학생부(합격인증마크) 전체 보기를 원하면 120포인트가 필요합니다.<br>
                                        (학생부 합격인증마크는 합격증명서를 제출 하여 합격이 확인된 경우입니다.) 
                                    </div>
                                </div>
                                <div class="contents_txt">
                                    <div class="txt_tit">2) 자소서 전체 열람 하기</div>
                                    <div class="txt">
                                        자소서: 한 건당 40포인트<br>
                                        자소서 한 건 당 40포인트 입니다.<br>
                                        예를 들어 2개의 자소서 전체 보기를 원하면 80포인트가 필요합니다
                                    </div>
                                    <div class="txt">
                                        자소서(합격인증마크): 한 건당 60포인트<br>
                                        자소서(합격인증마크) 한 건 당 60포인트 입니다.<br>
                                        예를 들어 2개의 자소서(합격인증마크) 전체 보기를 원하면 120포인트가 필요합니다.<br>
                                        (학생부 합격인증마크는 합격증명서를 제출 하여 합격이 확인된 경우입니다.) 

                                    </div>
                                </div>
                                <div class="contents_txt">
                                    <div class="txt_tit">3) 면접 후기 전체 열람 하기</div>
                                    <div class="txt">
                                        면접후기: 한 건당 30포인트<br>
                                        면접 후기 한 건당 30포인트 입니다.<br>
                                        예를 들어 2개의 면접 후기 전체 보기를 원하면 60포인트가 필요합니다.
                                    </div>
                                    <div class="txt">
                                        면접후기(합격인증마크): 한 건당 50포인트<br>
                                        면접후기(합격인증마크) 한 건 당 50포인트 입니다.<br>
                                        예를들어 2개의 면접 후기(합격인증마크) 전체 보기를 원하면 100포인트가 필요합니다.
                                    </div>
                                </div>
                                <div class="contents_txt">
                                    <div class="txt_tit">4) 정시 합격 점수 보기 </div>
                                    <div class="txt">
                                        수능점수보기: 한 건당 10포인트<br>
                                        정시로 합격한 학생의 수능 점수 보기는 한 건당 10포인트 입니다.<br>
                                        예를 들어 5개의 정시 합격 점수를 보기를 원하면 50포인트가 필요합니다. 
                                    </div>
                                    <div class="txt">
                                        수능점수(합격인증) 보기: 한 건당 15포인트<br>
                                        정시로 합격한 학생의 수능 점수(합격인증) 보기는 한 건당 15포인트 입니다.<br>
                                        예를 들어 5개의 정시 합격 점수를 보기를 원하면 75포인트가 필요합니다.

                                    </div>
                                </div>
                                <div class="contents_tit">이용기간 안내</div>
                                <div class="contents_txt">
                                    <div class="txt">
                                        포인트 결제 시 결제일로부터 15일간 열람 가능합니다.<br>
                                        건당 포인트는 변경될 수 있습니다. 
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="charging_btn"onclick="charge()">충전하기</div>
                </div>
            </div>
        </div>
		<div class="password_popup_wrap" id="passPopup2">
		    <div class="popup_inner">
		        <div class="popup_tit">
		            <div class="img">
		                <img src="/img/myinfo/password.png">
		            </div>
		            <div class="tit">비밀번호 변경</div>
		        </div>
		        <div class="password_input_wrap">
		            <input type="password" placeholder="현재 비밀번호" id="nowPassword" maxlength="16">
		            <input type="password" placeholder="새 비밀번호" id="newPassword1" maxlength="16">
		            <input type="password" placeholder="새 비밀번호 확인" id="newPassword2" maxlength="16">
		        </div>
		        <div class="btn_wrap m1">
		            <div class="btn left" onclick="$('#passPopup1').hide(), $('#passPopup2').hide(), $('body').css('overflow', 'auto')">
		                <div class="txt">취소</div>
		            </div>
		            <div class="btn right" onclick="passChange()">
		                <div class="txt">변경</div>
		            </div>
		        </div>
		    </div>
		</div>
        <div id="wrapper">
            <div class="myinfo">
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
                    <section class="section01">
                        <div class="info_wrap profile_wrap">
                            <div class="inner">
                                <div class="info_tit">
                                    <div class="it_wrap">
                                        <div class="dot"></div>
                                        <div class="img">
                                            <img src="/img/myinfo/item01.png">
                                        </div>
                                        <div class="tit">나의 프로필</div>
                                    </div>
                                </div>
                                <div class="info_list">
                                    <div class="tit">이름</div>
                                    <div class="txt">가나다</div>
                                </div>
                                <div class="info_list">
                                    <div class="tit">아이디</div>
                                    <div class="txt">${login.id }</div>
                                </div>
                                <div class="info_list">
                                    <div class="tit">비밀번호</div>
                                    <div class="btn" onclick="passwordChange()">변경하기</div>
                                </div>
                            </div>
                        </div>
                        <div class="info_wrap point_wrap">
                            <div class="inner">
                                <div class="info_tit">
                                    <div class="it_wrap">
                                        <div class="dot"></div>
                                        <div class="img">
                                            <img src="/img/myinfo/item02.png">
                                        </div>
                                        <div class="tit">나의 포인트</div>
                                    </div>    
                                </div>
                                <div class="info_list">
                                    <div class="tit">보유포인트
                                    </div>
                                    <div class="txt">
                                        <span>${login.point }</span> point
                                    </div>
                                </div>
                                <div class="btn1_wrap">
                                    <div class="btn1" onclick="chargePopup()">충전하기</div>
                                    <div class="btn1">환불하기</div>
                                </div>
                            </div>
                        </div>
                        <div class="info_wrap phone_wrap">
                            <div class="inner">
                                <div class="info_tit">
                                    <div class="it_wrap">
                                        <div class="dot"></div>
                                        <div class="img">
                                            <img src="/img/myinfo/item03.png">
                                        </div>
                                        <div class="tit">나의 연락처</div>
                                    </div>
                                </div>
                                <div class="info_list">
                                    <div class="tit">메일</div>
                                    <div class="txt" id="infoEmailTxt">${login.email1 }@${login.email2 }</div>
                                    <div class="input_wrap" id="emailInputWrap">
                                        <input class="mail_input" type="text" value="${login.email1 }" id="infoEmailInput">
                                        <div class="input_txt">@</div>
                                        <select class="mail_select" id="infoEmailSelect">
                                            <option ${login.email2 eq 'naver.com' ? 'selected' : '' }>naver.com</option>
                                            <option ${login.email2 eq 'gmail.com' ? 'selected' : '' }>gmail.com</option>
                                            <option ${login.email2 eq 'daum.net' ? 'selected' : '' }>duam.net</option>
                                            <option ${login.email2 eq 'nate.com' ? 'selected' : '' }>nate.com</option>
                                            <option ${login.email2 eq 'hotmail.com' ? 'selected' : '' }>hotmail.com</option>
                                            <option>직접입력</option>
                                        </select>
                                        <input class="input_txt2" type="text" value="${login.email2 }" id="infoEmailInput2"/>
                                    </div>
                                </div>
                                <div class="info_list">
                                    <div class="tit">휴대폰</div>
                                    <div class="txt" id="infoPhoneTxt">${login.phone1 }-${login.phone2 }-${login.phone3 }</div>
                                    <div class="input_wrap" id="phoneInputWrap">
                                        <select class="phone_select" id="infoPhoneSelect">
                                            <option ${login.phone1 eq '010' ? 'selected' : '' }>010</option>
                                            <option ${login.phone1 eq '011' ? 'selected' : '' }>011</option>
                                            <option ${login.phone1 eq '016' ? 'selected' : '' }>016</option>
                                            <option ${login.phone1 eq '017' ? 'selected' : '' }>017</option>
                                            <option ${login.phone1 eq '018' ? 'selected' : '' }>018</option>
                                            <option ${login.phone1 eq '019' ? 'selected' : '' }>019</option>
                                        </select>
                                        <div class="input_line"></div>
                                        <input class="phone_input" type="text" value="${login.phone2 }" id="infoPhoneInput1" maxlength="4">
                                        <div class="input_line"></div>
                                        <input class="phone_input" type="text" value="${login.phone3 }" id="infoPhoneInput2" maxlength="4">
                                    </div>
                                </div>
                                <div class="btn2 btn3 hidden" onclick="infoCancel()" id="cancelContact">취소</div>
                                <div class="btn2 hidden" onclick="infoSave('contact')" id="saveContact">저장</div>
                                <div class="btn2" onclick="infoModify('contact')" id="modifyContact">수정</div>
                            </div>
                        </div>
                        <div class="info_wrap region_wrap">
                            <div class="inner">
                                <div class="info_tit">
                                    <div class="it_wrap">
                                        <div class="dot"></div>
                                        <div class="img">
                                            <img src="/img/myinfo/item04.png">
                                        </div>
                                        <div class="tit">나의 지역</div>
                                    </div>
                                </div>
                                <div class="info_list">
                                    <div class="tit">지역</div>
                                    <div class="txt" id="infoAddrTxt">${login.addr1 }&nbsp;${login.addr2 }&nbsp;${login.addr3 }</div>
                                    <div class="form_wrap">
                                        <div class="sel_wrap">
                                            <select class="region_select region_select1" id="infoAddrSelect1">
                                                <option ${login.addr1 eq '서울' ? 'selected' : '' }>서울</option>
                                                <option ${login.addr1 eq '인천' ? 'selected' : '' }>인천</option>
                                                <option ${login.addr1 eq '세종' ? 'selected' : '' }>세종</option>
                                                <option ${login.addr1 eq '대전' ? 'selected' : '' }>대전</option>
                                                <option ${login.addr1 eq '대구' ? 'selected' : '' }>대구</option>
                                                <option ${login.addr1 eq '울산' ? 'selected' : '' }>울산</option>
                                                <option ${login.addr1 eq '부산' ? 'selected' : '' }>부산</option>
                                                <option ${login.addr1 eq '경기도' ? 'selected' : '' }>경기도</option>
                                                <option ${login.addr1 eq '강원도' ? 'selected' : '' }>강원도</option>
                                                <option ${login.addr1 eq '충청도' ? 'selected' : '' }>충청도</option>
                                                <option ${login.addr1 eq '전라도' ? 'selected' : '' }>전라도</option>
                                                <option ${login.addr1 eq '경상도' ? 'selected' : '' }>경상도</option>
                                                <option ${login.addr1 eq '제주도' ? 'selected' : '' }>제주도</option>
                                            </select>
                                            <select class="region_select" id="infoAddrSelect2">
                                                <option ${login.addr2 eq '강남구' ? 'selected' : '' }>강남구</option>
                                                <option ${login.addr2 eq '인천' ? 'selected' : '' }>인천</option>
                                                <option>강남구</option>
                                                <option>강남구</option>
                                            </select>
                                        </div>
                                        <div class="input_wrap">
                                            <input class="region_input" type="text" value="${login.addr3 }" id="infoAddrInput">
                                            <div class="input_txt" id="infoAddrTxt2">(동만 입력해주세요)</div>
                                        </div>
                                    </div>
                                </div>
                                <div class="btn2 btn3 hidden" onclick="infoCancel()" id="cancelAddr">취소</div>
                                <div class="btn2 hidden" onclick="infoSave('addr')" id="saveAddr">저장</div>
                                <div class="btn2" onclick="infoModify('addr')" id="modifyAddr">수정</div>
                            </div>
                        </div>
                        <div class="info_wrap info_wrap1 iwm1">
                            <div class="inner">
                                <div class="info_tit">
                                    <div class="it_wrap">
                                        <div class="dot"></div>
                                        <div class="tit">내 대학교</div>
                                    </div>
                                </div>
                                <div class="info_icon" onclick="location.href='/school'">
                                    <img src="/img/myinfo/item13_01.png">
                                </div>
                                <div class="info_txt">나의 대학교 올리기</div>
                            </div>
                        </div>
                        <div class="info_wrap info_wrap1 iwm2">
                            <div class="inner">
                                <div class="info_tit">
                                    <div class="it_wrap">
                                        <div class="dot"></div>
                                        <div class="tit">내 자료</div>
                                    </div>
                                </div>
                                <div class="info_icon" onclick="location.href='/member/myData/${login.auto }'">
                                    <img src="/img/myinfo/item06_01.png">
                                </div>
                                <div class="info_txt">내가 올린 자료 보기</div>
                            </div>
                        </div>
                        <div class="info_wrap info_wrap1 iwm1">
                            <div class="inner">
                                <div class="info_tit">
                                    <div class="it_wrap">
                                        <div class="dot"></div>
                                        <div class="tit">내 전국등수</div>
                                    </div>
                                </div>
                                <div class="info_icon" onclick="location.href='/rank/${login.auto }'">
                                    <img src="/img/myinfo/item14_01.png">
                                </div>
                                <div class="info_txt">내 전국등수 확인하기</div>
                            </div>
                        </div>
                        <div class="info_wrap info_wrap1 iwm2" id="bank01">
                            <div class="inner">
                                <div class="info_tit">
                                    <div class="it_wrap">
                                        <div class="dot"></div>
                                        <div class="tit">판매자 정보</div>
                                    </div>
                                </div>
                                <div class="info_icon" onclick="location.href='/member/sales'">
                                    <img src="/img/myinfo/item10_01.png">
                                </div>
                                <div class="info_txt">${login.bank }은행<br>
                                    <span>${login.account }</span>
                                </div>
                            </div>
                        </div>
                        <div class="info_wrap info_wrap1 iwm1">
                            <div class="inner">
                                <div class="info_tit">
                                    <div class="it_wrap">
                                        <div class="dot"></div>
                                        <div class="tit">내 구매내역</div>
                                    </div>
                                </div>
                                <div class="info_icon" onclick="location.href='/member/sales/buy'">
                                    <img src="/img/myinfo/item11_01.png">
                                </div>
                                <div class="info_txt">내가 구매한 내역 보기</div>
                            </div>
                        </div>
                        <div class="info_wrap info_wrap1 iwm2">
                            <div class="inner">
                                <div class="info_tit">
                                    <div class="it_wrap">
                                        <div class="dot"></div>
                                        <div class="tit">내 판매내역</div>
                                    </div>
                                </div>
                                <div class="info_icon" onclick="location.href='/member/sales/sell'">
                                    <img src="/img/myinfo/item12_01.png">   
                                </div>
                                <div class="info_txt">내가 판매한 내역 보기</div>
                            </div>
                        </div>
<!--                         <div class="info_wrap info_wrap1" id="bank02"> -->
<!--                             <div class="inner"> -->
<!--                                 <div class="info_tit"> -->
<!--                                     <div class="dot"></div> -->
<!--                                     <div class="tit">내 계좌관리</div> -->
<!--                                     <div class="btn2" onclick="accountSubmit()">등록</div> -->
<!--                                 </div> -->
<!--                                 <div class="bank_wrap"> -->
<!--                                     <select id="bank"> -->
<!--                                         <option value="choose">은행선택</option> -->
<!--                                         <option>국민은행</option> -->
<!--                                         <option>우리선택</option> -->
<!--                                     </select> -->
<!--                                     <input type="text" placeholder="계좌번호 숫자만 입력" id="acoount"> -->
<!--                                 </div> -->
<!--                                 <div class="confirm_btn" onclick="accountCertification()">계좌인증</div> -->
<!--                                 <div class="info_txt1">( 본인 명의의 계좌만 가능합니다.) -->
<!--                                 </div> -->
<!--                             </div> -->
<!--                         </div> -->
                        <div class="section_txt">
                            * <span onclick="location.href='/member/exit'">회원탈퇴 바로가기</span>
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
  			$("input[id=infoEmailInput]").keyup(function(event){ 
  				if (!(event.keyCode >=37 && event.keyCode<=40)) {
  					var inputVal = $(this).val();
  					$(this).val(inputVal.replace(/[^a-z0-9_-]/gi,''));
  				}
  			});
  			$("input[id=infoEmailInput2]").keyup(function(event){ 
  				if (!(event.keyCode >=37 && event.keyCode<=40)) {
  					var inputVal = $(this).val();
  					$(this).val(inputVal.replace(/[^a-z0-9.]/gi,''));
  				}
  			});
  			$("input[id=infoPwInput1]").keyup(function(event){ 
  				if (!(event.keyCode >=37 && event.keyCode<=40)) {
  					var inputVal = $(this).val();
  					$(this).val(inputVal.replace(/[^a-zA-Z0-9]/gi,''));
  				}
  			});
  			$("input[id=infoPwInput2]").keyup(function(event){ 
  				if (!(event.keyCode >=37 && event.keyCode<=40)) {
  					var inputVal = $(this).val();
  					$(this).val(inputVal.replace(/[^a-zA-Z0-9]/gi,''));
  				}
  			});
  			$("input[id=infoPhoneInput1]").keyup(function(event){ 
  				if (!(event.keyCode >=48 && event.keyCode<=57)) {
  					var inputVal = $(this).val();
  					$(this).val(inputVal.replace(/[^0-9]/gi,''));
  				}
  			});
  			$("input[id=infoPhoneInput2]").keyup(function(event){ 
  				if (!(event.keyCode >=48 && event.keyCode<=57)) {
  					var inputVal = $(this).val();
  					$(this).val(inputVal.replace(/[^0-9]/gi,''));
  				}
  			});
  			$("input[id=account]").keyup(function(event){ 
  				if (!(event.keyCode >=48 && event.keyCode<=57)) {
  					var inputVal = $(this).val();
  					$(this).val(inputVal.replace(/[^0-9]/gi,''));
  				}
  			});
  		});
    	// 정보 수정
    	function infoModify(type){
    		switch(type){
    		case "contact":
    			$("#emailInputWrap").css("display", "inline-block");
    			$("#phoneInputWrap").css("display", "inline-block");
    			$("#cancelContact").css("display", "inline-block");
    			$("#saveContact").css("display", "inline-block");
    			$("#modifyContact").hide();
    			$("#infoEmailTxt").hide();
    			$("#infoPhoneTxt").hide();
    			break;
    		case "addr":
    			$("#infoAddrSelect1").css("display", "inline-block");
    			$("#infoAddrSelect2").css("display", "inline-block");
    			$("#infoAddrInput").css("display", "inline-block");
    			$("#infoAddrTxt2").css("display", "inline-block");
    			$("#cancelAddr").css("display", "inline-block");
    			$("#saveAddr").css("display", "inline-block");
    			$("#modifyAddr").hide();
    			$("#infoAddrTxt").hide();
    			break;
    		}
    	}
    	// 정보수정 취소
    	function infoCancel(){
    		location.reload();
    	}
    	// 정보수정 저장
    	function infoSave(type){
    		if(${login == null}){
    			alert("로그인 후 이용할 수 있습니다.");
    			location.href='/member/login';
    			return;
    		}
    		var user = ${login.auto };
    		switch(type){
    		case "contact":
    			var email1 = $("#infoEmailInput").val();
    			var email2 = $("#infoEmailSelect").val();
    			var phone1 = $("#infoPhoneSelect").val();
    			var phone2 = $("#infoPhoneInput1").val();
    			var phone3 = $("#infoPhoneInput2").val();
    			$.ajax({
    				type : "post",
    				url : "/member/infoSave/"+user+"/"+email1+"/"+email2+"/"+phone1+"/"+phone2+"/"+phone3,
    				async : false,
    				success : function(txt){
    					if(txt){
    						alert("수정되었습니다.");
    					} else {
    						alert("수정에 실패하였습니다.\n잠시후 다시 시도해주세요.");
    					}
    					location.reload();
    				}
    			});
    			break;
    		case "addr":
    			var addr1 = $("#infoAddrSelect1").val();
    			var addr2 = $("#infoAddrSelect2").val();
    			var addr3 = $("#infoAddrInput").val();
    			$.ajax({
    				type : "post",
    				url : "/member/infoSave2/"+user+"/"+addr1+"/"+addr2+"/"+addr3,
    				async : false,
    				success : function(txt){
    					if(txt){
    						alert("수정되었습니다.");
    					} else {
    						alert("수정에 실패하였습니다.\n잠시후 다시 시도해주세요.");
    					}
    					location.reload();
    				}
    			});
    			break;
    		}
    	}
    	// 메일 셀렉트 변경
    	$("#infoEmailSelect").change(function(){
    		var sel = $("#infoEmailSelect").val();
    		if(sel == '직접입력'){
    			$("#infoEmailSelect").hide();
    			$("#infoEmailInput2").css("display", "inline-block");
    			$("#infoEmailInput2").focus();
    			$("#infoEmailInput2").val("");
    		}
    	});
    	// 메일 입력 삭제
    	$("#infoEmailInput2").keyup(function(){
    		var txt = $("#infoEmailInput2").val();
    		if(txt.length == 0){
    			$("#infoEmailInput2").hide();
    			$("#infoEmailSelect").css("display", "inline-block");
    		}
    	});
    	// 비밀번호 변경
    	function passwordChange(){
    		$("#passPopup1").show();
    		$("#passPopup2").show();
    		$("body").css("overflow", "hidden");
    	}
    	// 비밀번호 특정문자 입력제한
    	$(document).ready(function(){
	    	$("input[id=nowPassword]").keyup(function(event){ 
				if (!(event.keyCode >=37 && event.keyCode<=40)) {
					var inputVal = $(this).val();
					$(this).val(inputVal.replace(/[^a-zA-Z0-9~!@?]/gi,''));
				}
			});
	    	$("input[id=newPassword1]").keyup(function(event){ 
				if (!(event.keyCode >=37 && event.keyCode<=40)) {
					var inputVal = $(this).val();
					$(this).val(inputVal.replace(/[^a-zA-Z0-9]/gi,''));
				}
			});
	    	$("input[id=newPassword2]").keyup(function(event){ 
				if (!(event.keyCode >=37 && event.keyCode<=40)) {
					var inputVal = $(this).val();
					$(this).val(inputVal.replace(/[^a-zA-Z0-9]/gi,''));
				}
			});
    	});
    	// 비밀번호 변경완료
    	function passChange(){
    		if(${login == null}){
    			alert("로그인 후 이용할 수 있습니다.");
    			location.href='/member/login';
    			return;
    		}
    		var now = $("#nowPassword").val();
    		var new1 = $("#newPassword1").val();
    		var new2 = $("#newPassword2").val();
    		if(now.length == 0){
    			alert("현재 비밀번호를 입력해주세요.");
    		} else if(new1.length == 0){
    			alert("새 비밀번호를 입력해주세요.");
    		} else if(new2.length == 0){
    			alert("비밀번호 확인을 입력해주세요.");
    		} else if(now != "${login.pw }"){
    			alert("현재 비밀번호가 일치하지 않습니다.");
    		} else if(now == new1){
    			alert("새 비밀번호는 현재 비밀번호와 같을 수 없습니다.");
    		} else if(new1.length<6){
    			alert("새 비밀번호는 6~16자리로 설정해주세요.");
    		} else if(new1 != new2){
    			alert("새 비밀번호와 비밀번호 확인이 일치하지 않습니다.");
    		} else {
    			$.ajax({
    				type : "post",
    				url : "/member/passChange/${login.auto }/"+new1,
    				async : false,
    				success : function(txt){
    					if(txt){
	    					alert("변경되었습니다.\n변경된 비밀번호로 로그인 바랍니다.");
	    					location.href='/logout';
    					} else {
    						alert("변경에 실패하였습니다.\n잠시후 다시 시도해주세요.");
    						location.reload();
    					}
    				}
    			});
    		}
    	}
    	// 충전하기 팝업
    	function chargePopup(){
    		$("#passPopup1").show();
    		$("#chargePopup").show();
    		$("body").css("overflow", "hidden");
    	}
    	// 계좌인증
    	var accountNum = 0;
    	function accountCertification(){
    		var bank = $("#bank").val();
    		var account = $("#accont").val();
    		if(bank == "choose" || account == ""){
    			alert("은행과 계좌번호를 확인해주세요.");
    			return;
    		}
    		alert("계좌인증");
    		accountNum++;
    	}
    	// 계좌등록
    	function accountSubmit(){
    		var bank = $("#bank").val();
    		var account = $("#account").val();
    		if(accountNum == 0){
    			alert("계좌인증을 해주세요.");
    			return;
    		}
    		$.ajax({
    			type : "post",
    			url : "/member/account/${login.auto }/"+bank+"/"+account,
    			async : false,
    			success : function(txt){
    				if(txt){
    					alert("등록되었습니다.");
    					location.reload();
    				} else {
    					alert("등록에 실패하였습니다.\n잠시후 다시 시도해주세요.");
    				}
    			}
    		});
    	}
    	// 은행변경, 계좌변경시 재인증
    	$(document).ready(function(){
    		$("#bank").change(function(){
    			accountNum = 0;
    		});
    		$("#account").keydown(function(){
    			accountNum = 0;
    		});
    	});
    	// 충전 테스트
    	$(document).ready(function(){
    		IMP.init('imp43585031');
    	});
    	// 충전
    	function charge(){
    		var pay = $("#point1").prop("checked") ? "10000" : $("#point2").prop("checked") ? "20000" : $("#point3").prop("checked") ?
					"30000" : $("#point4").prop("checked") ? "50000" : $("#point5").prop("checked") ? "100000" : "";
			var type = $("#payment1").prop("checked") ? "card" : $("#payment2").prop("checked") ? "phone" : "";
			console.log("aa"+pay+"/"+type);
			if(pay == "" || type == ""){
				alert("충전할 금액, 방법을 선택해주세요.");
				return;
			}
	    	IMP.request_pay({
	    	    pg : 'inicis', // version 1.1.0부터 지원.
	    	    pay_method : type,
	    	    merchant_uid : 'merchant_' + new Date().getTime(),
	    	    name : '넌몇대? 포인트',
	    	    amount : pay,
	    	    buyer_email : '${login.email1 }@${login.email2 }',
	    	    buyer_name : '${login.name }',
	    	    buyer_tel : '${login.phone1 }-${login.phone2 }-${login.phon3 }',
	    	    buyer_addr : '${login.addr1 } ${login.addr2 } ${login.addr3 }',
// 	    	    buyer_postcode : '123-456',
	    	    m_redirect_url : 'https://www.yourdomain.com/payments/complete'
	    	}, function(rsp) {
	    	    if ( rsp.success ) {
	    	        var msg = '결제가 완료되었습니다.';
	    	        msg += '고유ID : ' + rsp.imp_uid;
	    	        msg += '상점 거래ID : ' + rsp.merchant_uid;
	    	        msg += '결제 금액 : ' + rsp.paid_amount;
	    	        msg += '카드 승인번호 : ' + rsp.apply_num;
	    	    } else {
	    	        var msg = '결제에 실패하였습니다.';
	    	        msg += '에러내용 : ' + rsp.error_msg;
	    	    }
	    	    alert(msg);
	    	});
    	}
    </script>
    
</html>