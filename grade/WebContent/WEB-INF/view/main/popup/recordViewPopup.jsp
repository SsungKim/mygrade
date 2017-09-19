<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!-- view popup -->
<div class="student_view_popup_wrap" id="popup2">
	<div class="pop_inner">
		<div class="student_view_popup_op"></div>
		<div class="sv_popup_tit">
			<img src="/img/student_view/popup_tit.png">
		</div>
		<div class="sv_popup_close" onclick="viewClose()">
			<img src="/img/student_view/pop_close.png">
		</div>
		<div class="sv_popup_infomation">
			<div class="school_logo">
				<img src="/img/university/${record.school }.png">
			</div>
			<div class="txt">${record.subject }<br>${record.name.substring(0, 1) }
				<c:forEach var="i" begin="1" end="${record.name.length()-1 }">
                    O
                </c:forEach>
			</div>
		</div>
		<div class="sv_popup_contents">
			<div class="sv_popup_contents_inner" id="popupImg">
				<c:forEach var="t" items="${record }">
					<div class="content recordContent">
						<img src="/file/record/${t }" />
					</div>
				</c:forEach>
				<c:forEach var="t" items="${intro }">
					<div class="content introContent">
						<img src="/file/intro/${t }" />
					</div>
				</c:forEach>
			</div>
			<div class="center_bar" id="blurTxt">
				<div class="bar_opa"></div>
				<div class="txt">
					첫장은 개인정보 이므로 흐릿한점<br>양해부탁드립니다.
				</div>
			</div>
		</div>
		<div class="sv_popup_arrow_wrap">
			<div class="sv_popup_arrow sv_popup_arrow_prev" id="popPrev" onclick="popPrev()">
				<img src="/img/student_view/popup_arrow_prev.png">
			</div>
			<div class="sv_popup_arrow sv_popup_arrow_next" id="popNext" onclick="popNext()">
				<img src="/img/student_view/popup_arrow_next.png">
			</div>
		</div>
		<div class="sv_popup_page_wrap">
			<input type="text" value="1" maxlength="2" id="pageNum">
			<div class="txt" id="pageNum2"></div>
		</div>
	</div>
</div>