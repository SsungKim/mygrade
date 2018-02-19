<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<aside class="gnb_wrap">
    <ul>
        <li class="gnb">
            <div class="img">
                <img src="/img/side/item02.png">
            </div>
            <div class="txt">
<!--                 <span onclick="location.href='/record'">학생부</span> -->
                <span onclick="alert('열람기간이 완료되었습니다.\n고1, 2(예비고2, 3) 학생들을 위한 오픈시기는 2018년 1월 1일입니다.\n(시기는 변동될 수 있습니다.)')">학생부</span>
            </div>
        </li>
        <li class="gnb">
            <div class="img">
                <img src="/img/side/item01.png">
            </div>
            <div class="txt">
<!--                 <span onclick="location.href='/intro'">자소서</span> -->
                <span onclick="alert('열람기간이 완료되었습니다.\n고1, 2(예비고2, 3) 학생들을 위한 오픈시기는 2018년 1월 1일입니다.\n(시기는 변동될 수 있습니다.)')">자소서</span>
            </div>
        </li>
        <li class="gnb">
            <div class="img">
                <img src="/img/side/item03.png">
            </div>
            <div class="txt">
                <span onclick="location.href='/interview'">면접후기</span>
            </div>
        </li>
        <li class="gnb">
            <div class="img">
                <img src="/img/side/item05.png">
            </div>
            <div class="txt">
<!--                 <span onclick="location.href='/exam'">정시 수능성적</span> -->
                <span onclick="alert('고2(예비고3) 학생들을 위한 오픈시기는 2017년 11월 16일입니다.\n(시기는 변동될 수 있습니다.)')">정시 수능성적</span>
            </div>
        </li>
        <li class="gnb">
            <div class="img">
                <img src="/img/side/item07.png">
            </div>
            <div class="txt">
                <span onclick="rank()">전국 등수확인</span>
            </div>
        </li>
        <li class="gnb">
            <div class="img">
                <img src="/img/side/item06.png">
            </div>
            <div class="txt">
<!--                 <span onclick="info()">내정보</span> -->
                <span onclick="location.href='/notice'">게시판</span>
            </div>
        </li>
        <li class="gnb_close">
            <div class="img">
                <img src="/img/side/close.png">
            </div>
        </li>
    </ul>
</aside>
<aside class="gnb_wrap1">
    <ul>
		<li class="gnb_header">
            <img src="/img/side/tit.png">
        </li>
        <li class="gnb_tit">
        	<c:choose>
        		<c:when test="${login != null }">
		            <div class="login_wrap">
		                <div class="img">
		                    <img src="/img/side/header_item01.png">
		                </div>
		                <div class="txt_wrap">
		                    <div class="id txt">${login.id }</div>
		                    <div class="point txt">${login.point }P</div>
		                    <div class="logout txt" onclick="location.href='/logout'">로그아웃</div>
		                </div>
		            </div>
        		</c:when>
        		<c:otherwise>
		            <div class="logout_wrap">
		                <div class="img">
		                    <img src="/img/side/header_item02.png">
		                </div>
		                <div class="txt" onclick="location.href='/member/login'">로그인을 해주세요.</div>
		            </div>
        		</c:otherwise>
        	</c:choose>
        </li>
        <li class="gnb_close">
            <div class="img" onclick="side_close()">
                <img src="/img/side/close.png">
            </div>
        </li>
        <li class="gnb">
            <div class="img">
                <img src="/img/side/item02.png">
            </div>
<!--             <div class="txt" onclick="location.href='/record'"> -->
            <div class="txt" onclick="alert('열람기간이 완료되었습니다.\n고2(예비고3) 학생들을 위한 오픈시기는 2018년 1월 1일입니다.\n(시기는 변동될 수 있습니다.)')">
                학생부
            </div>
        </li>
        <li class="gnb">
            <div class="img">
                <img src="/img/side/item01.png">
            </div>
<!--             <div class="txt" onclick="location.href='/intro'"> -->
            <div class="txt" onclick="alert('열람기간이 완료되었습니다.\n고2(예비고3) 학생들을 위한 오픈시기는 2018년 1월 1일입니다.\n(시기는 변동될 수 있습니다.)')">
                자소서
            </div>
        </li>
        <li class="gnb">
            <div class="img">
                <img src="/img/side/item03.png">
            </div>
            <div class="txt" onclick="location.href='/interview'">
                면접후기
            </div>
        </li>
        <li class="gnb">
            <div class="img">
                <img src="/img/side/item05.png">
            </div>
<!--             <div class="txt" onclick="location.href='/exam'"> -->
            <div class="txt" onclick="alert('고2(예비고3) 학생들을 위한 오픈시기는 2017년 11월 16일입니다.\n(시기는 변동될 수 있습니다.)')">
                정시 수능성적
            </div>
        </li>
        <li class="gnb">
            <div class="img">
                <img src="/img/side/item07.png">
            </div>
            <div class="txt" onclick="rank()">
                전국 등수확인
            </div>
        </li>
        <li class="gnb">
            <div class="img">
                <img src="/img/side/item06.png">
            </div>
<!--             <div class="txt" onclick="info()"> -->
            <div class="txt" onclick="location.href='/notice'">
                게시판
            </div>
        </li>
        <li class="gnb">
            <div class="img">
                <img src="/img/side/item04.png">
            </div>
            <div class="txt" onclick="info()">
                내정보
            </div>
        </li>
    </ul>
</aside>
<script>
	// 내정보
	function info(){
		if(${login == null}){
			alert("로그인 후 이용가능합니다.");
			location.href='/member/login';
		} else {
			location.href='/member/info';
		}
	}
	// side close
	function side_close(){
		$(".gnb_wrap1").stop().animate({
			left: -250
		});
	}
	// 전국등수
	function rank(){
		if(${login == null }){
			alert("로그인 후 이용가능합니다.");
			location.href='/member/login';
		} else {
			location.href='/rank/${login.auto }';
		}
	}
</script>