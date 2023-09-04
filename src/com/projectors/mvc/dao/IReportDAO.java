package com.projectors.mvc.dao;

import java.util.ArrayList;

import com.projectors.mvc.dto.ReportDTO;

public interface IReportDAO
{
	// 신고 처벌 - 유형
	public ArrayList<ReportDTO> punishContent();
	// 신고 처벌 - 기간
	public ArrayList<ReportDTO> periods();
	
	public ArrayList<String> samePostNo(String postNo);
	
	//--------------------------------------------------------------------------------------
	
	// 공고신고처리대기 리스트
	public ArrayList<ReportDTO> reportedRecruitList();
	// 공고신고 처리 insert
	public int clearManageReport(ReportDTO dto);
	// 공고신고 반려 insert
	public int rejectManageReport(ReportDTO dto);
	
	// 공고신고처리완료 리스트
	public ArrayList<ReportDTO> recruitReportComplete();
	// 공고신고처리완료 - 관리자 ID 검색
	public ArrayList<ReportDTO> searchAdminPinNo(String searchVal);
	// 공고신고처리완료 - 유저 닉네임 검색
	public ArrayList<ReportDTO> searchReportedUserPinNo(String searchVal);
	// 공고신고처리완료 - 신고 번호 검색
	public ArrayList<ReportDTO> searchRepNo(String searchVal);
	
	//--------------------------------------------------------------------------------------
	
	// 지원서신고처리대기 리스트
	public ArrayList<ReportDTO> reportedApplyList();
	// 지원서신고 처리 insert
	public int clearManageApplyReport(ReportDTO dto);
	// 지원서신고 반려 insert
	public int rejectManageApplyReport(ReportDTO dto);
	
	// 지원서 신고처리완료 리스트
	public ArrayList<ReportDTO> applyReportComplete();
	// 지원서 신고처리완료 - 관리자 ID 검색
	public ArrayList<ReportDTO> applySearchAdminPinNo(String searchVal);
	// 지원서 신고처리완료 - 유저 닉네임 검색
	public ArrayList<ReportDTO> applySearchReportedUserPinNo(String searchVal);
	// 지원서 신고처리완료 - 신고 번호 검색
	public ArrayList<ReportDTO> applySearchRepNo(String searchVal);
	
	//--------------------------------------------------------------------------------------
	
	// 쪽지 리스트
	public ArrayList<ReportDTO> reportedNoteList();
	// 쪽지 신고 처리 insert
	public int clearManageNoteReport(ReportDTO dto);
	// 쪽지 신고 반려 insert
	public int rejectManageNoteReport(ReportDTO dto);
	
	// 쪽지 신고처리완료 리스트
	public ArrayList<ReportDTO> noteReportComplete();
	// 쪽지 신고처리완료 - 관리자 ID 검색
	public ArrayList<ReportDTO> noteSearchAdminPinNo(String searchVal);
	// 쪽지 신고처리완료 - 유저 닉네임 검색
	public ArrayList<ReportDTO> noteSearchReportedUserPinNo(String searchVal);
	// 쪽지 신고처리완료 - 신고 번호 검색
	public ArrayList<ReportDTO> noteSearchRepNo(String searchVal);

	//--------------------------------------------------------------------------------------
	
	// 댓글 리스트
	public ArrayList<ReportDTO> reportedCommList();
	// 댓글 신고 처리 insert
	public int clearManageCommReport(ReportDTO dto);
	// 댓글 신고 반려 insert
	public int rejectManageCommReport(ReportDTO dto);
	
	// 댓글 신고처리완료 리스트
	public ArrayList<ReportDTO> commReportComplete();
	// 댓글 신고처리완료 - 관리자 ID 검색
	public ArrayList<ReportDTO> commSearchAdminPinNo(String searchVal);
	// 댓글 신고처리완료 - 유저 닉네임 검색
	public ArrayList<ReportDTO> commSearchReportedUserPinNo(String searchVal);
	// 댓글 신고처리완료 - 신고 번호 검색
	public ArrayList<ReportDTO> commSearchRepNo(String searchVal);
	
	
}
