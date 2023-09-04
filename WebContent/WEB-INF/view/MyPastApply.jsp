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
<link rel="stylesheet" type="text/css"
	href="<%=cp%>/css/flexBoxTwo.css">
<link rel="stylesheet" type="text/css" href="<%=cp%>/css/myapply.css">
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
<script type="text/javascript"
	src="http://code.jquery.com/jquery.min.js"></script>
<script type="text/javascript">
	$(function()
	{
		$("#WriteQnA").click(function()
		{
			window.location.href = "questioninsertform.action";
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
				<a href="projectorsmain.action"><img style="width: 530px;"
					src="<%=cp%>/images/NEXTART_LOGO.png" /></a>
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

				</div>
				<!-- left -->


				<div class="right">
					<span class="titleText1">과거 지원 이력</span>
					<hr />
					<br>

					<c:choose>
						<c:when
							test="${checkPastApply == 0}">
							<h3>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 과거 지원 이력이 존재하지 않습니다.</h3>
						</c:when>
						<c:otherwise>

							<div class="listsDiv">
								<table>
									<tr>
										<div>
											<!-- th 용  -->
											<th><div>지원서번호</div></th>
											<th><div>포지션명</div></th>
											<th class="recruitTitle"><div>공고 제목</div></th>
											<th><div>닉네임</div></th>
											<th><div>지원 날짜</div></th>
											<th><div>결과</div></th>
											<th><div>프로젝트</div></th>
										</div>
									</tr>
									<c:forEach var="pastApply" items="${pastApplyDTO}">
									<tr>
										<div>
											<!-- 현재 지원 데이터  -->
											<td><div>${pastApply.applyNo}</div></td>
											<td><div>${pastApply.posName}</div></td>
											<td><div>
													<a href="recruitarticle.action?recruitNo=${pastApply.recruitNo}">${pastApply.title}</a>
												</div></td>
											<td><div>${pastApply.nickName}</div></td>
											<td><div>${pastApply.applyDate}</div></td>
											<td><div>
													<c:choose>
														<c:when test="${not empty pastApply.fsApplyNo }">
															합격
														</c:when>
														<c:otherwise>
															불합격
														</c:otherwise>
													</c:choose>
											</div></td>
											<td><div>
												<c:choose>
													<c:when test="${not empty pastApply.prjNo }">
														<button type="button">바로가기</button>
													</c:when>
													<c:otherwise>
														미생성
													</c:otherwise>
												</c:choose>
											</div></td>
										</div>
									</tr>
									</c:forEach>
									
								</table>
							</div>
							<!-- end of listDiv  -->
						</c:otherwise>
					</c:choose>


				</div>
				<!-- right -->


			</div>
			<!-- container1 -->
		</div>
		<!-- main -->

		<div class="footer">
			<!-- footer -->
			<c:import url="Footer.jsp"></c:import>
		</div>
	</div>


</body>
</html>