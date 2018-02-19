<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<div class="main_login_wrap">
	<c:choose>
		<c:when test="${login == null }">
			<div class="img">
				<img src="/img/login_icon.png">
			</div>
			<div class="txt" onclick="location.href='/member/login'">로그인</div>
		</c:when>
		<c:otherwise>
			<div class="img">
				<img src="/img/logout_icon.png">
			</div>
			<div class="txt" onclick="location.href='/logout'">로그아웃</div>
			<div class="txt" onclick="location.href='/member/info';">내정보</div>
			<c:if test="${login.admin == '메인관리자' || login.admin == '인증관리자' }">
				<div class="txt" onclick="location.href='/admin';">관리자</div>
			</c:if>
		</c:otherwise>
	</c:choose>
</div>