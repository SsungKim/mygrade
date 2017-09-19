<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:choose>
	<c:when test="${place == '서울' }">
		<option value="choose">대학선택</option>
		<option value="101" ${school == 101 ? 'selected' : '' }>가톨릭대</option>
		<option value="102" ${school == 102 ? 'selected' : '' }>감리교신학대</option>
		<option value="103" ${school == 103 ? 'selected' : '' }>건국대</option>
		<option value="104" ${school == 104 ? 'selected' : '' }>경희대</option>
		<option value="105" ${school == 105 ? 'selected' : '' }>고려대</option>
		<option value="106" ${school == 106 ? 'selected' : '' }>광운대</option>
		<option value="107" ${school == 107 ? 'selected' : '' }>국민대</option>
		<option value="108" ${school == 108 ? 'selected' : '' }>그리스도대</option>
		<option value="109" ${school == 109 ? 'selected' : '' }>덕성여대</option>
		<option value="110" ${school == 110 ? 'selected' : '' }>동국대</option>
		<option value="111" ${school == 111 ? 'selected' : '' }>동덕여대</option>
		<option value="112" ${school == 112 ? 'selected' : '' }>명지대</option>
		<option value="113" ${school == 113 ? 'selected' : '' }>삼육대</option>
		<option value="114" ${school == 114 ? 'selected' : '' }>상명대</option>
		<option value="115" ${school == 115 ? 'selected' : '' }>서강대</option>
		<option value="116" ${school == 116 ? 'selected' : '' }>서경대</option>
		<option value="117" ${school == 117 ? 'selected' : '' }>서울과학기술대</option>
		<option value="118" ${school == 118 ? 'selected' : '' }>서울교대</option>
		<option value="119" ${school == 119 ? 'selected' : '' }>서울기독대</option>
		<option value="120" ${school == 120 ? 'selected' : '' }>서울대</option>
		<option value="121" ${school == 121 ? 'selected' : '' }>서울시립대</option>
		<option value="122" ${school == 122 ? 'selected' : '' }>서울여대</option>
		<option value="123" ${school == 123 ? 'selected' : '' }>성공회대</option>
		<option value="124" ${school == 124 ? 'selected' : '' }>성균관대</option>
		<option value="125" ${school == 125 ? 'selected' : '' }>성신여대</option>
		<option value="126" ${school == 126 ? 'selected' : '' }>세종대</option>
		<option value="127" ${school == 127 ? 'selected' : '' }>숙명여대</option>
		<option value="128" ${school == 128 ? 'selected' : '' }>숭실대</option>
		<option value="129" ${school == 129 ? 'selected' : '' }>연세대</option>
		<option value="130" ${school == 130 ? 'selected' : '' }>육군사관학교</option>
		<option value="131" ${school == 131 ? 'selected' : '' }>이화여대</option>
		<option value="132" ${school == 132 ? 'selected' : '' }>장로회신학대</option>
		<option value="133" ${school == 133 ? 'selected' : '' }>중앙대</option>
		<option value="134" ${school == 134 ? 'selected' : '' }>추계예술대</option>
		<option value="135" ${school == 135 ? 'selected' : '' }>충신대</option>
		<option value="136" ${school == 136 ? 'selected' : '' }>한국교대</option>
		<option value="137" ${school == 137 ? 'selected' : '' }>한국성서대</option>
		<option value="138" ${school == 138 ? 'selected' : '' }>한국외대</option>
		<option value="139" ${school == 139 ? 'selected' : '' }>한국체육대</option>
		<option value="140" ${school == 140 ? 'selected' : '' }>한성대</option>
		<option value="141" ${school == 141 ? 'selected' : '' }>한양대</option>
		<option value="142" ${school == 142 ? 'selected' : '' }>한영신학대</option>
		<option value="143" ${school == 143 ? 'selected' : '' }>홍익대</option>
	</c:when>
	<c:when test="${place == '인천' }">
		<option value="choose">대학선택</option>
		<option value="201" ${school == 201 ? 'selected' : '' }>경인교대</option>
		<option value="202" ${school == 202 ? 'selected' : '' }>인천가톨릭대</option>
		<option value="203" ${school == 203 ? 'selected' : '' }>인천대</option>
		<option value="204" ${school == 204 ? 'selected' : '' }>인하대</option>
		<option value="205" ${school == 205 ? 'selected' : '' }>한국뉴욕주립대</option>
	</c:when>
	<c:when test="${place == '대전' }">
		<option value="choose">대학선택</option>
		<option value="301" ${school == 301 ? 'selected' : '' }>국군간호사관학교</option>
		<option value="302" ${school == 302 ? 'selected' : '' }>대전대</option>
		<option value="303" ${school == 303 ? 'selected' : '' }>대전신학대</option>
		<option value="304" ${school == 304 ? 'selected' : '' }>목원대</option>
		<option value="305" ${school == 305 ? 'selected' : '' }>배재대</option>
		<option value="306" ${school == 306 ? 'selected' : '' }>우송대</option>
		<option value="307" ${school == 307 ? 'selected' : '' }>을지대</option>
		<option value="308" ${school == 308 ? 'selected' : '' }>충남대</option>
		<option value="309" ${school == 309 ? 'selected' : '' }>침례신학대</option>
		<option value="310" ${school == 310 ? 'selected' : '' }>한국과학기술원</option>
		<option value="311" ${school == 311 ? 'selected' : '' }>한남대</option>
		<option value="312" ${school == 312 ? 'selected' : '' }>한밭대</option>
	</c:when>
	<c:when test="${place == '대구' }">
		<option value="choose">대학선택</option>
		<option value="401" ${school == 401 ? 'selected' : '' }>개명대</option>
		<option value="402" ${school == 402 ? 'selected' : '' }>경북대</option>
		<option value="403" ${school == 403 ? 'selected' : '' }>대구경북과학기술원</option>
		<option value="404" ${school == 404 ? 'selected' : '' }>대구교대</option>
	</c:when>
	<c:when test="${place == '광주' }">
		<option value="choose">대학선택</option>
		<option value="501" ${school == 501 ? 'selected' : '' }>광신대</option>
		<option value="502" ${school == 502 ? 'selected' : '' }>광주과학기술원</option>
		<option value="503" ${school == 503 ? 'selected' : '' }>광주교대</option>
		<option value="504" ${school == 504 ? 'selected' : '' }>광주대</option>
		<option value="505" ${school == 505 ? 'selected' : '' }>광주여대</option>
		<option value="506" ${school == 506 ? 'selected' : '' }>남부대</option>
		<option value="507" ${school == 507 ? 'selected' : '' }>송원대</option>
		<option value="508" ${school == 508 ? 'selected' : '' }>전남대</option>
		<option value="509" ${school == 509 ? 'selected' : '' }>조선대</option>
		<option value="510" ${school == 510 ? 'selected' : '' }>호남대</option>
		<option value="511" ${school == 511 ? 'selected' : '' }>호남신학대</option>
	</c:when>
	<c:when test="${place == '울산' }">
		<option value="choose">대학선택</option>
		<option value="601" ${school == 601 ? 'selected' : '' }>울산과학기술대</option>
		<option value="602" ${school == 602 ? 'selected' : '' }>울산대</option>
	</c:when>
	<c:when test="${place == '부산' }">
		<option value="choose">대학선택</option>
		<option value="701" ${school == 701 ? 'selected' : '' }>경성대</option>
		<option value="702" ${school == 702 ? 'selected' : '' }>고신대</option>
		<option value="703" ${school == 703 ? 'selected' : '' }>동명대</option>
		<option value="704" ${school == 704 ? 'selected' : '' }>동서대</option>
		<option value="705" ${school == 705 ? 'selected' : '' }>동아대</option>
		<option value="706" ${school == 706 ? 'selected' : '' }>동의대</option>
		<option value="707" ${school == 707 ? 'selected' : '' }>부경대</option>
		<option value="708" ${school == 708 ? 'selected' : '' }>부산가톨릭대</option>
		<option value="709" ${school == 709 ? 'selected' : '' }>부산교대</option>
		<option value="710" ${school == 710 ? 'selected' : '' }>부산대</option>
		<option value="711" ${school == 711 ? 'selected' : '' }>부산외대</option>
		<option value="712" ${school == 712 ? 'selected' : '' }>신라대</option>
		<option value="713" ${school == 713 ? 'selected' : '' }>한국해양대</option>
	</c:when>
	<c:when test="${place == '경기' }">
		<option value="choose">대학선택</option>
		<option value="801" ${school == 801 ? 'selected' : '' }>가천대</option>
		<option value="802" ${school == 802 ? 'selected' : '' }>강남대</option>
		<option value="803" ${school == 803 ? 'selected' : '' }>경기대</option>
		<option value="804" ${school == 804 ? 'selected' : '' }>단국대</option>
		<option value="805" ${school == 805 ? 'selected' : '' }>대진대</option>
		<option value="806" ${school == 806 ? 'selected' : '' }>루터대</option>
		<option value="807" ${school == 807 ? 'selected' : '' }>서울신학대</option>
		<option value="808" ${school == 808 ? 'selected' : '' }>서울장신대</option>
		<option value="809" ${school == 809 ? 'selected' : '' }>성결대</option>
		<option value="810" ${school == 810 ? 'selected' : '' }>수원가톨릭대</option>
		<option value="811" ${school == 811 ? 'selected' : '' }>수원대</option>
		<option value="812" ${school == 812 ? 'selected' : '' }>신경대</option>
		<option value="813" ${school == 813 ? 'selected' : '' }>신한대</option>
		<option value="814" ${school == 814 ? 'selected' : '' }>아세아연합신학대</option>
		<option value="815" ${school == 815 ? 'selected' : '' }>아주대</option>
		<option value="816" ${school == 816 ? 'selected' : '' }>안양대</option>
		<option value="817" ${school == 817 ? 'selected' : '' }>용인대</option>
		<option value="818" ${school == 818 ? 'selected' : '' }>중앙승가대</option>
		<option value="819" ${school == 819 ? 'selected' : '' }>차의과대</option>
		<option value="820" ${school == 820 ? 'selected' : '' }>칼빈대</option>
		<option value="821" ${school == 821 ? 'selected' : '' }>평택대</option>
		<option value="822" ${school == 822 ? 'selected' : '' }>한경대</option>
		<option value="823" ${school == 823 ? 'selected' : '' }>한국산업기술대</option>
		<option value="824" ${school == 824 ? 'selected' : '' }>한국항공대</option>
		<option value="825" ${school == 825 ? 'selected' : '' }>한세대</option>
		<option value="826" ${school == 826 ? 'selected' : '' }>한신대</option>
		<option value="827" ${school == 827 ? 'selected' : '' }>협성대</option>
	</c:when>
	<c:when test="${place == '강원' }">
		<option value="choose">대학선택</option>
		<option value="901" ${school == 901 ? 'selected' : '' }>가톨릭관동대</option>
		<option value="902" ${school == 902 ? 'selected' : '' }>강릉원주대</option>
		<option value="903" ${school == 903 ? 'selected' : '' }>강원대</option>
		<option value="904" ${school == 904 ? 'selected' : '' }>경동대</option>
		<option value="905" ${school == 905 ? 'selected' : '' }>상지대</option>
		<option value="906" ${school == 906 ? 'selected' : '' }>춘천교대</option>
		<option value="907" ${school == 907 ? 'selected' : '' }>한라대</option>
		<option value="908" ${school == 908 ? 'selected' : '' }>한림대</option>
		<option value="909" ${school == 909 ? 'selected' : '' }>한중대</option>
	</c:when>
	<c:when test="${place == '충북' }">
		<option value="choose">대학선택</option>
		<option value="1001" ${school == 1001 ? 'selected' : '' }>공군사관학교</option>
		<option value="1002" ${school == 1002 ? 'selected' : '' }>극동대</option>
		<option value="1003" ${school == 1003 ? 'selected' : '' }>꽃동네대</option>
		<option value="1004" ${school == 1004 ? 'selected' : '' }>서원대</option>
		<option value="1005" ${school == 1005 ? 'selected' : '' }>세명대</option>
		<option value="1006" ${school == 1006 ? 'selected' : '' }>영동대</option>
		<option value="1007" ${school == 1007 ? 'selected' : '' }>중원대</option>
		<option value="1008" ${school == 1008 ? 'selected' : '' }>청주교대</option>
		<option value="1009" ${school == 1009 ? 'selected' : '' }>청주대</option>
		<option value="1010" ${school == 1010 ? 'selected' : '' }>한국교원대</option>
		<option value="1011" ${school == 1011 ? 'selected' : '' }>한국교통대</option>
	</c:when>
	<c:when test="${place == '충남' }">
		<option value="choose">대학선택</option>
		<option value="1101" ${school == 1101 ? 'selected' : '' }>건양대</option>
		<option value="1102" ${school == 1102 ? 'selected' : '' }>경찰대</option>
		<option value="1103" ${school == 1103 ? 'selected' : '' }>공주교대</option>
		<option value="1104" ${school == 1104 ? 'selected' : '' }>공주대</option>
		<option value="1105" ${school == 1105 ? 'selected' : '' }>금강대</option>
		<option value="1106" ${school == 1106 ? 'selected' : '' }>나사렛대</option>
		<option value="1107" ${school == 1107 ? 'selected' : '' }>남서울대</option>
		<option value="1108" ${school == 1108 ? 'selected' : '' }>대전가톨릭대</option>
		<option value="1109" ${school == 1109 ? 'selected' : '' }>백석대</option>
		<option value="1110" ${school == 1110 ? 'selected' : '' }>선문대</option>
		<option value="1111" ${school == 1111 ? 'selected' : '' }>순천향대</option>
		<option value="1112" ${school == 1112 ? 'selected' : '' }>중부대</option>
		<option value="1113" ${school == 1113 ? 'selected' : '' }>청운대</option>
		<option value="1114" ${school == 1114 ? 'selected' : '' }>한국기술교육대</option>
		<option value="1115" ${school == 1115 ? 'selected' : '' }>한서대</option>
		<option value="1116" ${school == 1116 ? 'selected' : '' }>호서대</option>
	</c:when>
	<c:when test="${place == '경북' }">
		<option value="choose">대학선택</option>
		<option value="1201" ${school == 1201 ? 'selected' : '' }>가야대</option>
		<option value="1202" ${school == 1202 ? 'selected' : '' }>경운대</option>
		<option value="1203" ${school == 1203 ? 'selected' : '' }>경일대</option>
		<option value="1204" ${school == 1204 ? 'selected' : '' }>경주대</option>
		<option value="1205" ${school == 1205 ? 'selected' : '' }>금오공과대</option>
		<option value="1206" ${school == 1206 ? 'selected' : '' }>김천대</option>
		<option value="1207" ${school == 1207 ? 'selected' : '' }>대구가톨릭대</option>
		<option value="1208" ${school == 1208 ? 'selected' : '' }>대구대</option>
		<option value="1209" ${school == 1209 ? 'selected' : '' }>대구예술대</option>
		<option value="1210" ${school == 1210 ? 'selected' : '' }>대구외대</option>
		<option value="1211" ${school == 1211 ? 'selected' : '' }>대구한의대</option>
		<option value="1212" ${school == 1212 ? 'selected' : '' }>대신대</option>
		<option value="1213" ${school == 1213 ? 'selected' : '' }>동양대</option>
		<option value="1214" ${school == 1214 ? 'selected' : '' }>안동대</option>
		<option value="1215" ${school == 1215 ? 'selected' : '' }>영남대</option>
		<option value="1216" ${school == 1216 ? 'selected' : '' }>영남신학대</option>
		<option value="1217" ${school == 1217 ? 'selected' : '' }>위덕대</option>
		<option value="1218" ${school == 1218 ? 'selected' : '' }>포항공대</option>
		<option value="1219" ${school == 1219 ? 'selected' : '' }>한동대</option>
	</c:when>
	<c:when test="${place == '경남' }">
		<option value="choose">대학선택</option>
		<option value="1301" ${school == 1301 ? 'selected' : '' }>경남과학기술대</option>
		<option value="1302" ${school == 1302 ? 'selected' : '' }>경남대</option>
		<option value="1303" ${school == 1303 ? 'selected' : '' }>경상대</option>
		<option value="1304" ${school == 1304 ? 'selected' : '' }>부산장신대</option>
		<option value="1305" ${school == 1305 ? 'selected' : '' }>영산대</option>
		<option value="1306" ${school == 1306 ? 'selected' : '' }>인제대</option>
		<option value="1307" ${school == 1307 ? 'selected' : '' }>진주교대</option>
		<option value="1308" ${school == 1308 ? 'selected' : '' }>창원대</option>
		<option value="1309" ${school == 1309 ? 'selected' : '' }>창진대</option>
		<option value="1310" ${school == 1310 ? 'selected' : '' }>한국국제대</option>
		<option value="1311" ${school == 1311 ? 'selected' : '' }>해군사관학교</option>
	</c:when>
	<c:when test="${place == '전북' }">
		<option value="choose">대학선택</option>
		<option value="1401" ${school == 1401 ? 'selected' : '' }>군산대</option>
		<option value="1402" ${school == 1402 ? 'selected' : '' }>서남대</option>
		<option value="1403" ${school == 1403 ? 'selected' : '' }>예수대</option>
		<option value="1404" ${school == 1404 ? 'selected' : '' }>예원예술대</option>
		<option value="1405" ${school == 1405 ? 'selected' : '' }>우석대</option>
		<option value="1406" ${school == 1406 ? 'selected' : '' }>원광대</option>
		<option value="1407" ${school == 1407 ? 'selected' : '' }>전북대</option>
		<option value="1408" ${school == 1408 ? 'selected' : '' }>전주교대</option>
		<option value="1409" ${school == 1409 ? 'selected' : '' }>전주대</option>
		<option value="1410" ${school == 1410 ? 'selected' : '' }>한일장신대</option>
		<option value="1411" ${school == 1411 ? 'selected' : '' }>호원대</option>
	</c:when>
	<c:when test="${place == '전남' }">
		<option value="choose">대학선택</option>
		<option value="1501" ${school == 1501 ? 'selected' : '' }>광주가톨릭대</option>
		<option value="1502" ${school == 1502 ? 'selected' : '' }>동신대</option>
		<option value="1503" ${school == 1503 ? 'selected' : '' }>목포가톨릭대</option>
		<option value="1504" ${school == 1504 ? 'selected' : '' }>목포대</option>
		<option value="1505" ${school == 1505 ? 'selected' : '' }>목포해양대</option>
		<option value="1506" ${school == 1506 ? 'selected' : '' }>세한대</option>
		<option value="1507" ${school == 1507 ? 'selected' : '' }>순천대</option>
		<option value="1508" ${school == 1508 ? 'selected' : '' }>영산선학대</option>
		<option value="1509" ${school == 1509 ? 'selected' : '' }>초당대</option>
	</c:when>
	<c:when test="${place == '제주' }">
		<option value="choose">대학선택</option>
		<option value="1601" ${school == 1601 ? 'selected' : '' }>제주국제대</option>
		<option value="1602" ${school == 1602 ? 'selected' : '' }>제주대</option>
	</c:when>
</c:choose>
