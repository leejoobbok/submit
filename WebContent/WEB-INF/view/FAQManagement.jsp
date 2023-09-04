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
		margin-right: 10%;
	}
	.FAQWriteBtn
	{
		font-size: 11pt;
		float: right;
		width: 120px;
		margin-right: 11%;
		font-weight: bold;
		padding: 5px 10px
	}
	.table
	{
		text-align: center;
		margin: auto;
		width: 90%;
		margin-left: 0%;
	}
	
	.leftTd
	{
		text-align: left;
	}
	
	#rightBar-left
	{
		float: left;
		width: 80%;
	}
	#rightBar-right
	{
		float: right;
		width: 20%;
		right: 0px;
		bottom: 0px;		
	}
	

	/* ======================================================= */
	
	
	
</style>
<script type="text/javascript">
	$(function()
	{
		$("#WriteQnA").click(function()
		{
			window.location.href="faqInsertForm.action";
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
		<c:import url="adminLogo.jsp"></c:import>
	</div>
	<div id="menuBar">						<!-- 메뉴바( 메인 | 공지..) -->
		<c:import url="AdminBar.jsp"></c:import>
	</div>
	<!-- ============================================================= -->
		
	<div>
		<h1>문의관리</h1>
		<hr />
	</div>
	<br>


	<div id="leftBar">
		<div class="btnHeight">
			<a href="faqManagement.action">
				<button type="button" class="btn">FAQ 관리</button>
			</a>
		</div>
		<div class="btnHeight">
			<a href="q-list-4admin.action">
				<button type="button" class="btn">1:1 문의 관리</button>
			</a>
		</div>
	</div><!-- end #leftBar -->


	<div id="rightBar">
		<div>
			<h2>	FAQ 관리 </h2>
		</div>
		<div>
			<div>
				<button id="WriteQnA" class="FAQWriteBtn">FAQ 작성하기</button>
			</div>
		</div>
		<br>
		
	
		<div>	
			<table class="table">
				<tr>
					<th colspan="2"><hr /></th>
				</tr>
				<tr>
					<th style="width: 10%;">번호</th>
					<th style="width: 90%;">제목</th>
				</tr>
				<tr>
					<th colspan="2"><hr /></th>
				</tr>
				<c:forEach var="faq" items="${lists }">
					<tr>
						<td>${faq.faqNo }</td>
						<td><a href="faqManagementArticle.action?faqNo=${faq.faqNo }">${faq.title }</a></td>
					</tr>
				</c:forEach>
				
			</table>
		</div>
		<br>
		<div style="text-align: center;">
			&lt; [ 1 2 3 4 5 6 7 8 9 ] >
		</div>
		<br><br>
		<hr>
		<br><br><br><br><br><br><br>
	</div><!-- end #rightBar -->

<!-- footer 넣을 자리	 -->

</body>
</html>


<!-- 정적 구성
				<tr>
					<td>29</td>
					<td class="leftTd"><a href="FAQManagementArticle.jsp">지원한 내역이 안보여요</a></td>
				</tr>
				<tr>
					<th colspan="2"><hr style="width: 97%"/></th>
				</tr>
				<tr>
					<td>28</td>
					<td class="leftTd"><a href="FAQManagementArticle.jsp">상대방에게 쪽지를 보내고 싶어요</a></td>
				</tr>
				<tr>
					<th colspan="2"><hr style="width: 97%"/></th>
				</tr>
				<tr>
					<td>27</td>
					<td class="leftTd"><a href="FAQManagementArticle.jsp">프로젝트를 삭제하고 싶어요</a></td>
				</tr>
				<tr>
					<th colspan="2"><hr style="width: 97%"/></th>
				</tr>
				<tr>
					<td>26</td>
					<td class="leftTd"><a href="FAQManagementArticle.jsp">프로젝트에 어떻게 참여하나요?</a></td>
				</tr>
				<tr>
					<th colspan="2"><hr style="width: 97%"/></th>
				</tr>
				<tr>
					<td>25</td>
					<td class="leftTd"><a href="FAQManagementArticle.jsp">프로젝트의 진행 방식은 어떤가요?</a></td>
				</tr>
				<tr>
					<th colspan="2"><hr style="width: 97%"/></th>
				</tr>
				<tr>
					<td>24</td>
					<td class="leftTd"><a href="FAQManagementArticle.jsp">제3자가 이 프로젝트를 열람할 수 있을까요?</a></td>
				</tr>
				<tr>
					<th colspan="2"><hr style="width: 97%"/></th>
				</tr>
				<tr>
					<td>23</td>
					<td class="leftTd"><a href="FAQManagementArticle.jsp">기술적인 도움을 받을 수 있는 방법은 무엇인가요?</a></td>
				</tr>
				<tr>
					<th colspan="2"><hr style="width: 97%"/></th>
				</tr>
				<tr>
					<td>22</td>
					<td class="leftTd"><a href="FAQManagementArticle.jsp">버그 리포트는 어떻게 제출하나요?</a></td>
				</tr>
				<tr>
					<th colspan="2"><hr style="width: 97%"/></th>
				</tr>
				<tr>
					<td>21</td>
					<td class="leftTd"><a href="FAQManagementArticle.jsp">개발 가이드나 설명서는 제공하나요?</a></td>
				</tr>
				<tr>
					<th colspan="2"><hr style="width: 97%"/></th>
				</tr>
				<tr>
					<td>20</td>
					<td class="leftTd"><a href="FAQManagementArticle.jsp">추가 기능이나 업데이트 예정인 내용이 있을까요?</a></td>
				</tr>
				<tr>
					<th colspan="2"><hr style=""/></th>
				</tr>
				 -->