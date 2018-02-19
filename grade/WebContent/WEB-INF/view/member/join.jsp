<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="java.util.*"%>
<%@ page import="java.util.regex.*"%>
<%@ page import="java.text.*"%>

<%
	response.setHeader("Pragma", "no-cache");
	response.setDateHeader("Expires", 0);
	response.setHeader("Pragma", "no-store");
	response.setHeader("Cache-Control", "no-cache");
%>
<%
	//////////////////////////////////////// 본인인증서비스 ///////////////////////////////////////////
	//tr_cert 데이터 변수 선언 ---------------------------------------------------------------
	String tr_cert = "";
	String cpId = request.getParameter("cpId"); // 회원사ID
	cpId = "TSGM1001";
	String urlCode = request.getParameter("urlCode"); // URL코드
	urlCode = "011001";
	//날짜 생성
    Calendar today = Calendar.getInstance();
    SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
    String day = sdf.format(today.getTime());

    java.util.Random ran = new Random();
    //랜덤 문자 길이
    int numLength = 6;
    String randomStr = "";

    for (int i = 0; i < numLength; i++) {
        //0 ~ 9 랜덤 숫자 생성
        randomStr += ran.nextInt(10);
    }

	//reqNum은 최대 40byte 까지 사용 가능
    String reqNum = day + randomStr;
	String certNum = request.getParameter("certNum"); // 요청번호
	certNum = reqNum;
	String date = request.getParameter("date"); // 요청일시
	date = day;
	String certMet = request.getParameter("certMet"); // 본인인증방법
	certMet = "M";
	String name = request.getParameter("name"); // 성명
	name = "";
	String phoneNo = request.getParameter("phoneNo"); // 휴대폰번호
	phoneNo = "";
	String phoneCorp = request.getParameter("phoneCorp"); // 이동통신사
	phoneCorp = "";
// 	if (phoneCorp == null)
// 		phoneCorp = "";
	String birthDay = request.getParameter("birthDay"); // 생년월일
	birthDay = "";
	String gender = request.getParameter("gender"); // 성별
	gender = "";
// 	if (gender == null)
// 		gender = "";
	String nation = request.getParameter("nation"); // 내외국인 구분
	nation = "";
	String plusInfo = request.getParameter("plusInfo"); // 추가DATA정보
	plusInfo = "";
	String extendVar = "0000000000000000"; // 확장변수
	//End-tr_cert 데이터 변수 선언 ---------------------------------------------------------------

	String tr_url = request.getParameter("tr_url"); // 본인인증서비스 결과수신 POPUP URL
	tr_url = "http://www.mygrade.co.kr/member/cert3";
	String tr_add = request.getParameter("tr_add"); // IFrame사용여부
	tr_add = "N";

	/** certNum 주의사항 **************************************************************************************
	* 1. 본인인증 결과값 복호화를 위한 키로 활용되므로 중요함.
	* 2. 본인인증 요청시 중복되지 않게 생성해야함. (예-시퀀스번호)
	* 3. certNum값은 본인인증 결과값 수신 후 복호화키로 사용함.
	       tr_url값에 certNum값을 포함해서 전송하고, (tr_url = tr_url + "?certNum=" + certNum;)
		   tr_url에서 쿼리스트링 형태로 certNum값을 받으면 됨. (certNum = request.getParameter("certNum"); )
	*
	***********************************************************************************************************/
	//////////////////////////////////////// 본인인증서비스 ///////////////////////////////////////////
%>
<%!
	//////////////////////////////////////// 본인인증서비스 ///////////////////////////////////////////
	// 파라미터 유효성 검증 --------------------------------------------
	boolean b = true;
	String regex = "";
	String regex1 = "";

	public Boolean paramChk(String patn, String param) {
		Pattern pattern = Pattern.compile(patn);
		Matcher matcher = pattern.matcher(param);
		b = matcher.matches();
		return b;
	}
	//////////////////////////////////////// 본인인증서비스 ///////////////////////////////////////////
%>
<%
	//////////////////////////////////////// 본인인증서비스 ///////////////////////////////////////////
	//01. 한국모바일인증(주) 암호화 모듈 선언
	com.icert.comm.secu.IcertSecuManager seed = new com.icert.comm.secu.IcertSecuManager();

	//02. 1차 암호화 (tr_cert 데이터변수 조합 후 암호화)
	String enc_tr_cert = "";
	tr_cert = cpId + "/" + urlCode + "/" + certNum + "/" + date + "/" + certMet + "/" + birthDay + "/" + gender
			+ "/" + name + "/" + phoneNo + "/" + phoneCorp + "/" + nation + "/" + plusInfo + "/" + extendVar;
	enc_tr_cert = seed.getEnc(tr_cert, "");

	//03. 1차 암호화 데이터에 대한 위변조 검증값 생성 (HMAC)
	String hmacMsg = "";
	hmacMsg = seed.getMsg(enc_tr_cert);

	//04. 2차 암호화 (1차 암호화 데이터, HMAC 데이터, extendVar 조합 후 암호화)
	tr_cert = seed.getEnc(enc_tr_cert + "/" + hmacMsg + "/" + extendVar, "");
	//////////////////////////////////////// 본인인증서비스 ///////////////////////////////////////////
%>
<script language=javascript>
	//////////////////////////////////////// 본인인증서비스 ///////////////////////////////////////////
<!--
   window.name = "kmcis_web_sample";
   
   var KMCIS_window;

   function openKMCISWindow(){    

    var UserAgent = navigator.userAgent;
    /* 모바일 접근 체크*/
    // 모바일일 경우 (변동사항 있을경우 추가 필요)
    if (UserAgent.match(/iPhone|iPod|Android|Windows CE|BlackBerry|Symbian|Windows Phone|webOS|Opera Mini|Opera Mobi|POLARIS|IEMobile|lgtelecom|nokia|SonyEricsson/i) != null || UserAgent.match(/LG|SAMSUNG|Samsung/) != null) {
   		 document.reqKMCISForm.target = '';
	  } 
	  
	  // 모바일이 아닐 경우
	  else {
   		KMCIS_window = window.open('', 'KMCISWindow', 'width=425, height=550, resizable=0, scrollbars=no, status=0, titlebar=0, toolbar=0, left=435, top=250' );
   		
   		if(KMCIS_window == null){
  			alert(" ※ 윈도우 XP SP2 또는 인터넷 익스플로러 7 사용자일 경우에는 \n    화면 상단에 있는 팝업 차단 알림줄을 클릭하여 팝업을 허용해 주시기 바랍니다. \n\n※ MSN,야후,구글 팝업 차단 툴바가 설치된 경우 팝업허용을 해주시기 바랍니다.");
      }
   		
   		document.reqKMCISForm.target = 'KMCISWindow';
	  }
	  
	  document.reqKMCISForm.action = 'https://www.kmcert.com/kmcis/web/kmcisReq.jsp';
	  document.reqKMCISForm.submit();
  }
//-->
	//////////////////////////////////////// 본인인증서비스 ///////////////////////////////////////////
</script>

<%
	//////////////////////////////////////// 아이핀서비스 ///////////////////////////////////////////
	java.util.Random ran2 = new Random();
	//랜던 문자 길이
	int numLength2 = 16;
	String randomStr2 = "";
	
	for (int i = 0; i < numLength2; i++) {
		//0 ~ 9 랜덤 숫자 생성
		randomStr2 += ran2.nextInt(10);
	}
	
	String reqNum2 = randomStr2;
	
// 	Cookie c = new Cookie("reqNum2", reqNum2);
// 	c.setMaxAge(1800); // <==초단위로 설정됩니다.
// 	c.setPath("/");
// 	session.setAttribute("reqNum2", reqNum2);
// 	response.addCookie(c);
	String id = "TGP001"; //회원사 ID
// 	String reqNum = ""; //요청번호
	String retUrl = "23http://www.mygrade.co.kr/member/ipin2/"+reqNum2; //결과 수신 URL
	String srvNo = "001002"; //서비스번호
	String exVar = "0000000000000000"; // 복호화용 임시필드

// 	id = request.getParameter("id").trim();
// 	reqNum2 = request.getParameter("reqNum2").trim();
// 	retUrl = request.getParameter("retUrl").trim();
// 	srvNo = request.getParameter("srvNo").trim();

	// 암호화 모듈 선언

	com.sci.v2.ipin.secu.SciSecuManager seed2 = new com.sci.v2.ipin.secu.SciSecuManager();

	// 1차 암호화
	String encStr = "";
	String reqInfo = reqNum2 + "/" + id + "/" + srvNo + "/" + exVar; // 데이터 암호화
	encStr = seed2.getEncPublic(reqInfo);

	// 위변조 검증 값 등록
	com.sci.v2.ipin.secu.hmac.SciHmac hmac = new com.sci.v2.ipin.secu.hmac.SciHmac();
	String hmacMsg2 = hmac.HMacEncriptPublic(encStr);

	// 2차 암호화
	reqInfo = seed2.getEncPublic(encStr + "/" + hmacMsg2 + "/" + "00000000"); //2차암호화
	//////////////////////////////////////// 아이핀서비스 ///////////////////////////////////////////
%>
<%-- <c:set var="reqNum2" value="<%= reqNum2 %>"/> --%>
<script language=javascript>  
	//////////////////////////////////////// 아이핀서비스 ///////////////////////////////////////////
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
	//////////////////////////////////////// 아이핀서비스 ///////////////////////////////////////////
</script>

<!doctype html>
<html oncontextmenu='return false' ondragstart='return false' onselectstart='return false'>
    <head>
    	<c:import url="/WEB-INF/view/main/head.jsp"/>
    </head>
     
    <body>
        <div id="wrapper">
            <div class="join01_01">
            	<c:import url="/WEB-INF/view/main/side.jsp"/>
                <header class="sub_header">
                    <div class="hmenubar">
                        <img src="/img/hmenubar.png">
                    </div>
                    <c:import url="/WEB-INF/view/main/login.jsp"/>
                </header>
                <div class="page_inner">
                    <div class="logo">
                        <img src="/img/logo.png" onclick="location.href='/'">
                    </div>
                    <section class="join_tit_wrap">
                        <div class="join_tit">
                            <div class="img">
                                <img src="/img/join/join01_01/people.png">
                            </div>
                            <div class="tit">회원가입 절차</div>
                        </div>
                        <div class="join_step">
                            <span>1.실명확인 및 약관동의</span> > 2.회원 정보작성 > 3.가입완료
                        </div>
                    </section>
                    <section class="section01">
                        <div class="inner">
                            <div class="join_terms_wrap">
                                <div class="join_terms">
                                	<c:import url="/WEB-INF/view/member/term1.jsp"/>
                                </div>
                                <div class="join_terms">
                                	<c:import url="/WEB-INF/view/member/term2.jsp"/>
                                </div>
                            </div>
                            <div class="confirm_wrap">
                                <div class="confirm_inner">
                                    <div class="confirm_tit">
                                        <div class="dot"></div>
                                        <div class="tit">본인 실명확인</div>
                                    </div>
                                    <div class="confirm_contents">
                                        <div class="confirm">
                                            <div class="icon">
                                                <div class="img">
                                                    <img src="/img/join/join01_01/phone.png">
                                                </div>
                                            </div>
                                            <div class="txt" onclick="certification('phone')">휴대폰 인증하기</div>
                                        </div>
                                        <div class="confirm">
                                            <div class="icon">
                                                <div class="img">
                                                    <img src="/img/join/join01_01/ipin.png">
                                                </div>
                                            </div>
                                            <div class="txt" onclick="certification('ipin')">아이핀 인증하기</div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </section>
                </div>
            </div>
            <footer>
            	<c:import url="/WEB-INF/view/main/footer.jsp"/>
            </footer>
        </div>
        <!-- ////////////////////////////////////////본인인증서비스 /////////////////////////////////////////// -->
        <form name="reqKMCISForm" method="post" action="#" style="display: none; ">
			<input type="hidden" name="tr_cert" value="<%=tr_cert%>">
			<input type="hidden" name="tr_url" value="<%=tr_url%>">
			<input type="hidden" name="tr_add" value="<%=tr_add%>">
			<input type="submit" value="본인인증서비스 요청" onclick="javascript:openKMCISWindow();" id="submitForm">
		</form>
		<!-- ////////////////////////////////////////본인인증서비스 /////////////////////////////////////////// -->
		<!-- //////////////////////////////////////// 아이핀서비스 /////////////////////////////////////////// -->
		<form name="reqCBAForm" method="post" action="" style="display: none; ">
			<input type="hidden" name="reqInfo" value="<%=reqInfo%>">
			<!--실명확인 회원사 아이디-->
			<input type="hidden" name="retUrl" value="<%=retUrl%>">
			<!--실명확인 결과수신 URL-->
			<input type="hidden" name="verSion" value="1">
			<!--모듈 버전정보-->
			<input type="submit" value="본인확인 요청"
				onclick="javascript:openCBAWindow();" id="reqCBAForm">
		</form>
		<!-- //////////////////////////////////////// 아이핀서비스 /////////////////////////////////////////// -->
    </body>
    
    <script>
    	// 인증
    	function certification(type){
    		var agree1 = $("#agree1").prop("checked");
    		var agree2 = $("#agree2").prop("checked");
    		if(agree1 && agree2){
	    		if(type == 'phone'){
					$("#submitForm").trigger("click");
	    		} else if(type == 'ipin'){
					$("#reqCBAForm").trigger("click");
	    		}
    		} else {
    			alert("약관에 동의해주세요.");
    		}
    	}
    </script>
    
</html>