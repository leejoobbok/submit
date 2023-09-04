<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>문의관리 FAQ : Projectors</title>
<script type="text/javascript" src="http://code.jquery.com/jquery.min.js"></script>
<link rel="stylesheet" type="text/css" href="css/main.css">
<style type="text/css">
	/*==========  상단 공통 요소 (메뉴바까지) ==================*/
	#logoBox 					   /*로고 이미지*/
	{
		text-align: center;
		height: 100px;
		padding-top: 20px;
		/* border: 1px solid; */
	}
	#upperBarBox 				 /*최상단 바(로그인..쪽지)*/
	{
		text-align: right;
	}
	#menuBar					/*메뉴바(메인|공지..)*/
	{
		text-align: center;
		position :sticky;  
		padding-top: 32px;
	    top: -32px;
	}
	/*==========================================================*/

	/* 헤더 */
	div>h1
	{
		padding-left : 5%; 
	}

	/* ====================== 좌측바 ========================= */

	#leftBar
	{
		float: left;
		width: 20%;
		height : 300px;
		text-align: center;
	}
	
	.btnHeight
	{
		padding: 10px;
		border-right: 3px solid black;
	}
	
	.btn
	{
		width: 150px;
	}
	

	/* ======================================================= */
	
	
	/* ====================== 우측바 ========================= */

	#rightBar
	{
		float: right;
		width: 70%;
		padding : 0% 5% 0% 5%;
	}
	
	.blackBtn
	{
		font-size: x-small;
		color: white;
		background-color: black;
		border: none;
	}

	.table
	{
		text-align: auto;
		width: 90%;
	}

	/* ======================================================= */
	
	.returnList
	{
		font-size: 11pt;
		background-color: #CCCCCC;
		border: none;
		width: 120px;
		border-radius: 10px;
		padding: 4px 10px
	}
	
</style>
<script type="text/javascript">
	$(function()
	{
		$("#updateFaq").click(function()
		{
			$("#updateForm").submit();
		});
		
		$("#returnArticle").click(function()
		{
			window.location.href="faqManagementArticle.action?faqNo="+$("#faqNo").val;
		});
		
	});
</script>
</head>
<body>
	 	<!-- ========== 공통 상단 영역( 메뉴바까지) ======================== -->
		<div id="upperBarBox">		<!-- 로그인/ 회원가입 문의/ 쪽지 -->
			<c:import url="AdminUpperBar.jsp"></c:import>
		</div>	
		<div id="logoBox">    		<!-- 로고 이미지 -->
			<a href="adminMain.action"><img src="images/tmp_logo_admin.jpg"/></a>
		</div>
		<div id="menuBar">						<!-- 메뉴바( 메인 | 공지..) -->
			<c:import url="AdminBar.jsp"></c:import>
		</div>
		<!-- ============================================================= -->
		
<div>
<h1>FAQ / 문의</h1>
<hr />
</div>
<br />


<div id="leftBar">
	<div class="btnHeight">
		<button type="button" class="btn">
			<a href="FAQManagement.jsp">FAQ</a>
		</button>
	</div>
	<div class="btnHeight">
		<button type="button" class="btn">
			<a href="AnswerManagement.jsp">1:1문의</a>
		</button>
	</div>
</div><!-- end #leftBar -->


<div id="rightBar">
	<div>
		<h2>	FAQ 수정하기</h2>
	</div>
	<br>
	<form action="faqUpdate.action" method="get" id="updateForm">
	<div>	
		<table class="table">
			<tr>
				<th colspan="2"><hr /></th>
			</tr>
			<tr>
				<th style="width: 10%;">번호</th>
				<td style="width: 90%;">
					<input type="text" id="faqNo" name="faqNo" value="${article.faqNo }"
					readonly="readonly" style="width: 90%; border: none;" />
				</td>
			</tr>
			<tr>
				<th style="width: 10%;">제목</th>
				<td style="width: 90%;">
					<input type="text" id="title" name="title" style="width: 90%;"
					value="${article.title} ">
				</td>
			</tr>
			<tr>
				<th colspan="2"><hr /></th>
			</tr>
			<tr>
				<th style="vertical-align: top;">내용</th>
				<td>
					<div>
					<textarea rows="50" cols="70" id="content" name="content" style="width: 90%; height: 200px;"
					>${article.content }</textarea>
					</div>
				</td>
			</tr>
			<tr>
				<th colspan="2"><hr /></th>
			</tr>
		</table>
	</div>
	<br>
	<div style="text-align: center;">
	    <button class="returnList" value="${article.faqNo }" id="updateFaq">수정하기</button>
		<button class="returnList" value="${article.faqNo }" id="returnArticle">취소하기</button>
	</div>
	</form>
	<br><br>
	<br><br><br><br><br><br><br>
</div><!-- end #rightBar -->

<!-- footer 넣을 자리	 -->

</body>
</html>