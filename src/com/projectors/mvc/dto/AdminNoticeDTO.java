package com.projectors.mvc.dto;

public class AdminNoticeDTO
{
	// 관리자 속성 구성
	private String adminNoticeNo, pinNo, title, content;
	//-- 관리자공지번호, 관리자식별번호, 제목, 내용
	
	// getter / setter
	public String getAdminNoticeNo()
	{
		return adminNoticeNo;
	}

	public void setAdminNoticeNo(String adminNoticeNo)
	{
		this.adminNoticeNo = adminNoticeNo;
	}

	public String getPinNo()
	{
		return pinNo;
	}

	public void setPinNo(String pinNo)
	{
		this.pinNo = pinNo;
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

}
