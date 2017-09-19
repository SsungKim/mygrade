<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div class="tab_view06">
    <div class="tab_tit">
        <div class="tit">
            <div class="img">
                <img src="/img/admin/dot.png">
            </div>
            <div class="txt">게시물 관리</div>
        </div>
        <div class="input_wrap">
            <input type="text" placeholder="이름 또는 아이디 검색" id="tab6Search">
            <img src="/img/main/search.png" onclick="tab6Search()">
        </div>
        <select id="tab6Select">
            <option>학생부</option>
            <option>자소서</option>
            <option>면접후기</option>
            <option>정시성적</option>
        </select>
    </div>
    <div class="tab_contents" id="tab6Content">
        <div class="tab_inner">
            <div class="tab_header">
                <div class="content num">번호</div>
                <div class="content c2">아이디</div>
                <div class="content c1">구분</div>
                <div class="content c2">학교</div>
                <div class="content c2">학과</div>
                <div class="content c3">삭제</div>
            </div>
            <c:forEach var="t" items="${searchList }">
            	<div class="tab_content">
	                <div class="content num">${t.auto }</div>
	                <div class="content c2">${t.id }(${t.name })</div>
	                <div class="content c1">${tab6Type }</div>
	                <div class="content c2">${t.schoolName }</div>
	                <div class="content c2">${t.subject }</div>
	                <div class="content c3">
	                    <img src="/img/admin/minus.png" onclick="tab6Remove('${tab6Type }', '${t.auto }')">
	                </div>
	            </div>
            </c:forEach>
        </div>
    </div>
    <div class="page_select_wrap" id="tab6Page">
        <c:import url="/WEB-INF/view/admin/page/tab6Page.jsp"/>
    </div>
</div>

<script>
	// 검색
	$("#tab6Search").keyup(function(e){
		if(e.keyCode == 13){
			tab6Search();
		}
	});
	function tab6Search(){
		var search = $("#tab6Search").val();
		if(search.length == 0){
			alert("검색어를 입력해주세요.\n전체목록을 보실 경우 '전체'라고 검색해주세요.");
			return;
		}
		var type = $("#tab6Select").val();
		$.ajax({
			type : "post",
			url : "/admin/tab6/search/"+type+"/"+search+"/1",
			async : false,
			success : function(txt){
				$("#tab6Content").html(txt);
				$.ajax({
					type : "post",
					url : "/admin/tab6/searchPage/"+type+"/"+search+"/1",
					async : false,
					success : function(txt){
						$("#tab6Page").html(txt);
					}
				});
			}
		});
	}
	// 항목 변경
	$(document).ready(function(){
		$("#tab6Select").change(function(){
			tab6Search();
		});
	});
	// 삭제
	function tab6Remove(type, num){
		var confirm = window.confirm("삭제하시겠습니까?");
		if(confirm){
			$.ajax({
				type : "post",
				url : "/admin/tab6/remove/"+type+"/"+num,
				async : false,
				success : function(txt){
					if(txt){
						alert("삭제되었습니다.");
						location.reload();
					} else {
						alert("삭제에 실패하였습니다.\n잠시후 다시 시도해주세요.");
					}
				}
			});
		}
	}
</script>