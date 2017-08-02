package com.willbe.controller.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class InputMenuAction implements Action{
	@Override
	public void execute(HttpServletRequest request,HttpServletResponse response) throws ServletException,IOException{
		String url="menu.jsp";
		HttpSession session=request.getSession();
		
		request.getRequestDispatcher(url).forward(request, response);
	}
}
