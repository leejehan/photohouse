package com.willbe.controller.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.willbe.dao.ScheduleDAO;

public class DeleteScheduleAction  implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		
		HttpSession session=request.getSession();
		
		String id=(String)session.getAttribute("id");		
		String year=(String)request.getParameter("year");
		String month=(String)request.getParameter("month");
		String date=(String)request.getParameter("date");
		String time=(String)request.getParameter("time");
		
		String url="deleteschedule.jsp";
		
		ScheduleDAO scheduleDAO=ScheduleDAO.getInstance();
		scheduleDAO.deleteSchedule(id, year, month, date, time);
		
		request.setAttribute("year", year);
		request.setAttribute("month", month);
		request.setAttribute("date", date);
		
		request.getRequestDispatcher(url).forward(request, response);
	}


}
