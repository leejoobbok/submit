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

<script type="text/javascript" src="http://code.jquery.com/jquery.min.js"></script>
<script type="text/javascript">

	// 모집공고 보러가기
	function showRecruit()
	{
		window.location.href = "PostFormSample.jsp";
	}
	
	// 지원서 보러가기
	$(function() 
	{
		$(".showApply").click(function() 
		{
			//alert($(this).val());
			window.open('ApplyArticle.jsp','applyArticle',
		             'left=500,top=300,width=1000,height=1000,resizable=no,location=no');
		});
	});
		
	
	function rateOneMember()
	{
		window.open('RateOneMemberForm.jsp','rateOneMbmer',
	    'left=500,top=300,width=1000,height=500,resizable=no,location=no');
	}
	
	
	// 팀 스페이스 이동
	function moveToTeamSpace()
	{
		window.open('TeamSpace.jsp','teamSpace',
	    'left=500,top=300,width=1570,height=850,resizable=no,location=no');
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
				<span class="titleText1">진행중인 프로젝트</span>
				<br />
				<br>
				
				<div class="listsDiv">	
				
				<!-- ★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★시작 -->
				
				

	<c:choose>
		<c:when test="${checkPresentProject == 0 }">
			<h3>현재 진행 중인 프로젝트가 존재하지 않습니다.</h3>
		</c:when>
		<c:otherwise>
			<div>
				<div>
					<h2>
						프로젝트
						<button type="button" id="showRecruit" name="showRecruit"
							class="blackBtn"
							onclick="window.location.href='recruitarticle.action?recruitNo=${projectInfoDTO.recruitNo }'">
							현재 프로젝트 공고 보러가기</button>
						<button type="button" class="ingMember"
							onclick="moveToTeamSpace()" style="background-color: yellow;">
							팀 스페이스</button>
					</h2>
					${projectInfoDTO.recruitName} (<span id="dDay">D-${projectInfoDTO.dDay }</span>)
					<br />
					<h4>나의 포지션: ${projectInfoDTO.posName }</h4>
					<p>진행 기간 (${projectInfoDTO.prjStart } ~ ${projectInfoDTO.prjEnd })</p>

				</div>


				<hr />

				<div>
					<h2>멤버 정보 & 평가</h2>

					<div class="right-left">
						<c:forEach var="position" items="${positionDTO }">
				${position.posName } <b> ${position.count } </b>명 | 
			</c:forEach>
						<br />
						<br />

					</div>
					<div id="projectInfo">
						<table id="prjMemberLists">
							<tr>
								<th>멤버 번호</th>
								<th>닉네임</th>
								<th>포지션</th>
								<!-- 
					<th>상태</th>
					<th>평가</th>
					 -->
							</tr>
							<c:forEach var="member" items="${memberDTO }">
								<tr>
									<td>${member.finalNo }</td>
									<td>${member.nickname }</td>
									<td>${member.posName }</td>
									<!-- <td><span class="ing">참여 중</span></td> -->
									<!--
					<td>
						<button type="button" class="ingMember"
						onclick="alert('프로젝트가 끝나지 않은 멤버는 평가할 수 없습니다.')">
							평가
						</button>
					</td> 
				-->
								</tr>
							</c:forEach>
						</table>

					</div>
				</div>
				<hr />




			</div>
			<!-- end #rightBar -->
		</c:otherwise>
	</c:choose>
					
					
					
				<!-- ★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★끝 -->
					
					
				</div><!-- listsDiv -->
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