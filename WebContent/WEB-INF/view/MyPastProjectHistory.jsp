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
<title>나의 프로젝트 :projectors</title>
<link rel="stylesheet" type="text/css" href="<%=cp %>/css/flexBoxTwo.css">
<link rel="stylesheet" type="text/css" href="<%=cp %>/css/myproject.css">
<style type="text/css">
	th 
	{
		width:13.5%;
		
		border-bottom: 1px solid black;
	}
	
	td
	{
		text-align: center;
	}

</style>
<script type="text/javascript" src="http://code.jquery.com/jquery.min.js"></script>
<script type="text/javascript">

	function rateAllMember()
	{
		window.open('RateAllMemberForm.jsp', 'rateAllMember', 'left=500,top=300,width=1000,height=800,resizable=no,location=no');
	}
	
	// 팀 스페이스 이동
	function moveToTeamSpace()
	{
		window.open('TeamSpace.jsp', 'teamSpace', 'left=500,top=300,width=1570,height=850,resizable=no,location=no');
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
		<h2 class="pageTitle">나의 프로젝트 이력</h2>
		
		<div class="container">
		
			<div class="left">
			
				<div class="btnHeight">
					<a href="myproject.action">
						<button type="button" class="btn" id="nowButton">진행 중인 프로젝트</button>
					</a>
				</div>
				<div class="btnHeight">
					<a href="myPastProject.action">
						<button type="button" class="btn" id="pastButton">과거 프로젝트 이력</button>
					</a>
				</div>
				
			</div><!-- left -->
			
			  
			<div class="right">
				<span class="titleText1">과거 프로젝트</span>
				<br>
				
				<div class="listsDiv">	
				
				<!-- ★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★시작 -->
				
				
<div class="right-left">
				<p id="pastProjectCount">
					과거 프로젝트 수 <b>${checkPastProject}</b>
				</p>
			</div>
			<div id="projectInfo">
				<table id="pastPrjLists">
					<tr>
						<!-- <th>프로젝트 번호</th> -->
						<th>프로젝트 명</th>
						<th>프로젝트 기간</th>
						<th>인원</th>
						<th>나의 포지션</th>
						<th>상태</th>
						<th>팀 스페이스</th>
						<th>평가</th>
					</tr>
					<c:choose>
						<c:when test="${checkPastProject == 0 }">
							<td colspan="8"><b>진행되었던 과거 프로젝트 이력이 존재하지 않습니다.</b></td>
						</c:when>
						<c:otherwise>
							<c:forEach var="pastProject" items="${pastProjectDTO}">
							<tr>
								<%-- <td>${pastProject.prjNo }</td> --%>
								<td>${pastProject.recruitName }</td>
								<td>${pastProject.prjStart }~ ${pastProject.prjEnd }</td>
								<td>${pastProject.count }</td>
								<td>${pastProject.posName }</td>
								<td><span class="prjStatus">완료(정적)</span></td>
								<td>
									<button type="button" class="ingMember"
										onclick="moveToTeamSpace()">이동</button>
								</td>
								<td>
									<button type="button" class="ingMember"
										onclick="rateAllMember()">팀원 평가</button>
								</td>
							</tr>
							</c:forEach>
						</c:otherwise>
					</c:choose>


				

				</table>
			</div>
					
					
					
				<!-- ★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★끝 -->
					
					
				</div><!-- listsDiv -->
				
				<div class="paging">
					<span>[페이징처리]</span>
				</div>
			
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