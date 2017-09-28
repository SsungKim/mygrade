<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    
<div class="web_page">
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
</div>
    
<div class="mobile_page">
    <div class="prev_pages_wrap pages_wrap" onclick="page(${first })" id="firstWrap2">
        <div class="page">
            <img src="/img/admin/prev01.png">
        </div>
    </div>
    <div class="prev_pages_wrap pages_wrap" onclick="page(${prevM })" id="prevWrap2">
        <div class="page">
            <img src="/img/admin/prev02.png">
        </div>
    </div>
    <div class="now_pages_wrap pages_wrap">
        <c:forEach var="t" begin="${startM }" end="${endM }">
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
    <div class="next_pages_wrap pages_wrap" onclick="page(${nextM })" id="nextWrap2">
        <div class="page">
            <img src="/img/admin/next02.png">
        </div>
    </div>
    <div class="next_pages_wrap pages_wrap" onclick="page(${last })" id="lastWrap2">
        <div class="page">
            <img src="/img/admin/next01.png">
        </div>
    </div>
</div>

<script>
	// 페이지 이동
	function page(num){
		var searchType = $("#searchType").val();
		var searchTxt = $("#searchTxt").val();
		if(searchTxt != ""){
			location.href='/interview/search/page/'+searchType+"/"+searchTxt+"/"+num;
		} else {
			location.href="/interview/page/"+num;
		}
	}
	// 화살표 보이기
	$(document).ready(function(){
		var blo = $(".web_page").css("display");
		if(blo == "block"){
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
		} else {
			if(${select > 5 }){
				$("#firstWrap2").css("display", "inline-block");
				$("#prevWrap2").css("display", "inline-block");
			}
			if(${last > 5 && endM != last }){
				$("#lastWrap2").css("display", "inline-block");
			}
			if(${endM < last }){
				$("#nextWrap2").css("display", "inline-block");
			}
		}
	});
</script>