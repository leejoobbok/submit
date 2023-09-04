package com.projectors.mvc.dto;

public class FaqDTO
{
	private String faqNo, title, content;
	// faq번호, 제목, 내용 
	
	//getter setter 
	public String getFaqNo()
	{
		return faqNo;
	}

	public void setFaqNo(String faqNo)
	{
		this.faqNo = faqNo;
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
