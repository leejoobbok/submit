package com.projectors.mvc.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.projectors.mvc.dao.ILoginDAO;
import com.projectors.mvc.dto.LoginDTO;


@Controller
public class LoginController
{

	@Autowired
	private SqlSession sqlSession;

	@RequestMapping(value = "/loginForm.action", method = RequestMethod.GET)
	public String loginForm(Model model)
	{
		String result = "";

		result = "/WEB-INF/view/Login.jsp";

		return result;
	}
	

	@RequestMapping(value = "/login.action", method = RequestMethod.POST)
	public String login(Model model, LoginDTO loginDTO, HttpServletRequest request)
	{
		String result = "";
		
		ILoginDAO dao = sqlSession.getMapper(ILoginDAO.class);
		
		HttpSession session = request.getSession();
		
		/*관리자라면*/
		if (loginDTO.getManagerCheck() != null)
		{
			
			if (dao.adminLogin(loginDTO) == 1)
			{
				System.out.println("관리자 로그인 성공");
				result="adminMain.action";
				
				/*관리자 핀 번호 찾는 메소드로
				  핀번호 구하고 세션에 넣을 자리*/
				
				//System.out.println(dao.getAdminPin(loginDTO));
				//System.out.println(dao.getAdminNo(loginDTO));
				
				
				/*세션에 관리자 pin 등록*/
				session.setAttribute("pinNo", dao.getAdminPin(loginDTO));
				session.setAttribute("adminNo", dao.getAdminNo(loginDTO));
				
				// 추가 코드 : 세션 유지 시간 설정
				// 32,400 (6시간) 테스트용 600 (10분)
				session.setMaxInactiveInterval(600);
				dao.loginRec(dao.getAdminPin(loginDTO));
				
			}
			else
			{
				System.out.println("관리자 로그인 실패");
				result="redirect:loginForm.action";
			}
		}
		/*일반 사용자라면 (관리자가 아니라면)*/
		else 
		{
			if (dao.userLogin(loginDTO) == 1)
			{
				System.out.println("사용자 로그인 성공");
				
				/*사용자 핀 번호 찾는 메소드로
				  핀번호 구하고 세션에 넣을 자리*/
				
				System.out.println("LoginController_사용자 핀넘버 : "+dao.getUserPin(loginDTO));
				
				/*세션에 사용자 pin 등록*/
				session.setAttribute("pinNo", dao.getUserPin(loginDTO));
				dao.loginRec(dao.getUserPin(loginDTO));
				
				// result="MainPage.jsp";
				result="redirect:projectorsmain.action";
				
			}
			else
			{
				System.out.println("사용자 로그인 실패");
				result="redirect:loginForm.action";
			}
		}
		
		return result;
	}
	
	// 로그인 로그 리스트 출력
	@RequestMapping (value = "/userManagementLog.action", method = RequestMethod.GET)
	public String logInLog(Model model)
	{
		String result = "";
		
		ILoginDAO dao = sqlSession.getMapper(ILoginDAO.class);
		
		model.addAttribute("lists", dao.findLoginRec());
		
		result = "/WEB-INF/view/UserManagementLog.jsp";
		
		return result;
	}
	
	// 로그 아웃
	@RequestMapping(value="/logout.action", method=RequestMethod.GET)
	public String logOut(HttpServletRequest request)
	{
		HttpSession session = request.getSession();
		
		ILoginDAO dao = sqlSession.getMapper(ILoginDAO.class);
		
		String pinNo=  (String)session.getAttribute("pinNo");
		
		dao.logoutRec(pinNo);
		
		System.out.println(pinNo +  " : 로그아웃 레코드 남기고 종료!");
		
		session.invalidate();

		return "redirect:projectorsmain.action";
	}
	
	@RequestMapping (value = "/userManagementLogOut.action", method = RequestMethod.GET )
	// 로그아웃 로그 리스트 출력
	public String logOutLog(Model model)
	{
		String result = "";
		
		ILoginDAO dao = sqlSession.getMapper(ILoginDAO.class);
		
		model.addAttribute("lists", dao.findLogoutRec());

		result = "/WEB-INF/view/UserManagementLogOut.jsp";
		
		return result;
	}

}
