package com.projectors.mvc.controller;


//import javax.servlet.http.HttpServletRequest;
//import javax.servlet.http.HttpSession;

//import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class TeamSpaceController
{	
	
	@Autowired
	//private SqlSession sqlSession;
	
	// 팀 스페이스 메인으로 이동
	@RequestMapping(value="/teamSpaceMain.action", method = RequestMethod.GET)
	public String teamSpaceMain()
	{
		String url="";
		
		url="/WEB-INF/view/TeamSpace.jsp";
				
		return url;
	}

}
