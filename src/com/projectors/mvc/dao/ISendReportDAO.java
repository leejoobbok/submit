package com.projectors.mvc.dao;

import com.projectors.mvc.dto.SendReportDTO;

public interface ISendReportDAO // 유저가 신고 보내는 기능들 (DTO는 관리자랑 공유)
{
	public int reportRecruit(SendReportDTO dto); // 모집 공고 신고 
	
	public int reportApply(SendReportDTO dto); //  지원서 신고
	
	public int reportComment(SendReportDTO dto); //  댓글 신고
	
	public int reportNote(SendReportDTO dto); //  쪽지 신고
	
}
