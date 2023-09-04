<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
	/* 
	String pinNo = (String)request.getAttribute("pinNo");
	if (pinNo != null)
		pinNo = pinNo.trim();
	 */
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>환영해요! :projectors</title>
<link rel="stylesheet" type="text/css" href="<%=cp %>/css/flexBoxOne.css">
<link rel="stylesheet" type="text/css" href="<%=cp %>/css/mainpage.css">

<script type="text/javascript" src="http://code.jquery.com/jquery.min.js"></script>
<script type="text/javascript">

	 $(document).ready(function() {
		 
		$('#goRecruitLists ').click(function(event) {
			var offset = 60;
			var target = $('#recruitLists').offset().top - offset;
			$('html, body').animate({scrollTop:target}, 500);
			event.preventDefault();
		});
		
	});
	 
	function moveArticle(recruitNo)
	{
		window.location.href = 'recruitarticle.action?recruitNo=' + recruitNo;
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
	<div class="mainContainer">
		
		<div class="bannerOuter">
			프로젝터스에 오신 것을 환영합니다. <br>[ 정상로그인 검토 : ${pinNo } ]
		</div>
		
		<button id="goRecruitLists" class="goRecruitListsBtn">모집공고 둘러보기</button>
			
		<div id="recruitLists" class="recruitLists">
			모집공고 둘러보기 <a class="moreRecruit" href="recruitlist.action"> > 더보기</a>
			
			<div class="recruitList">
				
				<c:forEach var="list" items="${lists }" varStatus="status">
				<div class="recruit" onclick="moveArticle('${list.recruitNo }')">
				<ul class="ul1">
					<li>마감일 | ${list.deadlineDate }</li>
					<li>${list.title }</li>
					<li>${list.prjStart } ~ ${list.prjEnd }</li>
					<li>모집 인원</li>
					<c:forEach var="pos" items="${recruitMember[status.index] }">
						<li class="pos">${pos.posName } ${pos.countPos }/${pos.countAll }</li>
					</c:forEach>
				</ul>
				<ul class="ul2">
					<li>사용도구</li>
					<c:forEach var="tool" items="${tools[status.index] }" varStatus="count">
						<c:choose>
						<c:when test="${count.index < 2 }">
							<li class="tool">${tool }</li>
						</c:when>
						<c:when test="${count.index == 2 }">
							<li class="tool">...</li>
						</c:when>
						</c:choose>
					</c:forEach>
				</ul>
				</div>
				</c:forEach>
				
			
			</div> <!-- end.recruitList -->
		</div> <!-- end.recruitLists -->
	</div> <!-- end.mainContainer -->
	</div> <!-- end.main -->
	
	
	
	<div class="footer">
		<!-- footer -->
		<c:import url="Footer.jsp"></c:import>
	</div>
</div>


</body>
</html>
