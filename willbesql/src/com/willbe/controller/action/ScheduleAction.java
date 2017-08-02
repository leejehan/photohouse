package com.willbe.controller.action;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Calendar;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.willbe.dao.*;
import com.willbe.dto.*;

public class ScheduleAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String url="schedule.jsp";
				
		Calendar c=Calendar.getInstance();	
		
		
		int year=c.get(Calendar.YEAR);
		int month=c.get(Calendar.MONTH);
		
		c.set(year, month,1);
		month+=1;
		
		int today=c.get(Calendar.DATE);
		int dayNum=c.get(Calendar.DAY_OF_WEEK);
		int eday=c.getActualMaximum(Calendar.DATE);
		int sday =c.get(Calendar.DAY_OF_WEEK)-1;
		int date=c.get(Calendar.DATE);
		
		
		
				
		request.setAttribute("year",year);
		request.setAttribute("month",month);
		request.setAttribute("dayNum",dayNum);
		request.setAttribute("eday",eday);
		request.setAttribute("sday", sday);
		request.setAttribute("today",today);
		request.setAttribute("date",date);
		
		HttpSession session=request.getSession();
		
		String id=(String)session.getAttribute("id");
		
		ScheduleDAO scheduleDAO=ScheduleDAO.getInstance();
		ArrayList<ScheduleDTO> scheduleDTO=scheduleDAO.selectSchedule(id);
		
		request.setAttribute("schedulelist",scheduleDTO);
		
		request.getRequestDispatcher(url).forward(request, response);
		
	}

}
