package com.projectors.mvc.controller;


import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.projectors.mvc.dao.IFeedDAO;
import com.projectors.mvc.dto.FeedDTO;

@Controller
public class FeedController
{
	@Autowired
	private SqlSession sqlSession;
	
	
	//● 담벼락 메세지 불러오기 (특정 팀 스페이스)
	@RequestMapping(value = "/loadFeed.action", method = RequestMethod.GET)
	public String loadFeed(Model model)
	{
		String result = "";
		
		IFeedDAO dao = sqlSession.getMapper(IFeedDAO.class);
		
		model.addAttribute("list", dao.loadFeed());
		
		System.out.println(dao.loadFeed());
		result = "/WEB-INF/view/Feed.jsp";
		
		return result;
	}

	// ● 담벼락 글 등록 
	@RequestMapping (value = "/addFeed.action", method = RequestMethod.GET)
	public String addFeed(FeedDTO dto)
	{
		String result = "";
		
		IFeedDAO dao = sqlSession.getMapper(IFeedDAO.class);
		dao.addFeed(dto); 
		
		result="redirect:loadFeed.action";
		
		return result;
	}
	
}

