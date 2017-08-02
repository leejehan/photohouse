package com.willbe.controller.action;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.willbe.dao.MemberDAO;
import com.willbe.dto.MemberDTO;

public class JoinMemberAction implements Action {
	
	@Override
	public void execute(HttpServletRequest request,HttpServletResponse response) throws ServletException,IOException{
		String url="login.jsp";
		
		
		MemberDTO memberDTO=new MemberDTO();
		
		memberDTO.setMember_id(request.getParameter("member_id"));
		memberDTO.setMember_pw(request.getParameter("member_pw"));
		memberDTO.setMember_name(request.getParameter("member_name"));
		memberDTO.setMember_gender(request.getParameter("member_gender"));
		String phone1=request.getParameter("member_phone1");
		String phone2=request.getParameter("member_phone2");
		String phone3=request.getParameter("member_phone3");
		memberDTO.setMember_phone(phone1+phone2+phone3);
		String email1=request.getParameter("member_email1");
		String email2=request.getParameter("member_email2");
		memberDTO.setMember_email(email1+"@"+email2);
		
		MemberDAO memberDAO=MemberDAO.getInstance();
		memberDAO.insertMember(memberDTO);
		
		RequestDispatcher dispatcher=request.getRequestDispatcher(url);
		dispatcher.forward(request, response);
	}
}
