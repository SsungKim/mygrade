<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<div class="school_logo">
	<select id="addr${num }" name="addr" onchange="schoolChange(${num })">
		<option value="choose">도(특별, 광역시)</option>
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
		<option value="choose">지역을 선택하세요</option>
	</select>
	<input type="text" placeholder="입학전형 입력" id="type${num }" name="type">
</div>
<div class="department">
	<input type="text" placeholder="학과입력" id="subject${num }" name="subject">
</div>
<div class="pass">
	<div class="tit">합격여부</div>
	<div class="radio">
		<input type="radio" id="passY${num }" name="pass">
		<label for="passY${num }">합격</label>
	</div>
	<div class="radio">
		<input type="radio" id="passN${num }" name="pass">
		<label for="passN${num }">불합격</label>
	</div>
</div>
<div class="add_file">
	<input class="upload_name" value="합격증or재학증명서 등록" disabled="disabled" id="dataName${num }">
	<label for="passData${num }">등록</label>
	<input type="file" id="passData${num }" class="upload_hidden" name="passData" onchange="dataImg(${num })">
</div>
<div class="pass">
	<div class="tit">정/수시</div>
	<div class="radio">
		<input type="radio" id="typeY${num }" name="pass1">
		<label for="typeY${num }">정시</label>
	</div>
	<div class="radio">
		<input type="radio" id="typeN${num }" name="pass1">
		<label for="typeN${num }">수시</label>
	</div>
	<div class="delete_btn_wrap" onclick="deleteSchool(${num})">
    	<div class="delete_btn">삭제하기</div>
    </div>
</div>

<script>
	// 학교 삭제
	function deleteSchool(num){
		if(schoolNum != num){
			alert("마지막 항목부터 삭제해주세요.");
			return;
		}
		$.ajax({
			type : "post",
			url : "/record/deleteSchool/"+num,
			async : false,
			success : function(txt){
				$("#schoolDiv"+num).html(txt);
				schoolNum--;
			}
		});
	}
</script>