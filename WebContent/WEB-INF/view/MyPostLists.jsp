<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>나의 모집 :projectors</title>
<link rel="stylesheet" type="text/css" href="<%=cp %>/css/flexBoxTwo.css">
<link rel="stylesheet" type="text/css" href="<%=cp %>/css/mypost.css">

<script type="text/javascript" src="http://code.jquery.com/jquery.min.js"></script>
<script type="text/javascript">

/* 	// 모집공고 보러가기
	function showRecruit()
	{
		window.location.href = "PostFormSample.jsp";
	}

 */	// 지원서 보러가기
	$(function()
	{
		$(".showApply").click(function()
		{
			//alert($(this).val());
			window.open('ApplyArticle.jsp', 'applyArticle','left=500,top=300,width=1000,height=1000,resizable=no,location=no');
		});
	});
	
 
 	function preDelete()
	{
		if (confirm("취소 후 복구할 수 없습니다. 취소하시겠습니까?"))
		{
			var recruitNo = document.getElementById("recruitNo").value;
			
			window.location.href="deleteRecruit.action?recruitNo="+recruitNo;
		}
		else
		{
			return;		
		}
	}
	
</script>

</head>

<body>


<div class="wrapper">

	<div class="header">
	
		<!-- header -->
		<c:choose>
		<c:when test="${not empty pinNo}">
			<div class="header-member">
				<c:import url="memberBar.jsp"></c:import>
			</div>
		</c:when>
		<c:otherwise>
			<div class="header-member">
				<c:import url="GuestBar.jsp"></c:import>
			</div>
		</c:otherwise>
		</c:choose>
		
		<div class="header-logo">
			<a href="projectorsmain.action"><img style="width: 530px;" src="<%=cp %>/images/NEXTART_LOGO.png"/></a>
		</div>	
		
	</div>
	
	<div class="header-menu">
		<c:import url="menuBar.jsp"></c:import>
	</div>
	
	
	<div class="main">
		<h2 class="pageTitle">나의 모집 이력</h2>
		
		<div class="container">
		
			<div class="left">
			
				<div class="btnHeight">
					<a href="mypost.action">
						<button type="button" class="btn" id="nowButton">현재 모집</button>
					</a>
				</div>
				<div class="btnHeight">
					<a href="mypastpost.action">
						<button type="button" class="btn" id="pastButton">과거 모집</button>
					</a>
				</div>
				
			</div><!-- left -->
			
			  
			<div class="right">
				<span class="titleText1">현재 모집 이력</span>
				<br><br />
				
				<c:choose>
				<c:when test="${check==0}">
					<h3>&nbsp;&nbsp;&nbsp; 현재 회원님께서 모집 중인 공고가 존재하지 않습니다.</h3>
				</c:when>
				<c:otherwise>
				<div class="listsDiv">	
				
				<!-- ★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★시작 -->
				
				
			            <div>
			               <h2>
			                  모집 중인 공고
			                  <button type="button" id="showRecruit" name="showRecruit"
			                     class="blackBtn" onclick="window.location.href='recruitarticle.action?recruitNo=${presentRecruit.recruitNo}'">모집공고 보러가기</button>
			                     
								<!-- 코어태그랑 공고취소 버튼 달릴 자리  -->
								<c:choose>
									<c:when test="${checkDelete == 1}">
										<button type="button" onclick="preDelete()">
											<span style="color: red;">모집 취소</span>
										</button>
										<input type="hidden" id="recruitNo" value="${presentRecruit.recruitNo }" />
									</c:when>
								</c:choose>
			               </h2>
			               ${presentRecruit.recruitName }
			            </div>
			            <hr />
			            <br />
			            	모집 현황 (포지션 마감 인원 / 모집 인원) <br />
			 					<b><c:forEach var="positionCount" items="${positionCount }" >
			               	 		  ${positionCount.posName }    ${positionCount.countPos } / ${positionCount.countAll } |
			             		</c:forEach></b>
			            <div>
			               <h2>모집 마감일</h2>
			               ${presentRecruit.deadline }
			            </div>
			            <hr />
			            <br />
			
			            <div>
			               <h2>미열람 지원자</h2>
			               <hr />
			               <br />
			        
			                  <table class="table">
			                     <tr>
			                        <th>지원서 번호</th>
			                        <th>지원포지션</th>
			                        <th>지원자</th>
			                        <th>보기</th>
			                     </tr>
			                     <c:choose>
			                        <c:when test="${checkPresentNone == 0}">
			                           <tr>
			                              <td colspan="4">미열람 지원자가 없습니다.</td>
			                           </tr>
			                        </c:when>
			                        <c:otherwise>
			                           <c:forEach var="presentNone" items="${presentNone }">
			                              <tr>
			                                 <td>${presentNone.recruitNo }</td>
			                                 <td>${presentNone.posName }</td>
			                                 <td>${presentNone.nickname }</td>
			                                 <td><button onclick="window.location.href='readApply.action?applyNo=${presentNone.applyNo}'">지원서 보기</button></td>
			                              </tr>
			                           </c:forEach>
			                        </c:otherwise>
			                     </c:choose>
			                  </table>
			              
			               <br /> <br />
			               <h2>보류 지원자</h2>
			               <hr />
			               <br />
			               
			                  <table class="table">
			                     <tr>
			                        <th>지원서 번호</th>
			                        <th>지원포지션</th>
			                        <th>지원자</th>
			                        <th>열람일시</th>
			                        <th>지원서</th>
			                        <th>합격 버튼</th>
			                     </tr>
			                     <c:choose>
			                        <c:when test="${checkPresentX == 0}">
			                           <tr>
			                              <td colspan="6">보류 지원자가 없습니다.</td>
			                           </tr>
			                        </c:when>
			                        <c:otherwise>
			                           <c:forEach var="presentX" items="${presentX }">
			                              <tr>
			                                 <td>${presentX.recruitNo }</td>
			                                 <td>${presentX.posName }</td>
			                                 <td>${presentX.nickname }</td>
			                                 <td><c:if test="${not empty presentX.ckDate}">
			                                 ${presentX.ckDate }
			                                 </c:if></td>
											 <td><button onclick="window.location.href='readApply.action?applyNo=${presentX.applyNo}'">지원서 보기</button></td>
			                                 <td>
			                                 <c:choose>
			                                 <c:when test="${presentX.fullCount == 0 }">
			                                 	<button onclick="window.location.href='passApply.action?applyNo=${presentX.applyNo}&recruitNo=${presentX.recruitNo}'">합격 처리하기</button>
			                                 </c:when>
			                                 <c:otherwise>
			                                 	모집마감
			                                 </c:otherwise>
			                                 </c:choose>
			                                 </td>
			                              </tr>
			                           </c:forEach>
			                        </c:otherwise>
			                     </c:choose>
			                  </table>
			             
			               <br /> <br />
			               <h2>합격 지원자(1차)</h2>
			               <hr />
			               <br />
			          
			                  <table class="table">
			                     <tr>
			                        <th>지원서 번호</th>
			                        <th>지원포지션</th>
			                        <th>지원자</th>
			                        <th>열람일시</th>
			                     </tr>
			                     <c:choose>
			                        <c:when test="${checkPresentO == 0}">
			                           <tr>
			                              <td colspan="4">합격 지원자가 없습니다.</td>
			                           </tr>
			                        </c:when>
			                        <c:otherwise>
			                           <c:forEach var="presentO" items="${presentO }">
			                              <tr>
			                                 <td>${presentO.applyNo }</td>
			                                 <td>${presentO.posName }</td>
			                                 <td>${presentO.nickname }</td>
			                                 <td><c:if test="${not empty presentO.ckDate}">
			                                 ${presentO.ckDate }
			                                 </c:if></td>
			                              </tr>
			                           </c:forEach>
			                        </c:otherwise>
			                     </c:choose>
			                  </table>
			          
			            </div>
			            <br />
			            <div>
			               <div class="right-left">
			          <!--         <p>모집 현황</p> -->
			                  
			               </div>
<!-- 			               
							 <div class="right-right">
			                  <button class="blackBtn" style="background-color: grat;">모집
			                     취소<br />(공사중)</button>
			               	</div> 
-->
			          	   <br />
			               <br>
							
							<h2>
								최종 합류
								<c:choose>
									<c:when test="${finalCountDTO.finalCount == finalCountDTO.totalCount}">
										(프로젝트 생성 완료)&nbsp;<button type="button"
										onclick="window.location.href='myproject.action'"> 프로젝트 </button>
									</c:when>
								</c:choose>
								
								<c:choose>
									<c:when test="${checkFinal != 0 }">
										<h4>
										합류 인원:${finalCountDTO.finalCount } /
										모집 인원:${finalCountDTO.totalCount }
										</h4>
									</c:when>
								</c:choose>
							</h2>
			               <hr />
							<br />
			               <table class="table" >
			               <tr>
			               		<th>지원서 번호</th>
			               		<th>포지션</th>
			               		<th>닉네임</th>
			               		<th>최종 합류 일시</th>
			               </tr>
			               <c:choose>
							  <c:when test="${checkFinal == 0}">
			               		<tr>
			               			<td colspan="4">최종 합류자가 없습니다.</td>
			               		</tr>
			               	  </c:when>
			               	  <c:otherwise>
			               	  	<c:forEach var="finalMember" items="${finalMemberDTO }">
									<tr>
										<td>${finalMember.applyNo }</td>
										<td>${finalMember.posName }</td>
										<td>${finalMember.nickname }</td>
										<td>${finalMember.finalCkDate }
									</tr>
			               	  	</c:forEach>
			               	  </c:otherwise>
			               </c:choose>
			               </table>
			            </div>
			
					
					
				<!-- ★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★끝 -->
					
				</div><!-- listsDiv -->
				</c:otherwise>
				</c:choose>
				
				
			</div><!-- right -->
		</div> <!-- container -->
	</div><!-- main -->
	
	<div class="footer">
		<!-- footer -->
		<c:import url="Footer.jsp"></c:import>
	</div>
</div>


</body>
</html>