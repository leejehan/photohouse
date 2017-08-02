package com.willbe.controller.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class InsertScheduleAction implements Action {
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String url="scheduleInsert.jsp";
		
		String year=request.getParameter("year");
		String month=request.getParameter("month");
		String date=request.getParameter("date");
		
		
		request.setAttribute("year", year);
		request.setAttribute("month", month);
		request.setAttribute("date", date);
		
		request.getRequestDispatcher(url).forward(request, response);
	}

}
