<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:if test="${select > 5 }">
	<div class="prev_pages_wrap pages_wrap">
		<div class="page">
			<span onclick="page(${first })">${first }</span>
		</div>
		<div class="omit_page">
			<span>···</span>
		</div>
	</div>
</c:if>
<div class="now_pages_wrap pages_wrap">
	<c:forEach var="t" begin="${start }" end="${end }">
		<c:choose>
			<c:when test="${t == select }">
				<div class="page sel">
					<span onclick="page(${t })">${t }</span>
				</div>
			</c:when>
			<c:otherwise>
				<div class="page">
					<span onclick="page(${t })">${t }</span>
				</div>
			</c:otherwise>
		</c:choose>
	</c:forEach>
</div>
<c:if test="${end != last }">
	<div class="next_pages_wrap pages_wrap">
		<div class="omit_page">
			<span>···</span>
		</div>
		<div class="page">
			<span onclick="page(${last })">${last }</span>
		</div>
	</div>
</c:if>

<script>
	//페이지 이동
	function page(num){
		location.href="/faq/page/"+num;
	}
</script>