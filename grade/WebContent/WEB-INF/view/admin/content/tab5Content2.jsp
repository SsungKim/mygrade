<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:forEach var="t" items="${recordFile }">
	<div class="popup_slide">
		<img src="/file/record/${t }">
	</div>
</c:forEach>

<script>
// 보기 화살표
$(document).ready(function(){
	$("#recordLeft").hide();
	$("#recordRight").show();
	if(${recordSize == 0 }){
		$("#recordRight").hide();
	}
	recordNum = ${recordSize };
});
</script>