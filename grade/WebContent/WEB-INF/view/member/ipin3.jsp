<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>

<%
	/**************************************************************************************************************************
	 * Program Name  : 아이핀서비스 요청 Sample Page
	 * File Name     : ipin_request_seed
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
<html oncontextmenu='return false' ondragstart='return false' onselectstart='return false'>
<head>
<title>SIREN24 아이핀 서비스 Sample 화면</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

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
	String id = "TGP001"; //회원사 ID
// 	String reqNum = ""; //요청번호
	String retUrl = "23http://www.mygrade.co.kr/member/ipin2"; //결과 수신 URL
	String srvNo = "001003"; //서비스번호
	String exVar = "0000000000000000"; // 복호화용 임시필드

// 	id = request.getParameter("id").trim();
// 	reqNum = request.getParameter("reqNum").trim();
// 	retUrl = request.getParameter("retUrl").trim();
// 	srvNo = request.getParameter("srvNo").trim();

	// 암호화 모듈 선언

	com.sci.v2.ipin.secu.SciSecuManager seed = new com.sci.v2.ipin.secu.SciSecuManager();

	// 1차 암호화
	String encStr = "";
	String reqInfo = reqNum + "/" + id + "/" + srvNo + "/" + exVar; // 데이터 암호화
	encStr = seed.getEncPublic(reqInfo);

	// 위변조 검증 값 등록
	com.sci.v2.ipin.secu.hmac.SciHmac hmac = new com.sci.v2.ipin.secu.hmac.SciHmac();
	String hmacMsg = hmac.HMacEncriptPublic(encStr);

	// 2차 암호화
	reqInfo = seed.getEncPublic(encStr + "/" + hmacMsg + "/" + "00000000"); //2차암호화
%>

<script language=javascript>  
<!--
    var CBA_window; 

    function openCBAWindow(){ 
        CBA_window = window.open('', 'IPINWindow', 'width=450, height=500, resizable=0, scrollbars=no, status=0, titlebar=0, toolbar=0, left=300, top=200' );

        if(CBA_window == null){ 
			alert(" ※ 윈도우 XP SP2 또는 인터넷 익스플로러 7 사용자일 경우에는 \n    화면 상단에 있는 팝업 차단 알림줄을 클릭하여 팝업을 허용해 주시기 바랍니다. \n\n※ MSN,야후,구글 팝업 차단 툴바가 설치된 경우 팝업허용을 해주시기 바랍니다.");
        }

		document.reqCBAForm.action = 'https://ipin.siren24.com/i-PIN/jsp/ipin_j10.jsp';
        document.reqCBAForm.target = 'IPINWindow';
    }
//-->
</script>

</head>

<body bgcolor="#FFFFFF" topmargin=0 leftmargin=0 marginheight=0
	marginwidth=0>

	<center>
		<br>
		<br>
		<br>
		<br>
		<br>
		<br> <span class="style1">SIREN24 아이핀 서비스 요청화면 Sample입니다.</span><br>
		<br>
		<br>

		<table cellpadding=1 cellspacing=1>
			<tr>
				<td align=center>회원사아이디</td>
				<td align=left><%=id%></td>
			</tr>
			<tr>
				<td align=center>요청번호</td>
				<td align=left><%=reqNum%></td>
			</tr>
			<tr>
				<td align=center>결과수신URL</td>
				<td align=left><%=retUrl%></td>
			</tr>
			<tr>
				<td align=center>서비스번호</td>
				<td align=left><%=srvNo%></td>
			</tr>

			<tr>
				<td align=center>&nbsp</td>
				<td align=left>&nbsp</td>
			</tr>
			<tr width=100>
				<td align=center>요청정보(암호화)</td>
				<td align=left><%=reqInfo.substring(0, 50)%>...</td>
			</tr>
		</table>

		<!--실명확인팝업 요청 form --------------------------->
		<form name="reqCBAForm" method="post" action="">
			<input type="hidden" name="reqInfo" value="<%=reqInfo%>">
			<!--실명확인 회원사 아이디-->
			<input type="hidden" name="retUrl" value="<%=retUrl%>">
			<!--실명확인 결과수신 URL-->
			<input type="hidden" name="verSion" value="1">
			<!--모듈 버전정보-->
			<input type="submit" value="본인확인 요청"
				onclick="javascript:openCBAWindow();" id="reqCBAForm">
		</form>
		<!--End 실명확인팝업 요청 form ----------------------->

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