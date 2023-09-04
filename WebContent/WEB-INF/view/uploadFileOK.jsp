<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="java.io.File"%>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
%>
<%
	// 등록한 첨부파일 받아오는 부분 

	// ① 주요 속성값들 준비 
	String root = "/";
	root = pageContext.getServletContext().getRealPath(root);
	
	String savePath = root + "pds" + File.separator + "saveFile";
	//								 --------------
	//								 "\\" 로 구분자를 고정하지 않고
	// 								동적으로 상황에 맞는 구분자를 사용하게 함. 
	
	String encType = "UTF-8";
	int maxFileSize = 5*1024*1024;
	
	// ② 경로에 디렉터리가 없으면 생성
	File dir = new File(savePath);
	if(!dir.exists())
	{
		dir.mkdirs();
	}
	
	//③ MultipartRequest 구성 
	MultipartRequest req = null;
	String urlFile = "";
	
	try
	{	
		// request, 파일저장경로, 파일최대크기, 인코딩방식, 중복파일명처리정책
		req = new MultipartRequest(request, savePath, maxFileSize
								  , encType, new DefaultFileRenamePolicy());
		
		//④ 구성된 MultipartRequest 로부터 필요한 값 얻어내기
		out.println("서버에 저장된 파일명 : " + req.getFilesystemName("uploadFile") + "<br>");
		out.println("업로드한 실제 파일명 : " + req.getOriginalFileName("uploadFile") + "<br>");
		out.println("파일 타입 : " + req.getContentType("uploadFile") + "<br>");
		
		File f = req.getFile("uploadFile");
		if(f != null)
		{
			out.println("파일 크기: " + f.length() + "Bytes<br>");
		}
		
		//⑤ 다운로드 기능을 수행하기 위한 속성을 get 방식으로 처리 
		urlFile = "Download.jsp?saveFileName=" + req.getFilesystemName("uploadFile");
		urlFile += "&originalFileName=" + req.getOriginalFileName("uploadFile");
		
	}
	catch(Exception e)
	{
		System.out.println(e.toString());
	}
%>

<a href="<%=urlFile%>">파일 다운로드</a>