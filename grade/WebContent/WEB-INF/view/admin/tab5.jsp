<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div class="tab_view05">
	<div class="list_btn">
        <div class="btn sel" onclick="tab5BtnSel(1)" id="tab5Btn1">인증 리스트</div>
        <div class="btn" onclick="tab5BtnSel(2)" id="tab5Btn2">인증 완료 리스트</div>
    </div>
    <div class="tab_tit">
        <div class="tit">
            <div class="img">
                <img src="/img/admin/dot.png">
            </div>
            <div class="txt">학생부 인증</div>
        </div>
    </div>
    <div class="tab_contents">
        <div class="tab_inner">
            <div class="tab_header">
                <div class="content num">번호</div>
                <div class="content c1">날짜</div>
                <div class="content c2">아이디</div>
                <div class="content c1">이름</div>
                <div class="content c3">고등학교</div>
                <div class="content c2">파일</div>
                <div class="content num">인증</div>
            </div>
            <div id="tab5Content">
	            <c:forEach var="t" begin="1" end="${certList.size() }">
	            	<div class="tab_content">
		                <div class="content num" id="tab5Auto${t }">${certList.get(t-1).auto }</div>
		                <div class="content c1">${certList.get(t-1).day }</div>
		                <div class="content c2">${certList.get(t-1).id }</div>
		                <div class="content c1">${certList.get(t-1).name }</div>
		                <div class="content c3">${certList.get(t-1).hschool }</div>
		                <div class="content c2">
			                <c:if test="${certList.get(t-1).recordFile != null }">
			                	<img src="/img/admin/view.png" onclick="tab5View(${certList.get(t-1).recordFile })">
			                </c:if>
		                </div>
		                <div class="content num">
		                    <input type="checkbox" id="tab5Cert${t }">
		                </div>
		            </div>
	            </c:forEach>
            </div>
        </div>
    </div>
    <div class="btn_wrap">
        <div class="btn cancel" onclick="location.reload()">취소</div>
        <div class="btn save" onclick="tab5Save()">저장</div>
    </div>
    <div class="page_select_wrap" id="tab5Page">
        <c:import url="/WEB-INF/view/admin/page/tab5Page.jsp" />
    </div>
</div>

<script>
	function tab5BtnSel(num){
		$(".tab_view05 .btn").removeClass(" sel");
		$("#tab5Btn"+num).addClass(" sel");
		switch(num){
		case 1:
			$.ajax({
				type : "post",
				url : "/admin/tab5/certList/1",
				async : false,
				success : function(txt){
					$("#tab5Content").html(txt);
					$.ajax({
						type : "post",
						url : "/admin/tab5/certPage",
						async : false,
						success : function(txt){
							$("#tab5Page").html(txt);
						}
					});
				}
			});
			$("#tab5BtnWrap").show();
			break;
		case 2:
			$.ajax({
				type : "post",
				url : "/admin/tab5/certEndList/1",
				async : false,
				success : function(txt){
					$("#tab5Content").html(txt);
					$.ajax({
						type : "post",
						url : "/admin/tab5/certEndPage",
						async : false,
						success : function(txt){
							$("#tab5Page").html(txt);
						}
					});
				}
			});
			$("#tab5BtnWrap").hide();
			break;
		}
	}
	function tab5Save(){
		var cert = new Array();
		for(var i=1; i<=20; i++){
			if($("#tab5Cert"+i).prop("checked")){
				cert[cert.length] = $("#tab5Auto"+i).html();
			}
		}
		if(cert.length == 0){
			alert("변경된 정보가 없습니다.");
			return;
		}
		$.ajax({
			type : "post",
			url : "/admin/tab5/cert/"+cert,
			async : false,
			success : function(txt){
				if(txt){
					alert("저장되었습니다.");
					location.reload();
				} else {
					alert("저장에 실패하였습니다.\n잠시후 다시 시도해주세요.");
				}
			}
		});
	}
	// 보기
	function tab5View(num){
		$("#popup_cover").show();
		$("#recordView").show();
		$("body").css("overflow", "hidden");
		$.ajax({
			type : "post",
			url : "/admin/tab5/recordFile/"+num,
			async : false,
			success : function(txt){
				$("#recordSlide").html(txt);
			}
		});
	}
	//보기 화살표
	var sn = 0;
	var recordNum = 0;
	$(document).ready(function(){
		$("#recordLeft").click(function(){
		    sn--;
		    $("#recordRight").show();
		    if(sn == 0){
		    	$("#recordLeft").hide();
		    }
		    $(".popup_slider_inner").stop().animate({
		        left: -900 * sn
		    });
		});
		$("#recordRight").click(function(){
			sn++;
			$("#recordLeft").show();
		    if(recordNum == (sn+1)){
		    	$("#recordRight").hide();
		    }
		    $(".popup_slider_inner").stop().animate({
		        left: -900 * sn
		    });
		});
		$("#recordClose").click(function(){
			sn = 0;
			$('#popup_cover').hide();
			$('#recordView').hide();
			$('body').css('overflow', 'auto');
			$(".popup_slider_inner").css("left", 0);
		});
	});
</script>