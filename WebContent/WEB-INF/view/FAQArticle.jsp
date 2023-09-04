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
<title>FAQ :projectors</title>
<link rel="stylesheet" type="text/css" href="<%=cp %>/css/flexBoxTwo.css">
<link rel="stylesheet" type="text/css" href="<%=cp %>/css/faq.css">
<script type="text/javascript" src="http://code.jquery.com/jquery.min.js"></script>

<script type="text/javascript">
	$(function()
	{
		$("#returnList").click(function()
		{
			window.location.href="faq-list.action";
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
		<h2 class="pageTitle">FAQ / 문의</h2>
		
		<div class="container">
		
			<div class="left">
			
				<div class="btnHeight">
					<a href="faq-list.action">
						<button type="button" class="btn" id="faqButton">FAQ</button>
					</a>
				</div>
				<div class="btnHeight">
				
				<c:choose>
				<c:when test="${not empty pinNo}">
					<a href="question-list.action">
						<button type="button" class="btn" id="qnaButton">1:1문의</button>
					</a>
				</c:when>
				<c:otherwise>
					<a href="">
						<button type="button" class="btn" id="qnaButton">1:1문의</button>
					</a>
				</c:otherwise>
				</c:choose>
				
				</div>
			</div><!-- left -->
			
			  
			<div class="right">
				<span class="titleText1">FAQ: 자주하는 질문</span>
				<br>

				<div class="articleDiv">	
				<c:set var="faq" value="${faqArticle}"/>
				
					<div class="article1">
					<hr class="tableLine1">
						<span class="faqArticleNum">번호</span>
						<span class="faqArticleNum2">${faq.faqNo}</span>
						<span class="faqArticleTitle">제목</span>
						<span class="faqArticleTitle2">${faq.title}</span>
					<hr class="tableLine2">
					</div>
					
	              	<div class="article2">
						<span class="faqArticleContent">내용</span>
						<span class="faqArticleContent2">${faq.content}</span>
			            <hr class="tableLine1">
	              	</div>
					
				</div><!-- listsDiv -->
				
				<div class="paging">
					<button id="returnList">목록으로</button>
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
