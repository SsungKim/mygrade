<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!doctype html>
<html oncontextmenu='return false' ondragstart='return false' onselectstart='return false'>
    <head>
        <c:import url="/WEB-INF/view/main/head.jsp"/>
        <script>
            $(document).ready(function(){
            	if(${login == null}){
	    			alert("세션이 만료되었습니다.\n로그인 페이지로 이동합니다.");
	    			location.href="/login";
	    		}
            });
        </script>
    </head>
     
    <body>
        <div id="wrapper">
            <div class="notice02">
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
                        <div class="tit">공지사항</div>
                    </section>
                    <form action="/notice/writeSave" enctype="multipart/form-data" method="post" id="form">
	                    <section class="section01">
	                        <div class="board_tit">
	                            <div class="tit">제목</div>
	                            <input type="text" name="title" placeholder="제목 입력란" id="title">
	                        </div>
                            <textarea placeholder="내용을 입력해주세요" name="content" id="content"></textarea>
<!-- 	                        <div class="board_password_wrap"> -->
<!-- 	                            <div class="tit">비밀번호</div> -->
<!-- 	                            <input type="password" id="board_password"> -->
<!-- 	                            <div class="txt">(4자리 이상 10자리 이하의 비밀번호를 설정 해주세요)</div> -->
<!-- 	                        </div> -->
	                        <div class="btn_wrap">
                                <div class="btn right" onclick="submit()">
	                                <div class="txt">등록</div>
	                            </div>
	                            <div class="btn left" onclick="history.back()">
	                                <div class="txt">취소</div>
	                            </div>
	                        </div>
	                    </section>
					</form>
                </div>
            </div>
            <footer>
            	<c:import url="/WEB-INF/view/main/footer.jsp"/>
            </footer>
        </div>
    </body>
    
    <script>
    	// 저장
    	function submit(){
    		var title = $("#title").val();
    		var content = $("#content").val();
    		content = content.replace(/\n/g,"<br>");
    		if(title == ""){
    			alert("제목을 입력해주세요.");
    		} else {
    			$.ajax({
    				type : "post",
    				url : "/notice/write/"+title+"/"+content+"/${login.id }",
    				async : false,
    				success : function(txt){
    					if(txt){
    						alert("등록되었습니다.");
    						location.href="/notice";
    					} else {
    						alert("등록에 실패하였습니다.\n잠시후 다시 시도해주세요.");
    					}
    				}
    			});
    		}
    	}
    </script>
    
</html>