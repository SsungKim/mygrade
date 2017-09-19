<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<div class="popup_cover" id="tab7Popup1"></div>
<div class="manage_popup_wrap manage_popup_wrap1" id="tab7Popup2">
	<div class="pop_header">
		<div class="tit">
			<div class="dot">
				<img src="/img/admin/dot01.png">
			</div>
			<div class="txt">판매자박탈</div>
		</div>
		<div class="line"></div>
	</div>
	<div class="contents">
		<div class="pop_logo">
			<img src="/img/admin/pop_logo.png">
		</div>
		<div class="content">
			<span id="salesId"></span> 님의<br>판매자 자격을 박탈 시키겠습니까?
		</div>
	</div>
	<div class="sv_btn_wrap">
		<div class="sv_btn" onclick="$('#tab7Popup1').hide(), $('#tab7Popup2').hide(), $('body').css('overflow', 'auto')">
			<img src="/img/admin/btnNo.png">
		</div>
		<div class="sv_btn" onclick="tab7SalesCommit()">
			<img src="/img/admin/btnYes.png">
		</div>
	</div>
</div>
<div class="manage_popup_wrap" id="tab7Popup3">
	<div class="pop_header">
		<div class="tit">
			<div class="dot">
				<img src="/img/admin/dot01.png">
			</div>
			<div class="txt">회원추방</div>
		</div>
		<div class="line"></div>
	</div>
	<div class="contents">
		<div class="pop_logo">
			<img src="/img/admin/pop_logo.png">
		</div>
		<div class="content">
			<span id="exitId"></span> 님을<br>추방 하시겠습니까?
		</div>
	</div>
	<div class="sv_btn_wrap">
		<div class="sv_btn" onclick="$('#tab7Popup1').hide(), $('#tab7Popup3').hide(), $('body').css('overflow', 'auto')">
			<img src="/img/admin/btnNo.png">
		</div>
		<div class="sv_btn" onclick="tab7ExitCommit()">
			<img src="/img/admin/btnYes.png">
		</div>
	</div>
</div>
<div class="manage_popup_wrap manage_popup_wrap2" id="tab7Popup4">
	<div class="pop_header">
		<div class="tit">
			<div class="dot">
				<img src="/img/admin/dot01.png">
			</div>
			<div class="txt">관리자권한설정</div>
		</div>
		<div class="line"></div>
	</div>
	<div class="contents">
		<div class="pop_logo">
			<img src="/img/admin/pop_logo.png">
		</div>
		<div class="content">
			<span id="adminId"></span>님을<br>
			<select id="tab7AdminType">
				<option value="choose">권한선택</option>
				<option value="부관리자">부 관리자</option>
				<option value="인증관리자">인증 관리자</option>
			</select>
			<br>로 설정 하시겠습니까?
		</div>
	</div>
	<div class="sv_btn_wrap">
		<div class="sv_btn" onclick="$('#tab7Popup1').hide(), $('#tab7Popup4').hide(), $('body').css('overflow', 'auto')">
			<img src="/img/admin/btnNo.png">
		</div>
		<div class="sv_btn" onclick="tab7AdminCommit()">
			<img src="/img/admin/btnYes.png">
		</div>
	</div>
</div>

<div class="tab_view07">
	<div class="tab_tit">
		<div class="tit">
			<div class="img">
				<img src="/img/admin/dot.png">
			</div>
			<div class="txt">회원 관리</div>
		</div>
		<div class="input_wrap">
			<input type="text" placeholder="이름 또는 아이디 검색" id="tab7Search">
			<img src="/img/main/search.png" onclick="tab7Search()">
		</div>
		<select id="tab7Select">
			<option value="choose">전체보기</option>
			<option>판매자</option>
			<option>구매자</option>
			<option>관리자</option>
		</select>
	</div>
	<div class="tab_contents">
		<div class="tab_inner">
			<div class="tab_header">
				<div class="content num">번호</div>
				<div class="content c1">구분</div>
				<div class="content c2">아이디</div>
				<div class="content c1">이름</div>
				<div class="content c3">나이</div>
				<div class="content c2">연락처</div>
				<div class="content c4">메일</div>
				<div class="content c3">지역</div>
				<div class="content c2">가입일</div>
				<div class="content c3">판매자</div>
				<div class="content c3">관리자</div>
				<div class="content c3">추방</div>
			</div>
			<div id="tab7Content">
				<c:forEach var="t" items="${memberList }">
					<div class="tab_content">
						<div class="content num">${t.auto }</div>
						<div class="content c1">${t.admin }</div>
						<div class="content c2">${t.id }</div>
						<div class="content c1">${t.name }</div>
						<div class="content c3">${t.age }세</div>
						<div class="content c2">${t.phone1 }-${t.phone2 }-${t.phone3 }</div>
						<div class="content c4">${t.email1 }@${t.email2 }</div>
						<div class="content c3">${t.addr1 }</div>
						<div class="content c2">${t.day }</div>
						<div class="content c3">
							<c:if test="${t.admin == '판매자' }">
								<img src="/img/admin/citem01.png" onclick="tab7Sales('${t.auto }', '${t.id }', '${t.name }')">
							</c:if>
						</div>
						<div class="content c3">
							<c:if test="${t.id != 'admin' }">
								<img src="/img/admin/citem02.png" onclick="tab7Admin('${t.auto }', '${t.id }', '${t.name }')">
							</c:if>
						</div>
						<div class="content c3">
							<c:if test="${t.id != 'admin' }">
								<img src="/img/admin/citem03.png" onclick="tab7Exit('${t.auto }', '${t.id }', '${t.name }')">
							</c:if>
						</div>
					</div>
				</c:forEach>
			</div>
		</div>
	</div>
	<div class="page_select_wrap" id="tab7Page">
		<c:import url="/WEB-INF/view/admin/page/tab7Page.jsp" />
	</div>
</div>

<script>
	// 검색
	function tab7Search() {
		var search = $("#tab7Search").val();
		$.ajax({
			type : "post",
			url : "/admin/tab7/search/" + search,
			async : false,
			success : function(txt) {
				$("#tab7Content").html(txt);
				$.ajax({
					type : "post",
					url : "/admin/tab7/searchPage/" + search,
					async : false,
					success : function(txt) {
						$("#tab7Page").html(txt);
						$("#tab7Select").val("choose");
					}
				});
			}
		});
	}
	$(document).ready(function() {
		$("#tab7Search").keydown(function(e) {
			if (e.keyCode == 13) {
				tab7Search();
			}
		});
	});
	// select
	$(document).ready(function() {
		$("#tab7Select").change(function() {
			var select = $("#tab7Select").val();
			var search = $("#tab7Search").val();
			switch (search.length) {
			case 0:
				$.ajax({
					type : "post",
					url : "/admin/tab7/select/" + select,
					async : false,
					success : function(txt) {
						$("#tab7Content").html(txt);
						$.ajax({
							type : "post",
							url : "/admin/tab7/selectPage/" + select,
							async : false,
							success : function(txt) {
								$("#tab7Page").html(txt);
							}
						});
					}
				});
				break;
			default:
				$.ajax({
					type : "post",
					url : "/admin/tab7/select/search/" + select + "/" + search,
					async : false,
					success : function(txt) {
						$("#tab7Content").html(txt);
						$.ajax({
							type : "post",
							url : "/admin/tab7/selectSearchPage/" + select + "/" + search,
							async : false,
							success : function(txt) {
								$("#tab7Page").html(txt);
							}
						});
					}
				});
				break;
			}
		});
	});
	// 판매자 박탈
	var salesAuto;
	function tab7Sales(auto, id, name) {
		$("#salesId").html(id + "(" + name + ")");
		$("#tab7Popup1").show();
		$("#tab7Popup2").show();
		$("body").css("overflow", "hidden");
		salesAuto = auto;
	}
	// 판매자 박탈확인
	function tab7SalesCommit() {
		$.ajax({
			type : "post",
			url : "/admin/tab7/sales/"+salesAuto,
			async : false,
			success : function(txt){
				if(txt){
					alert("박탈되었습니다.");
					location.reload();
				} else {
					alert("박탈에 실패하였습니다.\n잠시후 다시 시도해주세요.");
				}
			}
		});
	}
	// 관리자 설정
	var adminAuto;
	function tab7Admin(auto, id, name){
		$("#adminId").html(id+"("+name+")");
		$("#tab7Popup1").show();
		$("#tab7Popup4").show();
		$("body").css("overflow", "hidden");
		adminAuto = auto;
	}
	// 관리자 설정 확인
	function tab7AdminCommit(){
		var adminType = $("#tab7AdminType").val();
		if(adminType == "choose"){
			alert("관리자 타입을 선택해주세요.");
			return;
		}
		$.ajax({
			type : "post",
			url : "/admin/tab7/admin/"+adminAuto+"/"+adminType,
			async : false,
			success : function(txt){
				if(txt){
					alert("설정되었습니다.");
					location.reload();
				} else {
					alert("설정에 실패하였습니다.\n잠시후 다시 시도해주세요.");
				}
			}
		});
	}
	// 회원 추방
	var exitAuto;
	function tab7Exit(auto, id, name){
		$("#exitId").html(id+"("+name+")");
		$("#tab7Popup1").show();
		$("#tab7Popup3").show();
		$("body").css("overflow", "hidden");
		exitAuto = auto;
	}
	// 회원 추방 확인
	function tab7ExitCommit(){
		$.ajax({
			type : "post",
			url : "/admin/tab7/exitMember/"+exitAuto,
			async : false,
			success : function(txt){
				if(txt){
					alert("추방되었습니다.");
					location.reload();
				} else {
					alert("추방에 실패하였습니다.\n잠시후 다시 시도해주세요.");
				}
			}
		});
	}
</script>