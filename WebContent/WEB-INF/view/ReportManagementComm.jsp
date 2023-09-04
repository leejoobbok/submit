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
<title>신고처리대기-지원서 : Projectors</title>


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
	
</style>

<script type="text/javascript">
function manageReport(button)
{
	var row = button.closest('tr');
    var reportedNickName = row.querySelector('.reportedNickName').value;
    
    var newWindow = window.open('managementReport.action?reportedNickName='+reportedNickName
								, 'manageReport', 'left=500,top=300,width=600,height=500,resizable=no');
    
    window.addEventListener('message', function(event) 
 	{
        if (event.origin !== window.location.origin) 
        {
            // 안전한 출처 확인
            return;
        }

        // 전달받은 데이터 사용
        var receivedData = JSON.parse(event.data);
        
        row.querySelector('.reguNo').value = receivedData.param1;
        row.querySelector('.reguPeriodNo').value = receivedData.param2;
        
        var repNo = row.querySelector('.repNo').value;
        var reguNo = row.querySelector('.reguPeriodNo').value;
        var reguPeriodNo = row.querySelector('.reguPeriodNo').value;
        
        var f = document.forms.reportForm;
        f.action = 'clearManageReport.action?repNo='+repNo+'&reguNo='+reguNo+'&reguPeriodNo='+reguPeriodNo;
        f.submit();
 	});
    
}

function cancelReport(button)
{
	var row = button.closest('tr');
	var repNo = row.querySelector('.repNo').value;
	if (confirm("정말 신고 처리 취소 하시겠습니까?"))
	{
		var f = document.forms.reportForm;
	    f.action ="rejectManageReport.action?repNo="+repNo;
	    f.submit();
	}
	return;
}

</script>
</head>


<body>	
	 	<!-- ========== 공통 상단 영역( 메뉴바까지) ======================== -->
		
		<div id="upperBarBox">		<!-- 로그인/ 회원가입 문의/ 쪽지 -->
			<c:import url="AdminUpperBar.jsp"></c:import>
		</div>	
		<c:import url="adminLogo.jsp"></c:import>
		<div id="menuBar">						<!-- 메뉴바( 메인 | 공지..) -->
			<c:import url="AdminBar.jsp"></c:import>
		</div>
		<!-- ============================================================= -->

<div>
<h1>신고 관리</h1>
<hr />
</div>
<br />


<div id="leftBar">
	<div class="btnHeight">
		<button type="button">
			<a href="reportRecruit.action">신고 처리 대기</a>
		</button>
	</div>
	<div class="btnHeight">
		<button type="button">
			<a href="reportManageComplete.action">신고 처리 완료</a>
		</button>
	</div>
</div><!-- end #leftBar -->


<div id="rightBar">
	<div>
		<h2>
			신고 처리 대기 - 댓글
		</h2> 
	</div>
	<div id="subMenuBar">
		<a href="reportRecruit.action">공고</a>
		<a href="reportApply.action">지원서</a>
		<a href="reportComm.action" style="background-color: gray; color: white; border-radius: 5px;">댓글</a>
		<a href="reportNote.action">쪽지</a>
		<!-- <a href="reportTeamSpace.action">팀스페이스</a> -->
		<hr>
	</div>
	<br />

	<div>
	<form action="" method="get" id="reportForm" name="reportForm">
		<table class="table">
			<tr>
				<th>신고번호</th>
				<th>댓글번호</th><!-- 클릭시 해당 게시물 이동 -->
				<th>피신고자</th><!-- 클릭시 해당 유저 프로필 이동 -->
				<th>신고자</th><!-- 클릭시 해당 유저 프로필 이동 -->
				<th>사유</th>
				<th>신고일자</th>
				<th>신고처리</th><!-- 버튼에 따라 처리결과 value 넘김 -->
			</tr>
			<c:choose>
				<c:when test="${not empty lists }">
			<c:forEach var="report" items="${lists }" varStatus="i">
				<tr class="${i.count }">
					<td>
						${report.repNo }
						<input type="hidden" class="repNo" name="repNo" value="${report.repNo }"/>
					</td>
					<td><a href="applyarticle.action?applyNo=${report.postNo }">${report.postNo }</a></td>
					<td>
						<a href="<%= request.getContextPath()%>/profileadminview.action?pinNo=${report.reportedUserPinNo }"
  							 onclick="window.open(this.href, 'photoUpdate',
                         'left=500,top=300,width=400,height=400,resizable=no,location=no');
            						return false;">${report.reportedNickName }</a>
						<input type="hidden" class="reportedNickName" name="reportedUserPinNo" 
							value="${report.reportedNickName }" />
						<input type="hidden" class="reportedUserPinNo" name="reportedUserPinNo" 
							value="${report.reportedUserPinNo }" />
					</td>
					<td>
						<a href="<%= request.getContextPath()%>/profileadminview.action?pinNo=${report.reportUserPinNo}"
  							 onclick="window.open(this.href, 'photoUpdate',
                         'left=500,top=300,width=400,height=400,resizable=no,location=no');
            						return false;">${report.reportNickName }</a>
						<input type="hidden" class="reportUserPinNo" name="reportUserPinNo" 
							value="${report.reportUserPinNo }" />					
					</td>
					<td>
						${report.repReason } 
						<input type="hidden" class="reguNo" name="reguNo"/>
						<input type="hidden" class="reguPeriodNo" name="reguPeriodNo"/>
					</td>
					<td>
						${report.reportDate }
					</td>
					<td>
						<button type="button" class="manageReport" name="repResultNo" value="${i.count}" onclick="manageReport(this)">처리</button>
						<button type="button" class="cancelReport" name="repResultNo" value="${i.count}" onclick="cancelReport(this)">반려</button>
					</td>
				</tr>
			</c:forEach>
			</c:when>
				<c:otherwise>
					<tr>
						<td colspan="7">신고 내역이 없습니다.</td>
					</tr>
				</c:otherwise>
			</c:choose>
		</table>
	</form>
	</div>

	<div id="paging">
		[페이징 처리처리처리처리]
	</div>

</div><!-- end #rightBar -->

</body>
</html>
