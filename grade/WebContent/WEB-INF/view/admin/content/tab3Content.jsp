<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<div class="tab_inner">
	<div class="tab_header">
		<div class="content num">번호</div>
		<div class="content c1">날짜</div>
		<div class="content c2">아이디</div>
		<div class="content c1">내역</div>
		<div class="content c3">
			<div class="top">상세내역</div>
			<div class="bottom">
				<div class="content c4 c4_1">판매자아이디</div>
				<div class="content c4 c4_2">학교</div>
				<div class="content c4 c4_3">학과</div>
			</div>
		</div>
		<div class="content c5">
			<div class="top">${p1 }P</div>
			<div class="bottom">포인트</div>
		</div>
		<div class="content c5">
			<div class="top">${p2 }P</div>
			<div class="bottom">회사분</div>
		</div>
		<div class="content c5">
			<div class="top">${p3 }P</div>
			<div class="bottom">판매자분</div>
		</div>
	</div>
	<c:forEach var="t" items="${useList }">
		<div class="tab_content">
			<div class="content num">${t.auto }</div>
			<div class="content c1">${t.day }</div>
			<div class="content c2">
				<span onclick="tab3UseView(${t.user })">${t.id }</span>
			</div>
			<div class="content c1">${t.item }</div>
			<div class="content c4 c4_1">${t.owner }</div>
			<div class="content c4 c4_2">${t.schoolName }</div>
			<div class="content c4 c4_3">${t.subject }</div>
			<div class="content c5">${t.point }P</div>
			<div class="content c5">${t.point1 }P</div>
			<div class="content c5">${t.point2 }P</div>
		</div>
	</c:forEach>
</div>