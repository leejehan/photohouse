package com.willbe.controller.action;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.willbe.dao.WalletDAO;
import com.willbe.dto.WalletDTO;

public class WalletInsertFormAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String url="";
		String str="";
		
		
		HttpSession session=request.getSession();
		
		String id=(String)session.getAttribute("id");
		String year=request.getParameter("year");
		String month=request.getParameter("month");
		String date=request.getParameter("date");
		String content=(String)request.getParameter("content");		
		String inout=request.getParameter("inout");
		String inoutmoney=request.getParameter("inoutmoney");
		int inoutint=Integer.parseInt(inoutmoney);
		String sum;
		int sumint=0;	
		
		WalletDAO walletlistDAO=WalletDAO.getInstance();
		ArrayList<WalletDTO> walletlist=walletlistDAO.selectWallet(id);
		
		String stri=null;
		
		for(int i=0;i<walletlist.size();i++){
			stri=walletlist.get(i).getWallet_sum();
		}
		int inti=0;
		if(stri==null){
			inti=0;
		}else{
			inti=Integer.parseInt(stri);
		}
		
		
		
		
		WalletDTO walletDTO=new WalletDTO();
		
		if(inout.equals("1")){
			sumint=inti+inoutint;
			
			sum=String.valueOf(sumint);
			str="입금";
			
			walletDTO.setWallet_id(id);
			walletDTO.setWallet_value(str);
			walletDTO.setWallet_year(year);
			walletDTO.setWallet_month(month);
			walletDTO.setWallet_day(date);
			walletDTO.setWallet_inout(inoutmoney);
			walletDTO.setWallet_content(content);
			walletDTO.setWallet_sum(sum);
			
			WalletDAO walletDAO=WalletDAO.getInstance();
			walletDAO.insertWalletin(walletDTO);
			
			url="WillBeServlet?command=mywallet";
		}else{
			sumint=inti-inoutint;
			
			sum=String.valueOf(sumint);
			str="출금";
			
			walletDTO.setWallet_id(id);
			walletDTO.setWallet_value(str);
			walletDTO.setWallet_year(year);
			walletDTO.setWallet_month(month);
			walletDTO.setWallet_day(date);
			walletDTO.setWallet_inout(inoutmoney);
			walletDTO.setWallet_content(content);
			walletDTO.setWallet_sum(sum);
			
			WalletDAO walletDAO=WalletDAO.getInstance();
			walletDAO.insertWalletin(walletDTO);
			
			url="WillBeServlet?command=mywallet";
		}
		
		request.getRequestDispatcher(url).forward(request, response);
		
		
	}

}
