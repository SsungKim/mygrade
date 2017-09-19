<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div class="student_view_slider_wrap student_view_slider_wrap1" id="introInnerWrap${num }">
    <div class="delete_btn" onclick="deleteIntro(${num })">삭제하기</div>
    <div class="confirm_btn" onclick="uploadIntro(${num })">등록하기</div>
    <div class="sv_tit">
        <img src="/img/student_view/stu_pic_tit02.png">
    </div>
    <div class="student_view_slider">
        <div class="sv_slider_inner1">
        	<form id="introForm_${num }" action="/member/uploadIntro" enctype="multipard/form-data" method="post">
         	<c:forEach var="t" begin="1" end="50">
              <div class="sv_slide no_img" id="viewintro${t }_${num }">
                  <label for="intro${t }_${num }">
                      <img src="/img/student_add/plus.png">
                  </label>
                  <input type="file" id="intro${t }_${num }" name="intro${t }" onchange="showImg(this)">
                  <div class="txt">${t }P</div>
              </div>
         	</c:forEach>
        	</form>
        </div>
    </div>
    <div class="sv_arrow sv_arrow_prev1">
        <img src="/img/student_view/arrow_prev.png">
    </div>
    <div class="sv_arrow sv_arrow_next1">
        <img src="/img/student_view/arrow_next.png">
    </div>
    <select id="school_sel_${num }">
        <option value="choose">학교선택</option>
        <c:forEach var="t" items="${schoolList }">
        	<option>${t }</option>
        </c:forEach>
    </select>
</div>

<script>
	// 자소서 삭제
	function deleteIntro(num){
		$("#introInnerWrap"+num).remove();
	}
</script>