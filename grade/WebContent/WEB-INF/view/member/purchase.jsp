<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<div class="point_popup_wrap" id="popup3">
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
			<div class="point">100P</div>
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
			<div class="point">100P</div>
		</div>
        <div class="input_content">
            <div class="input_wrap">
                <input type="radio" name="buy" id="buy4" onchange="buyPrice(4)">
                <label for="buy4">
                    <div class="img">
                        <img src="/img/myinfo/item07.png">
                    </div>
                    <div class="txt">면접후기 구매</div>
                </label>
            </div>
            <div class="point">50P</div>
        </div>
        <div class="input_content">
			<div class="input_wrap">
				<input type="radio" name="buy" id="buy3" onchange="buyPrice(3)">
				<label for="buy3">
					<div class="img">
						<img src="/img/myinfo/item15.png">
					</div>
					<div class="txt">수능성적 구매</div>
				</label>
			</div>
			<div class="point">100P</div>
		</div>
		<div class="point_txt_wrap">
			<div class="point_txt">
				<div class="tit">※</div>
				<div class="txt">
					<span>학생부, 자소서, 면접후기는 한건당의 포인트</span> 입니다
				</div>
			</div>
			<div class="point_txt">
				<div class="tit">※</div>
				<div class="txt">
					<span>결제일로부터 15일간 열람 가능</span> 합니다
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
			<!-- 						<div class="txt" onclick="$('#popup3').hide(), $('#chargePopup').show()">포인트충전하기</div> -->
			<div class="txt" onclick="alert('준비중입니다.')">포인트충전하기</div>
		</div>
		<div class="popup_btn_wrap">
			<div class="confirm_btn" onclick="buy()">구매하기</div>
			<div class="confirm_btn close_btn" onclick="closeBuy()">닫기</div>
		</div>
	</div>
</div>