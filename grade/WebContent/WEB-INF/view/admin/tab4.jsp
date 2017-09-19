<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div class="tab_view04">
    <div class="list_btn">
        <div class="btn sel" onclick="tab4BtnSel(1)" id="tab4Btn1">인증 리스트</div>
        <div class="btn" onclick="tab4BtnSel(2)" id="tab4Btn2">인증 완료 리스트</div>
    </div>
    <div class="tab_tit">
        <div class="tit">
            <div class="img">
                <img src="/img/admin/dot.png">
            </div>
            <div class="txt">인증 리스트</div>
        </div>
    </div>
    <div class="tab_contents">
        <div class="tab_inner">
            <div class="tab_header">
                <div class="content num">번호</div>
                <div class="content c1">날짜</div>
                <div class="content c2">아이디</div>
                <div class="content c1">이름</div>
                <div class="content c3">학교</div>
                <div class="content c4">학과</div>
                <div class="content c5">파일</div>
                <div class="content c2">인증</div>
            </div>
            <div id="tab4Content">
	            <c:forEach var="t" begin="1" end="${certList.size() }">
	            	<div class="tab_content">
		                <div class="content num" id="tab4Auto${t }">${certList.get(t-1).auto }</div>
		                <div class="content c1">${certList.get(t-1).day }</div>
		                <div class="content c2" id="tab4Id${t }">${certList.get(t-1).id }</div>
		                <div class="content c1">${certList.get(t-1).name }</div>
		                <div class="content c3">${certList.get(t-1).schoolName }</div>
		                <div class="content c4">${certList.get(t-1).subject }</div>
		                <div class="content c5"><span onclick="tab4Img('${certList.get(t-1).uuid }')">${certList.get(t-1).uuid }</span></div>
		                <div class="content c2">
		                    <div class="input_wrap">
		                        <label for="tab4Ent${t }">재학</label>
		                        <input type="checkbox" id="tab4Ent${t }" onclick="tab4Ent('${t }')">
		                    </div>
		                    <div class="input_wrap">
		                        <label for="tab4Pass${t }">합격</label>
		                        <input type="checkbox" id="tab4Pass${t }" onclick="tab4Pass('${t }')">
		                    </div>
		                </div>
		            </div>
	            </c:forEach>
	        </div>
        </div>
    </div>
    <div class="btn_wrap" id="tab4BtnWrap">
        <div class="btn cancel" onclick="location.reload()">취소</div>
        <div class="btn save" onclick="tab4Save()">저장</div>
    </div>
    <div class="page_select_wrap" id="tab4Page">
        <c:import url="/WEB-INF/view/admin/page/tab4Page.jsp" />
    </div>
</div>

<script>
	function tab4BtnSel(num){
		$(".tab_view04 .btn").removeClass(" sel");
		$("#tab4Btn"+num).addClass(" sel");
		switch(num){
		case 1:
			$.ajax({
				type : "post",
				url : "/admin/tab4/certList/1",
				async : false,
				success : function(txt){
					$("#tab4Content").html(txt);
					$.ajax({
						type : "post",
						url : "/admin/tab4/certPage",
						async : false,
						success : function(txt){
							$("#tab4Page").html(txt);
						}
					});
				}
			});
			$("#tab4BtnWrap").show();
			break;
		case 2:
			$.ajax({
				type : "post",
				url : "/admin/tab4/certEndList/1",
				async : false,
				success : function(txt){
					$("#tab4Content").html(txt);
					$.ajax({
						type : "post",
						url : "/admin/tab4/certEndPage",
						async : false,
						success : function(txt){
							$("#tab4Page").html(txt);
						}
					});
				}
			});
			$("#tab4BtnWrap").hide();
			break;
		}
	}
	var entId = new Array();
	var entNum = new Array();
	function tab4Ent(num){
		for(var i=0; i<entId.length; i++){
			if(entId[i] == $("#tab4Id"+num).html()){
				if(entNum[i] == num){
					$("#tab4Ent"+num).prop("checked", false);
					entId[i] = 0;
					entNum[i] = 0;
					return;
				}
				alert("한 아이디당 재학인증은 한 학교에만 가능합니다.");
				$("#tab4Ent"+num).prop("checked", false);
				$("#tab4Pass"+num).prop("checked") ? $("#tab4Pass"+num).prop("checked", true) : $("#tab4Pass"+num).prop("checked", false);
				return;
			}
		}
		entId[entId.length] = $("#tab4Id"+num).html();
		entNum[entNum.length] = num;
		if($("#tab4Ent"+num).prop("checked")){
			$("#tab4Pass"+num).prop("checked", false);
		}
	}
	function tab4Pass(num){
		if($("#tab4Ent"+num).prop("checked")){
			alert("재학, 합격인증은 하나만 가능합니다.");
			$("#tab4Pass"+num).prop("checked", false);
		}
	}
	function tab4Save(){
		var ent = new Array();
		var pass = new Array();
		for(var i=1; i<=20; i++){
			if($("#tab4Ent"+i).prop("checked")){
				ent[ent.length] = $("#tab4Auto"+i).html();
			}
			if($("#tab4Pass"+i).prop("checked")){
				pass[pass.length] = $("#tab4Auto"+i).html();
			}
		}
		ent = ent.length > 0 ? ent : "0";
		pass = pass.length > 0 ? pass : "0";
		$.ajax({
			type : "post",
			url : "/admin/tab4/cert/"+ent+"/"+pass,
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
	// 파일 보기
	function tab4Img(uuid){
		var src = "/file/school/"+uuid;
		$("#dataImg").prop("src", src);
		$("#showImg").show();
		$("#popup_cover").show();
		$("body").css("overflow", "hidden");
	}
</script>