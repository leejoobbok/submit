/*=================
  UsersController.java
 ================*/

package com.projectors.mvc.controller;


import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.projectors.mvc.dao.IUsersDAO;
import com.projectors.mvc.dto.UsersDTO;


@Controller
public class UsersController
{
	@Autowired
	private SqlSession sqlSession;

	@RequestMapping(value = "/createAccountForm.action", method = RequestMethod.GET)
	public String creatAccountForm(Model model)
	{
		String result = "";

		result = "/WEB-INF/view/CreateAccount.jsp";

		return result;

	}

	
	

	@RequestMapping(value = "/idcheck.action", method = RequestMethod.GET)
	public void CheckId(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
	
		IUsersDAO dao = sqlSession.getMapper(IUsersDAO.class);
		
		String userId = (request.getParameter("userId")).trim();
		
		int result = 0;
		
		if (dao.checkId(userId) > 0 || userId.equals(""))
		{
			result = 1;
		}
		else /*중복된 아이디가 없을 때*/
		{
			result = 0;
		}
	
		
		/* System.out.println(userId); */
		
		request.setAttribute("result", result);
		
		RequestDispatcher dispatcher = request.getRequestDispatcher("id_ck_ajax.jsp");
		dispatcher.forward(request, response);
		
		
	}
	
	
	
	@RequestMapping(value="/nicknamecheck.action", method=RequestMethod.GET)
	public void CheckNickname(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		
		IUsersDAO dao = sqlSession.getMapper(IUsersDAO.class);
		
		String nickname = (request.getParameter("nickname")).trim();
		
		/* System.out.println("닉네임 중복 확인 버큰 작동"); */
		
		
		int result=0;
		
		if(dao.checknickname(nickname) > 0 || nickname.equals(""))
		{
			result=3;
		}
		else
		{
			result=2;
		}
		
		request.setAttribute("result", result);
		
		RequestDispatcher dispatcher = request.getRequestDispatcher("nickname_ck_ajax.jsp");
		dispatcher.forward(request, response);
		
	}
/*checkrepw.action*/	
	@RequestMapping(value="/checkrepw.action")
	public void CheckRePw(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		String userPw = (request.getParameter("userPw")).trim();
		String userPwCk = (request.getParameter("userPwCk")).trim();
		
		int result = 0;
		//if 변경 비밀번호와 변경 비밀번호 확인이 동일한 경우 else 동일하지 않은 경우
		if (userPw.equals(userPwCk) && !userPw.equals(""))
		{
			result = 10;
		}
		else if((userPw.equals("") && userPwCk.equals("")) || userPwCk.equals(""))
		{
			result = 111; 
		}
		else
		{
			result = 11;
		}
		
		request.setAttribute("result", result);
		
		RequestDispatcher dispatcher = request.getRequestDispatcher("repw_ck_ajax.jsp");
		dispatcher.forward(request, response);
	}
	
	@RequestMapping(value="/userRegist.action",method=RequestMethod.GET)
	public String userRegist(Model model, UsersDTO usersDTO)
	{
		IUsersDAO dao = sqlSession.getMapper(IUsersDAO.class);
		
		dao.addPin();
		dao.addUsers(usersDTO);

		return "aftercreateaccount.action";
		
	}
	
	@RequestMapping(value="/aftercreateaccount.action", method=RequestMethod.GET)
	public String afterCreateAccount()
	{
		return "/WEB-INF/view/AfterCreateAccount.jsp";
		
	}
	
	
	
	@RequestMapping(value="photoUpdateForm.action", method=RequestMethod.GET)
	public String photoUpdateForm(Model model, HttpServletRequest request)
	{
		String url="";
		
		IUsersDAO dao = sqlSession.getMapper(IUsersDAO.class);
		
		HttpSession session = request.getSession();
		
		String pinNo = (String) session.getAttribute("pinNo");
		
		String photourl = dao.getPhotourl(pinNo);
		
		model.addAttribute("photourl", photourl);
		
		url="/WEB-INF/view/PhotoUpdate.jsp";
		return url;
	}
	
	
	
	
	@RequestMapping(value="/removePhoto.action", method=RequestMethod.GET)
	public String removePhoto(HttpServletRequest request)
	{
		
		String url="";	
		
		HttpSession session = request.getSession();
		
		IUsersDAO dao = sqlSession.getMapper(IUsersDAO.class);
		
		String pinNo = (String) session.getAttribute("pinNo");
		
		dao.removePhoto(pinNo);
		
		url="redirect:photoUpdateForm.action";
		
		return url;
		
	}
	
	
	@RequestMapping(value="/updatePhoto.action", method=RequestMethod.GET)
	public String updatePhoto(HttpServletRequest request)
	{
		String url ="";
		
		HttpSession session = request.getSession();
		
		String pinNo = (String) session.getAttribute("pinNo");
		
		IUsersDAO dao = sqlSession.getMapper(IUsersDAO.class);
		
		UsersDTO usersDTO = new UsersDTO();
		
		
		
		usersDTO.setPhotourl((String)session.getAttribute("pinNo"));
		usersDTO.setPhotourl(request.getParameter("photourl"));
		
		System.out.println((String)session.getAttribute("pinNo"));
		System.out.println(request.getParameter("photourl"));
		
		
		dao.updatePhoto(usersDTO);
		
		url="redirect:photoUpdateForm.action";
		
		return url;
	}
	
	
	// 관리자의 회원관리 시 필요한 메소드
	// 회원 리스트
	@RequestMapping (value = "/userManagement.action", method = RequestMethod.GET)
	public String userList(Model model)
	{
		String result = "";
		
		IUsersDAO dao = sqlSession.getMapper(IUsersDAO.class);
		
		model.addAttribute("lists", dao.list());
		
		result = "/WEB-INF/view/UserManagement.jsp";
		
		return result;
	}
	
	//회원 검색
	@RequestMapping (value ="/userSearchManagement.action", method = RequestMethod.GET )
	public String searchUserList(Model model, String searchKey, String searchValue)
	{
		String result = "";
		
		IUsersDAO dao = sqlSession.getMapper(IUsersDAO.class);
		
		if (searchKey.equals("1"))
			model.addAttribute("lists", dao.searchId(searchValue));
		else if (searchKey.equals("2"))
			model.addAttribute("lists", dao.searchNickname(searchValue));
			
		result = "/WEB-INF/view/UserManagement.jsp";
			
		return result;
	}

	
	
	
	
}
