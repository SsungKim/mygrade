<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<div class="prev_pages_wrap pages_wrap" onclick="page(${first })" id="firstWrap">
	<div class="page">
		<img src="/img/admin/prev01.png">
	</div>
</div>
<div class="prev_pages_wrap pages_wrap" onclick="page(${prev })" id="prevWrap">
	<div class="page">
		<img src="/img/admin/prev02.png">
	</div>
</div>
<div class="now_pages_wrap pages_wrap">
	<c:forEach var="t" begin="${start }" end="${end }">
		<c:choose>
			<c:when test="${t == select }">
				<div class="page sel" onclick="page(${t })">
					<span>${t }</span>
				</div>
			</c:when>
			<c:otherwise>
				<div class="page" onclick="page(${t })">
					<span>${t }</span>
				</div>
			</c:otherwise>
		</c:choose>
	</c:forEach>
</div>
<div class="next_pages_wrap pages_wrap" onclick="page(${next })" id="nextWrap">
	<div class="page">
		<img src="/img/admin/next02.png">
	</div>
</div>
<div class="next_pages_wrap pages_wrap" onclick="page(${last })" id="lastWrap">
	<div class="page">
		<img src="/img/admin/next01.png">
	</div>
</div>

<script>
	// 페이지 이동
	function page(num){
		var searchTxt = $("#searchTxt").val();
		if(searchTxt != ""){
			location.href='/exam/search/page/'+searchTxt+"/"+num;
		} else {
			location.href="/exam/page/"+num;
		}
	}
	// 화살표 보이기
	$(document).ready(function(){
		if(${select > 10 }){
			$("#firstWrap").css("display", "inline-block");
			$("#prevWrap").css("display", "inline-block");
		}
		if(${last > 10 && end != last }){
			$("#lastWrap").css("display", "inline-block");
		}
		if(${end < last }){
			$("#nextWrap").css("display", "inline-block");
		}
	});
</script>