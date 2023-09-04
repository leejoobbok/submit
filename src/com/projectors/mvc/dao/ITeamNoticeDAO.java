package com.projectors.mvc.dao;

import java.util.ArrayList;

import com.projectors.mvc.dto.TeamNoticeDTO;

public interface ITeamNoticeDAO // 팀 공지게시판 인터페이스
{
	public int add(TeamNoticeDTO dto);      //● 공지글 등록 (팀장)
	 
	public int modify(TeamNoticeDTO dto);   //● 공지글 수정 (팀장)
	
	public int delete(String spaceNoticeNo);//● 공지글 삭제  (팀장)
	
	public ArrayList<TeamNoticeDTO> getList();				//● 공지글 리스트로 불러오기 (모든 팀원)
	
	public TeamNoticeDTO viewArticle(String spaceNoticeNo);	//● 공지글 아티클 읽기 (모든 팀원)

	// 가장 최근에 생성한 팀공지글 번호 가져오기 ( 새 글 등록 후 바로 해당 아티클 확인 가능하도록) 
	public String findTeamNoticeNo();
	
}
