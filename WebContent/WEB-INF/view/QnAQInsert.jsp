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
<title>QnA :projectors</title>
<link rel="stylesheet" type="text/css" href="<%=cp %>/css/flexBoxTwo.css">
<link rel="stylesheet" type="text/css" href="<%=cp %>/css/qna.css">
<script type="text/javascript" src="http://code.jquery.com/jquery.min.js"></script>

<script type="text/javascript">
	$(function()
	{
		$("#submitQnA").click(function()
		{
			$("#insertForm").submit();
		});
		
		$("#cancelQnA").click(function()
		{
			window.location.href="question-list.action";
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
				<span class="titleText1">1:1 문의 작성하기</span>
				<br>

				<div class="articleDiv">
				<form action="questioninsert.action" id="insertForm" method="GET">
				
					<div class="Inert1">
						<span class="qnaInsertTitle">제목</span>
						<input type="text" name="questionTitle" id="questionTitle" class="questionTitle">
					</div>
					
	              	<div class="Insert2">
						<span class="qnaInsertContent">내용</span>
						<textarea name="questionContent" id="questionContent" class="questionContent"
						cols="100" rows="10" placeholder="내용을 작성해주세요."></textarea>
	              	</div>
	              	
				</form>	
				</div><!-- articleDiv -->
				
				<div class="paging">
				<button id="submitQnA">작성하기</button>
				<button id="cancelQnA">취소하기</button>
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