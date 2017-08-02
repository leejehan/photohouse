package com.willbe.controller.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class MyPageAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String url="mypage/mypage.jsp";
		
		HttpSession session=request.getSession();
		
		String id=(String)session.getAttribute("id");
		String name=(String)session.getAttribute("name");
		
		request.getRequestDispatcher(url).forward(request, response);
	}

}
