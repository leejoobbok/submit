package com.projectors.mvc.dto;

public class TeamNoticeDTO
{	
	// 팀 스페이스 > 공지 게시판
	// (스페이스 공지번호, 플젝번호, 공지글제목, 내용, 작성일)
	private String spaceNoticeNo, prjNo, title, content, createdDate;

	// getter, setter
	public String getSpaceNoticeNo()
	{
		return spaceNoticeNo;
	}

	public void setSpaceNoticeNo(String spaceNoticeNo)
	{
		this.spaceNoticeNo = spaceNoticeNo;
	}

	public String getPrjNo()
	{
		return prjNo;
	}

	public void setPrjNo(String prjNo)
	{
		this.prjNo = prjNo;
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

	public String getCreatedDate()
	{
		return createdDate;
	}

	public void setCreatedDate(String createdDate)
	{
		this.createdDate = createdDate;
	}
	
	
	
}
