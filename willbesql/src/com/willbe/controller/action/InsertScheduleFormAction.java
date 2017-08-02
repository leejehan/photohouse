package com.willbe.controller.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.willbe.dao.ScheduleDAO;
import com.willbe.dto.ScheduleDTO;

public class InsertScheduleFormAction implements Action{
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String url="WillBeServlet?command=schedule";
		
		HttpSession session=request.getSession();
		
		String id=(String)session.getAttribute("id");
		String year=request.getParameter("year");
		String month=request.getParameter("month");
		String date=request.getParameter("date");
		
		System.out.println(year+month+date);
				
		ScheduleDTO scheduleDTO=new ScheduleDTO();
		
		scheduleDTO.setSchedule_id(id);
		scheduleDTO.setSchedule_year(year);
		scheduleDTO.setSchedule_Month(month);
		scheduleDTO.setSchedule_Day(date);
		String shour=request.getParameter("shour");
		String sminute=request.getParameter("sminute");
		String ehour=request.getParameter("ehour");
		String eminute=request.getParameter("eminute");
		scheduleDTO.setSchedule_time(shour+":"+sminute+"~"+ehour+":"+eminute);
		scheduleDTO.setSchedule_title(request.getParameter("title"));
		scheduleDTO.setSchedule_content(request.getParameter("content"));
		
		ScheduleDAO scheduleDAO=ScheduleDAO.getInstance();
		scheduleDAO.insertSchedule(scheduleDTO);
		
		
		request.getRequestDispatcher(url).forward(request, response);
	}

}
