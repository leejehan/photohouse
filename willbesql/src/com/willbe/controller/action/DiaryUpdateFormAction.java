package com.willbe.controller.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.willbe.dao.DiaryDAO;
import com.willbe.dto.DiaryDTO;

public class DiaryUpdateFormAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		HttpSession session=request.getSession();
		
		String id=(String)session.getAttribute("id");
		String year=request.getParameter("year");
		String month=request.getParameter("month");
		String date=request.getParameter("date");
		
		DiaryDTO diaryDTO=new DiaryDTO();
		
		diaryDTO.setDiary_id(id);
		diaryDTO.setDiary_year(year);
		diaryDTO.setDiary_month(month);
		diaryDTO.setDiary_day(date);
		diaryDTO.setDiary_content(request.getParameter("content"));
		
		DiaryDAO diaryDAO=DiaryDAO.getInstance();
		diaryDAO.updateDiary(diaryDTO);
		
		String url="WillBeServlet?command=diarydate&year="+year+"&month="+month+"&=date"+date;
		
		request.getRequestDispatcher(url).forward(request, response);
	}

}
