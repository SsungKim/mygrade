<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div class="tab_view02">
    <div class="input_container">
        <div class="input_wrap">
            <div class="tit">기간</div>
            <div class="cash date">
               <input class="date-picker" type="text" value="${day1 }" id="tab2Day1"/>
            </div>
            <div class="txt1">~</div>
            <div class="cash date">
               <input class="date-picker" type="text" value="${day2 }" id="tab2Day2"/>
            </div>
            <div class="img" onclick="tab2Search()">
                <img src="/img/admin/search.png">
            </div>
        </div>
    </div>
    <div id="tab2Content">
	    <div class="input_container">
	        <div class="input_wrap">
	            <div class="tit">총 금액</div>
	            <div class="cash">${price }</div>
	            <div class="txt">원</div>
	        </div>
	    </div>
	    <div class="tab_tit">
	        <div class="tit">
	            <div class="img">
	                <img src="/img/admin/dot.png">
	            </div>
	            <div class="txt">충전 리스트</div>
	        </div>
	        <div class="month" onclick="tab2Month()">
	            <img src="/img/admin/month.png">
	        </div>
	        <div class="excel">
	            <img src="/img/admin/excel.png" onclick="tab2Excel()">
	        </div>
	    </div>
	    <div class="tab_contents">
	        <div class="tab_inner">
	            <div class="tab_header">
	                <div class="content num">번호</div>
	                <div class="content c1">날짜</div>
	                <div class="content c2">아이디</div>
	                <div class="content c3">금액</div>
	                <div class="content c3">결제수단</div>
	            </div>
	            <c:forEach var="t" items="${chargeList }">
		            <div class="tab_content">
		                <div class="content num">${t.auto }</div>
		                <div class="content c1">${t.day }</div>
		                <div class="content c2">${t.id }</div>
		                <div class="content c3">${t.pay }원</div>
		                <div class="content c3">${t.applyNum == '-' ? '휴대폰' : '신용카드' }</div>
		            </div>
	            </c:forEach>
	        </div>
	    </div>
    </div>
    <div class="page_select_wrap" id="tab2Page">
        <c:import url="/WEB-INF/view/admin/page/tab2Page.jsp" />
    </div>
</div>

<script>
	$('.date-picker:text').each(function () {
		$(this).datePicker();
	});
	// 검색
	function tab2Search(){
		var day1 = $("#tab2Day1").val();
		var day2 = $("#tab2Day2").val();
		var d1 = day1.substring(0, 4)+day1.substring(day1.indexOf('-')+1, day1.lastIndexOf('-'))+day1.substring(day1.lastIndexOf('-')+1);
		var d2 = day2.substring(0, 4)+day2.substring(day2.indexOf('-')+1, day2.lastIndexOf('-'))+day2.substring(day2.lastIndexOf('-')+1);
		if(Number(d1) > Number(d2)){
			alert("올바른 기간을 선택해주세요.");
			return;
		}
		$.ajax({
			type : "post",
			url : "/admin/tab2/search/"+day1+"/"+day2,
			async : false,
			success : function(txt){
				$("#tab2Content").html(txt);
				$.ajax({
					type : "post",
					url : "/admin/tab2/searchPage/"+day1+"/"+day2,
					async : false,
					success : function(txt){
						$("#tab2Page").html(txt);
					}
				});
			}
		});
	}
	// 월별
	function tab2Month(){
		var year = $("#tab2Year").val();
		$.ajax({
			type : "post",
			url : "/admin/tab2/monthTotal/"+year,
			async : false,
			success : function(txt){
				$("#tab2Content2").html(txt);
			}
		});
		$("#popup_cover").show();
		$("#chargeListTotal").show();
		$("body").css("overflow", "hidden");
	}
	// 월별 년도 변경
	$(document).ready(function(){
		$("#tab2Year").change(function(){
			tab2Month();
		});
	});
	// 엑셀 저장
	function tab2Excel(){
		var day1 = $("#tab2Day1").val();
		var day2 = $("#tab2Day2").val();
		var d1 = day1.substring(0, 4)+day1.substring(day1.indexOf('-')+1, day1.lastIndexOf('-'))+day1.substring(day1.lastIndexOf('-')+1);
		var d2 = day2.substring(0, 4)+day2.substring(day2.indexOf('-')+1, day2.lastIndexOf('-'))+day2.substring(day2.lastIndexOf('-')+1);
		if(Number(d1) > Number(d2)){
			alert("올바른 기간을 선택해주세요.");
			return;
		}
		location.href='/admin/tab2/excel?day1='+day1+"&day2="+day2;
	}
</script>