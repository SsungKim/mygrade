<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:forEach var="t" items="${searchList }">
	<div class="detail_item1" onclick="view(${t.auto}, 'interview')">
        <div class="logo_wrap">
            <div class="sname0">
                <c:choose>
					<c:when test="${t.schoolName.indexOf('(') > 0 }">
						<span>${t.schoolName.substring(0, t.schoolName.indexOf('(')) }</span>
					</c:when>
					<c:otherwise>
						<span>${t.schoolName }</span>
					</c:otherwise>
				</c:choose>
            </div>
            <div class="inner">
                <div class="school_logo">
                    <img src="/img/university/${t.school }.png" />
                </div>
                <div class="sname">
                    <c:choose>
						<c:when test="${t.schoolName.indexOf('(') > 0 }">
							<span>${t.schoolName.substring(t.schoolName.indexOf('(')+1, t.schoolName.indexOf(')')) }</span><br>
						</c:when>
						<c:otherwise>
							<span>${t.schoolName }</span><br>
						</c:otherwise>
					</c:choose>
                    ${t.name.substring(0, 1) }
                    <c:forEach var="i" begin="1" end="${t.name.length()-1 }">O</c:forEach>
                    <div class="star_wrap">
                        <c:choose>
                            <c:when test="${t.point == 0 }">
                                <c:forEach var="i" begin="1" end="5">
                                    <div class="star">
                                        <img src="/img/interview/interview01/star02.png">
                                    </div>
                                </c:forEach>
                            </c:when>
                            <c:when test="${t.point / t.comment >= 4.5 }">
                                <c:forEach var="i" begin="1" end="5">
                                    <div class="star">
                                        <img src="/img/interview/interview01/star01.png">
                                    </div>
                                </c:forEach>
                            </c:when>
                            <c:when test="${t.point / t.comment >= 3.5 }">
                                <c:forEach var="i" begin="1" end="4">
                                    <div class="star">
                                        <img src="/img/interview/interview01/star01.png">
                                    </div>
                                </c:forEach>
                                <c:forEach var="i" begin="1" end="1">
                                    <div class="star">
                                        <img src="/img/interview/interview01/star02.png">
                                    </div>
                                </c:forEach>
                            </c:when>
                            <c:when test="${t.point / t.comment >= 2.5 }">
                                <c:forEach var="i" begin="1" end="3">
                                    <div class="star">
                                        <img src="/img/interview/interview01/star01.png">
                                    </div>
                                </c:forEach>
                                <c:forEach var="i" begin="1" end="2">
                                    <div class="star">
                                        <img src="/img/interview/interview01/star02.png">
                                    </div>
                                </c:forEach>
                            </c:when>
                            <c:when test="${t.point / t.comment >= 1.5 }">
                                <c:forEach var="i" begin="1" end="2">
                                    <div class="star">
                                        <img src="/img/interview/interview01/star01.png">
                                    </div>
                                </c:forEach>
                                <c:forEach var="i" begin="1" end="3">
                                    <div class="star">
                                        <img src="/img/interview/interview01/star02.png">
                                    </div>
                                </c:forEach>
                            </c:when>
                            <c:when test="${t.point / t.comment >= 0.5 }">
                                <c:forEach var="i" begin="1" end="1">
                                    <div class="star">
                                        <img src="/img/interview/interview01/star01.png">
                                    </div>
                                </c:forEach>
                                <c:forEach var="i" begin="1" end="4">
                                    <div class="star">
                                        <img src="/img/interview/interview01/star02.png">
                                    </div>
                                </c:forEach>
                            </c:when>
                            <c:otherwise>
                                <c:forEach var="i" begin="1" end="5">
                                    <div class="star">
                                        <img src="/img/interview/interview01/star02.png">
                                    </div>
                                </c:forEach>
                            </c:otherwise>
                        </c:choose>
                    </div>
                </div>
            </div>
        </div>
        <div class="infomation">
            <div class="department">${t.subject }</div>
            <div class="txt">${t.content1.substring(0, 30) }...</div>
            <div class="txt mobile_txt">${t.content1.substring(0, 15) }...</div>
        </div>
    </div>
</c:forEach>