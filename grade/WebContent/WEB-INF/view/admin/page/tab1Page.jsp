<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<div class="prev_pages_wrap pages_wrap" onclick="page(${first1 })" id="firstWrap">
	<div class="page">
		<img src="/img/admin/prev01.png">
	</div>
</div>
<div class="prev_pages_wrap pages_wrap" onclick="page(${prev1 })" id="prevWrap">
	<div class="page">
		<img src="/img/admin/prev02.png">
	</div>
</div>
<div class="now_pages_wrap pages_wrap">
	<c:forEach var="t" begin="${start1 }" end="${end1 }">
		<c:choose>
			<c:when test="${t == select1 }">
				<div class="page sel" id="page${t }" onclick="page(${t })">
					<span>${t }</span>
				</div>
			</c:when>
			<c:otherwise>
				<div class="page" id="page${t }" onclick="page(${t })">
					<span>${t }</span>
				</div>
			</c:otherwise>
		</c:choose>
	</c:forEach>
</div>
<div class="next_pages_wrap pages_wrap" onclick="page(${next1 })" id="nextWrap">
	<div class="page">
		<img src="/img/admin/next02.png">
	</div>
</div>
<div class="next_pages_wrap pages_wrap" onclick="page(${last1 })" id="lastWrap">
	<div class="page">
		<img src="/img/admin/next01.png">
	</div>
</div> 

<script>
	//페이지 이동
	function page(num){
		var month = $("#tab1Month").val();
		$.ajax({
			type : "post",
			url : "/admin/tab1/month/"+month+"?page="+num,
			async : false,
			success : function(txt){
				$("#tab1Content").html(txt);
				$.ajax({
					type : "post",
					url : "/admin/tab1/monthPage/"+month+"?page="+num,
					async : false,
					success : function(txt){
						$("#tab1Page").html(txt);
						$(".page").removeClass("sel");
						$("#page"+num).addClass(" sel");
					}
				});
			}
		});
	}
	// 화살표 보이기
	$(document).ready(function(){
		if(${select1 > 10 }){
			$("#firstWrap").css("display", "inline-block");
			$("#prevWrap").css("display", "inline-block");
		}
		if(${last1 > 10 && end1 != last1 }){
			$("#lastWrap").css("display", "inline-block");
		}
		if(${end1 < last1 }){
			$("#nextWrap").css("display", "inline-block");
		}
	});
</script>