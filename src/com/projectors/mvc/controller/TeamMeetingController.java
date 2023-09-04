package com.projectors.mvc.controller;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.projectors.mvc.dao.ITeamMeetingDAO;
import com.projectors.mvc.dto.TeamMeetingDTO;

@Controller
public class TeamMeetingController
{
	@Autowired
	private SqlSession sqlSession;
	
	// ● 회의록 작성 페이지로 이동 
	@RequestMapping (value = "/writeMeeting.action", method = RequestMethod.GET)
	public String writeMeeting()
	{
		String result = "";
		result="/WEB-INF/view/TeamMeetingWrite.jsp";
		return result;
	}
	
	
	// ● 회의록 등록 (인서트 수행)
	@RequestMapping (value = "/insertMeeting.action", method = RequestMethod.GET)
	public String meetingInsert(TeamMeetingDTO dto)
	{
		String result = "";
		ITeamMeetingDAO dao = sqlSession.getMapper(ITeamMeetingDAO.class);
		dao.add(dto);
		
		result = "redirect:TeamMeetingList.action";
		return result;
	}
	
	//● 회의록 수정 (작성자 본인만)
	@RequestMapping(value = "/modifyMeeting.action", method = RequestMethod.GET)
	public String meetingModify(TeamMeetingDTO dto)
	{
		String result = "";
		ITeamMeetingDAO dao = sqlSession.getMapper(ITeamMeetingDAO.class);

		dao.modify(dto);
		
		result = "redirect:teamMeetingArticle.action?meetingNo=" + dto.getMeetingNo();
		return result;
	}
	
	//● 회의록 삭제 (작성자 본인만)
	@RequestMapping(value = "/deleteMeeting.action", method = RequestMethod.GET)
	public String meetingDelete(String meetingNo)
	{
		String result = "";
		ITeamMeetingDAO dao = sqlSession.getMapper(ITeamMeetingDAO.class);
		dao.delete(meetingNo);
		
		result = "redirect:TeamMeetingList.action";
		return result;
	}
	
	//=========================================================================
	//● 회의록 리스트로 불러오기 (회의록 게시판 메인)
	@RequestMapping(value = "/TeamMeetingList.action", method = RequestMethod.GET)
	public String meetingList(Model model)
	{
		String result = "";
		ITeamMeetingDAO dao = sqlSession.getMapper(ITeamMeetingDAO.class);
		model.addAttribute("list", dao.getList());
		
		result = "/WEB-INF/view/TeamMeetingList.jsp";
		return result;
	}
	
	//● 회의록 아티클 읽기 (모든 팀원)
	@RequestMapping(value = "/teamMeetingArticle.action", method = RequestMethod.GET)
	public String meetingArticle(String meetingNo, Model model)
	{
		String result = "";
		ITeamMeetingDAO dao = sqlSession.getMapper(ITeamMeetingDAO.class);
		model.addAttribute("meetingArticle", dao.viewArticle(meetingNo));
		
		result = "/WEB-INF/view/TeamMeetingArticle.jsp";
		return result;
	}
}
