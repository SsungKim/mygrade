<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>


<!doctype html>
<html>
    <head>
    	<c:import url="/WEB-INF/view/main/head.jsp"/>
    </head>
     
    <body>
        <div id="wrapper">
        	<c:import url="/WEB-INF/view/main/popup/buyPopup.jsp"/>
            <div class="interview02">
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
                <div class="purchase">
                    <div class="img">
                        <img src="/img/student_view/buy_img.png">
                    </div>
                    <div class="txt">
                        <span onclick="buyPopup()">구매하기</span><br>
                        <c:if test="${interview.user == login.auto }">
                        </c:if>
                    </div>
                </div>
                <div class="infomation_wrap">
                    <div class="inner">
                        <div class="detail_item">
                            <div class="school_logo">
                                <img src="/img/university/${interview.school }.png"/>
                            </div>
                            <div class="txt_wrap">
                                <div class="name">
                                    ${interview.name.substring(0, 1) }
                                    <c:forEach var="i" begin="1" end="${interview.name.length()-1 }">
                                        O
                                    </c:forEach>
                                </div>
                                <div class="university">${interview.school2 }</div>
                                <div class="department">${interview.subject }</div>
                            </div>
                        </div>
                        <div class="detail_info_wrap">
                            <div class="detail_info">
                                <div class="info">
                                    <div class="img">
                                        <img src="/img/student_view/info01.png">
                                    </div>
                                    <div class="txt">${interview.year }</div>
                                </div>
                                <div class="info">
                                    <div class="img">
                                        <img src="/img/student_view/info10.png">
                                    </div>
                                    <div class="txt">${interview.type }</div>
                                </div>
                            </div>
                            <div class="detail_info">
                                <div class="info">
                                    <div class="img">
                                        <img src="/img/student_view/info09.png">
                                    </div>
                                    <div class="txt">${interview.admission }</div>
                                </div>
                                <div class="info">
                                    <div class="img">
                                        <img src="/img/student_view/info15.png">
                                    </div>
                                    <div class="txt">${interview.typical }</div>
                                </div>
                                <div class="info">
                                    <div class="img">
                                        <img src="/img/student_view/info08.png">
                                    </div>
                                    <div class="txt">${interview.pass }</div>
                                </div>
                            </div>
							<div class="certify_wrap">
								<c:forEach var="t" items="${certList }">
									<div class="certify">
										<div class="star">
											<img src="/img/student_view/star.png">
										</div>
										<div class="txt">${t.schoolName } ${t.certType }생</div>
										<div class="stamp">
											<img src="/img/student_view/stamp.png">
										</div>
									</div>
								</c:forEach>
							</div>
                        </div>
                    </div>
                </div>
                <div class="infomation_wrap re_info">
                    <div class="inner">
                        <div class="detail_info_wrap">
                            <div class="detail_info">
                                <div class="info">
                                    <div class="img">
                                        <img src="/img/student_view/info01.png">
                                    </div>
                                    <div class="txt">${interview.year }</div>
                                </div>
                                <div class="info">
                                    <div class="img">
                                        <img src="/img/student_view/info10.png">
                                    </div>
                                    <div class="txt">${interview.type }</div>
                                </div>
                            </div>
                            <div class="detail_info">
                                <div class="info">
                                    <div class="img">
                                        <img src="/img/student_view/info09.png">
                                    </div>
                                    <div class="txt">${interview.admission }</div>
                                </div>
                                <div class="info">
                                    <div class="img">
                                        <img src="/img/student_view/info15.png">
                                    </div>
                                    <div class="txt">${interview.typical }</div>
                                </div>
                                <div class="info">
                                    <div class="img">
                                        <img src="/img/student_view/info08.png">
                                    </div>
                                    <div class="txt">${interview.pass }</div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="infomation_wrap infomation_wrap1">
                    <div class="inner blur" id="blur">
                        <div class="infomation_txt">
                            <div class="img">
                                <img src="/img/student_view/info_tit.png">
                            </div>
                            <div class="txt">면접방법</div>
                        </div>
                        <div class="detail_info_wrap">
                        	<c:choose>
                        		<c:when test="${login.id == 'admin' || interview.user == login.auto  || buyCheck == 'buy' }">
                        			<div class="detail_info">
		                                <div class="info">
		                                    <div class="img">
		                                        <img src="/img/interview/interview01/info01.png">
		                                    </div>
		                                    <div class="txt">
		                                        ${interview.time }
		                                    </div>
		                                </div>
		                                <div class="info info1">
		                                    <div class="img">
		                                        <img src="/img/interview/interview01/info05.png">
		                                    </div>
		                                    <div class="txt">
		                                        ${interview.people }
		                                    </div>
		                                </div>
		                                <div class="info info1 fr">
		                                    <div class="img">
		                                        <img src="/img/interview/interview01/info06.png">
		                                    </div>
		                                    <div class="txt">
												${interview.kinds }
		                                    </div>
		                                </div>
		                                <div class="info">
		                                    <div class="img">
		                                        <img src="/img/interview/interview01/info07.png">
		                                    </div>
		                                    <div class="txt">
		                                        ${interview.how }
		                                    </div>
		                                </div>
		                                <div class="info">
		                                    <div class="img">
		                                        <img src="/img/interview/interview01/info08.png">
		                                    </div>
		                                    <div class="txt">
		                                        ${interview.tip }
		                                    </div>
		                                </div>
		                            </div>
                        		</c:when>
                        		<c:otherwise>
		                            <div class="blur_img">
		                                <img src="/img/blur02.png">
		                            </div>
                        		</c:otherwise>
                        	</c:choose>
                        </div>
                    </div>
                </div>
                <div class="page_inner">
                    <div class="student_view_txt">※면접후기는 구매하셔야 내용이 보입니다.</div>
                    <div class="ssw_tit">
                        <div class="img">
                            <img src="/img/student_view/info_tit.png">
                        </div>
                        <div class="tit">
                            면접후기1
                        </div>
                        <div class="txt">
                            질문 및 답변내용
                        </div>
                    </div>
                    <div class="txtarea_wrap">
                        <div class="img">
                            <img src="/img/interview/interview01/interview_tit.png">
                            <div class="sub_tit">
                                <div class="img">
                                    <img src="/img/student_view/info_tit.png">
                                </div>
                                <div class="txt">
                                     질문 및 답변내용
                                </div>
                            </div>
                        </div>
                        <c:choose>
                        	<c:when test="${login.id == 'admin' || interview.user == login.auto || buyCheck == 'buy'}">
                        		<div class="txtarea_txt blur" style="background-image: none; ">${interview.content1 }</div>
                        	</c:when>
                        	<c:otherwise>
                        		<div class="txtarea_txt blur"></div>
                        	</c:otherwise>
                        </c:choose>
                    </div>
                    <div class="ssw_tit">
                        <div class="img">
                            <img src="/img/student_view/info_tit.png">
                        </div>
                        <div class="tit">
                            면접후기2
                        </div>
                        <div class="txt">
                            기타 특이사항 또는 나만의 면접 팁
                        </div>
                    </div>
                    <div class="txtarea_wrap">
                        <div class="img">
                            <img src="/img/interview/interview01/interview_tit01.png">
                            <div class="sub_tit">
                                <div class="img">
                                    <img src="/img/student_view/info_tit.png">
                                </div>
                                <div class="txt">
                                      기타 특이사항 또는 나만의 면접 팁
                                </div>
                            </div>
                        </div>
                        <c:choose>
                        	<c:when test="${login.id == 'admin' || interview.user == login.auto || buyCheck == 'buy' }">
                        		<div class="txtarea_txt blur" style="background-image: none; ">${interview.content2 }</div>
                        	</c:when>
                        	<c:otherwise>
                        		<div class="txtarea_txt blur"></div>
                        	</c:otherwise>
                        </c:choose>
                    </div>
                    <div class="sv_btn_wrap">
                    	<c:if test="${interview.user == login.auto }">
	                        <div class="sv_btn" onclick="modify()">
	                            <img src="/img/student_view/btn01.png">
	                        </div>
	                        <div class="sv_btn" onclick="remove()">
	                            <img src="/img/student_view/btn03.png">
	                        </div>
                    	</c:if>
                        <div class="sv_btn" onclick="history.back()">
                            <img src="/img/student_view/btn02.png">
                        </div>
                    </div>
                    <div class="gpa_wrap">
                        <div class="gpa_header">
                            <div class="gpa_tit">평점</div>
                            <div class="star_wrap">
                                <c:choose>
                                	<c:when test="${interview.point == 0 }">
										<c:forEach var="i" begin="1" end="5">
											<div class="star">
                                            	<img src="/img/interview/interview01/star02.png">
											</div>
										</c:forEach>
									</c:when>
									<c:otherwise>
										<c:choose>
											<c:when test="${interview.point / interview.comment >= 4.5 }">
												<c:forEach var="i" begin="1" end="5">
													<div class="star">
		                                            	<img src="/img/interview/interview01/star01.png">
													</div>
												</c:forEach>
											</c:when>
											<c:when test="${interview.point / interview.comment >= 3.5 }">
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
											<c:when test="${interview.point / interview.comment >= 2.5 }">
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
											<c:when test="${interview.point / interview.comment >= 1.5 }">
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
											<c:when test="${interview.point / interview.comment >= 0.5 }">
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
										</c:choose>
									</c:otherwise>
								</c:choose>
                            </div>
                            <div class="gpa_num">
                            	<c:choose>
                            		<c:when test="${interview.point == 0 }">
                            			0.0
                            		</c:when>
                            		<c:otherwise>
		                            	<fmt:formatNumber pattern="#.##" value="${interview.point / interview.comment }"/>
                            		</c:otherwise>
                            	</c:choose>
                                <span>${interview.comment }명</span>
                            </div>
                        </div>
                        <div class="gpa_input_wrap">
                            <div class="radio_wrap">
                                <div class="radio">
                                    <input type="radio" id="type01" name="star">
                                    <label for="type01">별점</label>
                                    <div class="line"></div>
                                </div>
                                <div class="radio">
                                    <input type="radio" id="type02" name="star">
                                    <label for="type02">별점+댓글</label>
                                </div>
                            </div>
                            <select id="commentPoint">
                                <option value="choose">평점선택</option>
                                <option value="1">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;1점</option>
                                <option value="2">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;2점</option>
                                <option value="3">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;3점</option>
                                <option value="4">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;4점</option>
                                <option value="5">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;5점</option>
                            </select>
                            <c:choose>
                            	<c:when test="${login.auto == interview.user }">
		                            <textarea placeholder="(본인 자료는 평가할 수 없습니다.)" id="comment" maxlength="100" disabled="disabled"></textarea>
                            	</c:when>
                            	<c:when test="${login != null && buy == 0 }">
		                            <textarea placeholder="(한글 최소 3자이상, 최대 100자 까지 입력 가능합니다.)" id="comment" maxlength="100"></textarea>
                            	</c:when>
                            	<c:when test="${login != null && buy == 1 }">
                            		<textarea placeholder="(구매 후 작성 가능합니다.)" id="comment" maxlength="100" disabled="disabled"></textarea>
                            	</c:when>
                            	<c:otherwise>
                            		<textarea placeholder="(로그인 후 작성 가능합니다.)" id="comment" maxlength="100" disabled="disabled"></textarea>
                            	</c:otherwise>
                            </c:choose>
                            <div class="gpa_btn" onclick="commentSubmit()">
                                <img src="/img/interview/interview01/gpa_btn.png">
                            </div>
                            <div class="gpa_btn01" onclick="commentSubmit()">
                                <img src="/img/interview/interview01/gpa_btn01.png">
                            </div>
                        </div>
                        <c:forEach var="t" items="${comment }">
	                        <div class="gpa_contents">
	                            <div class="contents_tit">
	                                <div class="star_wrap">
	                                    <c:choose>
											<c:when test="${t.point >= 4.5 }">
												<c:forEach var="i" begin="1" end="5">
													<div class="star">
		                                            	<img src="/img/interview/interview01/star01.png">
													</div>
												</c:forEach>
											</c:when>
											<c:when test="${t.point >= 3.5 }">
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
											<c:when test="${t.point >= 2.5 }">
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
											<c:when test="${t.point >= 1.5 }">
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
											<c:when test="${t.point >= 0.5 }">
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
	                                <div class="tit_txt">
	                                    (
	                                    	${t.id.substring(0, 2) }
	                                    	<c:forEach var='i' begin="1" end="${t.id.length()-2 }">
	                                    		*
	                                    	</c:forEach>
	                                    )
	                                    ${t.day }
	                                </div>
	                            </div>
	                            <div class="contents_txt">
									${t.comment }
	                            </div>
	                        </div>
                        </c:forEach>
                        <div class="page_select_wrap">
                            <c:import url="/WEB-INF/view/interview/page2.jsp"/>
                        </div>
                    </div>
                </div>
            </div>
            <footer>
            	<c:import url="/WEB-INF/view/main/footer.jsp"/>
            </footer>
        </div>
    </body>
    
    <script>
    	// 구매하기 팝업
    	function buyPopup(){
 	 		if(${login == null}){
 	 			alert("로그인 후 구매 가능합니다.");
 	 			location.href="/member/login";
 	 			return;
 	 		}
 	 		if(${interview.user == login.auto }){
 				alert("본인 자료는 구매할 수 없습니다.");
 				return;
 			}
 	 		$("#popup_cover").show();
 	 		$("#popup_buy").show();
 	 		$("body").css("overflow", "hidden");
 	 	}
    	// 댓글입력
        function commentSubmit(){
           if(${login == null}){
              alert("로그인 후 작성 가능합니다.");
              location.href='/member/login';
              return;
           }
           if(${interview.user == login.auto }){
              alert("본인 자료는 평가할 수 없습니다.");
              return;
           }
           if(${buy == 1}){
              alert("구매후 작성 가능합니다.");
              return;
           }
           var ratingNum = 0;
           $.ajax({
        	   type : "post",
        	   url : "/interview/interviewRating/${interview.auto }/${login.id }",
        	   async : false,
        	   success : function(num){
        		   ratingNum = num;
        	   }
           });
//            if(ratingNum > 0){
//         	   alert("이미 평가한 자료입니다.");
//         	   return;
//            }
           var point = $("#commentPoint").val();
           var comment = $("#comment").val();
           var type = $("#type01").prop("checked") ? true : false;
           if(point == "choose"){
              alert("평점을 선택해주세요.");
              return;
           }
           if(type){
              $.ajax({
                 type : "post",
                 url : "/interview/comment/${interview.auto }/${login.id }/"+point,
                 async : false,
                 success : function(txt){
                    if(txt){
                       alert("평가되었습니다.");
                       location.reload();
                    } else {
                       alert("평가에 실패하였습니다.\n잠시후 다시 시도해주세요.");
                    }
                 }
              });
           } else {
              if(comment.length < 3){
                 alert("댓글은 3자이상, 100자 이하로 작성해주세요.");
                 return;
              }
              $.ajax({
                 type : "post",
                 url : "/interview/comment/${interview.auto }/${login.id }/"+comment+"/"+point,
                 async : false,
                 success : function(txt){
                    if(txt){
                       alert("등록되었습니다.");
                       location.reload();
                    } else {
                       alert("등록에 실패하였습니다.\n잠시후 다시 시도해주세요.");
                    }
                 }
              });
           }
        }
		// 수정하기
		function modify(){
			location.href='/interview/modify/${interview.auto }';
		}
		// 구매내역 확인
	 	$(document).ready(function(){
	 		var buyList;
	 		$.ajax({
	 			type : "post",
	 			url : "/member/buyList",
	 			async : false,
	 			success : function(txt){
	 				buyList = txt;
	 			}
	 		});
	 		if(buyList.length > 0){
	 			for(var i=0; i<buyList.length; i++){
	 				if(buyList[i].item == "면접후기"){
	 					if(buyList[i].target == ${itemNum }){
	 						$(".blur").css("filter", "none");
	 					}
	 				}
	 			}
	 		}
	 		if(${interview.user == login.auto }){
	 			$(".blur").css("filter", "none");
	 		}
	 	});
		// 삭제
		function remove(){
			var confirm = window.confirm("삭제하시겠습니까?");
			if(confirm){
				$.ajax({
					type : "post",
					url : "/interview/remove/${interview.auto }",
					async : false,
					success : function(txt){
						if(txt){
							alert("삭제되었습니다.");
							location.href="/member/myData/${login.auto }";
						} else {
							alert("삭제에 실패하였습니다.\n잠시후 다시 시도해주세요.");
						}
					}
				});
			}
		}
		// 평점 타입 선택
	      $(document).ready(function(){
	         $("#type01").change(function(){
	            var type = $("#type01").prop("checked");
	            if(type){
	               $("#comment").prop("disabled", "disabled");
	            }
	         });
	         $("#type02").change(function(){
	            var type = $("#type02").prop("checked");
	            if(type && ${buy != 1}){
	               $("#comment").prop("disabled", "");
	            }
	         });
	      });
    </script>
    
</html>