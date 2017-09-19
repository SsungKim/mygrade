<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<div class="prev_pages_wrap pages_wrap" onclick="page(${first4 })" id="firstWrap">
	<div class="page">
		<img src="/img/admin/prev01.png">
	</div>
</div>
<div class="prev_pages_wrap pages_wrap" onclick="page(${prev4 })" id="prevWrap">
	<div class="page">
		<img src="/img/admin/prev02.png">
	</div>
</div>
<div class="now_pages_wrap pages_wrap">
	<c:forEach var="t" begin="${start4 }" end="${end4 }">
		<c:choose>
			<c:when test="${t == select4 }">
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
<div class="next_pages_wrap pages_wrap" onclick="page(${next4 })" id="nextWrap">
	<div class="page">
		<img src="/img/admin/next02.png">
	</div>
</div>
<div class="next_pages_wrap pages_wrap" onclick="page(${last4 })" id="lastWrap">
	<div class="page">
		<img src="/img/admin/next01.png">
	</div>
</div> 

<script>
	//페이지 이동
	function page(num){
		$.ajax({
			type : "post",
			url : "/admin/tab4/${tab4Type }/page/"+num,
			async : false,
			success : function(txt){
				$("#tab4Content").html(txt);
				$.ajax({
					type : "post",
					url : "/admin/tab4/${tab4Type }/page2/"+num,
					async : false,
					success : function(txt){
						$("#tab4Page").html();
					}
				});
			}
		});
	}
	// 화살표 보이기
	$(document).ready(function(){
		if(${select4 > 10 }){
			$("#firstWrap").css("display", "inline-block");
			$("#prevWrap").css("display", "inline-block");
		}
		if(${last4 > 10 && end4 != last4 }){
			$("#lastWrap").css("display", "inline-block");
		}
		if(${end4 < last4 }){
			$("#nextWrap").css("display", "inline-block");
		}
	});
</script>