package com.willbe.controller.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.willbe.dao.MemberDAO;
import com.willbe.dto.MemberDTO;

public class LoginAction implements Action {
	@Override
	public void execute(HttpServletRequest request,HttpServletResponse response) throws ServletException,IOException{
		String url="join.jsp";
		HttpSession session=request.getSession();
		
		String id=request.getParameter("id");
		String pw=request.getParameter("pw");
		
		MemberDAO memberDAO=MemberDAO.getInstance();
		MemberDTO memberDTO=memberDAO.getMember(id);

		
		
		
		if(memberDTO!=null){
			if(memberDTO.getMember_pw().equals(pw)){
				session.removeAttribute("id");
				session.setAttribute("id", memberDTO.getMember_id());
				session.setAttribute("name", memberDTO.getMember_name());
				url="WillBeServlet?command=menu";
			}else{
				url="loginpwfail.jsp";				
			}
		}else{
			url="loginidfail.jsp";
		}
		request.getRequestDispatcher(url).forward(request, response);
	}
}
