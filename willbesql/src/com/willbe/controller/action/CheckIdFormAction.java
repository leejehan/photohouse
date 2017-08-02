package com.willbe.controller.action;

import java.io.IOException;
import java.net.URLDecoder;
import java.net.URLEncoder;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.willbe.dao.MemberDAO;
import com.willbe.dto.MemberDTO;

public class CheckIdFormAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String url="checkid.jsp";
		
		
		request.setCharacterEncoding("utf-8");
		
		
		String checkid=request.getParameter("id").trim();
		
		checkid=URLEncoder.encode(checkid,"utf-8");
		
		
		System.out.println(checkid);
				
		MemberDAO memberDAO=MemberDAO.getInstance();
		MemberDTO memberDTO=memberDAO.checkMember(checkid);	
		
		if(memberDTO==null){
			url="checkid.jsp";
			request.setAttribute("id",checkid);
		}else{
			url="checkidfail.jsp";
		}
		
		
		request.getRequestDispatcher(url).forward(request, response);
	}
}
