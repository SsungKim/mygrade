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
	                     <option ${interview.addr == '서울' ? 'selected' : '' }>서울</option>
	                     <option ${interview.addr == '인천' ? 'selected' : '' }>인천</option>
	                     <option ${interview.addr == '대전' ? 'selected' : '' }>대전</option>
	                     <option ${interview.addr == '대구' ? 'selected' : '' }>대구</option>
	                     <option ${interview.addr == '광주' ? 'selected' : '' }>광주</option>
	                     <option ${interview.addr == '울산' ? 'selected' : '' }>울산</option>
	                     <option ${interview.addr == '부산' ? 'selected' : '' }>부산</option>
	                     <option ${interview.addr == '경기' ? 'selected' : '' }>경기</option>
	                     <option ${interview.addr == '강원' ? 'selected' : '' }>강원</option>
	                     <option ${interview.addr == '충북' ? 'selected' : '' }>충북</option>
	                     <option ${interview.addr == '충남' ? 'selected' : '' }>충남</option>
	                     <option ${interview.addr == '경북' ? 'selected' : '' }>경북</option>
	                     <option ${interview.addr == '경남' ? 'selected' : '' }>경남</option>
	                     <option ${interview.addr == '전북' ? 'selected' : '' }>전북</option>
	                     <option ${interview.addr == '전남' ? 'selected' : '' }>전남</option>
	                     <option ${interview.addr == '제주' ? 'selected' : '' }>제주</option>
                    </select>
                    <select class="ml22" id="school" name="school">
                        <option value="choose">지역을 선택해주세요</option>
                    </select>
                    <div class="input_wrap">
                        <input type="text" placeholder="학과입력" id="subject" name="subject" value="${interview.subject }">
                    </div>
                    <select class="ml22" id="type" name="type">
                        <option value="choose">정시/수시 선택</option>
                        <option ${interview.type == '정시' ? 'selected' : '' }>정시</option>
                        <option ${interview.type == '수시' ? 'selected' : '' }>수시</option>
                    </select>
                </div>
            </div>
            <div class="input_wrapper">
                <div class="input_wrap">
                    <div class="tit">
                        <img src="/img/interview/interview01/info09.png">
                    </div>
                    <input class="txt" type="text" placeholder="예) 2017년도" id="year" name="year" value="${interview.year }">
                </div>
                <div class="input_wrap">
                    <div class="tit">
                        <img src="/img/interview/interview01/info03.png">
                    </div>
                    <input class="txt" type="text" placeholder="예) 학생부종합" id="admission" name="admission" value="${interview.admission }">
                </div>
                <div class="input_wrap">
                    <div class="tit">
                        <img src="/img/interview/interview01/info04.png">
                    </div>
                    <input class="txt" type="text" placeholder="예) 창의인재전형" id="typical" name="typical" value="${interview.typical }">
                </div>
                <div class="input_wrap">
                    <div class="tit">
                        <img src="/img/interview/interview01/info02.png">
                    </div>
                    <label>
                        <input type="radio" value="합격" name="pass" id="passY" ${interview.pass == '합격' ? 'checked' : '' }>
                        <div class="label_txt">합격</div>
                    </label>
                    <label>
                        <input type="radio" value="불합격" name="pass" id="passN" ${interview.pass == '불합격' ? 'checked' : '' }>
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