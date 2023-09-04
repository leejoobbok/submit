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
<title>Bar.jsp</title>
<link rel="stylesheet" type="text/css" href="css/main.css">
<script type="text/javascript" src="http://code.jquery.com/jquery.min.js"></script>
<style type="text/css">

@font-face {
    font-family: 'SUITE-Regular';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2304-2@1.0/SUITE-Regular.woff2') format('woff2');
    font-weight: 400;
    font-style: normal;
}
	.Main_category_Outer {
		width : 1300px;
		margin: auto;
		padding-top: 15px;
	}

	.Main_category {
    	font-family: 'SUITE-Regular';
		text-decoration: none;
		padding: 4px 14px 4px 14px;
		font-size: 17pt;
		font-weight: bold;
	}
	.Main_category:hover {
		color: orange;
	}
	.Main_category a:hover { color: orange; }
	.Main_category a:active { color: gold; }
</style>
<script type="text/javascript">
	
	// ajax 를 통해 관리자의 접근 차단하기
	$(function() {
		$("#myapply").click(function()
		{
			var pinNo = document.getElementById("pinNo").value;
			
			$.ajax(
			{
				type:"POST"
				, url:"checkadmin.action"
				, data:{ pinNo: pinNo }
				, contentType:  "application/x-www-form-urlencoded; charset=UTF-8"
				, success:function(result)
				{
					if (result == 0)
					{
						window.location.href="myapply.action";	
					}
					else
					{
						alert("관리자 계정으로 해당 기능에 접근할 수 없습니다.");
						return;
					}
				}
				, error:function(e)
				{
					alert(e.responseText);
				}
				
			});
		});
		
		$("#mypost").click(function()
		{
			var pinNo = document.getElementById("pinNo").value;
			
			$.ajax(
			{
				type:"POST"
				, url:"checkadmin.action"
				, data:{ pinNo: pinNo }
				, contentType:  "application/x-www-form-urlencoded; charset=UTF-8"
				, success:function(result)
				{
					if (result == 0)
					{
						window.location.href="mypost.action";	
					}
					else
					{
						alert("관리자 계정으로 해당 기능에 접근할 수 없습니다.");
						return;
					}
				}
				, error:function(e)
				{
					alert(e.responseText);
				}
				
			});
		});
		
		$("#myproject").click(function()
		{
			var pinNo = document.getElementById("pinNo").value;
			
			$.ajax(
			{
				type:"POST"
				, url:"checkadmin.action"
				, data:{ pinNo: pinNo }
				, contentType:  "application/x-www-form-urlencoded; charset=UTF-8"
				, success:function(result)
				{
					if (result == 0)
					{
						window.location.href="myproject.action";	
					}
					else
					{
						alert("관리자 계정으로 해당 기능에 접근할 수 없습니다.");
						return;
					}
				}
				, error:function(e)
				{
					alert(e.responseText);
				}
				
			});
		});
		
		$("#teamSpaceMain").click(function()
		{
			var pinNo = document.getElementById("pinNo").value;
			
			$.ajax(
			{
				type:"POST"
				, url:"checkadmin.action"
				, data:{ pinNo: pinNo }
				, contentType:  "application/x-www-form-urlencoded; charset=UTF-8"
				, success:function(result)
				{
					if (result == 0)
					{
						window.location.href="teamSpaceMain.action";	
					}
					else
					{
						alert("관리자 계정으로 해당 기능에 접근할 수 없습니다.");
						return;
					}
				}
				, error:function(e)
				{
					alert(e.responseText);
				}
				
			});
		});
		
	});


</script>
</head>

<body>
	<input type="hidden" id="pinNo" value="${pinNo }">
	<div style="background-color: white;">
	<div class="Main_category_Outer">
	<br>
		<a class="Main_category" href="projectorsmain.action">메인</a>
		<a class="Main_category" href="noticelists.action">공지</a>
		<a class="Main_category" href="recruitlist.action">공고 둘러보기</a>
		<a class="Main_category"  id="myapply">나의 지원 이력</a>
		<a class="Main_category"  id="mypost">나의 모집 공고</a>
		<a class="Main_category"  id="myproject">나의 프로젝트</a>
		<a class="Main_category"  id="teamSpaceMain">팀 스페이스</a>
	</div>
		<hr style="width: 90%;"><br>
	</div>
</body>
</html>