package com.projectors.mvc.dto;

public class TeamMeetingDTO
{	
	// 회의게시판번호, 최종합류번호(작성자), 제목, 내용, 첨부파일url, 작성일, 회의날짜
	private String meetingNo, finalNo, nickName, title, content, fileUrl, createdDate, meetingDate;
	
	// getter setter 
	
	public String getMeetingNo()
	{
		return meetingNo;
	}

	public void setMeetingNo(String meetingNo)
	{
		this.meetingNo = meetingNo;
	}

	public String getFinalNo()
	{
		return finalNo;
	}

	public void setFinalNo(String finalNo)
	{
		this.finalNo = finalNo;
	}
	
	public String getNickName()
	{
		return nickName;
	}

	public void setNickName(String nickName)
	{
		this.nickName = nickName;
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

	public String getFileUrl()
	{
		return fileUrl;
	}

	public void setFileUrl(String fileUrl)
	{
		this.fileUrl = fileUrl;
	}

	public String getCreatedDate()
	{
		return createdDate;
	}

	public void setCreatedDate(String createdDate)
	{
		this.createdDate = createdDate;
	}

	public String getMeetingDate()
	{
		return meetingDate;
	}

	public void setMeetingDate(String meetingDate)
	{
		this.meetingDate = meetingDate;
	}
	
	
}
