package com.willbe.controller.action;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Calendar;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.willbe.dao.WalletDAO;
import com.willbe.dto.WalletDTO;

public class WalletPrevAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String url="mywalletonlysee.jsp";
		
		Calendar c=Calendar.getInstance();   
	    
		int year=Integer.parseInt(request.getParameter("year"));
		int month=Integer.parseInt(request.getParameter("month"));
		if(month==0){
			year-=1;
			month=12;
		}
		
		String stryear=String.valueOf(year);
	    String strmonth=String.valueOf(month);
		
	    

	   
		
		c.set(year, month,1);
		
		
		HttpSession session=request.getSession();
				
		String id=(String)session.getAttribute("id");
		
		WalletDAO walletDAO=WalletDAO.getInstance();
		ArrayList<WalletDTO> walletDTO=walletDAO.selectWallet(id,stryear,strmonth);
		
		request.setAttribute("walletlist", walletDTO);
		
		request.setAttribute("year",year);
		request.setAttribute("month", month);
		
		request.getRequestDispatcher(url).forward(request, response);
	}

}
