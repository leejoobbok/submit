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
		<form action="" id="searchForm" name="searchForm">
		<div id="userSearch">
			<span style="font-weight: bold;">유저 검색</span>
			<select id="searchKey" name="searchKey">
				<option value="1">아이디</option>
				<option value="2">닉네임</option>
			</select>
			<input type="text" style="width: 30%;" id="searchValue" name="searchValue"/>
			<button type="button" id="searchBtn" onclick="search()">검색</button>
		</div>
		</form>
		<div id="userList">
		<!-- 닉네임 클릭 시 해당 유저 프로필 확인 -->
			<table class="table userList">
				<tr>
					<th>아이디</th>
					<th>닉네임</th>
					<th>가입일자</th>
				</tr>
				<c:forEach var="user" items="${lists }">
				<c:if test="${not empty user.userNo }">
					<tr>
						<td>${user.userId }</td>
						<td><a href="프로필주소?pinNo=${user.pinNo}">${user.nickname }</a></td>
						<td>${user.joinDate }</td>
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
<!--
2.유저 관리 기능 
2-1. 관리자 페이지를 통해 유저 데이터를 검색할 수 있고, 사이트 운영정책에 근거하여    
        사용자의 계정을 정지/탈퇴 상태로 전환할 수 있다.
2-2.  일시, 영구 정지 회원의 계정 정보와 사유를 별도의 목록으로 확인할 수 있다.
2-3.  탈퇴 회원의 계정 정보와 사유를 별도의 목록으로 확인할 수 있다.
-->