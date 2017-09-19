<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%
	response.setHeader("Cache-Control", "no-cache");
	response.setHeader("Pragma", "no-cache");
%>
<%
	String param = "";
	String retInfo = request.getParameter("retInfo").trim();
	param = "?retInfo=" + retInfo;
%>
<c:set var="param" value="<%= retInfo %>"/>
<html oncontextmenu='return false' ondragstart='return false' onselectstart='return false'>
<head>
<script language="JavaScript">
	function end() {
<%-- 		window.opener.location.href = 'http://.../ipin_result_seed.jsp<%=param%>'; --%>
<%-- 		window.opener.location.href = 'http://www.mygrade.co.kr/member/ipin4<%=param%>'; --%>
		window.opener.location.href = "/member/join22/${param }";
		self.close();
	}
</script>
</head>
<body onload="javascript:end()">
</body>
</html>