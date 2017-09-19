<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div class="content" id="schoolDiv${num }">
<form action="/school/uploadSchool" method="post" enctype="multipart/form-data" id="schoolForm${num }">
    <select id="addr${num }" name="addr" onchange="schoolChange(this)">
        <option value="choose">시,도 선택</option>
        <option>서울</option>
        <option>인천</option>
        <option>대전</option>
        <option>대구</option>
        <option>광주</option>
        <option>울산</option>
        <option>부산</option>
        <option>세종</option>
        <option>경기</option>
        <option>강원</option>
        <option>충북</option>
        <option>충남</option>
        <option>경북</option>
        <option>경남</option>
        <option>전북</option>
        <option>전남</option>
        <option>제주</option>
    </select>
    <select id="school${num }" name="school">
        <option value="choose">대학선택</option>
    </select>
    <input type="text" placeholder="학과입력" id="subject${num }" name="subject">
    <select id="year${num }" name="year">
        <option value="choose">입학년도 선택</option>
        <c:forEach var="t" begin="0" end="4">
			<option>${year - t }년</option>
		</c:forEach>
    </select>
    <input type="text" placeholder="입학전형 입력" id="admission${num }" name="admission">
    <input type="text" placeholder="전형명 입력" id="typical${num }" name="typical">
    <div class="hschool">
        <input type="text" placeholder="고등학교 입력" id="hschool${num }" name="hschool">
        <div class="txt">고등학교</div>
    </div>
    <div class="pass">
        <div class="tit">합격여부</div>
        <div class="radio">
            <input type="radio" id="passY${num }" name="pass" value="합격">
            <label for="passY${num }">합격</label>
        </div>
        <div class="radio">
            <input type="radio" id="passN${num }" name="pass" value="불합격">
            <label for="passN${num }">불합격</label>
        </div>
    </div>
    <div class="add_file">
        <input class="upload_name${num }" value="합격증or재학증명서 등록" disabled="disabled" id="dataName${num }">
        <label for="passData${num }">등록</label>
        <input type="file" id="passData${num }" class="upload_hidden" name="passData" onchange="dataChange(this)">
    </div>
    <div class="pass">
        <div class="tit">정/수시</div>
        <div class="radio">
            <input type="radio" id="typeY${num }" name="type" value="정시">
            <label for="typeY${num }">정시</label>
        </div>
        <div class="radio">
            <input type="radio" id="typeN${num }" name="type" value="수시">
            <label for="typeN${num }">수시</label>
        </div>
    </div>
    <div class="clear_btn">
        <img src="/img/school/btn01.png" onclick="deleteSchool(${num})">
    </div>
</form>
</div>