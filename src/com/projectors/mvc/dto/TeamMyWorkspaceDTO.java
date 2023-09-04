package com.projectors.mvc.dto;

public class TeamMyWorkspaceDTO
{	
	// 작업글 번호, 작성자의 최종합류번호, 제목, 내용, 작업일,작성일 
	private String workspaceNo, finalNo, title, content, workDate, createdDate;


	public String getWorkspaceNo()
	{
		return workspaceNo;
	}

	public void setWorkspaceNo(String workspaceNo)
	{
		this.workspaceNo = workspaceNo;
	}

	public String getFinalNo()
	{
		return finalNo;
	}

	public void setFinalNo(String finalNo)
	{
		this.finalNo = finalNo;
	}

	public String getTitle()
	{
		return title;
	}

	public void setTitle(String title)
	{
		this.title = title;
	}

	public String getContent()
	{
		return content;
	}

	public void setContent(String content)
	{
		this.content = content;
	}
	
	public String getWorkDate()
	{
		return workDate;
	}

	public void setWorkDate(String workDate)
	{
		this.workDate = workDate;
	}
	public String getCreatedDate()
	{
		return createdDate;
	}

	public void setCreatedDate(String createdDate)
	{
		this.createdDate = createdDate;
	}
	
	
}

//WORKSPACE_NO, FINAL_NO, TITLE, CONTENT, CREATED_DATE