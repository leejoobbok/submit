package com.projectors.mvc.controller;

//import javax.servlet.http.HttpServletRequest;

//import javax.servlet.http.HttpServletRequest;
//import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.projectors.mvc.dao.ITeamNoticeDAO;
import com.projectors.mvc.dto.TeamNoticeDTO;

@Controller
public class TeamNoticeController
{
	@Autowired
	private SqlSession sqlSession;
	
	// ● 공지글 작성 페이지로 이동 
	@RequestMapping (value = "/writeTeamNotice.action", method = RequestMethod.GET)
	public String writeTeamNotice()
	{
		String result = "";
		result="/WEB-INF/view/TeamNoticeInsert.jsp";
		return result;
	}
	
	
	// ● 공지글 등록 (팀장)
	@RequestMapping (value = "/insertTeamNotice.action", method = RequestMethod.GET)
	public String teamNoticeInsert(TeamNoticeDTO dto)
	{
		String result = "";
		
		ITeamNoticeDAO dao = sqlSession.getMapper(ITeamNoticeDAO.class);
		dao.add(dto); 
		result = "redirect:teamNoticeArticle.action?spaceNoticeNo=" + dao.findTeamNoticeNo();
		
		return result;
	}
	
	//● 공지글 수정 (팀장)
	@RequestMapping(value = "/teamNoticeModify.action", method = RequestMethod.GET)
	public String teamNoticeModify(TeamNoticeDTO dto)
	{
		String result = "";
		
		ITeamNoticeDAO dao = sqlSession.getMapper(ITeamNoticeDAO.class);
		dao.modify(dto);
		
		result = "redirect:teamNoticeArticle.action?spaceNoticeNo=" + dto.getSpaceNoticeNo();
		return result;
	}
	
	//● 공지글 삭제 (팀장)
	@RequestMapping(value = "/teamNoticeDelete.action", method = RequestMethod.GET)
	public String teamNoticeDelete(String spaceNoticeNo)
	{
		String result = "";
		ITeamNoticeDAO dao = sqlSession.getMapper(ITeamNoticeDAO.class);
		dao.delete(spaceNoticeNo);
		
		result = "redirect:teamNoticeList.action";
		return result;
	}
	//=========================================================================
	//● 공지글 리스트로 불러오기 (모든 팀원)
	@RequestMapping(value = "/teamNoticeList.action", method = RequestMethod.GET)
	public String teamNoticeList(Model model)
	{
		String result = "";
		ITeamNoticeDAO dao = sqlSession.getMapper(ITeamNoticeDAO.class);
		model.addAttribute("list", dao.getList());
		
		result = "/WEB-INF/view/TeamNoticeList.jsp";
		return result;
	}
	
	//● 공지글 아티클 읽기 (모든 팀원)
	@RequestMapping(value = "/teamNoticeArticle.action", method = RequestMethod.GET)
	public String teamNoticeArticle(String spaceNoticeNo, Model model)
	{
		String result = "";
		ITeamNoticeDAO dao = sqlSession.getMapper(ITeamNoticeDAO.class);
		model.addAttribute("teamArticle", dao.viewArticle(spaceNoticeNo));
		
		result = "/WEB-INF/view/TeamNoticeArticle.jsp";
		return result;
	}
	
}



















