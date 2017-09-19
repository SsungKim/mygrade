<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<div class="prev_pages_wrap pages_wrap" onclick="page(${first2 })" id="firstWrap">
	<div class="page">
		<img src="/img/admin/prev01.png">
	</div>
</div>
<div class="prev_pages_wrap pages_wrap" onclick="page(${prev2 })" id="prevWrap">
	<div class="page">
		<img src="/img/admin/prev02.png">
	</div>
</div>
<div class="now_pages_wrap pages_wrap">
	<c:forEach var="t" begin="${start2 }" end="${end2 }">
		<c:choose>
			<c:when test="${t == select2 }">
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
<div class="next_pages_wrap pages_wrap" onclick="page(${next2 })" id="nextWrap">
	<div class="page">
		<img src="/img/admin/next02.png">
	</div>
</div>
<div class="next_pages_wrap pages_wrap" onclick="page(${last2 })" id="lastWrap">
	<div class="page">
		<img src="/img/admin/next01.png">
	</div>
</div> 

<script>
	//페이지 이동
	function page(num){
		var day1 = $("#tab2Day1").val();
		var day2 = $("#tab2Day2").val();
		var d1 = day1.substring(0, 4)+day1.substring(day1.indexOf('-')+1, day1.lastIndexOf('-'))+day1.substring(day1.lastIndexOf('-')+1);
		var d2 = day2.substring(0, 4)+day2.substring(day2.indexOf('-')+1, day2.lastIndexOf('-'))+day2.substring(day2.lastIndexOf('-')+1);
		if(Number(d1) > Number(d2)){
			alert("올바른 기간을 선택해주세요.");
			return;
		}
		$.ajax({
			type : "post",
			url : "/admin/tab2/search/"+day1+"/"+day2+"?page="+num,
			async : false,
			success : function(txt){
				console.log(txt);
				$("#tab2Content").html(txt);
				$.ajax({
					type : "post",
					url : "/admin/tab2/searchPage/"+day1+"/"+day2+"?page="+num,
					async : false,
					success : function(txt){
						$("#tab2Page").html(txt);
					}
				});
			}
		});
	}
	// 화살표 보이기
	$(document).ready(function(){
		if(${select2 > 10 }){
			$("#firstWrap").css("display", "inline-block");
			$("#prevWrap").css("display", "inline-block");
		}
		if(${last2 > 10 && end2 != last2 }){
			$("#lastWrap").css("display", "inline-block");
		}
		if(${end2 < last2 }){
			$("#nextWrap").css("display", "inline-block");
		}
	});
</script>