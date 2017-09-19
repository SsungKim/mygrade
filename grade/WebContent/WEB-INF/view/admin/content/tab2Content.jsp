<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<div class="input_container">
	<div class="input_wrap">
		<div class="tit">총 금액</div>
		<div class="cash">${price }</div>
		<div class="txt">원</div>
	</div>
</div>
<div class="tab_tit">
	<div class="tit">
		<div class="img">
			<img src="/img/admin/dot.png">
		</div>
		<div class="txt">충전 리스트</div>
	</div>
	<div class="month">
		<img src="/img/admin/month.png">
	</div>
	<div class="excel">
		<img src="/img/admin/excel.png" onclick="tab2Excel()">
	</div>
</div>
<div class="tab_contents">
	<div class="tab_inner">
		<div class="tab_header">
			<div class="content num">번호</div>
			<div class="content c1">날짜</div>
			<div class="content c2">아이디</div>
			<div class="content c3">금액</div>
			<div class="content c3">결제수단</div>
		</div>
		<c:forEach var="t" items="${chargeList }">
			<div class="tab_content">
				<div class="content num">${t.auto }</div>
				<div class="content c1">${t.day }</div>
				<div class="content c2">${t.id }</div>
				<div class="content c3">${t.pay }원</div>
				<div class="content c3">${t.applyNum == '-' ? '휴대폰' : '신용카드' }</div>
			</div>
		</c:forEach>
	</div>
</div>