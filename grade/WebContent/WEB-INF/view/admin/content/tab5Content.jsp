<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:forEach var="t" begin="1" end="${certList.size() }">
	<div class="tab_content">
		<div class="content num" id="tab5Auto${t }">${certList.get(t-1).auto }</div>
		<div class="content c1">${certList.get(t-1).day }</div>
		<div class="content c2">${certList.get(t-1).id }</div>
		<div class="content c1">${certList.get(t-1).name }</div>
		<div class="content c3">${certList.get(t-1).hschool }</div>
		<div class="content c2">
			<img src="/img/admin/view.png" onclick="tab5View(${certList.get(t-1).auto })">
		</div>
		<div class="content num">
			<input type="checkbox" id="tab5Cert${t }" ${tab5Type == 'certEnd' ? 'checked' : '' } ${tab5Type == 'certEnd' ? 'disabled' : '' }>
		</div>
	</div>
</c:forEach>