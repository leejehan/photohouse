package willbe.question.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import willbe.question.action.*;



/**
 * Servlet implementation class boardFrontController
 */
@WebServlet("*.qt")
public class boardFrontController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public boardFrontController() {
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
		boardAction action=null;		
		
		String uri=request.getRequestURI();
		String conPath=request.getContextPath();
		String com=uri.substring(conPath.length());
				
		if(com.equals("/listboard.qt")){			
			action=new boardListAction();			
			action.execute(request,response);
			viewPage="/board2/listboard.jsp";
		}else if(com.equals("/write.qt")){
			action=new boardWriteAction();
			action.execute(request,response);
			viewPage="/board2/write.jsp";
		}else if(com.equals("/write_input.qt")){			
			action=new boardWriteInputAction();
			action.execute(request,response);
			viewPage="/listboard.qt";
		}else if(com.equals("/write_output.qt")){
			boolean write=new boardWriteOutputAction().execute2(request, response);
			if(write){
				action=new boardWriteOutputAction();
				action.execute(request,response);
				viewPage="/board2/write_adminOutput.jsp";
			}else{
				action=new boardWriteOutputAction();
				action.execute(request,response);				
				viewPage="/board2/write_output.jsp";
			}
		}else if(com.equals("/modify_pass.qt")){
			action=new boardModifyAction();			
			action.execute(request,response);
			viewPage="/board2/modify.jsp";			
		}else if(com.equals("/modify_output.qt")){
			action=new boardModifyOutputAction();			
			action.execute(request,response);
			viewPage="/listboard.qt";			
		}else if(com.equals("/delete_pass.qt")){
			action=new boardDeleteAction();			
			action.execute(request,response);
			viewPage="/listboard.qt";			
		}else if(com.equals("/reply_input.qt")){			
			boolean write=new boardWriteOutputAction().execute2(request, response);
			if(write){
				action=new replyInputAction();				
				action.execute(request,response);
				viewPage="/board2/write_adminOutput.jsp";			
			}else{
				action=new replyInputAction();				
				action.execute(request,response);			
				viewPage="/board2/write_output.jsp";
			}
		}else if(com.equals("/listboardSearch.qt")){			
			action=new boardSearchListAction();			
			action.execute(request,response);
			viewPage="/board2/listboardSearch.jsp";			
		}else if(com.equals("/replyDelete.qt")){
			boolean write=new boardWriteOutputAction().execute2(request, response);
			if(write){				
				action=new replyDeleteAction();			
				action.execute(request,response);				
				viewPage="/board2/write_adminOutput.jsp";			
			}else{				
				action=new replyDeleteAction();			
				action.execute(request,response);			
				viewPage="/board2/write_output.jsp";
			}
									
		}else if(com.equals("/file_down.qt")){
			boolean write=new boardWriteOutputAction().execute2(request, response);
			if(write){				
				action=new boardFileDownAction();			
				action.execute(request,response);				
				viewPage="/board2/write_adminOutput.jsp";			
			}else{				
				action=new boardFileDownAction();			
				action.execute(request,response);			
				viewPage="/board2/write_output.jsp";
			}					
		}
		
		
		
			
		RequestDispatcher dispatcher=request.getRequestDispatcher(viewPage);
		dispatcher.forward(request,response);
	}
	
	
	
	

}
