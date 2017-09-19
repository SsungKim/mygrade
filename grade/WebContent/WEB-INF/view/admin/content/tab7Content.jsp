<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:forEach var="t" items="${memberList }">
	<div class="tab_content">
		<div class="content num">${t.auto }</div>
		<div class="content c1">${t.admin }</div>
		<div class="content c2">${t.id }</div>
		<div class="content c1">${t.name }</div>
		<div class="content c3">${t.birth }</div>
		<div class="content c2">${t.phone1 }-${t.phone2 }-${t.phone3 }</div>
		<div class="content c4">${t.email1 }@${t.email2 }</div>
		<div class="content c3">${t.addr1 }</div>
		<div class="content c2">${t.day }</div>
		<div class="content c3">
			<c:if test="${t.admin == '판매자' }">
				<img src="/img/admin/citem01.png" onclick="tab7Sales('${t.auto }', '${t.id }', '${t.name }')">
			</c:if>
		</div>
		<div class="content c3">
			<c:if test="${t.id != 'admin' }">
				<img src="/img/admin/citem02.png" onclick="tab7Admin('${t.auto }', '${t.id }', '${t.name }')">
			</c:if>
		</div>
		<div class="content c3">
			<c:if test="${t.id != 'admin' }">
				<img src="/img/admin/citem03.png" onclick="tab7Exit('${t.auto }', '${t.id }', '${t.name }')">
			</c:if>
		</div>
	</div>
</c:forEach>