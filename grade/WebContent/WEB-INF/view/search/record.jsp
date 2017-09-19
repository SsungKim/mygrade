<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:forEach var="t" items="${searchList }">
	<div class="detail_item" onclick="view(${t.auto }, '${searchType }')">
		<div class="inner">
            <div class="school_logo">
                <img src="/img/university/${t.school }.png">
            </div>
            <div class="department">${t.schoolName }</div>
            <div class="infomation">
                <div class="name">${t.subject }</div>
                <div class="name">
                    ${t.name.substring(0, 1) }
                    <c:forEach var="i" begin="1" end="${t.name.length()-1 }">
                        O
                    </c:forEach>
                </div>
                <div class="entrance_wrap">
                    <div class="img">
                        <img src="/img/student_grade/entrance_img.png">
                    </div>
                    <div class="txt">${t.year }</div>
                </div>
            </div>
        </div>
	</div>
</c:forEach>