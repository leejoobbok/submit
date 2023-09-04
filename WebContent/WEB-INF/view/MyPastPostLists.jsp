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
			window.open('ApplyArticle.jsp', 'applyArticle','left=500,top=300,width=1000,height=1000,resizable=no,location=no');
		});
	});

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
				<span class="titleText1">과거 모집 이력</span>
				<br><br />
				
				<div class="listsDiv">	
				
				<!-- ★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★시작 -->
				
			<c:choose>
			<c:when test="${checkPastPost == 0}">
				<h3>과거 모집 이력이 존재하지 않습니다.</h3>
			</c:when>
			<c:otherwise>
			<table class="table">
			<!-- 8개 -->
			<tr>
				<th>게시물 번호</th>
				<th>제목</th>
				<th>합류 인원</th>
				<th>모집 인원</th>
				<th>모집시작일</th>
				<th>프로젝트 기간</th>
				<th>상태</th>
			</tr>
			<c:forEach var="myPastPost" items="${myPastPostDTO}">			
			<tr>
				<td>${myPastPost.recruitNo }</td>
				<td>
					<a href="">${myPastPost.recruitName}</a>
				</td>
				<td>${myPastPost.firstCkCount}</td>
				<td>${myPastPost.totalCount}</td>
				<td>${myPastPost.createdDate }</td>
				<td>${myPastPost.prjStart }~${myPastPost.prjEnd }</td>
				<td>마감(
					<c:choose>
						<c:when test="${not empty myPastPost.prjNo}">
							<button type="button">프로젝트</button>
						</c:when>
						<c:otherwise>
							인원부족
						</c:otherwise>
					</c:choose>
					)</td>
			</tr>
			</c:forEach>
			</table>
			</c:otherwise>
			</c:choose>
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