package com.projectors.mvc.controller;


import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.projectors.mvc.dao.IAdminNoticeDAO;
import com.projectors.mvc.dao.IRecruitDAO;
import com.projectors.mvc.dto.RecruitDTO;


@Controller
public class MainController
{
	@Autowired
	private SqlSession sqlsession;
	
	@RequestMapping(value = "/projectorsmain.action", method = RequestMethod.GET)
	public String projectorsmain(Model model, String recruitNo)
	{
		IRecruitDAO dao = sqlsession.getMapper(IRecruitDAO.class);
		List<ArrayList<String>> tools = new ArrayList<ArrayList<String>>();
		List<ArrayList<RecruitDTO>> recruitMember = new ArrayList<ArrayList<RecruitDTO>>();
		
		model.addAttribute("lists", dao.lists());
		
		for (int i=0; i < dao.lists().size(); i++)
		{
			recruitNo = dao.lists().get(i).getRecruitNo();
			tools.add(dao.showTool(recruitNo));
			recruitMember.add(dao.countPosRecruitMember(recruitNo));
		}
		
	    model.addAttribute("tools", tools);
	    model.addAttribute("recruitMember", recruitMember);
	    
		return "/WEB-INF/view/ProjectorsMainPage.jsp";
	}
	
	
	@RequestMapping(value = "/noticelists.action", method = RequestMethod.GET)
	public String noticelists(Model model)
	{
		IAdminNoticeDAO dao = sqlsession.getMapper(IAdminNoticeDAO.class);
		
		model.addAttribute("lists", dao.lists());
		
		return "/WEB-INF/view/MainNoticeLists.jsp";
	}
	
	
	@RequestMapping(value = "/noticearticle.action", method = RequestMethod.GET)
	public String noticearticle(Model model, String adminNoticeNo)
	{
		IAdminNoticeDAO dao = sqlsession.getMapper(IAdminNoticeDAO.class);

		model.addAttribute("article", dao.article(adminNoticeNo));
		
		return "/WEB-INF/view/MainNoticeArticle.jsp";
	}
	

}