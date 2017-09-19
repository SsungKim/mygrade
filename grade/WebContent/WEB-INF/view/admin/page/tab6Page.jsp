<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<div class="prev_pages_wrap pages_wrap" onclick="page(${first6 })" id="firstWrap">
	<div class="page">
		<img src="/img/admin/prev01.png">
	</div>
</div>
<div class="prev_pages_wrap pages_wrap" onclick="page(${prev6 })" id="prevWrap">
	<div class="page">
		<img src="/img/admin/prev02.png">
	</div>
</div>
<div class="now_pages_wrap pages_wrap">
	<c:forEach var="t" begin="${start6 }" end="${end6 }">
		<c:choose>
			<c:when test="${t == select6 }">
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
<div class="next_pages_wrap pages_wrap" onclick="page(${next6 })" id="nextWrap">
	<div class="page">
		<img src="/img/admin/next02.png">
	</div>
</div>
<div class="next_pages_wrap pages_wrap" onclick="page(${last6 })" id="lastWrap">
	<div class="page">
		<img src="/img/admin/next01.png">
	</div>
</div> 

<script>
	//페이지 이동
	function page(num){
		var search = $("#tab6Search").val();
		if(search.length == 0){
			alert("검색어를 입력해주세요.\n전체목록을 보실 경우 '전체'라고 검색해주세요.");
			return;
		}
		var type = $("#tab6Select").val();
		$.ajax({
			type : "post",
			url : "/admin/tab6/search/"+type+"/"+search+"/"+num,
			async : false,
			success : function(txt){
				$("#tab6Content").html(txt);
				$.ajax({
					type : "post",
					url : "/admin/tab6/searchPage/"+type+"/"+search+"/"+num,
					async : false,
					success : function(txt){
						$("#tab6Page").html(txt);
					}
				});
			}
		});
	}
	// 화살표 보이기
	$(document).ready(function(){
		if(${select6 > 10 }){
			$("#firstWrap").css("display", "inline-block");
			$("#prevWrap").css("display", "inline-block");
		}
		if(${last6 > 10 && end6 != last6 }){
			$("#lastWrap").css("display", "inline-block");
		}
		if(${end6 < last6 }){
			$("#nextWrap").css("display", "inline-block");
		}
	});
</script>