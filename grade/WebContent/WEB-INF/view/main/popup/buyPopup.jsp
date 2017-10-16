<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<div class="popup_cover" id="popup_cover"></div>
<!-- purchase popup -->
<div class="point_popup_wrap" id="popup_buy">
	<div class="popup_tit">
		<div class="img">
			<img src="/img/myinfo/popup_tit01.png">
		</div>
		<div class="tit">구매하기</div>
	</div>
	<div class="popup_contents">
		<div class="input_content">
			<div class="input_wrap">
				<input type="radio" name="buy" id="buy1" onchange="buyPrice(1)">
				<label for="buy1">
					<div class="img">
						<img src="/img/myinfo/item05.png">
					</div>
					<div class="txt">학생부 구매</div>
				</label>
			</div>
			<div class="point">${certList.size() > 0 ? '60P' : '40P' }</div>
		</div>
		<div class="input_content">
			<div class="input_wrap">
				<input type="radio" name="buy" id="buy2" onchange="buyPrice(2)">
				<label for="buy2">
					<div class="img">
						<img src="/img/myinfo/item06.png">
					</div>
					<div class="txt">자소서 구매</div>
				</label>
			</div>
			<div class="point">${certList.size() > 0 ? '60P' : '40P' }</div>
		</div>
		<div class="input_content">
			<div class="input_wrap">
				<input type="radio" name="buy" id="buy3" onchange="buyPrice(3)">
				<label for="buy3">
					<div class="img">
						<img src="/img/myinfo/item07.png">
					</div>
					<div class="txt">면접후기 구매</div>
				</label>
			</div>
			<div class="point">${certList.size() > 0 ? '50P' : '30P' }</div>
		</div>
		<div class="input_content">
			<div class="input_wrap">
				<input type="radio" name="buy" id="buy4" onchange="buyPrice(4)">
				<label for="buy4">
					<div class="img">
						<img src="/img/myinfo/item15.png">
					</div>
					<div class="txt">정시성적 구매</div>
				</label>
			</div>
			<div class="point">${certList.size() > 0 ? '15P' : '10P' }</div>
		</div>
		<div class="point_txt_wrap">
			<div class="point_txt">
				<div class="tit">※</div>
				<div class="txt">
					<span>학생부, 자소서, 면접후기, 정시성적 모두 한 건당의 포인트</span> 입니다.
				</div>
			</div>
			<div class="point_txt">
				<div class="tit">※</div>
				<div class="txt">
					<span>결제일로부터 15일간 열람 가능</span> 합니다.
				</div>
			</div>
			<div class="point_txt">
				<div class="tit">※</div>
				<div class="txt">
					<span>결제 전 나에게 필요한 항목, 대학, 학과기 있는지 확인 후 결제해주세요.</span>
				</div>
			</div>
		</div>
		<div class="input_content1">
			<div class="inner">
				<div class="point_wrap">
					<div class="tit">구매 포인트</div>
					<div class="txt" id="buyPoint">-</div>
				</div>
				<div class="point_boundry"></div>
				<div class="point_wrap">
					<div class="tit">나의 포인트</div>
					<div class="txt">${login.point }P</div>
				</div>
			</div>
		</div>
		<div class="point_charge">
			<div class="img">
				<img src="/img/myinfo/item02.png">
			</div>
			<div class="txt" onclick="chargePopup()">포인트충전하기</div>
		</div>
		<div class="popup_btn_wrap">
			<div class="confirm_btn" onclick="buy()">구매하기</div>
			<div class="confirm_btn close_btn" onclick="closeBuy()">닫기</div>
		</div>
	</div>
</div>
<!-- recharge view -->
<div class="charging_popup_wrap" id="popup_charge">
	<div class="popup_tit">
		<div class="txt">포인트 충전</div>
		<div class="img">
			<img src="/img/myinfo/close01.png"
				onclick="$('#popup_cover').hide(), $('#popup_charge').hide(), $('body').css('overflow', 'auto')">
		</div>
	</div>
	<div class="popup_inner">
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
					<input type="radio" id="card" name="payment">
					<label for="card">신용카드</label>
				</div>
				<div class="radio">
					<input type="radio" id="phone" name="payment">
					<label for="phone">핸드폰 소액결제</label>
				</div>
			</div>
		</div>
		<div class="tab_wrap">
			<div class="tab_tit_wrap">
				<div class="tab_tit sel">이용안내</div>
				<div class="tab_tit">유의사항 및 환불정책</div>
			</div>
			<div class="tab_contents">
				<div class="contents_tit">포인트 이용안내</div>
				<div class="contents_tit" style="font-size: 12px;">1포인트 = 100원</div>
				<div class="contents_txt">
					<div class="txt_tit">1) 학생부 전체 열람 하기</div>
					<div class="txt">
						학생부: 한 건당 40포인트<br> 학생부 한 건 당 40포인트 입니다.<br> 예를 들어 2개의
						학생부 전체 보기를 원하면 80포인트가 필요합니다. <br> (합격, 불합격 학생부 모두 동일 합니다.) <br>
						<br> 학생부(합격인증마크): 한 건당 60포인트<br> 학생부(합격인증마크) 한 건 당
						60포인트 입니다.<br> 예를 들어 2개의 학생부(합격인증마크) 전체 보기를 원하면 120포인트가
						필요합니다.<br> (학생부 합격인증마크는 합격증명서를 제출 하여 합격이 확인된 경우입니다.) <br>
					</div>
				</div>
				<div class="contents_txt">
					<div class="txt_tit">2) 자소서 전체 열람 하기</div>
					<div class="txt">
						자소서: 한 건당 40포인트<br> 자소서 한 건 당 40포인트 입니다.<br> 예를 들어 2개의
						자소서 전체 보기를 원하면 80포인트가 필요합니다. <br> <br> 자소서(합격인증마크): 한
						건당 60포인트<br> 자소서(합격인증마크) 한 건 당 60포인트 입니다.<br> 예를 들어
						2개의 자소서(합격인증마크) 전체 보기를 원하면 120포인트가 필요합니다.<br> (학생부 합격인증마크는
						합격증명서를 제출 하여 합격이 확인된 경우입니다.) <br>
					</div>
				</div>
				<div class="contents_txt">
					<div class="txt_tit">3) 면접 후기 전체 열람 하기</div>
					<div class="txt">
						면접후기: 한 건당 30포인트<br> 면접 후기 한 건당 30포인트 입니다.<br> 예를 들어 2개의
						면접 후기 전체 보기를 원하면 60포인트가 필요합니다.<br> <br> 면접후기(합격인증마크): 한
						건당 50포인트<br> 면접후기(합격인증마크) 한 건 당 50포인트 입니다.<br> 예를들어
						2개의 면접 후기(합격인증마크) 전체 보기를 원하면 100포인트가 필요합니다.<br>
					</div>
				</div>
				<div class="contents_txt">
					<div class="txt_tit">4) 정시 합격 점수 보기</div>
					<div class="txt">
						수능점수보기: 한 건당 10포인트<br> 정시로 합격한 학생의 수능 점수 보기는 한 건당 10포인트 입니다.<br>
						예를 들어 5개의 정시 합격 점수를 보기를 원하면 50포인트가 필요합니다.<br> <br>
						수능점수(합격인증) 보기: 한 건당 15포인트<br> 정시로 합격한 학생의 수능 점수(합격인증) 보기는 한
						건당 15포인트 입니다.<br> 예를 들어 5개의 정시 합격 점수를 보기를 원하면 75포인트가 필요합니다.<br>
					</div>
				</div>
				<div class="contents_txt">
					<div class="txt_tit">5) 이용기간 안내</div>
					<div class="txt">포인트 결제 시 결제일로부터 15일간 열람 가능합니다.</div>
				</div>
			</div>
		</div>
		<div class="charging_btn" onclick="charge()">충전하기</div>
	</div>
</div>

<script>
	// 구매하기 닫기
	function closeBuy(){
		$("#popup_cover").hide();
		$("#popup_buy").hide();
		$("body").css("overflow", "auto");
	}
	// 구매항목 선택
	function buyPrice(num){
		switch(num){
		case 1:
		case 2:
			$("#buyPoint").html("${certList.size() > 0 ? '60P' : '40P' }");
			break;
		case 3:
			$("#buyPoint").html("${certList.size() > 0 ? '50P' : '30P' }");
			break;
		case 4:
			$("#buyPoint").html("${certList.size() > 0 ? '15P' : '10P' }");
			break;
		}
	}
	// 구매하기
	function buy(){
		if(${login == null}){
			alert("로그인 후 구매 가능합니다.");
			location.href="/member/login";
			return;
		}
		var item = $("#buy1").prop("checked") ? "학생부" : $("#buy2").prop("checked") ? "자소서" : $("#buy3").prop("checked") ? "면접후기" :
							$("#buy4").prop("checked") ? "정시성적" : false;
		if(!item){
			alert("구매할 항목을 선택해주세요.");
			return;
		}
		var price = false;
		switch(item){
		case "학생부":
		case "자소서":
			if(${certList.size() > 0}){
				if(${login.point >= 60 }){
					price = true;
				}
			} else {
				if(${login.point >= 40 }){
					price = true;
				}
			}
			break;
		case "면접후기":
			if(${certList.size() > 0}){
				if(${login.point >= 50 }){
					price = true;
				}
			} else {
				if(${login.point >= 30 }){
					price = true;
				}
			}
			break;
		case "정시성적":
			if(${certList.size() > 0}){
				if(${login.point >= 15 }){
					price = true;
				}
			} else {
				if(${login.point >= 10 }){
					price = true;
				}
			}
			break;
		}
		var point = $("#buyPoint").html();
		point = point.substring(0, point.indexOf('P'));
		if(price){
			$.ajax({
				type : "post",
				url : "/member/buy/"+item+"/${itemNum }/${itemUser }/${itemSchool}/${itemSubject }/"+point,
				async : false,
				success : function(txt){
					if(txt == 0){
						alert("구매하였습니다.");
						location.reload();
					} else if(txt == 1){
						alert("이미 구매한 항목입니다.");
						return;
					} else if(txt == 2){
						alert("구매에 실패하였습니다.\n잠시후 다시 시도해주세요.");
						return;
					}
				}
			});
		} else {
			alert("구매할 포인트가 부족합니다.\n충전후 구매해주세요.");
			$("#popup_buy").hide();
			$("#popup_charge").show();
			return;
		}
	}
	// 충전하기 팝업
	function chargePopup(){
		$("#popup_cover").show();
		$("#popup_charge").show();
		$("#popup_buy").hide();
	}
	// 충전하기
// 	function charge(){
// 		var pay = $("#point1").prop("checked") ? "10000" : $("#point2").prop("checked") ? "20000" : $("#point3").prop("checked") ?
// 							"30000" : $("#point4").prop("checked") ? "50000" : $("#point5").prop("checked") ? "100000" : "";
// 		var type = $("#card").prop("checked") ? "카드" : $("#phone").prop("checked") ? "핸드폰" : "";
// 		if(pay == "" || type == ""){
// 			alert("충전할 금액, 방법을 선택해주세요.");
// 			return;
// 		}
// 		$.ajax({
// 			type : "post",
// 			url : "/member/charge/${login.auto }/"+pay+"/"+type,
// 			async : false,
// 			success : function(txt){
// 				if(txt){
// 					alert("충전되었습니다.");
// 					location.reload();
// 				} else {
// 					alert("충전에 실패하였습니다.\n잠시후 다시 시도해주세요.");
// 				}
// 			}
// 		});
// 	}
	// 충전 테스트
   	$(document).ready(function(){
   		IMP.init('imp43585031');
   	});
   	// 충전
   	function charge(){
   		var pay = $("#point1").prop("checked") ? "10000" : $("#point2").prop("checked") ? "20000" : $("#point3").prop("checked") ?
				"30000" : $("#point4").prop("checked") ? "50000" : $("#point5").prop("checked") ? "100000" : "";
		var type = $("#card").prop("checked") ? "카드" : $("#phone").prop("checked") ? "핸드폰" : "";
		console.log("aa"+pay+"/"+type);
		if(pay == "" || type == ""){
			alert("충전할 금액, 방법을 선택해주세요.");
			return;
		}
    	IMP.request_pay({
    	    pg : 'danal', // version 1.1.0부터 지원.
    	    pay_method : type,
    	    merchant_uid : 'merchant_' + new Date().getTime(),
    	    name : '넌몇대 포인트',
    	    amount : pay,
    	    buyer_email : '${login.email1 }@${login.email2 }',
    	    buyer_name : '${login.name }',
    	    buyer_tel : '${login.phone1 }-${login.phone2 }-${login.phon3 }',
    	    buyer_addr : '${login.addr1 } ${login.addr2 } ${login.addr3 }',
    	    m_redirect_url : 'https://www.mygrade.co.kr/member/info'
    	}, function(rsp) {
    	    if ( rsp.success ) {
    	        if(rsp.apply_num == "")
    	        	rsp.apply_num = "-";
    	        $.ajax({
    	        	type : "post",
    	        	url : "/admin/chargeData/${login.auto }/${login.id }/"+rsp.imp_uid+"/"+rsp.merchant_uid+"/"+rsp.paid_amount+"/"+
    	        			rsp.apply_num,
    	        	async : false,
    	        	success : function(txt){
    	        		if(txt){
	    	        		alert("결제가 완료되었습니다.");
	    	        		location.reload();
    	        		} else {
    	        			alert("결제에 실패하였습니다.\n잠시후 다시 시도해주세요.");
    	        		}
    	        	}
    	        });
    	    } else {
    	        var msg = '결제에 실패하였습니다.\n';
    	        msg += rsp.error_msg;
	    	    alert(msg);
    	    }
    	});
   	}
</script>