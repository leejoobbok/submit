/*=================
  AccountManagementController.java
 ================*/

package com.projectors.mvc.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.projectors.mvc.dao.IAccountManagementDAO;
import com.projectors.mvc.dto.AccountManagementDTO;
import com.sun.org.apache.bcel.internal.generic.NEW;

@Controller
public class AccountManagementController
{
	@Autowired
	private SqlSession sqlSession;
	
	//비밀번호 변경 시 변경할 비밀번호 확인해주는 ajax
	@RequestMapping(value = "/preChangePw.action")
	@ResponseBody
	public String preChangePw(String password, String pinNo)
	{
		AccountManagementDTO dto = new AccountManagementDTO();

		IAccountManagementDAO dao = sqlSession.getMapper(IAccountManagementDAO.class);

		dto.setPinNo(pinNo);
		dto.setPw(password);

		String result = dao.checkPw(dto);

		// System.out.println("password :" + password + ",pinNo : " + pinNo);
		// System.out.println("변경전 현재 비밀 번호 확인" + result);

		return result;
	}

	// 비밀번호 변경 쿼리문 실행 시켜주는 메소드
	@RequestMapping(value = "/changePw.action")
	public String changePw(HttpServletRequest request)
	{
		HttpSession session = request.getSession();

		String pinNo = (String) session.getAttribute("pinNo");
		String newPw = request.getParameter("newPassword");

		AccountManagementDTO dto = new AccountManagementDTO();

		dto.setPinNo(pinNo);
		dto.setNewPw(newPw);

		IAccountManagementDAO dao = sqlSession.getMapper(IAccountManagementDAO.class);

		dao.changePw(dto);

		session.invalidate();

		return "redirect:projectorsmain.action";
	}
	
	
	//---- ▼ 회원 탈퇴 관련 메소드
	// 비밀번호 입력 올바르게 했는지 검사 ajax
	@RequestMapping(value = "/preWithdraw.action")
	@ResponseBody
	public String preWithdraw(String pinNo, String password)
	{
		AccountManagementDTO dto = new AccountManagementDTO();
		
		IAccountManagementDAO dao = sqlSession.getMapper(IAccountManagementDAO.class);
		
		dto.setPinNo(pinNo);
		dto.setPw(password);
		
		String result = dao.checkPw(dto);
		
		return result;
	}
	
	// 검사 통과 후 탈퇴 수행시킬 메소드
	@RequestMapping(value = "withdraw.action")
	public String withdraw(HttpServletRequest request)
	{
		HttpSession session = request.getSession();

		String pinNo = request.getParameter("pinNo");
		String pw = request.getParameter("password");
		int wdTypeNo = Integer.parseInt(request.getParameter("wdTypeNo"));
		
		AccountManagementDTO dto = new AccountManagementDTO();

		dto.setPinNo(pinNo);
		dto.setPw(pw);
		dto.setWdTypeNo(wdTypeNo);
		
		IAccountManagementDAO dao = sqlSession.getMapper(IAccountManagementDAO.class);
			
		// withdraw 테이블에 값 인서트
		dao.insertWithdraw(dto);
		// users 테이블에 있는 회원 데이터 삭제
		dao.withdraw(dto);
		
		session.invalidate();
		
		return "redirect:projectorsmain.action";
	}
}
