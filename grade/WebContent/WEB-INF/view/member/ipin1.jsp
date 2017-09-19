<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>

<%
	/*************************************************************************************************************************
	* Program Name  : 아이핀서비스 요청 Sample Page
	* File Name     : ipin_input_seed
	* Comment       : 
	* History       : Version 1.0
	**************************************************************************************************************************/
%>

<%
	response.setHeader("Pragma", "no-cache");
	response.setDateHeader("Expires", 0);
	response.setHeader("Pragma", "no-store");
	response.setHeader("Cache-Control", "no-cache");
%>
<%
	java.util.Random ran = new Random();
	//랜던 문자 길이
	int numLength = 16;
	String randomStr = "";

	for (int i = 0; i < numLength; i++) {
		//0 ~ 9 랜덤 숫자 생성
		randomStr += ran.nextInt(10);
	}

	String reqNum = randomStr;

	Cookie c = new Cookie("reqNum", reqNum);
	c.setMaxAge(1800); // <==초단위로 설정됩니다.
	response.addCookie(c);
%>
<html oncontextmenu='return false' ondragstart='return false' onselectstart='return false'>
<head>
<title>아이핀 서비스 Sample 화면</title>
<meta http-equiv="Content-Type" content="text/html; charset=euc-kr">
<style>
<!--
body, p, ol, ul, td {
	font-family: 굴림;
	font-size: 12px;
}

a:link {
	size: 9px;
	color: #000000;
	text-decoration: none;
	line-height: 12px
}

a:visited {
	size: 9px;
	color: #555555;
	text-decoration: none;
	line-height: 12px
}

a:hover {
	color: #ff9900;
	text-decoration: none;
	line-height: 12px
}

.style1 {
	color: #6b902a;
	font-weight: bold;
}

.style2 {
	color: #666666
}

.style3 {
	color: #3b5d00;
	font-weight: bold;
}
-->
</style>
</head>
<body bgcolor="#FFFFFF" topmargin=0 leftmargin=0 marginheight=0
	marginwidth=0>

	<center>
		<br>
		<br>
		<br>
		<br>
		<br>
		<br> <span class="style1">아이핀 서비스 요청화면 Sample입니다.</span><br>

<!-- 		<form name="reqCBAForm" method="post" action="ipin_request_seed.jsp"> -->
		<form name="reqCBAForm" method="post" action="/member/ipin3">

			<table cellpadding=1 cellspacing=1>
				<tr>
					<td align=center>회원사 ID</td>
					<td align=left><input type="text" name="id" size='41'
						maxlength='8' value="TGP001"></td>
				</tr>
				<tr>
					<td align=center>요청번호</td>
					<td align=left><input type="text" name="reqNum" size='41'
						maxlength='30' value='<%=reqNum%>'></td>
				</tr>
				<tr>
					<td align=center>결과수신URL</td>
					<!-- 결과수신 URL(23http:// 포함한 주소) -->
					<!-- 23http:// 인 경우 - 동일 프레임에서 결과 수신하는 경우
															   24http:// 인 경우 - 부모창에서 결과 수신하는 경우 -->
					<td align=left>
<!-- 					<input type="text" name="retUrl" size='41' maxlength='6' value="23http://.../ipin_popup_seed.jsp"></td> -->
					<input type="text" name="retUrl" size='41' maxlength='6' value="23http://www.mygrade.co.kr/member/ipin2"></td>
				</tr>
				<tr>
					<td align=center>서비스번호</td>
					<td><input type="text" name="srvNo" size='41' maxlength='6'
						value="001001"></td>
				</tr>
			</table>
			<br>
			<br> <input type="submit" value="아이핀서비스 요청">



		</form>


		<br> <br>
		<table width="450" border="0" cellspacing="0" cellpadding="0">
			<tr>
				<td width="130"><a
					href=http://www.siren24.com/v2alimi/comm/jsp/v2alimiAuth.jsp?id=SIR005&svc_seq=01
					target=blank><img
						src="http://ntest.siren24.com/name/images/logo01.gif" width="122"
						height="41" border=0></a></td>
				<td width="320"><span class="style2">본 사이트는 SCI평가정보(주)의
						<span class="style3">명의도용방지서비스</span> 협약사이트 입니다. 타인의 명의를 도용하실 경우
						관련법령에 따라 처벌 받으실 수 있습니다.
				</span></td>
			</tr>
		</table>
		<br> <br> <br> 이 Sample화면은 i-PIN 서비스 요청화면 개발시 참고가 되도록
		제공하고 있는 화면입니다.<br> <br>
	</center>

</BODY>
</HTML>