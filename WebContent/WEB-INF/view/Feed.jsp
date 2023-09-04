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
<title> 피드 (팀 스페이스 메인 임포트용)</title>

<style>
	
	*{font-size: 10pt;}
	ul, li{list-style: none;}
	ul
	{
		margin-block-start: 0;
    	margin-block-end: 0;
    	padding-inline-start: 0;
	}
	#feedContent			/* 담벼락 입력된 공간 */
	{	
		position: absolute;
		top: 280px;
		left: 40px;
		width: 242px;
		height: 320px;
		overflow:auto;
	
		background-color: #d5e9eb;
		margin: auto;
		margin-top: 10px;
		border-radius: 10px;
	}
	.feedMsg			/* 메세지 블럭(노랑)*/
	{	
		display: inline-block;
		text-align: left;
		background-color: #fcf153;
		
		margin: 8px 0px;
		margin-bottom: 2px;
		padding: 4px 10px;
		border-radius: 10px;
		width: 180px;
		
	}
	#sendArea				/*입력창, 보내기버튼 감싸는 영역*/
	{
		position: absolute;
		top: 610px;
		left: 40px;
	}
	#feedInsert 			/* 담벼락 입력 창*/
	{	
		width: 218px;
		margin: auto;
		margin-top: 10px ;
		padding: 10px;
		
		border-radius: 10px;
		text-align: left;
	}
	#feedBtn
	{	
		font-size: 10pt;
		font-weight: bold; 
		padding: 2px 10px;
		border-radius: 10px;
	}
</style>
<script type="text/javascript">

	//담벼락에 메세지 붙이기
	function sendFeed() {
	    var feedMsg = document.getElementById("feedInsert").value;
	    var url = "addFeed.action?finalNo='FN1'&content="+feedMsg;

	    $.ajax({
	        type: "GET",
	        url: url,
	        success: function(response) {
	            // 서버 응답을 받았을 때 실행될 내용
	            $("#feed").load("loadFeed.action");
	        },
	        error: function(xhr, status, error) {
	            console.error("AJAX 요청 실패:", status, error);
	        }
	    });
	}
</script>


</head>
<body>

<div id="feedContent">
	<ul>
	    <c:forEach items="${list}" var="feed">
	    <li class="feedMsg">
		     <span style="font-weight:bold">${feed.nickName}:</span>
		     ${feed.content}<br>
		     <span style="font-size: 9pt; color: gray;"> (${feed.createdDate})</span>
	    </li>
	    </c:forEach>
	</ul>
	
</div>
<div id="sendArea">
	<form action="" method="get">
		<textarea  id="feedInsert" rows="2" placeholder="내용을 입력하세요."></textarea><br>
		<button type="button" id="feedBtn" name="feedBtn" onclick="sendFeed()">보내기</button>
	</form>
</div>

</body>
</html>


