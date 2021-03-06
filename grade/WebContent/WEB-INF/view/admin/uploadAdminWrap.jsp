<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div class="infomation_wrap hidden" id="adminWrap">
    <div class="inner">
        <div class="search_wrap">
            <input type="text" placeholder="대학검색" list="univList" id="searchUniv" onblur="selectUniv()">
            <datalist id="univList"></datalist>
            <div class="img" onclick="searchUniv()">
                <img src="/img/main/search.png">
            </div>
        </div>
        <div class="id_container">
            <div class="uni_box">
                <div class="inner">
                    <div class="name">${login.name }</div>
                    <select id="addr" name="addr">
                        <option value="choose">시,도 선택</option>
	                     <option>서울</option>
	                     <option>인천</option>
	                     <option>대전</option>
	                     <option>대구</option>
	                     <option>광주</option>
	                     <option>울산</option>
	                     <option>부산</option>
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
                    <select class="ml22" id="school" name="school">
                        <option value="choose">지역을 선택해주세요</option>
                    </select>
                    <div class="input_wrap">
                        <input type="text" placeholder="학과입력" id="subject" name="subject">
                    </div>
                    <select class="ml22" id="type" name="type">
                        <option value="choose">정시/수시 선택</option>
                        <option>정시</option>
                        <option>수시</option>
                    </select>
                </div>
            </div>
            <div class="input_wrapper">
                <div class="input_wrap">
                    <div class="tit">
                        <img src="/img/interview/interview01/info09.png">
                    </div>
                    <input class="txt" type="text" placeholder="예) 2017년도" id="year" name="year">
                </div>
                <div class="input_wrap">
                    <div class="tit">
                        <img src="/img/interview/interview01/info03.png">
                    </div>
                    <input class="txt" type="text" placeholder="예) 학생부종합" id="admission" name="admission">
                </div>
                <div class="input_wrap">
                    <div class="tit">
                        <img src="/img/interview/interview01/info04.png">
                    </div>
                    <input class="txt" type="text" placeholder="예) 창의인재전형" id="typical" name="typical">
                </div>
                <div class="input_wrap">
                    <div class="tit">
                        <img src="/img/interview/interview01/info02.png">
                    </div>
                    <label>
                        <input type="radio" value="합격" name="pass" id="passY">
                        <div class="label_txt">합격</div>
                    </label>
                    <label>
                        <input type="radio" value="불합격" name="pass" id="passN">
                        <div class="label_txt">불합격</div>
                    </label>
                </div>
            </div>
        </div>
    </div>
</div>

<script>
	//대학 지역 선택
	$("#addr").change(function(){
		var addr = $("#addr").val();
		$.ajax({
			type : "post",
			url : "/university/"+addr,
			async : false,
			success : function(txt){
				$("#school").html(txt);
			}
		});
	});
	// 대학검색
	function searchUniv(){
		var univ = $("#searchUniv").val();
		$.ajax({
			type : "post",
			url : "/wordChange/"+univ,
			async : false,
			success : function(txt){
				$("#searchUniv").val(txt[0]);
				$.ajax({
					type : "post",
					url : "/searchUniv/"+txt[0],
					async : true,
					success : function(list){
						$("#univList").html(list);
					}
				});
			}
		});
	}
	$(document).ready(function(){
		$("#searchUniv").keyup(function(e){
			if(e.keyCode == 13){
				searchUniv();
			}
		});
	});
	// 대학 검색 후 대학 반영
	function selectUniv(){
		var univ = $("#searchUniv").val();
		console.log(univ);
		$.ajax({
			type : "post",
			url : "/selectUniv/"+univ,
			async : false,
			success : function(txt){
				console.log(txt);
				if(txt == ""){
					alert("올바른 학교를 검색해주세요.");
					return;
				}
				$("#addr").val(txt.addr);
				var school = "<option value='"+txt.num+"'>"+txt.name+"</option>";
				$("#school").html(school);
			}
		});
	}
</script>