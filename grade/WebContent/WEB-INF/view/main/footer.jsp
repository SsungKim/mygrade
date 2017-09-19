<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<div class="footer_inner">
	<div class="footer_logo">
		<img src="/img/footer_logo.png">
	</div>
	<div class="footer_info_wrap">
		<ul class="footer_gnb_wrap">
			<li>
				<div class="txt pdl0">
					<span onclick="alert('열람기간이 완료되었습니다.\n고2(예비고3) 학생들을 위한 오픈시기는 2017년 11월 1일입니다.\n(시기는 변동될 수 있습니다.)')">학생부</span>
<!-- 					<span onclick="location.href='/record'">학생부</span> -->
				</div>
				<div class="boundry"></div>
			</li>
			<li>
				<div class="txt">
					<span onclick="alert('열람기간이 완료되었습니다.\n고2(예비고3) 학생들을 위한 오픈시기는 2017년 12월 1일입니다.\n(시기는 변동될 수 있습니다.)')">자소서</span>
<!-- 					<span onclick="location.href='/intro'">자소서</span> -->
				</div>
				<div class="boundry"></div>
			</li>
			<li>
				<div class="txt">
					<span onclick="location.href='/interview'">면접후기</span>
				</div>
				<div class="boundry"></div>
			</li>
			<li>
				<div class="txt">
					<span onclick="alert('고2(예비고3) 학생들을 위한 오픈시기는 2017년 11월 16일입니다.\n(시기는 변동될 수 있습니다.)')">정시수능성적</span>
<!-- 					<span onclick="location.href='/exam'">정시수능성적</span> -->
				</div>
				<div class="boundry"></div>
			</li>
			<li>
				<div class="txt">
					<span onclick="rank()">전국등수확인</span>
				</div>
				<div class="boundry"></div>
			</li>
			<li>
				<div class="txt pdr0">
					<span onclick="location.href='/notice'">게시판</span>
				</div>
			</li>
		</ul>
		<ul class="footer_txt_wrap">
			<li>
				<div class="txt pdl0">
					<span>상호 : 티에스그룹</span>
				</div>
				<div class="boundry"></div>
			</li>
			<li>
				<div class="txt">
					<span>주소 : 서울시 강남구 도곡로 444 5F </span>
				</div>
				<div class="boundry"></div>
			</li>
			<li>
				<div class="txt">
					<span>사업자번호 : 539-16-00362</span>
				</div>
			</li>
			<li>
				<div class="txt pdl0">
					<span>대표자명 : 이혁진</span>
				</div>
				<div class="boundry"></div>
			</li>
			<li>
				<div class="txt">
					<span>유선번호 : 02-6188-0619</span>
				</div>
			</li>
		</ul>
	</div>
</div>

<script>
//전국등수 확인하기
function rank(){
	if(${login == null}){
		alert("로그인 후 이용할 수 있습니다.");
		location.href="/member/login";
	} else {
		location.href="/rank/${login.auto }";
	}
}
</script>