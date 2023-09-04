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
<title>회원 관리 : Projectors</title>


<link rel="stylesheet" type="text/css" href="css/main.css">
<script type="text/javascript" src="http://code.jquery.com/jquery-latest.js"></script>

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
	
	.table
	{
		width: 90%;
	}
	
	
	#userSearch
	{
		text-align: center;
	}
	
	.userList
	{
		margin: auto;
		margin-top: 5%;
		margin-bottom: 5%;
		text-align: center;
	}
	
	#paging
	{
		margin: auto;
		text-align: center;
	}
	
	th
	{
		border-bottom: 1px solid gray;
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
		width: 100%;
	}
	
	th
	{
		border-bottom: 1px solid gray;
	}
	
	td
	{
		text-align: center;
	}
	
	.right-left { width: 80%;}
	.right-right { width: 10%;}
	/* ======================================================= */
	/*=========================서브메뉴바=========================*/
	a 
	{
		text-decoration: none;
		padding: 4px 14px 4px 14px;
	}
	
	#subMenuBar
	{
		text-align: left;
		font-size: 12pt;
		font-weight: bold;
		background-color: white;
	}
	/*==========================================================*/
	
	#paging
	{
		margin: auto;
		text-align: center;
	}
	.userList
	{
		width: 80%;
	}
	
</style>

<script type="text/javascript">
function search()
{
	var searchKey = document.getElementById("searchKey").value;
	var searchValue = document.getElementById("searchValue").value;
	
	if (searchValue=="")
	{
		alert("검색어를 입력하세요");
		return;
	}
	
	var form = document.forms.searchForm;
	
	form.action = "userSearchManagement.action?searchKey="+searchKey+"&searchValue="+searchValue;
	form.submit();

}
</script>
</head>


<body>	

	<div id="root">
	 	
	 	<!-- ========== 공통 상단 영역( 메뉴바까지) ======================== -->
		
		<div id="upperBarBox">		<!-- 로그인/ 회원가입 문의/ 쪽지 -->
			<c:import url="AdminUpperBar.jsp"></c:import>
		</div>	
		<div id="logoBox">    		<!-- 로고 이미지 -->
			<a href="AdminMainPage.jsp"><img src="images/tmp_logo_admin.jpg"/></a>
		</div>
		<div id="menuBar">						<!-- 메뉴바( 메인 | 공지..) -->
			<c:import url="AdminBar.jsp"></c:import>
		</div>
		<!-- ============================================================= -->
	
	<div>
	<h1> 회원 관리</h1>
	<hr />
	</div>
	<br />
	
	<div id="leftBar">
	<div class="btnHeight">
		<button type="button">
			<a href="userManagement.action">유저 관리</a>
		</button>
	</div>
	<div class="btnHeight">
		<button type="button">
			<a href="userManagementLog.action">로그 관리</a>
		</button>
	</div>
	</div><!-- end #leftBar -->
	
	<div id="rightBar">
		<div>
		<h2>
			로그 관리 - 로그인
		</h2> 
		</div>
	<div id="subMenuBar">
		<a href="userManagementLog.action" style="background-color: gray; color: white; border-radius: 5px;">로그인</a>
		<a href="userManagementLogOut.action" >로그아웃</a>
		<hr>
	</div>
	<br />
	
		<div id="userList">
		<!-- 닉네임 클릭 시 해당 유저 프로필 확인 -->
			<table class="table userList">
				<tr>
					<th>번호</th>
					<th>아이디</th>
					<th>로그인일자</th>
				</tr>
				<c:forEach var="user" items="${lists }">
				<c:if test="${not empty user.logInRecNo }">
					<tr>
						<td>${user.logInRecNo }</td>
						<td>${user.pinNo }</td>
						<td>${user.logInDate }</td>
					</tr>
				</c:if>
				</c:forEach>
			</table>
		</div>
		
		
		<div id="paging">
			[페이징 처리처리처리처리]
		</div>
	</div>
	</div><!-- end of #root div -->

</body>
</html>