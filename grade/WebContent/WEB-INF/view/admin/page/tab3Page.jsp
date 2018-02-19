<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<div class="prev_pages_wrap pages_wrap" onclick="page(${first3 })" id="firstWrap">
	<div class="page">
		<img src="/img/admin/prev01.png">
	</div>
</div>
<div class="prev_pages_wrap pages_wrap" onclick="page(${prev3 })" id="prevWrap">
	<div class="page">
		<img src="/img/admin/prev02.png">
	</div>
</div>
<div class="now_pages_wrap pages_wrap">
	<c:forEach var="t" begin="${start3 }" end="${end3 }">
		<c:choose>
			<c:when test="${t == select3 }">
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
<div class="next_pages_wrap pages_wrap" onclick="page(${next3 })" id="nextWrap">
	<div class="page">
		<img src="/img/admin/next02.png">
	</div>
</div>
<div class="next_pages_wrap pages_wrap" onclick="page(${last3 })" id="lastWrap">
	<div class="page">
		<img src="/img/admin/next01.png">
	</div>
</div> 

<script>
	//페이지 이동
	function page(num){
		var day1 = $("#tab3Day1").val();
		var day2 = $("#tab3Day2").val();
		var d1 = day1.substring(0, 4)+day1.substring(day1.indexOf('-')+1, day1.lastIndexOf('-'))+day1.substring(day1.lastIndexOf('-')+1);
		var d2 = day2.substring(0, 4)+day2.substring(day2.indexOf('-')+1, day2.lastIndexOf('-'))+day2.substring(day2.lastIndexOf('-')+1);
		if(Number(d1) > Number(d2)){
			alert("올바른 기간을 선택해주세요.");
			return;
		}
		$.ajax({
			type : "post",
			url : "/admin/tab3/search/"+day1+"/"+day2+"?page="+num,
			async : false,
			success : function(txt){
				$("#tab3Content").html(txt);
				$.ajax({
					type : "post",
					url : "/admin/tab3/searchPage/"+day1+"/"+day2+"?page="+num,
					async : false,
					success : function(txt){
						$("#tab3Page").html(txt);
						$(".page").removeClass("sel");
						$("#page"+num).addClass(" sel");
					}
				});
			}
		});
	}
	// 화살표 보이기
	$(document).ready(function(){
		if(${select3 > 10 }){
			$("#firstWrap").css("display", "inline-block");
			$("#prevWrap").css("display", "inline-block");
		}
		if(${last3 > 10 && end3 != last3 }){
			$("#lastWrap").css("display", "inline-block");
		}
		if(${end3 < last3 }){
			$("#nextWrap").css("display", "inline-block");
		}
	});
</script>