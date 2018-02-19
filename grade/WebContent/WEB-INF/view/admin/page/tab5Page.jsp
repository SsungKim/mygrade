<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<div class="prev_pages_wrap pages_wrap" onclick="page(${first5 })" id="firstWrap">
	<div class="page">
		<img src="/img/admin/prev01.png">
	</div>
</div>
<div class="prev_pages_wrap pages_wrap" onclick="page(${prev5 })" id="prevWrap">
	<div class="page">
		<img src="/img/admin/prev02.png">
	</div>
</div>
<div class="now_pages_wrap pages_wrap">
	<c:forEach var="t" begin="${start5 }" end="${end5 }">
		<c:choose>
			<c:when test="${t == select5 }">
				<div class="page sel" onclick="page(${t })" id="page${t }">
					<span>${t }</span>
				</div>
			</c:when>
			<c:otherwise>
				<div class="page" onclick="page(${t })" id="page${t }">
					<span>${t }</span>
				</div>
			</c:otherwise>
		</c:choose>
	</c:forEach>
</div>
<div class="next_pages_wrap pages_wrap" onclick="page(${next5 })" id="nextWrap">
	<div class="page">
		<img src="/img/admin/next02.png">
	</div>
</div>
<div class="next_pages_wrap pages_wrap" onclick="page(${last5 })" id="lastWrap">
	<div class="page">
		<img src="/img/admin/next01.png">
	</div>
</div> 

<script>
	//페이지 이동
	function page(num){
		$.ajax({
			type : "post",
			url : "/admin/tab5/${tab5Type }/page/"+num,
			async : false,
			success : function(txt){
				$("#tab5Content").html(txt);
				$.ajax({
					type : "post",
					url : "/admin/tab5/${tab5Type }/page2/"+num,
					async : false,
					success : function(txt){
						$("#tab5Page").html(txt);
						$(".page").removeClass("sel");
						$("#page"+num).addClass(" sel");
					}
				});
			}
		});
	}
	// 화살표 보이기
	$(document).ready(function(){
		if(${select5 > 10 }){
			$("#firstWrap").css("display", "inline-block");
			$("#prevWrap").css("display", "inline-block");
		}
		if(${last5 > 10 && end5 != last5 }){
			$("#lastWrap").css("display", "inline-block");
		}
		if(${end5 < last5 }){
			$("#nextWrap").css("display", "inline-block");
		}
	});
</script>