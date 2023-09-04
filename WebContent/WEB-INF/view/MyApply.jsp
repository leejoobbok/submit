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
<title>나의 지원 :projectors</title>
<link rel="stylesheet" type="text/css" href="<%=cp %>/css/flexBoxTwo.css">
<link rel="stylesheet" type="text/css" href="<%=cp %>/css/myapply.css">

<script type="text/javascript" src="http://code.jquery.com/jquery.min.js"></script>
<script type="text/javascript">
</script>
<style type="text/css">

table
{
	text-align: center;
}

tr
{
	border-bottom: 1px solid black;
}

.recruitTitle
{
	width: 190pt;
}

</style>
<script type="text/javascript">
	function addFinal()
	{
		var firstCkNo = document.getElementById("addFinalBtn").value;
		var recruitNo = document.getElementById("recruitNo").value;
		
		if(confirm("정말 최종 합류 결정을 하시겠습니까?"))
		{
			/* alert("최종합류"); */
			
			window.location.href = "addfinal.action?firstCkNo="+firstCkNo+"&recruitNo="+recruitNo;		
		}
		else
		{
			/* alert("최종합류 취소"); */
			return;
		}
	}
	
	function preDelete()
	{
		var applyNo = document.getElementById("applyNo").value;
		
		if (confirm("정말 지원을 취소하시겠습니까?"))
		{
			/* alert("지원 취소 결정!"); */
			window.location.href="deleteapply.action?applyNo="+applyNo;
		}
		else
		{
			/* alert("지원 취소 안 할래요"); */
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
		<h2 class="pageTitle">나의 지원 이력</h2>
		
		<div class="container">
		
			<div class="left">
			
				<div class="btnHeight">
					<a href="myapply.action">
						<button type="button" class="btn" id="nowButton">현재 지원</button>
					</a>
				</div>
				<div class="btnHeight">
					<a href="mypastapply.action">
						<button type="button" class="btn" id="pastButton">과거 지원</button>
					</a>
				</div>
				
			</div><!-- left -->
			
			  
			<div class="right">
				<span class="titleText1">현재 지원 이력</span>
					<c:choose>
						<c:when test="${checkPresent == 0 || checkFirstCk !=0 || checkFinal != 0}">
						</c:when>	
						<c:otherwise>
							<c:choose>
								<c:when test="${checkDeleteApply == 1}">
									&nbsp;
									<button type="button" onclick="preDelete()" >
										지원 취소
									</button>
								</c:when>
							</c:choose>	
						</c:otherwise>				
					</c:choose>
				<hr />
				<br>
				
				
				<c:choose>
				<c:when test="${checkPresent == 0 || checkFirstCk !=0 || checkFinal != 0}">
					<h3>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;  현재 지원 이력이 존재하지 않습니다.</h3>
				</c:when>
				<c:otherwise>
				
					<div class="listsDiv">	
					<table>
					<tr>
					<div> <!-- th 용  -->
						<th><div>지원서번호</div></th>
						<th><div>포지션명</div></th>
						<th class="recruitTitle"><div>공고 제목</div></th>
						<th><div>닉네임</div></th>
						<th><div>지원 날짜</div></th>
						<th><div>상태</div></th>
					</div>
					</tr>
					<tr>
					<div> <!-- 현재 지원 데이터  -->
						<input type="hidden" id="applyNo" value="${presentApply.applyNo }">
						<td><div>${presentApply.applyNo}</div></td>
						<td><div>${presentApply.posName}</div></td>
						<td><div><a href="recruitarticle.action?recruitNo=${presentApply.recruitNo}">${presentApply.title}</a></div></td>
						<td><div>${presentApply.nickName}</div></td>
						<td><div>${presentApply.applyDate}</div></td>
						<td><div>
								<c:choose>
									<c:when test="${not empty presentApply.ckDate }">
										읽음
									</c:when>
									<c:otherwise>
										안읽음
									</c:otherwise>
								</c:choose>
							</div></td>			
					</div>
					</tr>
					</table>
					</div> <!-- end of listDiv  -->
					
					
					<div class="applyNow">
					</div>
					<div class="applyComplete">
					</div>
					
				</c:otherwise>
				</c:choose>
				<br />
				
		</div><!-- right -->
		
		
	</div> <!-- container1 -->
		
		
	<br />
	<div class="container">
		<!-- 1차 합격 지원서  -->
		<div class="left"></div>
		<div class="right">
				<span class="titleText1">1차 통과 지원서</span>
				<hr />
				<br>
				<c:choose>
					<c:when test="${checkFirstCk == 0 || checkFinal != 0}">
						<h3>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 현재 1차 통과 지원 이력이 존재하지 않습니다.</h3>
					</c:when>
					<c:otherwise>
						<div class="listsDiv">	
						<table>
						<tr>
						<div> <!-- th 용  -->
							<th><div>지원서번호</div></th>
							<th><div>포지션명</div></th>
							<th class="recruitTitle"><div>공고 제목</div></th>
							<th><div>닉네임</div></th>
							<th><div>통과 날짜</div></th>
							<th><div>상태</div></th>
							<th><div>최종합류</div></th>
						</div>
						</tr>
						<tr>
						<div> <!-- 현재 지원 데이터  -->
							<td><div>${firstCkApply.applyNo}</div></td>
							<td><div>${firstCkApply.posName}</div></td>
							<td><div><a href="recruitarticle.action?recruitNo=${firstCkApply.recruitNo}">${firstCkApply.title}</a></div></td>
							<td><div>${firstCkApply.nickName}</div></td>
							<td><div>${firstCkApply.passDate}</div></td>
							<td><div>
									<c:choose>
										<c:when test="${not empty firstCkApply.ckDate }">
											읽음
										</c:when>
										<c:otherwise>
											안읽음
										</c:otherwise>
									</c:choose>
								</div></td>			
							<td><div>
							<c:choose>
								<c:when test="${memberCount == firstCkCount }">
									<%-- <button type="button"
									onclick="location.href='addfinal.action?firstCkNo=${firstCkApply.firstCkNo}'">최종 합류</button>								
									</c:when> --%>
									<button type="button" id="addFinalBtn" value="${firstCkApply.firstCkNo}"
									onclick="addFinal()">최종 합류</button>								
									</c:when>
								<c:otherwise>
									합격자 부족
								</c:otherwise>	
							</c:choose>
							</div></td>
							<br />
							<input type="hidden" id="recruitNo" value="${firstCkApply.recruitNo }">
						</div>
						</tr>
						</table>
						</div> <!-- end of listDiv  -->					
					</c:otherwise>
				</c:choose>
				
				
		</div><!-- right -->
	</div><!-- container2  -->
	
	<br />
	<div class="container">	
		<!-- 최종 합류 대기 지원서  -->
		<div class="left"></div>
		<div class="right">
				<span class="titleText1">최종 합류 대기 지원서</span>
				<hr />
				<br>
				<%--<c:when test="${checkFinal == 0}"> --%>
				<c:choose>
					<c:when test="${checkFinal == 0}">
						<h3>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 현재 최종 합류 대기 중인 지원 이력이 존재하지 않습니다.</h3>
					</c:when>
					<c:otherwise>
						<div class="listsDiv">	
						<table>
						<tr>
						<div> <!-- th 용  -->
							<th><div>지원서번호</div></th>
							<th><div>포지션명</div></th>
							<th class="recruitTitle"><div>공고 제목</div></th>
							<th><div>닉네임</div></th>
							<th><div>합류 날짜</div></th>
							<th><div>프로젝트 생성 여부</div></th>
						</div>
						</tr>
						<tr>
						<div> <!-- 현재 지원 데이터  -->
							<td><div>${finalApply.applyNo}</div></td>
							<td><div>${finalApply.posName}</div></td>
							<td><div><a href="recruitarticle.action?recruitNo=${finalApply.recruitNo}">${finalApply.title}</a></div></td>
							<td><div>${finalApply.nickName}</div></td>
							<td><div>${finalApply.finalCkDate}</div></td>
							<td><div>
							<c:choose>
									<c:when test="${checkProject == 0}">
										미생성
									</c:when>
									<c:otherwise>
										생성됨
									</c:otherwise>
								</c:choose>
							</div></td>			
						</div>
						</tr>
						</table>
						</div> <!-- end of listDiv  -->					
					</c:otherwise>
				</c:choose>
		</div><!-- right -->
	</div><!-- container3  -->
	
	
</div><!-- main -->
	
	<div class="footer">
		<!-- footer -->
		<c:import url="Footer.jsp"></c:import>
	</div>



</body>
</html>