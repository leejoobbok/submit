package com.projectors.mvc.controller;

import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.projectors.mvc.dao.IMenuBarDAO;

@Controller
public class MenuBarController
{
	@Autowired
	private SqlSession sqlSession;
	

	@RequestMapping(value = "/checkadmin.action")
	@ResponseBody
	public String checkAdmin(String pinNo)
	{
		IMenuBarDAO dao = sqlSession.getMapper(IMenuBarDAO.class);
		
		String result = "";
		
		result = dao.checkAdmin(pinNo);
				
		return result;
	}
	
}
