package com.willbe.controller.action;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.willbe.dao.ScheduleDAO;
import com.willbe.dto.ScheduleDTO;

public class ScheduleContentsAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		String url="scheduleSelect.jsp";
		
		HttpSession session=request.getSession();
		
		String id=(String) session.getAttribute("id");
		String year=request.getParameter("year");
		String month=request.getParameter("month");
		String date=request.getParameter("date");
		String name=(String) session.getAttribute("name");
		
	
		
		ScheduleDAO scheduleDAO=ScheduleDAO.getInstance();
		ArrayList<ScheduleDTO> scheduleDTO=scheduleDAO.selectSchedule(id,year, month, date);
		
		
		if(scheduleDTO!=null){
			request.setAttribute("schedulelist",scheduleDTO);
			request.setAttribute("year",year);
			request.setAttribute("month",month);
			request.setAttribute("date",date);
			url="scheduleSelect.jsp";
			
		}
		
		request.getRequestDispatcher(url).forward(request,response);
		
	}

}
