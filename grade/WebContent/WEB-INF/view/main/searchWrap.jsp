<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<input class="main_search" type="text" placeholder="학교를 검색해주세요" maxlength="35" id="searchTxt" value="${word1 }">
<input class="main_search1" type="text" placeholder="학과를 검색해주세요" maxlength="35" id="searchTxt2" value="${word2 }">

<div class="img">
	<img src="/img/main/search01.png" onclick="search()">
</div>