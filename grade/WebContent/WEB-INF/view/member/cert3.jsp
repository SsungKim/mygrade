<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="java.util.regex.*"%>
<%@ page import="java.text.*"%>

<%
	//************************************************************************
	//																		//
	//		본 샘플소스는 개발 및 테스트를 위한 목적으로 만들어졌으며,		//
	//																		//
	//		실제 서비스에 그대로 사용하는 것을 금합니다.					//
	//																		//
	//************************************************************************
%>
<%
	response.setHeader("Pragma", "no-cache"); // HTTP1.0 캐쉬 방지
	response.setDateHeader("Expires", 0); // proxy 서버의 캐쉬 방지
	response.setHeader("Pragma", "no-store"); // HTTP1.1 캐쉬 방지
	if (request.getProtocol().equals("HTTP/1.1"))
		response.setHeader("Cache-Control", "no-cache"); // HTTP1.1 캐쉬 방지
%>
<%
	String rec_cert = ""; // 결과값(암호화)
	String certNum = ""; // certNum

	rec_cert = request.getParameter("rec_cert").trim();
	certNum = request.getParameter("certNum").trim();

	// 파라미터 유효성 검증
	if (rec_cert.length() == 0 || certNum.length() == 0) {
		out.println("<script> alert('결과값 비정상');");
		return;
	}
%>
<html oncontextmenu='return false' ondragstart='return false' onselectstart='return false'>
<head>
<meta name="robots" content="noindex">
<script type="text/javascript">
	var move_page_url;
	

	function end() {
		console.log("end()");
		console.log("<%= rec_cert %>");
   		var UserAgent = navigator.userAgent;
   		
   		var move_page_url = "http://www.mygrade.co.kr/member/cert4";
   		
    	/* 모바일 접근 체크*/
    	// 모바일일 경우 (변동사항 있을경우 추가 필요)
    	if (UserAgent.match(/iPhone|iPod|Android|Windows CE|BlackBerry|Symbian|Windows Phone|webOS|Opera Mini|Opera Mobi|POLARIS|IEMobile|lgtelecom|nokia|SonyEricsson/i) != null || UserAgent.match(/LG|SAMSUNG|Samsung/) != null) {
//     		move_page_url = "http://www.mygrade.co.kr/member/join2";
    		document.kmcis_form.action = move_page_url;
		    document.kmcis_form.submit();
// 			$("#kmcis").submit();
	  	} 
	  
	  	// 모바일이 아닐 경우
	  	else {
	  		console.log("end() else");
// 	  		move_page_url = "http://www.mygrade.co.kr/member/cert4";
	  		document.kmcis_form.action = move_page_url;
// 	  		opener.window.name = "certification";
// 			document.kmcis_form.target = opener.window.name;
// 			$("#kmcis").prop("target", opener.window.name);
			console.log(document.kmcis_form.target);
		  	document.kmcis_form.submit();
// 			$("#kmcis").submit();
// 			self.close();
	  	}
	}
</script>
</head>
<body onload="javascript:end()">
	<form id="kmcis_form" name="kmcis_form" method="post">
		<input type="hidden" name="rec_cert" id="rec_cert" value="<%=rec_cert%>" />
		<input type="hidden" name="certNum" id="certNum" value="<%=certNum%>" />
	</form>
</body>
</html>