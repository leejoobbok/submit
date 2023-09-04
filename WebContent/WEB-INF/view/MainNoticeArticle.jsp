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
<title>공지사항 :projectors</title>

<link rel="stylesheet" type="text/css" href="<%=cp %>/css/flexBoxOne.css">
<link rel="stylesheet" type="text/css" href="<%=cp %>/css/notice.css">

<script type="text/javascript" src="http://code.jquery.com/jquery.min.js"></script>
<script type="text/javascript">


$(function()
{
	$("#returnList").click(function()
	{
		window.location.href="noticelists.action";
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
	<div class="container">
		
		<div class="listsDiv">
		<span class="smallTitle">공지사항</span>
		
			<div class="listDiv">
			
				<div class="article1">
				<hr class="tableLine1">
					<span class="noticeArticleTitle">제목</span>
					<span class="noticeArticleTitle2">${article.title}</span>
				<hr class="tableLine2">
				</div>
				
              	<div class="article2">
					<span class="noticeArticleContent">내용</span>
					<span class="noticeArticleContent2">${article.content}</span>
		            <hr class="tableLine1">
              	</div>
			 		
			</div>
		
		<div class="paging">
			<button id="returnList">목록으로</button>
		</div>
		
		</div>
		
	</div> <!-- end.container -->
	</div> <!-- end.main -->
	
	
	
	<div class="footer">
		<!-- footer -->
		<c:import url="Footer.jsp"></c:import>
	</div>
</div>

	
</body>
</html>