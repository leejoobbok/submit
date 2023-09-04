package com.projectors.mvc.dao;

import java.util.ArrayList;

import com.projectors.mvc.dto.TeamMyWorkspaceDTO;

public interface ITeamMyWorkspaceDAO
{
	public ArrayList<TeamMyWorkspaceDTO> getList(); // 내 작업글 목록 불러오기
	
	public TeamMyWorkspaceDTO readArticle(String workspaceNo); // 특정 작업글 아티클 읽기 
	
	public int add(TeamMyWorkspaceDTO dto); // 새 작업글 등록
	
	public int modify(TeamMyWorkspaceDTO dto); // 작업글 수정(제목,본문)
	
	public int delete(String workspaceNo); // 작업글 삭제 
	
}
