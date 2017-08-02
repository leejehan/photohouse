package com.willbe.controller.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.willbe.dao.MemberDAO;
import com.willbe.dto.MemberDTO;

public class FindMemberAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String url="WillBeServlet?command=findSucess";
		
		HttpSession session=request.getSession();
		
		String name=request.getParameter("find_name");
		String email1=request.getParameter("find_email1");
		String email2=request.getParameter("find_email2");
		String email=email1+"@"+email2;
		
		System.out.println(name);
		System.out.println(email);
		
		MemberDAO memberDAO=MemberDAO.getInstance();
		MemberDTO memberDTO=memberDAO.findMember(name, email);
		
		session.setAttribute("find",memberDTO);
		
		if(memberDTO==null){
			url="findfail.jsp";
		}
		
		request.getRequestDispatcher(url).forward(request, response);
	}

}
