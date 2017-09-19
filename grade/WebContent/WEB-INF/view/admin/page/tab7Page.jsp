<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<div class="prev_pages_wrap pages_wrap" onclick="page(${first7 })" id="firstWrap">
	<div class="page">
		<img src="/img/admin/prev01.png">
	</div>
</div>
<div class="prev_pages_wrap pages_wrap" onclick="page(${prev7 })" id="prevWrap">
	<div class="page">
		<img src="/img/admin/prev02.png">
	</div>
</div>
<div class="now_pages_wrap pages_wrap">
	<c:forEach var="t" begin="${start7 }" end="${end7 }">
		<c:choose>
			<c:when test="${t == select7 }">
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
<div class="next_pages_wrap pages_wrap" onclick="page(${next7 })" id="nextWrap">
	<div class="page">
		<img src="/img/admin/next02.png">
	</div>
</div>
<div class="next_pages_wrap pages_wrap" onclick="page(${last7 })" id="lastWrap">
	<div class="page">
		<img src="/img/admin/next01.png">
	</div>
</div> 

<script>
	//페이지 이동
	function page(num){
		$.ajax({
			type : "post",
			url : "/admin/tab7/page/"+num,
			async : false,
			success : function(txt){
				$("#tab7Content").html(txt);
				$.ajax({
					type : "post",
					url : "/admin/tab7/pages/"+num,
					async : false,
					success : function(txt){
						$("#tab7Page").html(txt);
					}
				});
			}
		});
	}
	// 화살표 보이기
	$(document).ready(function(){
		if(${select7 > 10 }){
			$("#firstWrap").css("display", "inline-block");
			$("#prevWrap").css("display", "inline-block");
		}
		if(${last7 > 10 && end7 != last }){
			$("#lastWrap").css("display", "inline-block");
		}
		if(${end7 < last7 }){
			$("#nextWrap").css("display", "inline-block");
		}
	});
</script>