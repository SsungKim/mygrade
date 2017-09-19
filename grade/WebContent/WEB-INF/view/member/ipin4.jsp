<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>

<%
	/**************************************************************************************************************************
	 * Program Name  : 아이핀서비스 요청 Sample Page
	 * File Name     : ipin_result_seed
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

<!-- [(2차)결과값 수신 Sample - JSP (TEST) ] -->
<br>
<br>
<%
	// 변수 -------------------------------------------------------------------------------------------------------------
	String retInfo = "";
	String encPara = "";
	String decPara = "";

	String encMsg = ""; // HMAC 메세지

	String reqNum = ""; // 요청번호(복호화)
	String vDiscrNo = ""; // 가상식별번호
	String name = ""; // 성명
	String result = ""; // 결과값 (1인경우에만 정상)
	String age = "";
	String sex = "";
	String ip = "";
	String authInfo = ""; // 발급수단정보	
	String birth = "";
	String fgn = ""; // 외국인구분
	String discrHash = ""; // 중복가입확인정보
	String ciVersion = ""; // 연계정보 버젼
	String ciscrHash = ""; // 연계정보

	String msgChk = "N"; // 위조/변조 검증 결과

	//-----------------------------------------------------------------------------------------------------------------

	try {

		//쿠키값 가져 오기
// 		Cookie[] cookies = request.getCookies();
		String tranjectionName = "";
		String tranjectionReqNum = session.getAttribute("reqNum2").toString();
// 		if (cookies != null) {
// 			for (int i = 0; i < cookies.length; i++) {
// 				Cookie c = cookies[i];
// 				tranjectionName = c.getName();
// 				tranjectionReqNum = c.getValue();
// 				if (tranjectionName.compareTo("reqNum2") == 0)
// 					break;

// 				tranjectionReqNum = "";
// 			}
// 		}

		// Parameter 수신 --------------------------------------------------------------------
// 		retInfo = request.getParameter("retInfo").trim();
		retInfo = session.getAttribute("retInfo").toString().trim();
		retInfo = retInfo.substring(retInfo.indexOf("=")+1, retInfo.lastIndexOf("}"));
%>

<!-- [복호화 하기전 수신값] -->
<!-- <br> -->
<!-- retInfo(암호화) : -->
<%-- <%=retInfo%> --%>
<script>
<%-- 	alert("<%= retInfo %>"); --%>
<%-- 	alert("<%= tranjectionReqNum %>"); --%>
</script>
<br>
<br>
<%
	// ----------------------------------------------------------------------------------

		// 1. 암호화 모듈 (jar) Loading
		com.sci.v2.ipin.secu.SciSecuManager sciSecuMg = new com.sci.v2.ipin.secu.SciSecuManager();

		retInfo = sciSecuMg.getDec(retInfo, tranjectionReqNum);

		StringBuffer retInfoTemp = new StringBuffer("");
%>
<script>
// alert("111111111111111111111111");
<%-- alert("<%= retInfo %>"); --%>
</script>
<%
		// 2.1차 파싱---------------------------------------------------------------
		int inf1 = retInfo.indexOf("/", 0);
		int inf2 = retInfo.indexOf("/", inf1 + 1);

		encPara = retInfo.substring(0, inf1); //암호화된 통합 파라미터
		encMsg = retInfo.substring(inf1 + 1, inf2); //암호화된 통합 파라미터의 Hash값
%>
<script>
// alert("222222222222222222");
</script>
<%
		// 3.위/변조 검증 ---------------------------------------------------------------
		if (sciSecuMg.getMsg(encPara).equals(encMsg)) {
			msgChk = "Y";
		}

		if (msgChk.equals("N")) {
%>
<script language=javascript>
    alert("비정상적인 접근입니다.!!");
</script>
<%
	return;
		}
%>
<script>
// alert("333333333333333333");
</script>
<%
		// 4.파라미터별 값 가져오기 ---------------------------------------------------------------
		decPara = sciSecuMg.getDec(encPara, tranjectionReqNum);

		int info1 = decPara.indexOf("/", 0);
		int info2 = decPara.indexOf("/", info1 + 1);
		int info3 = decPara.indexOf("/", info2 + 1);
		int info4 = decPara.indexOf("/", info3 + 1);
		int info5 = decPara.indexOf("/", info4 + 1);
		int info6 = decPara.indexOf("/", info5 + 1);
		int info7 = decPara.indexOf("/", info6 + 1);
		int info8 = decPara.indexOf("/", info7 + 1);
		int info9 = decPara.indexOf("/", info8 + 1);
		int info10 = decPara.indexOf("/", info9 + 1);
		int info11 = decPara.indexOf("/", info10 + 1);
		int info12 = decPara.indexOf("/", info11 + 1);
		int info13 = decPara.indexOf("/", info12 + 1);

		reqNum = decPara.substring(0, info1);
		vDiscrNo = decPara.substring(info1 + 1, info2);		// 아이핀번호
		name = decPara.substring(info2 + 1, info3);		// 이름
		result = decPara.substring(info3 + 1, info4);		// 인증결과 : 1-성공
		age = decPara.substring(info4 + 1, info5);		// 연령대 (0~8 - 1 / 9~11 - 2 / 12~13 - 3 / 14 - 4 / 15~17 - 5 / 18 - 6 / 19 - 7 / 20이상 - 8)
		sex = decPara.substring(info5 + 1, info6);		// 성별 : m 남성 / f 여성
		ip = decPara.substring(info6 + 1, info7);		// 아이피
		authInfo = decPara.substring(info7 + 1, info8);
		// 발급수단정보(0-본인공인인증서 / 1-본인신용카드 / 2-본인핸드폰 / 3-본인대면확인 / 4-신원보증인 아이핀 / 5-신원보증인 공인인증서 / 6-신원보증인 신용카드
		//					7-신원보증인 핸드폰 / 8-신원보증인 대면확인 / 9-본인 외국인등록번호 / 10-본인 여권번호)
		birth = decPara.substring(info8 + 1, info9);		// 생년월일
		fgn = decPara.substring(info9 + 1, info10);		// 내외국인 구분 0-내국인 / 1-외국인
		discrHash = decPara.substring(info10 + 1, info11);		// 중복가입확인값
		//   ciVersion  = decPara.substring(info11+1,info12);		//CI관련 데이터는 계약시 설정하는 값입니다.  
		//	ciscrHash  = decPara.substring(info12+1,info13);		//데이터를 원하실 경우 영업팀을 통해 승인받으신후 주석제거 해주십시요

		discrHash = sciSecuMg.getDec(discrHash, tranjectionReqNum); //중복가입확인정보는 한번더 복호화
		//	ciscrHash  = sciSecuMg.getDec(ciscrHash, tranjectionReqNum); //연계정보는 한번더 복호화
%>
<script>
	console.log("<%= retInfo %>");
</script>

<!-- [복호화 후 수신값] -->
<!-- <br> -->
<!-- reqNum : -->
<%-- <%=reqNum%> --%>
<!-- <br> -->
<!-- 아이핀 : -->
<%-- <%=vDiscrNo%> --%>
<!-- <br> -->
<!-- 성명 : -->
<%-- <%=name%> --%>
<!-- <br> -->
<!-- 결과값 : -->
<%-- <%=result%> --%>
<!-- <br> -->
<!-- 연령대 : -->
<%-- <%=age%> --%>
<!-- <br> -->
<!-- 성별 : -->
<%-- <%=sex%> --%>
<!-- <br> -->
<!-- ip : -->
<%-- <%=ip%> --%>
<!-- <br> -->
<!-- 발급수단정보 : -->
<%-- <%=authInfo%> --%>
<!-- <br> -->
<!-- 생년월일 : -->
<%-- <%=birth%> --%>
<!-- <br> -->
<!-- 내/외국인구분 : -->
<%-- <%=fgn%> --%>
<!-- <br> -->
<!-- 중복가입확인정보 : -->
<%-- <%=discrHash%> --%>
<!-- <br> -->
<!--	
			연계정보 버젼 : <%=ciVersion%> <br>
			연계정보 : <%=ciscrHash%> <br>
	-->
<br>
<!-- <a href="http://.../ipin_request_seed.jsp" target="_top">[Back]</a> -->
<a href="http://www.mygrade.co.kr/member/ipin3" target="_top">[Back]</a>
<%
	// ----------------------------------------------------------------------------------

	} catch (Exception ex) {
		System.out.println("[IPIN] Receive Test Error -" + ex.getMessage());
	}
%>

<c:set var="name" value="<%= name %>"/>
<c:set var="birthDay" value="<%= birth %>"/>
<c:set var="gender" value="<%= sex %>"/>
<c:set var="result" value="<%= result %>"/>
<script>
	$(document).ready(function(){
		console.log(${result });
		if(${result == 1}){
			$.ajax({
				type : "post",
				url : "/member/join2/${name }/${birthDay }/${gender }/${result }",
				async : false,
				success : function(){
					location.href = "/member/join2";
				}
			});
		}
	});
</script>