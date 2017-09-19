<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<div class="tab_inner">
	<div class="tab_header">
		<div class="content num">번호</div>
		<div class="content c2">아이디</div>
		<div class="content c1">구분</div>
		<div class="content c2">학교</div>
		<div class="content c2">학과</div>
		<div class="content c3">삭제</div>
	</div>
	<c:forEach var="t" items="${searchList }">
		<div class="tab_content">
			<div class="content num">${t.auto }</div>
			<div class="content c2">${t.id }(${t.name })</div>
			<div class="content c1">${tab6Type }</div>
			<div class="content c2">${t.schoolName }</div>
			<div class="content c2">${t.subject }</div>
			<div class="content c3">
				<img src="/img/admin/minus.png" onclick="tab6Remove('${tab6Type }', '${t.auto }')">
			</div>
		</div>
	</c:forEach>
</div>