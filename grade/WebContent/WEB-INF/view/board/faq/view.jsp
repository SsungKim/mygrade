<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!doctype html>
<html oncontextmenu='return false' ondragstart='return false' onselectstart='return false'>
    <head>
        <c:import url="/WEB-INF/view/main/head.jsp"/>
    </head>
     
    <body>
        <div id="wrapper">
            <div class="notice03">
            	<c:import url="/WEB-INF/view/main/side.jsp"/>
            	<header class="sub_header">
                    <div class="hmenubar">
                        <img src="/img/hmenubar.png">
                    </div>
                    <c:import url="/WEB-INF/view/main/login.jsp"/>
                </header>
                <div class="page_inner">
                    <header class="main_header">
                         <div class="logo">
                             <img src="/img/logo.png" onclick="location.href='/'">
                         </div>
                    </header>
                    <section class="contents_tit">
                        <div class="img">
                            <img src="/img/notice/notice01/item01.png">
                        </div>
                        <div class="tit">문의사항</div>
                    </section>
                    <section class="section01">
                    	<form action="/notice/modify" id="form">
                    		<input type="hidden" name="num" value="${view.auto }"/>
	                        <div class="board_tit">
	                            <div class="txt" id="titleDiv">${view.title }</div>
                                <div class="txt1">
                                    <span>${view.day }</span>
                                </div>
	                        </div>
                            <div class="info_tit">
                                <div class="tit_wrap">
                                    <div class="tit">작성자</div>
                                    <div class="txt">${view.writer }</div>
                                </div>
<!--                                 <div class="tit_wrap"> -->
<!--                                     <div class="tit">조회</div> -->
<!--                                     <div class="txt">(3)</div> -->
<!--                                 </div> -->
                            </div>
                            <div class="board_txt" id="contentDiv">${view.content }</div>
	                        <div class="board_btn_wrap">
	                        	<div class="board_btn" onclick="location.href='/faq'">목록</div>
	                        	<c:if test="${login.id == view.writer }">
                                    <div class="board_btn bb1" onclick="remove()">삭제</div>
		                            <div class="board_btn" onclick="modify()" id="modify">수정</div>
	                        	</c:if>
	                        </div>
	                        <div class="board_btn_wrap"></div>
                        </form>
                    </section>
                </div>
            </div>
            <footer>
            	<c:import url="/WEB-INF/view/main/footer.jsp"/>
            </footer>
        </div>
    </body>
    
    <script>
    	// 글 수정
    	function modify(){
    		location.href="/faq/modify/${view.auto }";
    	}
    	// 글 삭제
    	function remove(){
    		var del = confirm("삭제하시겠습니까?");
    		if(del){
    			$.ajax({
    				type : "post",
    				url : "/faq/remove/${view.auto }",
    				async : false,
    				success : function(txt){
    					if(txt){
    						alert("삭제되었습니다.");
    						location.href='/faq';
    					} else {
    						alert("삭제에 실패하였습니다.\n잠시후 다시 시도해주세요.");
    						location.reload();
    					}
    				}
    			});
    		}
    	}
//     	// 취소
//     	function cancel(){
//     		$("#title").val(title);
//     		$("#content").val(content);
//     		$("#modify").css("display", "inline-block");
//     		$("#cancel").css("display", "none");
//     		$("#remove").css("display", "inline-block");
//     		$("#save").css("display", "none");
//     		$("#title").css("display", "none");
//     		$("#content").css("display", "none");
//     		$("#titleDiv").css("display", "inline-block");
//     		$("#contentDiv").css("display", "block");
//     	}
//     	// 저장
//     	function save(){
//     		title = $("#title").val();
//     		content = $("#content").val();
//     		if(title.length==0){
//     			alert("제목을 입력해주세요.");
//     		} else {
// 				$("#form").submit();
//     		}
//     	}
//     	// 삭제 완료
//     	function removeYes(num){
//     		$.ajax({
//     			type : "post",
//     			url : "/notice/remove/"+num,
//     			async : false,
//     			success : function(txt){
//     				if(txt){
//     					alert("삭제되었습니다.");
//     					location.href="/notice/";
//     				} else {
//     					alert("삭제에 실패하였습니다.\n잠시후 다시 시도해주세요.");
//     				}
//     			}
//     		});
//     	}
    </script>
    
</html>