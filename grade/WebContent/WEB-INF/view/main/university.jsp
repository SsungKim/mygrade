<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:choose>
	<c:when test="${place == '서울' }">
		<option value="choose">대학선택</option>
		<option value="145" ${school == '145' ? 'selected' : '' }>KC대학교</option>
		<option value="101" ${school == '101' ? 'selected' : '' }>가톨릭대학교</option>
		<option value="101-1" ${school == '101-1' ? 'selected' : '' }>가톨릭대학교(성신교정)</option>
		<option value="101-3" ${school == '101-3' ? 'selected' : '' }>가톨릭대학교(성의교정)</option>
		<option value="102" ${school == '102' ? 'selected' : '' }>감리교신학대학교</option>
		<option value="103" ${school == '103' ? 'selected' : '' }>건국대학교</option>
		<option value="803-1" ${school == '803-1' ? 'selected' : '' }>경기대학교(서울캠퍼스)</option>
		<option value="104" ${school == '104' ? 'selected' : '' }>경희대학교</option>
		<option value="105" ${school == '105' ? 'selected' : '' }>고려대학교</option>
		<option value="106" ${school == '106' ? 'selected' : '' }>광운대학교</option>
		<option value="107" ${school == '107' ? 'selected' : '' }>국민대학교</option>
		<option value="108" ${school == '108' ? 'selected' : '' }>그리스도대학교</option>
		<option value="109" ${school == '109' ? 'selected' : '' }>덕성여자대학교</option>
		<option value="109-1" ${school == '109-1' ? 'selected' : '' }>덕성여자대학교(쌍문캠퍼스)</option>
		<option value="109-2" ${school == '109-2' ? 'selected' : '' }>덕성여자대학교(종로캠퍼스)</option>
		<option value="110" ${school == '110' ? 'selected' : '' }>동국대학교</option>
		<option value="111" ${school == '111' ? 'selected' : '' }>동덕여자대학교</option>
		<option value="112" ${school == '112' ? 'selected' : '' }>명지대학교</option>
		<option value="113" ${school == '113' ? 'selected' : '' }>삼육대학교</option>
		<option value="114" ${school == '114' ? 'selected' : '' }>상명대학교</option>
		<option value="115" ${school == '115' ? 'selected' : '' }>서강대학교</option>
		<option value="116" ${school == '116' ? 'selected' : '' }>서경대학교</option>
		<option value="117" ${school == '117' ? 'selected' : '' }>서울과학기술대학교</option>
		<option value="118" ${school == '118' ? 'selected' : '' }>서울교육대학교</option>
		<option value="119" ${school == '119' ? 'selected' : '' }>서울기독대학교</option>
		<option value="120" ${school == '120' ? 'selected' : '' }>서울대학교</option>
		<option value="120-1" ${school == '120-1' ? 'selected' : '' }>서울대학교(연건캠퍼스)</option>
		<option value="121" ${school == '121' ? 'selected' : '' }>서울시립대학교</option>
		<option value="122" ${school == '122' ? 'selected' : '' }>서울여자대학교</option>
		<option value="122-1" ${school == '122-1' ? 'selected' : '' }>서울여자대학교(대학로캠퍼스)</option>
		<option value="122-2" ${school == '122-2' ? 'selected' : '' }>서울여자대학교(서울캠퍼스)</option>
		<option value="146" ${school == '146' ? 'selected' : '' }>서일대학교</option>
		<option value="123" ${school == '123' ? 'selected' : '' }>성공회대학교</option>
		<option value="124" ${school == '124' ? 'selected' : '' }>성균관대학교</option>
		<option value="125" ${school == '125' ? 'selected' : '' }>성신여자대학교</option>
		<option value="125-1" ${school == '125-1' ? 'selected' : '' }>성신여자대학교(돈암수정캠퍼스)</option>
		<option value="125-2" ${school == '125-1' ? 'selected' : '' }>성신여자대학교(미아운정그린캠퍼스)</option>
		<option value="126" ${school == '126' ? 'selected' : '' }>세종대학교</option>
		<option value="127" ${school == '127' ? 'selected' : '' }>숙명여자대학교</option>
		<option value="128" ${school == '128' ? 'selected' : '' }>숭실대학교</option>
		<option value="129" ${school == '129' ? 'selected' : '' }>연세대학교</option>
		<option value="130" ${school == '130' ? 'selected' : '' }>육군사관학교</option>
		<option value="131" ${school == '131' ? 'selected' : '' }>이화여자대학교</option>
		<option value="132" ${school == '132' ? 'selected' : '' }>장로회신학대학교</option>
		<option value="133" ${school == '133' ? 'selected' : '' }>중앙대학교</option>
		<option value="134" ${school == '134' ? 'selected' : '' }>추계예술대학교</option>
		<option value="135" ${school == '135' ? 'selected' : '' }>총신대학교</option>
		<option value="310-3" ${school == '310-3' ? 'selected' : '' }>KAIST(한국과학기술원/서울캠퍼스)</option>
		<option value="136" ${school == '136' ? 'selected' : '' }>한국교육대학교</option>
		<option value="137" ${school == '137' ? 'selected' : '' }>한국성서대학교</option>
		<option value="144" ${school == '144' ? 'selected' : '' }>한국예술종합학교</option>
		<option value="144-1" ${school == '144-1' ? 'selected' : '' }>한국예술종합학교(대학로캠퍼스)</option>
		<option value="144-2" ${school == '144-2' ? 'selected' : '' }>한국예술종합학교(서초동캠퍼스)</option>
		<option value="144-3" ${school == '144-3' ? 'selected' : '' }>한국예술종합학교(석관동캠퍼스)</option>
		<option value="138" ${school == '138' ? 'selected' : '' }>한국외국어대학교</option>
		<option value="139" ${school == '139' ? 'selected' : '' }>한국체육대학교</option>
		<option value="206-14" ${school == '206-14' ? 'selected' : '' }>한국폴리텍대학(서울강서캠퍼스)</option>
		<option value="206-15" ${school == '206-15' ? 'selected' : '' }>한국폴리텍대학(서울정수캠퍼스)</option>
		<option value="140" ${school == '140' ? 'selected' : '' }>한성대학교</option>
		<option value="141" ${school == '141' ? 'selected' : '' }>한양대학교</option>
		<option value="142" ${school == '142' ? 'selected' : '' }>한영신학대학교</option>
		<option value="143" ${school == '143' ? 'selected' : '' }>홍익대학교</option>
	</c:when>
	<c:when test="${place == '인천' }">
		<option value="choose">대학선택</option>
		<option value="801-1" ${school == '801-1' ? 'selected' : '' }>가천대학교(메디컬캠퍼스)</option>
		<option value="201" ${school == '201' ? 'selected' : '' }>경인교육대학교</option>
		<option value="816-1" ${school == '816-1' ? 'selected' : '' }>안양대학교(강화캠퍼스)</option>
		<option value="129-1" ${school == '129-1' ? 'selected' : '' }>연세대학교(국제캠퍼스)</option>
		<option value="202" ${school == '202' ? 'selected' : '' }>인천가톨릭대학교</option>
		<option value="202-1" ${school == '202-1' ? 'selected' : '' }>인천가톨릭대학교(강화캠퍼스)</option>
		<option value="202-2" ${school == '202-2' ? 'selected' : '' }>인천가톨릭대학교(송도국제캠퍼스)</option>
		<option value="203" ${school == '203' ? 'selected' : '' }>인천대학교</option>
		<option value="203-1" ${school == '203-1' ? 'selected' : '' }>인천대학교(미추홀캠퍼스)</option>
		<option value="203-2" ${school == '203-2' ? 'selected' : '' }>인천대학교(송도캠퍼스)</option>
		<option value="203-3" ${school == '203-3' ? 'selected' : '' }>인천대학교(제물포캠퍼스)</option>
		<option value="204" ${school == '204' ? 'selected' : '' }>인하대학교</option>
		<option value="1113-1" ${school == '1113-1' ? 'selected' : '' }>청운대학교(인천캠퍼스)</option>
		<option value="205" ${school == '205' ? 'selected' : '' }>한국뉴욕주립대학교</option>
		<option value="206" ${school == '206' ? 'selected' : '' }>한국폴리텍대학</option>
		<option value="206-6" ${school == '206-6' ? 'selected' : '' }>한국폴리텍대학(남인천캠퍼스)</option>
		<option value="206-25" ${school == '206-25' ? 'selected' : '' }>한국폴리텍대학(인천캠퍼스)</option>
		<option value="206-34" ${school == '206-34' ? 'selected' : '' }>한국폴리텍대학(학교법인)</option>
	</c:when>
	<c:when test="${place == '대전' }">
		<option value="choose">대학선택</option>
		<option value="301" ${school == '301' ? 'selected' : '' }>국군간호사관학교</option>
		<option value="1101-1" ${school == '1101-1' ? 'selected' : '' }>건양대학교(대전메디컬캠퍼스)</option>
		<option value="302" ${school == '302' ? 'selected' : '' }>대전대학교</option>
		<option value="303" ${school == '303' ? 'selected' : '' }>대전신학대학교</option>
		<option value="304" ${school == '304' ? 'selected' : '' }>목원대학교</option>
		<option value="305" ${school == '305' ? 'selected' : '' }>배재대학교</option>
		<option value="306" ${school == '306' ? 'selected' : '' }>우송대학교</option>
		<option value="307" ${school == '307' ? 'selected' : '' }>을지대학교</option>
		<option value="308" ${school == '308' ? 'selected' : '' }>충남대학교</option>
		<option value="308-1" ${school == '308-1' ? 'selected' : '' }>충남대학교(대덕캠퍼스)</option>
		<option value="308-2" ${school == '308-2' ? 'selected' : '' }>충남대학교(보운캠퍼스)</option>
		<option value="309" ${school == '309' ? 'selected' : '' }>침례신학대학교</option>
		<option value="310" ${school == '310' ? 'selected' : '' }>KAIST(한국과학기술원)</option>
		<option value="310-1" ${school == '310-1' ? 'selected' : '' }>KAIST(한국과학기술원/대덕캠퍼스)</option>
		<option value="310-2" ${school == '310-2' ? 'selected' : '' }>KAIST(한국과학기술원/문지캠퍼스)</option>
		<option value="206-9" ${school == '206-9' ? 'selected' : '' }>한국폴리텍대학(대전캠퍼스)</option>
		<option value="311" ${school == '311' ? 'selected' : '' }>한남대학교</option>
		<option value="312" ${school == '312' ? 'selected' : '' }>한밭대학교</option>
		<option value="312-1" ${school == '312-1' ? 'selected' : '' }>한밭대학교(대덕산학융합캠퍼스)</option>
		<option value="312-2" ${school == '312-2' ? 'selected' : '' }>한밭대학교(유성덕명캠퍼스)</option>
	</c:when>
	<c:when test="${place == '대구' }">
		<option value="choose">대학선택</option>
		<option value="401" ${school == '401' ? 'selected' : '' }>계명대학교</option>
		<option value="401-1" ${school == '401-1' ? 'selected' : '' }>계명대학교(대명캠퍼스)</option>
		<option value="401-2" ${school == '401-2' ? 'selected' : '' }>계명대학교(성서캠퍼스캠퍼스)</option>
		<option value="405" ${school == '405' ? 'selected' : '' }>계명문화대학</option>
		<option value="402" ${school == '402' ? 'selected' : '' }>경북대학교</option>
		<option value="1207-1" ${school == '1207-1' ? 'selected' : '' }>대구가톨릭대학교(루가캠퍼스)</option>
		<option value="1207-2" ${school == '1207-2' ? 'selected' : '' }>대구가톨릭대학교(유스티노캠퍼스)</option>
		<option value="403" ${school == '403' ? 'selected' : '' }>DGIST(대구경북과학기술원)</option>
		<option value="407" ${school == '407' ? 'selected' : '' }>대구과학대학교</option>
		<option value="406" ${school == '406' ? 'selected' : '' }>대구공업대학교</option>
		<option value="404" ${school == '404' ? 'selected' : '' }>대구교육대학교</option>
		<option value="1208-1" ${school == '1208-1' ? 'selected' : '' }>대구대학교(대명동캠퍼스)</option>
		<option value="408" ${school == '408' ? 'selected' : '' }>대구보건대학교</option>
		<option value="1211-1" ${school == '1211-1' ? 'selected' : '' }>대구한의대학교(수성캠퍼스)</option>
		<option value="1215-1" ${school == '1215-1' ? 'selected' : '' }>영남대학교(대구캠퍼스)</option>
		<option value="409" ${school == '409' ? 'selected' : '' }>영남이공대학교</option>
		<option value="410" ${school == '410' ? 'selected' : '' }>영진전문대학</option>
		<option value="206-7" ${school == '206-7' ? 'selected' : '' }>한국폴리텍대학(달성캠퍼스)</option>
		<option value="206-8" ${school == '206-8' ? 'selected' : '' }>한국폴리텍대학(대구캠퍼스)</option>
		<option value="206-16" ${school == '206-16' ? 'selected' : '' }>한국폴리텍대학(섬유패션캠퍼스)</option>
	</c:when>
	<c:when test="${place == '광주' }">
		<option value="choose">대학선택</option>
		<option value="501" ${school == '501' ? 'selected' : '' }>광신대학교</option>
		<option value="502" ${school == '502' ? 'selected' : '' }>GIST(광주과학기술원)</option>
		<option value="503" ${school == '503' ? 'selected' : '' }>광주교육대학교</option>
		<option value="504" ${school == '504' ? 'selected' : '' }>광주대학교</option>
		<option value="505" ${school == '505' ? 'selected' : '' }>광주여자대학교</option>
		<option value="506" ${school == '506' ? 'selected' : '' }>남부대학교</option>
		<option value="507" ${school == '507' ? 'selected' : '' }>송원대학교</option>
		<option value="508" ${school == '508' ? 'selected' : '' }>전남대학교</option>
		<option value="509" ${school == '509' ? 'selected' : '' }>조선대학교</option>
		<option value="206-3" ${school == '206-3' ? 'selected' : '' }>한국폴리텍대학(광주캠퍼스)</option>
		<option value="206-2" ${school == '206-2' ? 'selected' : '' }>한국폴리텍대학(광주2캠퍼스)</option>
		<option value="510" ${school == '510' ? 'selected' : '' }>호남대학교</option>
		<option value="511" ${school == '511' ? 'selected' : '' }>호남신학대학교</option>
	</c:when>
	<c:when test="${place == '울산' }">
		<option value="choose">대학선택</option>
		<option value="601" ${school == '601' ? 'selected' : '' }>UNIST(울산과학기술대)</option>
		<option value="602" ${school == '602' ? 'selected' : '' }>울산대학교</option>
		<option value="206-22" ${school == '206-22' ? 'selected' : '' }>한국폴리텍대학(울산캠퍼스)</option>
	</c:when>
	<c:when test="${place == '부산' }">
		<option value="choose">대학선택</option>
		<option value="701" ${school == '701' ? 'selected' : '' }>경성대학교</option>
		<option value="702" ${school == '702' ? 'selected' : '' }>고신대학교</option>
		<option value="702-1" ${school == '702-1' ? 'selected' : '' }>고신대학교(송도캠퍼스)</option>
		<option value="702-2" ${school == '702-2' ? 'selected' : '' }>고신대학교(영도캠퍼스)</option>
		<option value="703" ${school == '703' ? 'selected' : '' }>동명대학교</option>
		<option value="704" ${school == '704' ? 'selected' : '' }>동서대학교</option>
		<option value="705" ${school == '705' ? 'selected' : '' }>동아대학교</option>
		<option value="705-1" ${school == '705-1' ? 'selected' : '' }>동아대학교(구덕캠퍼스)</option>
		<option value="705-2" ${school == '705-2' ? 'selected' : '' }>동아대학교(부민캠퍼스)</option>
		<option value="705-3" ${school == '705-3' ? 'selected' : '' }>동아대학교(승학캠퍼스)</option>
		<option value="706" ${school == '706' ? 'selected' : '' }>동의대학교</option>
		<option value="706-2" ${school == '706-2' ? 'selected' : '' }>동의대학교(가야캠퍼스)</option>
		<option value="706-1" ${school == '706-1' ? 'selected' : '' }>동의대학교(양정캠퍼스)</option>
		<option value="707" ${school == '707' ? 'selected' : '' }>부경대학교</option>
		<option value="707-2" ${school == '707-2' ? 'selected' : '' }>부경대학교(대연캠퍼스)</option>
		<option value="707-1" ${school == '707-1' ? 'selected' : '' }>부경대학교(용당캠퍼스)</option>
		<option value="708" ${school == '708' ? 'selected' : '' }>부산가톨릭대학교</option>
		<option value="708-1" ${school == '708-1' ? 'selected' : '' }>부산가톨릭대학교(메리놀교정)</option>
		<option value="708-2" ${school == '708-1' ? 'selected' : '' }>부산가톨릭대학교(신학교정)</option>
		<option value="708-3" ${school == '708-3' ? 'selected' : '' }>부산가톨릭대학교(지산교정)</option>
		<option value="709" ${school == '709' ? 'selected' : '' }>부산교육대학교</option>
		<option value="710" ${school == '710' ? 'selected' : '' }>부산대학교</option>
		<option value="714" ${school == '714' ? 'selected' : '' }>부산여자대학교</option>
		<option value="711" ${school == '711' ? 'selected' : '' }>부산외국어대학교</option>
		<option value="712" ${school == '712' ? 'selected' : '' }>신라대학교</option>
		<option value="206-10" ${school == '206-10' ? 'selected' : '' }>한국폴리텍대학(동부산캠퍼스)</option>
		<option value="206-13" ${school == '206-13' ? 'selected' : '' }>한국폴리텍대학(부산캠퍼스)</option>
		<option value="713" ${school == '713' ? 'selected' : '' }>한국해양대학교</option>
	</c:when>
	<c:when test="${place == '경기' }">
		<option value="choose">대학선택</option>
		<option value="801" ${school == '801' ? 'selected' : '' }>가천대학교</option>
		<option value="802" ${school == '802' ? 'selected' : '' }>강남대학교</option>
		<option value="803" ${school == '803' ? 'selected' : '' }>경기대학교</option>
		<option value="904-3" ${school == '904-3' ? 'selected' : '' }>경동대학교(METROPOL캠퍼스)</option>
		<option value="201-1" ${school == '201-1' ? 'selected' : '' }>경인교육대학교(경기캠퍼스)</option>
		<option value="104-1" ${school == '104-1' ? 'selected' : '' }>경희대학교(광릉캠퍼스)</option>
		<option value="104-2" ${school == '104-2' ? 'selected' : '' }>경희대학교(국제캠퍼스)</option>
		<option value="804" ${school == '804' ? 'selected' : '' }>단국대학교</option>
		<option value="805" ${school == '805' ? 'selected' : '' }>대진대학교</option>
		<option value="110-1" ${school == '110-1' ? 'selected' : '' }>동국대학교(바이오메디캠퍼스)</option>
		<option value="828" ${school == '828' ? 'selected' : '' }>동아방송예술대학교</option>
		<option value="1213-1" ${school == '1213-1' ? 'selected' : '' }>동양대학교(북서울캠퍼스)</option>
		<option value="806" ${school == '806' ? 'selected' : '' }>루터대학교</option>
		<option value="112-1" ${school == '112-1' ? 'selected' : '' }>명지대학교(자연캠퍼스)</option>
		<option value="807" ${school == '807' ? 'selected' : '' }>서울신학대학교</option>
		<option value="808" ${school == '808' ? 'selected' : '' }>서울장신대학교</option>
		<option value="809" ${school == '809' ? 'selected' : '' }>성결대학교</option>
		<option value="101-2" ${school == '101-2' ? 'selected' : '' }>가톨릭대학교(성심교정)</option>
		<option value="124-1" ${school == '124-1' ? 'selected' : '' }>성균관대학교(자연과학캠퍼스)</option>
		<option value="810" ${school == '810' ? 'selected' : '' }>수원가톨릭대학교</option>
		<option value="811" ${school == '811' ? 'selected' : '' }>수원대학교</option>
		<option value="812" ${school == '812' ? 'selected' : '' }>신경대학교</option>
		<option value="830" ${school == '830' ? 'selected' : '' }>신안산대학교</option>
		<option value="813" ${school == '813' ? 'selected' : '' }>신한대학교(제1캠퍼스)</option>
		<option value="813-1" ${school == '813-1' ? 'selected' : '' }>신한대학교(제2캠퍼스)</option>
		<option value="814" ${school == '814' ? 'selected' : '' }>아세아연합신학대학교</option>
		<option value="815" ${school == '815' ? 'selected' : '' }>아주대학교</option>
		<option value="816" ${school == '816' ? 'selected' : '' }>안양대학교</option>
		<option value="1404-1" ${school == '1404-1' ? 'selected' : '' }>예원예술대학교(양주캠퍼스)</option>
		<option value="832" ${school == '832' ? 'selected' : '' }>연성대학교</option>
		<option value="817" ${school == '817' ? 'selected' : '' }>용인대학교</option>
		<option value="831" ${school == '831' ? 'selected' : '' }>유한대학교</option>
		<option value="307-1" ${school == '307-1' ? 'selected' : '' }>을지대학교(성남캠퍼스)</option>
		<option value="1112-1" ${school == '1112-1' ? 'selected' : '' }>중부대학교(고양캠퍼스)</option>
		<option value="133-1" ${school == '133-1' ? 'selected' : '' }>중앙대학교(안성캠퍼스)</option>
		<option value="818" ${school == '818' ? 'selected' : '' }>중앙승가대학교</option>
		<option value="819" ${school == '819' ? 'selected' : '' }>차의과대학교</option>
		<option value="135-1" ${school == '135-1' ? 'selected' : '' }>총신대학교(양지캠퍼스)</option>
		<option value="820" ${school == '820' ? 'selected' : '' }>칼빈대학교</option>
		<option value="821" ${school == '821' ? 'selected' : '' }>평택대학교</option>
		<option value="822" ${school == '822' ? 'selected' : '' }>한경대학교</option>
		<option value="829" ${school == '829' ? 'selected' : '' }>한국관광대학</option>
		<option value="1011-2" ${school == '1011-2' ? 'selected' : '' }>한국교통대학교(의왕캠퍼스)</option>
		<option value="823" ${school == '823' ? 'selected' : '' }>한국산업기술대학교</option>
		<option value="138" ${school == '138' ? 'selected' : '' }>한국외국어대학교</option>
		<option value="206-17" ${school == '206-17' ? 'selected' : '' }>한국폴리텍대학(성남캠퍼스)</option>
		<option value="206-20" ${school == '206-20' ? 'selected' : '' }>한국폴리텍대학(안성캠퍼스)</option>
		<option value="206-37" ${school == '206-37' ? 'selected' : '' }>한국폴리텍대학(화성캠퍼스)</option>
		<option value="824" ${school == '824' ? 'selected' : '' }>한국항공대학교</option>
		<option value="825" ${school == '825' ? 'selected' : '' }>한세대학교</option>
		<option value="826" ${school == '826' ? 'selected' : '' }>한신대학교</option>
		<option value="141-1" ${school == '141-1' ? 'selected' : '' }>한양대(ERICA캠퍼스)</option>
		<option value="827" ${school == '827' ? 'selected' : '' }>협성대학교</option>
	</c:when>
	<c:when test="${place == '강원' }">
		<option value="choose">대학선택</option>
		<option value="901" ${school == '901' ? 'selected' : '' }>가톨릭관동대학교</option>
		<option value="902" ${school == '902' ? 'selected' : '' }>강릉원주대학교(강릉캠퍼스)</option>
		<option value="902-1" ${school == '902-1' ? 'selected' : '' }>강릉원주대학교(원주캠퍼스)</option>
		<option value="903" ${school == '903' ? 'selected' : '' }>강원대학교</option>
		<option value="903-2" ${school == '903-2' ? 'selected' : '' }>강원대학교(도계캠퍼스)</option>
		<option value="903-1" ${school == '903-1' ? 'selected' : '' }>강원대학교(삼척캠퍼스)</option>
		<option value="903-3" ${school == '903-3' ? 'selected' : '' }>강원대학교(춘천캠퍼스)</option>
		<option value="904" ${school == '904' ? 'selected' : '' }>경동대학교(GLOBAL캠퍼스/고성)</option>
		<option value="904-1" ${school == '904-1' ? 'selected' : '' }>경동대학교(GLOBAL캠퍼스/속초)</option>
		<option value="904-2" ${school == '904-2' ? 'selected' : '' }>경동대학교(MEDICAL캠퍼스)</option>
		<option value="905" ${school == '905' ? 'selected' : '' }>상지대학교</option>
		<option value="120-2" ${school == '120-2' ? 'selected' : '' }>서울대학교(평창캠퍼스)</option>
		<option value="129-2" ${school == '129-2' ? 'selected' : '' }>연세대학교(원주캠퍼스)</option>
		<option value="906" ${school == '906' ? 'selected' : '' }>춘천교육대학교</option>
		<option value="206-1" ${school == '206-1' ? 'selected' : '' }>한국폴리텍대학(강릉캠퍼스)</option>
		<option value="206-23" ${school == '206-23' ? 'selected' : '' }>한국폴리텍대학(원주캠퍼스)</option>
		<option value="206-31" ${school == '206-31' ? 'selected' : '' }>한국폴리텍대학(춘천캠퍼스)</option>
		<option value="206-30" ${school == '206-30' ? 'selected' : '' }>한국폴리텍대학(춘천2캠퍼스)</option>
		<option value="907" ${school == '907' ? 'selected' : '' }>한라대학교</option>
		<option value="908" ${school == '908' ? 'selected' : '' }>한림대학교</option>
		<option value="909" ${school == '909' ? 'selected' : '' }>한중대학교</option>
	</c:when>
	<c:when test="${place == '충북' }">
		<option value="choose">대학선택</option>
		<option value="1013" ${school == '1013' ? 'selected' : '' }>강동대학교</option>
		<option value="1001" ${school == '1001' ? 'selected' : '' }>공군사관학교</option>
		<option value="1002" ${school == '1002' ? 'selected' : '' }>극동대학교</option>
		<option value="1003" ${school == '1003' ? 'selected' : '' }>꽃동네대학교</option>
		<option value="1004" ${school == '1004' ? 'selected' : '' }>서원대학교</option>
		<option value="1005" ${school == '1005' ? 'selected' : '' }>세명대학교</option>
		<option value="1006" ${school == '1006' ? 'selected' : '' }>영동대학교</option>
		<option value="1405-1" ${school == '1405-' ? 'selected' : '' }>우석대학교(진천캠퍼스)</option>
		<option value="1014" ${school == '1014' ? 'selected' : '' }>유원대학교</option>
		<option value="1014-2" ${school == '1014-2' ? 'selected' : '' }>유원대학교(영동캠퍼스)</option>
		<option value="1007" ${school == '1007' ? 'selected' : '' }>중원대학교</option>
		<option value="1008" ${school == '1008' ? 'selected' : '' }>청주교육대학교</option>
		<option value="1009" ${school == '1009' ? 'selected' : '' }>청주대학교</option>
		<option value="1012" ${school == '1012' ? 'selected' : '' }>충북대학교</option>
		<option value="1010" ${school == '1010' ? 'selected' : '' }>한국교원대학교</option>
		<option value="1011" ${school == '1011' ? 'selected' : '' }>한국교통대학교</option>
		<option value="1011-1" ${school == '1011-1' ? 'selected' : '' }>한국교통대학교(증평캠퍼스)</option>
		<option value="1011-3" ${school == '1011-3' ? 'selected' : '' }>한국교통대학교(충주캠퍼스)</option>
		<option value="206-29" ${school == '206-29' ? 'selected' : '' }>한국폴리텍대학(청주캠퍼스)</option>
		<option value="206-32" ${school == '206-32' ? 'selected' : '' }>한국폴리텍대학(충주캠퍼스)</option>
	</c:when>
	<c:when test="${place == '충남' }">
		<option value="choose">대학선택</option>
		<option value="103-1" ${school == '103-1' ? 'selected' : '' }>건국대학교(글로벌캠퍼스)</option>
		<option value="1101" ${school == '1101' ? 'selected' : '' }>건양대학교</option>
		<option value="1102" ${school == '1102' ? 'selected' : '' }>경찰대학교</option>
		<option value="702-2" ${school == '702-2' ? 'selected' : '' }>고신대학교(천안캠퍼스)</option>
		<option value="1103" ${school == '1103' ? 'selected' : '' }>공주교육대학교</option>
		<option value="1104" ${school == '1104' ? 'selected' : '' }>공주대학교</option>
		<option value="1104-3" ${school == '1104-3' ? 'selected' : '' }>공주대학교(공주캠퍼스)</option>
		<option value="1104-1" ${school == '1104-1' ? 'selected' : '' }>공주대학교(예산캠퍼스)</option>
		<option value="1104-2" ${school == '1104-2' ? 'selected' : '' }>공주대학교(천안캠퍼스)</option>
		<option value="1105" ${school == '1105' ? 'selected' : '' }>금강대학교</option>
		<option value="1106" ${school == '1106' ? 'selected' : '' }>나사렛대학교</option>
		<option value="1107" ${school == '1107' ? 'selected' : '' }>남서울대학교</option>
		<option value="804-1" ${school == '804-1' ? 'selected' : '' }>단국대학교(천안캠퍼스)</option>
		<option value="1108" ${school == '1108' ? 'selected' : '' }>대전가톨릭대학교</option>
		<option value="1109" ${school == '1109' ? 'selected' : '' }>백석대학교</option>
		<option value="114-1" ${school == '114-1' ? 'selected' : '' }>상명대학교(천안캠퍼스)</option>
		<option value="1402-1" ${school == '1402-1' ? 'selected' : '' }>서남대학교(아산캠퍼스)</option>
		<option value="1110" ${school == '1110' ? 'selected' : '' }>선문대학교</option>
		<option value="1110-2" ${school == '1110-2' ? 'selected' : '' }>선문대학교(아산캠퍼스)</option>
		<option value="1110-1" ${school == '1110-1' ? 'selected' : '' }>선문대학교(천안캠퍼스)</option>
		<option value="1506-1" ${school == '1506-1' ? 'selected' : '' }>세한대학교(당진캠퍼스)</option>
		<option value="1111" ${school == '1111' ? 'selected' : '' }>순천향대학교</option>
		<option value="1117" ${school == '1117' ? 'selected' : '' }>신성대학교</option>
		<option value="1014-1" ${school == '1014-1' ? 'selected' : '' }>유원대학교(아산캠퍼스)</option>
		<option value="1112" ${school == '1112' ? 'selected' : '' }>중부대학교</option>
		<option value="1113" ${school == '1113' ? 'selected' : '' }>청운대학교</option>
		<option value="1114" ${school == '1114' ? 'selected' : '' }>한국기술교육대학교(제1캠퍼스)</option>
		<option value="1114-1" ${school == '1114-1' ? 'selected' : '' }>한국기술교육대학교(제2캠퍼스)</option>
		<option value="1118" ${school == '1118' ? 'selected' : '' }>한국전통문화대학교</option>
		<option value="206-12" ${school == '206-12' ? 'selected' : '' }>한국폴리텍대학(바이오캠퍼스)</option>
		<option value="206-19" ${school == '206-19' ? 'selected' : '' }>한국폴리텍대학(아산캠퍼스)</option>
		<option value="206-36" ${school == '206-36' ? 'selected' : '' }>한국폴리텍대학(홍성캠퍼스)</option>
		<option value="1115" ${school == '1115' ? 'selected' : '' }>한서대학교</option>
		<option value="1115-2" ${school == '1115-2' ? 'selected' : '' }>한서대학교(서산캠퍼스)</option>
		<option value="1115-1" ${school == '1115-1' ? 'selected' : '' }>한서대학교(태안캠퍼스)</option>
		<option value="1116" ${school == '1116' ? 'selected' : '' }>호서대학교</option>
		<option value="1116-2" ${school == '1116-2' ? 'selected' : '' }>호서대학교(신학융합캠퍼스)</option>
		<option value="1116-3" ${school == '1116-3' ? 'selected' : '' }>호서대학교(아산캠퍼스)</option>
		<option value="1116-1" ${school == '1116-1' ? 'selected' : '' }>호서대학교(천안캠퍼스)</option>
	</c:when>
	<c:when test="${place == '경북' }">
		<option value="choose">대학선택</option>
		<option value="1201" ${school == '1201' ? 'selected' : '' }>가야대학교</option>
		<option value="402-1" ${school == '402-1' ? 'selected' : '' }>경북대학교(상주캠퍼스)</option>
		<option value="1220" ${school == '1220' ? 'selected' : '' }>경북전문대학</option>
		<option value="1202" ${school == '1202' ? 'selected' : '' }>경운대학교</option>
		<option value="1203" ${school == '1203' ? 'selected' : '' }>경일대학교</option>
		<option value="1204" ${school == '1204' ? 'selected' : '' }>경주대학교</option>
		<option value="1222" ${school == '1222' ? 'selected' : '' }>구미대학교</option>
		<option value="1205" ${school == '1205' ? 'selected' : '' }>금오공과대학교</option>
		<option value="1206" ${school == '1206' ? 'selected' : '' }>김천대학교</option>
		<option value="1223" ${school == '1223' ? 'selected' : '' }>대경대학교</option>
		<option value="1207" ${school == '1207' ? 'selected' : '' }>대구가톨릭대학교</option>
		<option value="1208" ${school == '1208' ? 'selected' : '' }>대구대학교</option>
		<option value="1209" ${school == '1209' ? 'selected' : '' }>대구예술대학교</option>
		<option value="1210" ${school == '1210' ? 'selected' : '' }>대구외국어대학교</option>
		<option value="1211" ${school == '1211' ? 'selected' : '' }>대구한의대학교</option>
		<option value="1211-3" ${school == '1211-3' ? 'selected' : '' }>대구한의대학교(삼성캠퍼스)</option>
		<option value="1211-2" ${school == '1211-2' ? 'selected' : '' }>대구한의대학교(오성캠퍼스)</option>
		<option value="1212" ${school == '1212' ? 'selected' : '' }>대신대학교</option>
		<option value="1213" ${school == '1213' ? 'selected' : '' }>동양대학교</option>
		<option value="1214" ${school == '1214' ? 'selected' : '' }>안동대학교</option>
		<option value="1215" ${school == '1215' ? 'selected' : '' }>영남대학교</option>
		<option value="1216" ${school == '1216' ? 'selected' : '' }>영남신학대학교</option>
		<option value="410-1" ${school == '410-1' ? 'selected' : '' }>영진전문대학(글로벌캠퍼스)</option>
		<option value="1217" ${school == '1217' ? 'selected' : '' }>위덕대학교</option>
		<option value="1218" ${school == '1218' ? 'selected' : '' }>POSTECH(포항공대)</option>
		<option value="206-4" ${school == '206-4' ? 'selected' : '' }>한국폴리텍대학(구미캠퍼스)</option>
		<option value="206-21" ${school == '206-21' ? 'selected' : '' }>한국폴리텍대학(영주캠퍼스)</option>
		<option value="206-33" ${school == '206-33' ? 'selected' : '' }>한국폴리텍대학(포항캠퍼스)</option>
		<option value="1219" ${school == '1219' ? 'selected' : '' }>한동대학교</option>
		<option value="1221" ${school == '1221' ? 'selected' : '' }>호산대학교(경산1대학)</option>
	</c:when>
	<c:when test="${place == '경남' }">
		<option value="choose">대학선택</option>
		<option value="1201-1" ${school == '1201-1' ? 'selected' : '' }>가야대학교(김해캠퍼스)</option>
		<option value="1301" ${school == '1301' ? 'selected' : '' }>경남과학기술대학교</option>
		<option value="1302" ${school == '1302' ? 'selected' : '' }>경남대학교</option>
		<option value="1303" ${school == '1303' ? 'selected' : '' }>경상대학교</option>
		<option value="1303-1" ${school == '1303-1' ? 'selected' : '' }>경상대학교(가좌캠퍼스)</option>
		<option value="1303-2" ${school == '1303-2' ? 'selected' : '' }>경상대학교(칠암캠퍼스)</option>
		<option value="1303-3" ${school == '1303-3' ? 'selected' : '' }>경상대학교(통영캠퍼스)</option>
		<option value="710-1" ${school == '710-1' ? 'selected' : '' }>부산대학교(밀양캠퍼스)</option>
		<option value="710-2" ${school == '710-2' ? 'selected' : '' }>부산대학교(양신캠퍼스)</option>
		<option value="1304" ${school == '1304' ? 'selected' : '' }>부산장신대학교</option>
		<option value="1305" ${school == '1305' ? 'selected' : '' }>영산대학교</option>
		<option value="1305-1" ${school == '1305-1' ? 'selected' : '' }>영산대학교(양산캠퍼스)</option>
		<option value="1305-2" ${school == '1305-2' ? 'selected' : '' }>영산대학교(해운대캠퍼스)</option>
		<option value="1306" ${school == '1306' ? 'selected' : '' }>인제대학교</option>
		<option value="1306-1" ${school == '1306-1' ? 'selected' : '' }>인제대학교(김해캠퍼스)</option>
		<option value="1306-2" ${school == '1306-2' ? 'selected' : '' }>인제대학교(부산캠퍼스)</option>
		<option value="1307" ${school == '1307' ? 'selected' : '' }>진주교육대학교</option>
		<option value="1308" ${school == '1308' ? 'selected' : '' }>창원대학교</option>
		<option value="1309" ${school == '1309' ? 'selected' : '' }>창신대학교</option>
		<option value="1310" ${school == '1310' ? 'selected' : '' }>한국국제대학교</option>
		<option value="206-27" ${school == '206-27' ? 'selected' : '' }>한국폴리텍대학(진주캠퍼스)</option>
		<option value="206-28" ${school == '206-28' ? 'selected' : '' }>한국폴리텍대학(창원캠퍼스)</option>
		<option value="206-35" ${school == '206-35' ? 'selected' : '' }>한국폴리텍대학(항공캠퍼스)</option>
		<option value="1311" ${school == '1311' ? 'selected' : '' }>해군사관학교</option>
	</c:when>
	<c:when test="${place == '전북' }">
		<option value="choose">대학선택</option>
		<option value="1401" ${school == '1401' ? 'selected' : '' }>군산대학교</option>
		<option value="1402" ${school == '1402' ? 'selected' : '' }>서남대학교</option>
		<option value="1403" ${school == '1403' ? 'selected' : '' }>예수대학교</option>
		<option value="1404" ${school == '1404' ? 'selected' : '' }>예원예술대학교</option>
		<option value="1405" ${school == '1405' ? 'selected' : '' }>우석대학교</option>
		<option value="1406" ${school == '1406' ? 'selected' : '' }>원광대학교</option>
		<option value="1407" ${school == '1407' ? 'selected' : '' }>전북대학교</option>
		<option value="1407-2" ${school == '1407-2' ? 'selected' : '' }>전북대학교(전주캠퍼스)</option>
		<option value="1407-3" ${school == '1407-3' ? 'selected' : '' }>전북대학교(틍성화캠퍼스)</option>
		<option value="1407-1" ${school == '1407-1' ? 'selected' : '' }>전북대학교(고창캠퍼스)</option>
		<option value="1408" ${school == '1408' ? 'selected' : '' }>전주교육대학교</option>
		<option value="1409" ${school == '1409' ? 'selected' : '' }>전주대학교</option>
		<option value="206" ${school == '206' ? 'selected' : '' }>한국폴리텍대학(김제캠퍼스)</option>
		<option value="206" ${school == '206' ? 'selected' : '' }>한국폴리텍대학(익산캠퍼스)</option>
		<option value="1410" ${school == '1410' ? 'selected' : '' }>한일장신대학교</option>
		<option value="1411" ${school == '1411' ? 'selected' : '' }>호원대학교</option>
	</c:when>
	<c:when test="${place == '전남' }">
		<option value="choose">대학선택</option>
		<option value="1501" ${school == '1501' ? 'selected' : '' }>광주가톨릭대학교</option>
		<option value="1502" ${school == '1502' ? 'selected' : '' }>동신대학교</option>
		<option value="1503" ${school == '1503' ? 'selected' : '' }>목포가톨릭대학교</option>
		<option value="1504" ${school == '1504' ? 'selected' : '' }>목포대학교</option>
		<option value="1504-1" ${school == '1504-1' ? 'selected' : '' }>목포대학교(남악캠퍼스)</option>
		<option value="1504-2" ${school == '1504-2' ? 'selected' : '' }>목포대학교(도림캠퍼스)</option>
		<option value="1504-3" ${school == '1504-3' ? 'selected' : '' }>목포대학교(목포캠퍼스)</option>
		<option value="1504-4" ${school == '1504-4' ? 'selected' : '' }>목포대학교(신해양산업단지캠퍼스)</option>
		<option value="1505" ${school == '1505' ? 'selected' : '' }>목포해양대학교</option>
		<option value="1506" ${school == '1506' ? 'selected' : '' }>세한대학교</option>
		<option value="1507" ${school == '1507' ? 'selected' : '' }>순천대학교</option>
		<option value="1508" ${school == '1508' ? 'selected' : '' }>영산선학대학교</option>
		<option value="508-1" ${school == '508-1' ? 'selected' : '' }>전남대학교(여수캠퍼스)</option>
		<option value="1509" ${school == '1509' ? 'selected' : '' }>초당대학교</option>
		<option value="206-11" ${school == '206-11' ? 'selected' : '' }>한국폴리텍대학(목포캠퍼스)</option>
		<option value="206-18" ${school == '206-18' ? 'selected' : '' }>한국폴리텍대학(순천캠퍼스)</option>
		<option value="1510" ${school == '1510' ? 'selected' : '' }>한려대학교</option>
	</c:when>
	<c:when test="${place == '제주' }">
		<option value="choose">대학선택</option>
		<option value="1601" ${school == '1601' ? 'selected' : '' }>제주국제대학교</option>
		<option value="1602" ${school == '1602' ? 'selected' : '' }>제주대학교</option>
		<option value="1602-1" ${school == '1602-1' ? 'selected' : '' }>제주대학교(사라캠퍼스)</option>
		<option value="1602-2" ${school == '1602-2' ? 'selected' : '' }>제주대학교(아라캠퍼스)</option>
		<option value="206-26" ${school == '206-26' ? 'selected' : '' }>한국폴리텍대학(제주캠퍼스)</option>
	</c:when>
	<c:when test="${place == '세종' }">
		<option value="choose">대학선택</option>
		<option value="105-1" ${school == '105-1' ? 'selected' : '' }>고려대학교(세종캠퍼스)</option>
		<option value="143-1" ${school == '143-1' ? 'selected' : '' }>홍익대학교(세종캠퍼스)</option>
	</c:when>
</c:choose>
