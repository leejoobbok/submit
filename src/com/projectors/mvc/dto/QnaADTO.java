package com.projectors.mvc.dto;

public class QnaADTO // 1:1 문의의 답변(A) 관련 DTO 
{
	private String questionNo, answerNo, answerPinNo, answerContent, answerCreatedDate;
	//문의번호, 답변번호, (관리자)식별번호, 답변내용, 답변등록일 
	
	// getter setter
	
	public String getAnswerNo()
	{
		return answerNo;
	}

	public String getQuestionNo()
	{
		return questionNo;
	}

	public void setQuestionNo(String questionNo)
	{
		this.questionNo = questionNo;
	}

	public void setAnswerNo(String answerNo)
	{
		this.answerNo = answerNo;
	}

	public String getAnswerPinNo()
	{
		return answerPinNo;
	}

	public void setAnswerPinNo(String answerPinNo)
	{
		this.answerPinNo = answerPinNo;
	}

	public String getAnswerContent()
	{
		return answerContent;
	}

	public void setAnswerContent(String answerContent)
	{
		this.answerContent = answerContent;
	}

	public String getAnswerCreatedDate()
	{
		return answerCreatedDate;
	}

	public void setAnswerCreatedDate(String answerCreatedDate)
	{
		this.answerCreatedDate = answerCreatedDate;
	}
	
	
}