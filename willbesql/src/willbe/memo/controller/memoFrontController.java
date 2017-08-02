package willbe.memo.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import willbe.memo.action.*;

/**
 * Servlet implementation class memoFrontController
 */
@WebServlet("*.mm")
public class memoFrontController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public memoFrontController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Actiondo(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Actiondo(request, response);
	}

	private void Actiondo(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
		String viewPage=null;
		memoAction action=null;
		
		String uri=request.getRequestURI();
		String conPath=request.getContextPath();
		String com=uri.substring(conPath.length());
		
		if(com.equals("/memo.mm")){
			action=new memoListAction();
			action.execute(request, response);
			viewPage="/memo/memo.jsp";
		}else if(com.equals("/memoRegit.mm")){
			action=new memoRegitAction();
			action.execute(request, response);
			viewPage="/memo.mm";
		}else if(com.equals("/memoDelete.mm")){
			action=new memoDeleteAction();
			action.execute(request, response);
			viewPage="/memo.mm";
		}else if(com.equals("/memoModify.mm")){
			action=new memoModifyAction();
			action.execute(request, response);
			viewPage="/memo.mm";
		}		
		
		RequestDispatcher dispatcher=request.getRequestDispatcher(viewPage);
		dispatcher.forward(request,response);
	}

}
