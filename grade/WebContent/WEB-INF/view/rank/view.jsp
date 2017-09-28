<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>


<!doctype html>
<html oncontextmenu='return false' ondragstart='return false' onselectstart='return false'>
    <head>
    	<c:import url="/WEB-INF/view/main/head.jsp"/>
    </head>
     
    <body>
        <div id="wrapper">
            <div class="rank_view">
            	<c:import url="/WEB-INF/view/main/side.jsp"/>
                <header class="sub_header">
                    <div class="hmenubar">
                        <img src="/img/hmenubar.png">
                    </div>
                    <c:import url="/WEB-INF/view/main/login.jsp"/>
                </header>
                <div class="main_header">
                    <div class="logo">
                        <img src="/img/logo.png" onclick="location.href='/'">
                    </div>
                </div>
                <div class="page_inner">
                    <div class="page_tit">
                        <div class="tit">
                            <div class="img">
                                <img src="/img/rank/tit_dot.png">
                            </div>
                            <div class="txt">전국등수 확인</div>
                        </div>
                        <div class="line"></div>
                    </div>
                    <div class="form_wrap">
                        <div class="sel_box">${view.addr }</div>
                        <div class="input_wrap ml27">
                            <div class="input_box">${view.school }</div>
                            <div class="txt">고등학교</div>
                        </div>
                        <div class="sel_box ml27">${view.grade }</div>
                        <div class="sel_box ml27">${view.rankDay }</div>
                        <div class="sel_box">${view.type }</div>
                    </div>
                    <div class="infomation_wrap">
                        <div class="inner" id="examView">
                            <div class="table_wrap">
                                <div class="inner">
                                    <div class="table">
                                        <div class="theader">
                                            <div class="tit_wrap">
                                                <div class="tit">구분</div>
                                            </div>
                                            <div class="tit_wrap">
                                                <div class="tit">국어</div>
                                            </div>
                                            <div class="tit_wrap">
                                                <div class="tit tit1">수학</div>
                                                <div class="tit tit1">
                                                    <div class="in_txt" id="examMathType">${view.mathType }</div>
                                                </div>
                                            </div>
                                            <div class="tit_wrap">
                                                <div class="tit">영어</div>
                                            </div>
                                            <div class="tit_wrap">
                                                <div class="tit"><span>한</span>국사</div>
                                            </div>
                                            <div class="tit_wrap tit_wrap1">
                                                <div class="tit tit1">
                                                    <div class="in_txt" id="examExplorType">${view.expType }</div>
                                                </div>
                                                <div class="tit tit1 tit2">
                                                    <div class="in_txt" id="examInnerType1">${view.expType1 }</div>
                                                </div>
                                                <div class="tit tit1 tit2">
                                                    <div class="in_txt" id="examInnerType2">${view.expType2 }</div>
                                                </div>
                                            </div>
                                            <div class="tit_wrap">
                                                <div class="tit tit1">제2<span>외국어</span></div>
                                                <div class="tit tit1">
                                                    <div class="in_txt" id="examLangType">${view.langType }</div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="tbody">
                                            <div class="tcontents">
                                                <div class="content">
                                                    <div class="txt">원점수</div>
                                                </div>
                                                <div class="content">
                                                    <div class="in_txt" id="point1">${view.kor }</div>
                                                </div>
                                                <div class="content">
                                                    <div class="in_txt" id="point2">${view.math }</div>
                                                </div>
                                                <div class="content">
                                                    <div class="in_txt"  id="point3">${view.eng }</div>
                                                </div>
                                                <div class="content">
                                                    <div class="in_txt" id="point4">${view.his }</div>
                                                </div>
                                                <div class="content">
                                                    <div class="in_txt" id="point5"> ${view.exp1 }</div>
                                                </div>
                                                <div class="content">
                                                    <div class="in_txt" id="point6">${view.exp2 }</div>
                                                </div>
                                                <div class="content">
                                                    <div class="in_txt"  id="point7">${view.lang }</div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="infomation_wrap infomation_wrap01" id="printWrap">
                    <div class="inner" id="examView">
                        <div class="info_tit">
                            <div class="img">
                                <img src="/img/rank/prize.png">
                            </div>
                            <div class="txt">나의 전국등수</div>
                            <div class="print" style="display: none; ">
                                <img src="/img/rank/print.png" onclick="print()">
                            </div>
                        </div>
                        <div class="id_wrap">
                            <div class="id_box">
                                <div class="tit">이름</div>
                                <div class="txt">${login.name }</div>
                            </div>
                            <div class="id_box">
                                <div class="tit">고등학교</div>
                                <div class="txt">
									${view.school }
                                    <span>고등학교</span>
                                </div>
                            </div>
                        </div>
                        <div class="table_wrap">
                            <div class="inner">
                                <div class="table">
                                    <div class="theader">
                                        <div class="tit_wrap half first">
                                            <div class="tit">구분</div>
                                        </div>
                                        <div class="tit_wrap">
                                            <div class="tit">국어</div>
                                        </div>
                                        <div class="tit_wrap">
                                            <div class="tit tit1">수학</div>
                                            <div class="tit tit1">
                                                <div class="in_txt" id="examMathType">${view.mathType }</div>
                                            </div>
                                        </div>
                                        <div class="tit_wrap">
                                            <div class="tit">영어</div>
                                        </div>
                                        <div class="tit_wrap">
                                            <div class="tit"><span>한</span>국사</div>
                                        </div>
                                        <div class="tit_wrap tit_wrap1">
                                            <div class="tit tit1">
                                                <div class="in_txt" id="examExplorType">${view.expType }</div>
                                            </div>
                                            <div class="tit tit1 tit2">
                                                <div class="in_txt" id="examInnerType1">${view.expType1 }</div>
                                            </div>
                                            <div class="tit tit1 tit2">
                                                <div class="in_txt" id="examInnerType2">${view.expType2 }</div>
                                            </div>
                                        </div>
                                        <div class="tit_wrap lb">
                                            <div class="tit tit1">제2<span>외국어</span></div>
                                            <div class="tit tit1">
                                                <div class="in_txt" id="examLangType">${view.langType }</div>
                                            </div>
                                        </div>
                                        <div class="tit_wrap half last">
                                            <div class="tit">총점</div>
                                        </div>
                                    </div>
                                    <div class="tbody">
                                        <div class="tcontents">
                                            <div class="content half first">
                                                <div class="txt">원점수</div>
                                            </div>
                                            <div class="content">
                                                <div class="in_txt white" id="point1">${view.kor }</div>
                                            </div>
                                            <div class="content">
                                                <div class="pink in_txt" id="point2">${view.math }</div>
                                            </div>
                                            <div class="content">
                                                <div class="pink in_txt"  id="point3">${view.eng }</div>
                                            </div>
                                            <div class="content">
                                                <div class="pink in_txt" id="point4">${view.his }</div>
                                            </div>
                                            <div class="content">
                                                <div class="pink in_txt" id="point5"> ${view.exp1 }</div>
                                            </div>
                                            <div class="content">
                                                <div class="pink in_txt" id="point6">${view.exp2 }</div>
                                            </div>
                                            <div class="content lb">
                                                <div class="pink in_txt"  id="point7">${view.lang }</div>
                                            </div>
                                            <div class="content half last">
                                                <div class="in_txt fb">${view.sum }</div>
                                            </div>
                                        </div>
                                        <div class="tcontents t2">
                                            <div class="content half first">
                                                <div class="txt">등수</div>
                                            </div>
                                            <div class="content">
                                                <div class="white in_txt" id="point8">${rank.kor }</div>
                                            </div>
                                            <div class="content">
                                                <div class="pink in_txt"  id="point9">${rank.math }</div>
                                            </div>
                                            <div class="content">
                                                <div class="pink in_txt"  id="point10">${rank.eng }</div>
                                            </div>
                                            <div class="content">
                                                <div class="pink in_txt"  id="point11">${rank.his }</div>
                                            </div>
                                            <div class="content">
                                                <div class="pink in_txt"  id="point12">${rank.exp1 }</div>
                                            </div>
                                            <div class="content">
                                                <div class="pink in_txt"  id="point13">${rank.exp2 }</div>
                                            </div>
                                            <div class="content lb">
                                                <div class="pink in_txt"  id="point14">${rank.lang }</div>
                                            </div>
                                            <div class="content half last">
                                                <div class="in_txt fb">${rank.sum }</div>
                                            </div>
                                        </div>
                                        <div class="tcontents t2">
                                            <div class="content half first">
                                                <div class="txt">백분위</div>
                                            </div>
                                            <div class="content">
                                                <div class="white in_txt" id="point15">
                                                	<fmt:formatNumber pattern="#.##" value="${hund.kor }"/>
                                                </div>
                                            </div>
                                            <div class="content">
                                                <div class="pink in_txt"  id="point16">
                                                	<fmt:formatNumber pattern="#.##" value="${hund.math }"/>
                                                </div>
                                            </div>
                                            <div class="content">
                                                <div class="pink in_txt"  id="point17">
                                                	<fmt:formatNumber pattern="#.##" value="${hund.eng }"/>
                                                </div>
                                            </div>
                                            <div class="content">
                                                <div class="pink in_txt"  id="point18">
                                                	<fmt:formatNumber pattern="#.##" value="${hund.his }"/>
                                                </div>
                                            </div>
                                            <div class="content">
                                                <div class="pink in_txt"  id="point19">
                                                	<fmt:formatNumber pattern="#.##" value="${hund.exp1 }"/>
                                                </div>
                                            </div>
                                            <div class="content">
                                                <div class="pink in_txt"  id="point20">
                                                	<fmt:formatNumber pattern="#.##" value="${hund.exp2 }"/>
                                                </div>
                                            </div>
                                            <div class="content lb">
                                                <div class="pink in_txt"  id="point21">
                                                	<fmt:formatNumber pattern="#.##" value="${hund.lang }"/>
                                                </div>
                                            </div>
                                            <div class="content half last">
                                                <div class="in_txt fb">
                                                	<fmt:formatNumber pattern="#.##" value="${hund.sum }"/>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="tcontents tlast">
                                            <div class="content half first">
                                                <div class="txt">응시자</div>
                                            </div>
                                            <div class="content">
                                                <div class="white in_txt" id="point15">${pk }</div>
                                            </div>
                                            <div class="content">
                                                <div class="pink in_txt"  id="point16">${pm }</div>
                                            </div>
                                            <div class="content">
                                                <div class="pink in_txt"  id="point17">${pe }</div>
                                            </div>
                                            <div class="content">
                                                <div class="pink in_txt"  id="point18">${ph }</div>
                                            </div>
                                            <div class="content">
                                                <div class="pink in_txt"  id="point19">${px1 }</div>
                                            </div>
                                            <div class="content">
                                                <div class="pink in_txt"  id="point20">${px2 }</div>
                                            </div>
                                            <div class="content lb">
                                                <div class="pink in_txt"  id="point21">${pf }</div>
                                            </div>
                                            <div class="content half last">
                                                <div class="in_txt fb">${ps }</div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="rank_add_txt">※총점은 국어, 수학, 탐구영역의 합계입니다.</div>
                    </div>
                </div>
                <div class="page_inner">
                    <div class="sv_btn">
                        <a onclick="history.back()">
                            <img src="/img/rank/btn01.png">
                        </a>
                    </div>
                </div>
            </div>
            <footer>
            	<c:import url="/WEB-INF/view/main/footer.jsp"/>
            </footer>
        </div>
    </body>
    
    <script>
		// 프린트
		function print(){
			$("#printWrap").printThis({
				importCSS : '/css/style.css'
			});
		}
	</script>
    
</html>