package com.willbe.controller.action;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.willbe.dao.DiaryDAO;
import com.willbe.dao.MemberDAO;
import com.willbe.dao.ScheduleDAO;
import com.willbe.dao.WalletDAO;
import com.willbe.dto.DiaryDTO;
import com.willbe.dto.MemberDTO;

import willbe.memo.db.memoDAO;
import willbe.together.db.boardDAO;

public class GetOutMemberAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String url="mypage/deleteok.jsp";
		
		HttpSession session=request.getSession();
		
		String id=(String)session.getAttribute("id");
		
		
		String pass=request.getParameter("pass");
		
		MemberDAO memberDAO=MemberDAO.getInstance();
		MemberDTO memberDTO=memberDAO.confirmMember(id,pass);
		
		if(memberDTO==null){
			url="mypage/deletefail.jsp";
		}else{
			DiaryDAO diaryDAO=DiaryDAO.getInstance();
			diaryDAO.deletediary(id);
			ScheduleDAO scheduleDAO=ScheduleDAO.getInstance();
			scheduleDAO.deleteSchedule(id);
			WalletDAO walletDAO=WalletDAO.getInstance();
			walletDAO.deletewallet(id);
			boardDAO togetherDAO = new boardDAO();
			togetherDAO.allDeleteBoard(id);
			willbe.question.db.boardDAO questionDAO = new willbe.question.db.boardDAO();
			questionDAO.allDeleteBoard(id);
			memoDAO memodao=new memoDAO();
			memodao.allDelete(id);
			MemberDAO delmember=MemberDAO.getInstance();
			delmember.deletemember(id, pass);
			
			session.invalidate();
			
			url="mypage/deleteok.jsp";
			
		}
		request.getRequestDispatcher(url).forward(request, response);
		
	}

}
