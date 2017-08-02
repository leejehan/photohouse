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

public class MyWalletAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String url="mywallet.jsp";
		
		Calendar c=Calendar.getInstance();   
	    
	    int year=c.get(Calendar.YEAR);
	    int month=c.get(Calendar.MONTH)+1;
	    int date=c.get(Calendar.DATE);
	    
	    String stryear=String.valueOf(year);
	    String strmonth=String.valueOf(month);
	    String strdate=String.valueOf(date);
	    
		HttpSession session=request.getSession();
				
		String id=(String)session.getAttribute("id");
		
		WalletDAO walletDAO=WalletDAO.getInstance();
		ArrayList<WalletDTO> walletDTO=walletDAO.selectWallet(id,stryear,strmonth);
		
		request.setAttribute("walletlist", walletDTO);
		
		request.setAttribute("year",year);
		request.setAttribute("month", month);
		request.setAttribute("date", date);
		
		
		
		request.getRequestDispatcher(url).forward(request, response);
		
	}

}
