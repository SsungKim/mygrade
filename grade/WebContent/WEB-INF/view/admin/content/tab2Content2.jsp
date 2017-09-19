<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<div class="tab_inner">
	<div class="tab_header">
		<div class="content num">월별</div>
		<div class="content c2">금액</div>
	</div>
	<c:forEach var="t" begin="0" end="${chargeTotal.size()-1 }">
		<div class="tab_content">
			<div class="content num">${t+1 }</div>
			<div class="content c2">${chargeTotal.get(t).pay }</div>
		</div>
	</c:forEach>
</div>