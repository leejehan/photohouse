package com.willbe.controller.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.willbe.dao.MemberDAO;
import com.willbe.dto.MemberDTO;

public class UpdateMemberSubmitAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		HttpSession session=request.getSession();
		
		String url="mypage/updateok.jsp";
		
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
		memberDAO.updateMember(memberDTO);
		
		request.getRequestDispatcher(url).forward(request, response);
	}

}
