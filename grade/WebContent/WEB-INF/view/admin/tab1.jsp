<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div class="tab_view01">
    <div class="select_wrap">
        <div class="tit">기간</div>
        <select id="tab1Month">
            <option value="choose">선택</option>
            <c:forEach var="t" begin="1" end="12">
            	<option ${month == t ? 'selected' : '' } value="${t }">${t }월</option>
            </c:forEach>
        </select>
    </div>
    <div id="tab1Content">
	    <div class="input_container">
	        <div class="input_wrap">
	            <div class="tit">총 금액</div>
	            <div class="cash">${payAll.get(payAll.size()-1).get("pay") }</div>
	            <div class="txt">원</div>
	        </div>
	        <div class="input_wrap">
	            <div class="tit">총 포인트</div>
	            <div class="cash">${payAll.get(payAll.size()-1).get("point") }</div>
	            <div class="txt">Point</div>
	        </div>
	    </div>
	    <div class="tab_tit">
	        <div class="tit">
	            <div class="img">
	                <img src="/img/admin/dot.png">
	            </div>
	            <div class="txt">입금자 리스트</div>
	        </div>
	        <div class="excel">
	            <img src="/img/admin/excel.png" onclick="tab1Excel()">
	        </div>
	    </div>
	    <div class="tab_contents">
            <div class="tab_header">
                <div class="content num">번호</div>
                <div class="content c1">아이디</div>
                <div class="content c2">포인트</div>
                <div class="content c3">입금액</div>
                <div class="content c3">예금주</div>
                <div class="content c1">은행</div>
                <div class="content c4">계좌번호</div>
            </div>
            <c:forEach var="t" items="${payList }">
	            <div class="tab_content">
	                <div class="content num">${t.auto }</div>
	                <div class="content c1"><span onclick="tab1UserView('${t.user }')">${t.user }</span></div>
	                <div class="content c2">${t.point }P</div>
	                <div class="content c3">${t.pay }원</div>
	                <div class="content c3">${t.name }</div>
	                <div class="content c1">${t.bank }</div>
	                <div class="content c4">${t.account }</div>
	            </div>
            </c:forEach>
	    </div>
    </div>
    <div class="page_select_wrap" id="tab1Page">
        <c:import url="/WEB-INF/view/admin/page/tab1Page.jsp" />
    </div>
</div>

<script>
	$(document).ready(function(){
		$("#tab1Month").change(function(){
			var month = $("#tab1Month").val();
			console.log(month);
			$.ajax({
				type : "post",
				url : "/admin/tab1/month/"+month,
				async : false,
				success : function(txt){
					$("#tab1Content").html(txt);
					$.ajax({
						type : "post",
						url : "/admin/tab1/monthPage/"+month,
						async : false,
						success : function(txt){
							$("#tab1Page").html(txt);
						}
					});
				}
			});
		});
	});
	function tab1UserView(user){
		location.href='/member/sales/sell?user='+user;
	}
	// 엑셀저장
	function tab1Excel(){
		location.href="/admin/tab1/excel?month="+$("#tab1Month").val();
	}
</script>