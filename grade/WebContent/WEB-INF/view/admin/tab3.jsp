<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div class="tab_view03">
    <div class="input_wrap">
        <div class="cash date">
           <input class="date-picker" type="text" value="${day1 }" id="tab3Day1"/>
        </div>
        <div class="txt1">~</div>
        <div class="cash date">
           <input class="date-picker" type="text" value="${day2 }" id="tab3Day2"/>
        </div>
        <div class="img" onclick="tab3Search()">
            <img src="/img/admin/search.png">
        </div>
    </div>
    <div class="tab_tit">
        <div class="tit">
            <div class="img">
                <img src="/img/admin/dot.png">
            </div>
            <div class="txt">사용 리스트</div>
        </div>
    </div>
    <div class="tab_contents" id="tab3Content">
        <div class="tab_inner">
            <div class="tab_header">
                <div class="content num">번호</div>
                <div class="content c1">날짜</div>
                <div class="content c2">아이디</div>
                <div class="content c1">내역</div>
                <div class="content c3">
                    <div class="top">상세내역</div>
                    <div class="bottom">
                        <div class="content c4 c4_1">판매자아이디</div>
                        <div class="content c4 c4_2">학교</div>
                        <div class="content c4 c4_3">학과</div>
                    </div>
                </div>
                <div class="content c5">
                    <div class="top">${p1 }P</div>
                    <div class="bottom">포인트</div>
                </div>
                <div class="content c5">
                    <div class="top">${p2 }P</div>
                    <div class="bottom">회사분</div>
                </div>
                <div class="content c5">
                    <div class="top">${p3 }P</div>
                    <div class="bottom">판매자분</div>
                </div>
            </div>
            <c:forEach var="t" items="${useList }">
	            <div class="tab_content">
	                <div class="content num">${t.auto }</div>
	                <div class="content c1">${t.day }</div>
	                <div class="content c2">
	                	<span onclick="tab3UseView(${t.user })">${t.id }</span>
	                </div>
	                <div class="content c1">${t.item }</div>
	                <div class="content c4 c4_1">${t.owner }</div>
	                <div class="content c4 c4_2">${t.schoolName }</div>
	                <div class="content c4 c4_3">${t.subject }</div>
	                <div class="content c5">${t.point }P</div>
	                <div class="content c5">${t.point1 }P</div>
	                <div class="content c5">${t.point2 }P</div>
	            </div>
            </c:forEach>
        </div>
    </div>
    <div class="page_select_wrap">
        <c:import url="/WEB-INF/view/admin/page/tab3Page.jsp" />
    </div>
</div>

<script>
	$('.date-picker:text').each(function () {
		$(this).datePicker();
	});
	// 아이디 클릭
	function tab3UseView(user){
		location.href='/member/sales/buy?user='+user;
	}
	// 검색
	function tab3Search(){
		var day1 = $("#tab3Day1").val();
		var day2 = $("#tab3Day2").val();
		var d1 = day1.substring(0, 4)+day1.substring(day1.indexOf('-')+1, day1.lastIndexOf('-'))+day1.substring(day1.lastIndexOf('-')+1);
		var d2 = day2.substring(0, 4)+day2.substring(day2.indexOf('-')+1, day2.lastIndexOf('-'))+day2.substring(day2.lastIndexOf('-')+1);
		if(Number(d1) > Number(d2)){
			alert("올바른 기간을 선택해주세요.");
			return;
		}
		$.ajax({
			type : "post",
			url : "/admin/tab3/search/"+day1+"/"+day2,
			async : false,
			success : function(txt){
				$("#tab3Content").html(txt);
				$.ajax({
					type : "post",
					url : "/admin/tab3/searchPage/"+day1+"/"+day2,
					async : false,
					success : function(txt){
						$("#tab3Page").html(txt);
					}
				});
			}
		});
	}
</script>