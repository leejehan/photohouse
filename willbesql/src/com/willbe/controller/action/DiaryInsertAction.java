package com.willbe.controller.action;

import java.io.IOException;
import java.util.Calendar;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class DiaryInsertAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String url="insertdiary.jsp";
		
		Calendar c=Calendar.getInstance();
	
		
		int year=Integer.parseInt(request.getParameter("year"));
		int month=Integer.parseInt(request.getParameter("month"));
		int date=Integer.parseInt(request.getParameter("date"));
		
		month-=1;
		c.set(year, month,date);
		
		
		
		year=c.get(Calendar.YEAR);
		month=c.get(Calendar.MONTH)+1;		
		int dayNum=c.get(Calendar.DAY_OF_WEEK);
		int eday=c.getActualMaximum(Calendar.DATE);
		int sday =c.get(Calendar.DAY_OF_WEEK);


		request.setAttribute("year",year );
		request.setAttribute("month",month);
		request.setAttribute("dayNum",dayNum);
		request.setAttribute("eday",eday);
		request.setAttribute("sday", sday);
		request.setAttribute("date",date);
		
		HttpSession session=request.getSession();
		
		String id=(String)session.getAttribute("id");
		
		request.getRequestDispatcher(url).forward(request, response);
	}

}
