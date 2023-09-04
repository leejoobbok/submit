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
			
				<div>
				<hr class="tableLine1">
					<span class="noticeListTitle">번호</span>
					<span class="noticeListContent">제목</span>
				<hr class="tableLine1">
				</div>
				
				<c:forEach var="lists" items="${lists}" varStatus="status">
              	<div>
            		 <span class="noticeNum">${status.index +1}</span>
            		 <span class="noticeTitle"><a href="noticearticle.action?adminNoticeNo=${lists.adminNoticeNo}">${lists.title}</a></span>
              	<hr class="tableLine2">
              	</div>
                </c:forEach>
			 		
			</div>
		
		<div class="paging">
			<span>[페이징처리]</span>
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