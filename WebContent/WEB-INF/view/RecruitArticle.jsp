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
<title>모집공고 :projectors</title>

<link rel="stylesheet" type="text/css" href="<%=cp %>/css/flexBoxOne.css">
<link rel="stylesheet" type="text/css" href="<%=cp %>/css/recruitArticle.css">

<script type="text/javascript" src="http://code.jquery.com/jquery.min.js"></script>
<script type="text/javascript">

$().ready(function()
{
	
	$(".applyBtn").click(function()
	{
		var pinNo = "${pinNo}";
		
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
					
					var recruitPosNo = $(".applyBtn").val();
			        var url = 'applyform.action?recruitPosNo=' + recruitPosNo;
			        var options = "left=400,top=200,width=600,height=600,resizable=no,location=no";
			        
			        window.open(url, 'applyRecruit', options);	
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
	
	$("#reportBtn").click(function()
	{
		var recruitNo = $(this).val();
        var url = 'popUpRecruitReport.action?recruitNo=' + recruitNo;
        var options = "left=500,top=300,width=520,height=420,resizable=no,location=no";
        
        window.open(url, 'reportRecruit', options);
 		    
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
		<div class="articleArea">
		
		<p class="endRecruitDay">모집 마감일&nbsp;
		
			<c:choose>
				<c:when test="${Integer.parseInt(article.dDay)<0}">
					기간종료
				</c:when>
				<c:otherwise>
					D-${article.dDay }
				</c:otherwise>
			</c:choose>
			 
		 (${article.deadlineDate })</p>
		<h1 class="title">${article.title }</h1>
		<p class="prjPeriod">프로젝트 기간 &nbsp;&nbsp;|&nbsp;&nbsp; ${article.prjStart } ~ ${article.prjEnd }</p>   
		
		<h2 class="title"> 모집 현황</h2>
		<div>
			<ul>
			<c:forEach var="countPos" items="${countPos }">
			<c:choose>
			<c:when test="${Integer.parseInt(countPos.countPos) == Integer.parseInt(countPos.countAll)}">
				<li class="positionList">
					<span class="positionName">${countPos.posName }</span>
					<span class="positionNumber">${countPos.countPos }/${countPos.countAll }</span>
				</li>
			</c:when>
			<c:otherwise>
				<li class="positionList">
					<span class="positionName">${countPos.posName }</span>
					<span class="positionNumber" style="color: red;">${countPos.countPos }/${countPos.countAll }</span>
				</li>
			</c:otherwise>
			</c:choose>
			</c:forEach>
			</ul>
		</div>
		
		<div class="recrutor">작성자 ${article.nickName }</div>
		
		</div> <!-- end.articleArea1 -->
		<hr class="line1">
		
		
		
		
		<h3 class="smallTitle">프로젝트 설명</h3>
		<hr class="line2">
		
		<div class="articleArea">
			<div class="recruitContent">
				${article.content }
			</div>
		</div> <!-- end.articleArea2 -->
		
		
		
		
		<h3 class="smallTitle">사용언어 &amp; 환경</h3>
		<hr class="line2">
		
		<div class="articleArea">
			<div class="recruitTools">
			<c:forEach var="tool" items="${tools }">
				<span class="toolTag">${tool }</span>&nbsp;&nbsp;
			</c:forEach>
			</div>
		</div> <!-- end.articleArea3 -->
		
		
		
		
		<h3 class="smallTitle">진행 방식</h3>
		<hr class="line2">
		
		<div class="articleArea">
			<div class="recruitDoType">
				${article.doTypeName }
			</div>
		</div> <!-- end.articleArea4 -->	
		
		
		
		
		<h3 class="smallTitle">지역</h3>
		<hr class="line2">
		
		<div class="articleArea">
			<div class="recruitRegion">
				${article.regionName } ${article.subRegionName }
			</div>
		</div> <!-- end.articleArea5 -->	
		
		
		
		
			
		<h2 class="smallTitle">지원하기</h2>
		<hr class="line2">
			
		<div class="applyArea">
		<ul>
		<c:forEach var="member" items="${recruitMember }">
		<c:choose>
			<c:when test="${member.countPos == 0 }">
				<li>
					<span class="position">${member.posName }</span>
					<span class="recruiting">${member.applyCount } 명 지원</span>
					<button type="button" value="${member.recruitPosNo }" class="applyBtn">지원하기</button>
				</li>
			</c:when>
			<c:otherwise>
				<li>
					<span class="position">${member.posName }</span>
					<span class="completed">모집완료</span>
					<button type="button" value="" class="unavailableBtn" disabled="disabled">지원하기</button>
				</li>
			</c:otherwise>
		</c:choose>
		</c:forEach>
		</ul>
		
		</div>
			 
			 
		<div class="etcBtnBox">
			
			<c:choose>
				<c:when test="${article.pinNo == pinNo }">
					<button class="removeBtn" value="${article.recruitNo }">삭제</button>
				</c:when>
				<c:otherwise>
					<button id="reportBtn" class="reportBtn" type="button" value="${article.recruitNo }">신고</button>
				</c:otherwise>
			</c:choose>
		</div> <!-- end.etcBtnBox -->
		

		<h3 class="replyTitle">댓글<span>(1)</span></h3>
		<hr class="line3">
		
		
		<div class="replyArea">
			<ul>
				<li>
					<span class="replyUser">사진과닉네임</span>
				</li>
				<li>
					<textarea name="" id="" cols="100" rows="1" class="replyContent" disabled="disabled"> 한줄일때</textarea>
				</li>
				<li><hr></li>
			</ul>
			<ul>
				<li>
					<span class="replyUser">사진과닉네임</span>
				</li>
				<li>
					<textarea name="" id="" cols="100" rows="1" class="replyContent" disabled="disabled"> 한줄일때
					두줄일때</textarea>
				</li>
				<li><hr></li>
			</ul>
		</div>
		
		
		<div class="applyInsertArea">
		<form action="" method="get">
			<textarea cols="100" rows="3" id="comment" name="comment" placeholder="댓글을 남겨보세요!" class="replyInsertContent"></textarea>
			<br><button type="submit" class="replyBtn">댓글 등록</button>
		</form>
		</div>
			 
		<hr class="line3">
			 
	</div> <!-- end.container -->
	</div> <!-- end.main -->
	
	
	
	<div class="footer">
		<!-- footer -->
		<c:import url="Footer.jsp"></c:import>
	</div>
</div>

	
</body>
</html>



