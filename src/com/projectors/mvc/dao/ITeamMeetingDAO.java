package com.projectors.mvc.dao;

import java.util.ArrayList;

import com.projectors.mvc.dto.TeamMeetingDTO;

public interface ITeamMeetingDAO
{	
	public ArrayList<TeamMeetingDTO> getList(); // 회의글 목록(메인)
	public int add(TeamMeetingDTO dto);			// 등록
	public int modify(TeamMeetingDTO dto);		// 수정
	public int delete(String meetingNo);		// 삭제
	public TeamMeetingDTO viewArticle(String meetingNo); // 아티클 조회
}
// dto 속성
// 회의게시판번호, 최종합류번호(작성자), 제목, 내용, 첨부파일url, 작성일, 회의날짜
// meetingNo, finalNo, title, content, fileUrl, createdDate, meetingDate;