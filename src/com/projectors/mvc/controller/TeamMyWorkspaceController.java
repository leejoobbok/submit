package com.projectors.mvc.controller;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.projectors.mvc.dao.ITeamMyWorkspaceDAO;
import com.projectors.mvc.dto.TeamMyWorkspaceDTO;

@Controller
public class TeamMyWorkspaceController
{
	@Autowired
	private SqlSession sqlSession;
	
	//● 작업글 리스트로 불러오기 (내 작업실 게시판 메인)
	@RequestMapping(value = "/teamMyWorkspace.action", method = RequestMethod.GET)
	public String myWorkList(Model model)
	{
		String result = "";
		ITeamMyWorkspaceDAO dao = sqlSession.getMapper(ITeamMyWorkspaceDAO.class);
		model.addAttribute("list", dao.getList());
		
		result = "/WEB-INF/view/TeamMyWorkspace.jsp";
		return result;
	}
	
	//● 회의록 아티클 읽기 (모든 팀원)
	@RequestMapping(value = "/teamMyWorkArticle.action", method = RequestMethod.GET)
	public String myWorkArticle(String workspaceNo, Model model)
	{
		String result = "";
		ITeamMyWorkspaceDAO dao = sqlSession.getMapper(ITeamMyWorkspaceDAO.class);
		model.addAttribute("myWorkArticle", dao.readArticle(workspaceNo));
		
		result = "/WEB-INF/view/TeamMyWorkArticle.jsp";
		return result;
	}
	//=========================================================================
	// ● 작업글 작성 폼 페이지로 이동 
	@RequestMapping (value = "/writeMyWork.action", method = RequestMethod.GET)
	public String writeMyWork()
	{
		String result = "";
		result="/WEB-INF/view/TeamMyWorkspaceWrite.jsp";
		return result;
	}
	
	// ● 작업글 등록 (인서트 수행)
	@RequestMapping (value = "/insertMyWork.action", method = RequestMethod.GET)
	public String myWorkInsert(TeamMyWorkspaceDTO dto)
	{
		String result = "";
		ITeamMyWorkspaceDAO dao = sqlSession.getMapper(ITeamMyWorkspaceDAO.class);
		dao.add(dto);
		
		result = "redirect:teamMyWorkspace.action";
		return result;
	}
	
	//● 작업글 수정 (작성자 본인만)
	@RequestMapping(value = "/modifyMyWork.action", method = RequestMethod.GET)
	public String myWorkModify(TeamMyWorkspaceDTO dto)
	{
		String result = "";
		ITeamMyWorkspaceDAO dao = sqlSession.getMapper(ITeamMyWorkspaceDAO.class);

		dao.modify(dto);
		
		result = "redirect:teamMyWorkArticle.action?workspaceNo=" + dto.getWorkspaceNo();
		return result;
	}
	
	//● 작업글 삭제 (작성자 본인만)
	@RequestMapping(value = "/deleteMyWork.action", method = RequestMethod.GET)
	public String myWorkDelete(String workspaceNo)
	{
		String result = "";
		ITeamMyWorkspaceDAO dao = sqlSession.getMapper(ITeamMyWorkspaceDAO.class);
		dao.delete(workspaceNo);
		
		result = "redirect:teamMyWorkspace.action";
		return result;
	}
	
}
