package willbe.together.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import willbe.together.action.*;



/**
 * Servlet implementation class boardFrontController
 */
@WebServlet("*.sw")
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
				
		if(com.equals("/listboard.sw")){			
			action=new boardListAction();			
			action.execute(request,response);
			viewPage="/board1/listboard.jsp";
		}else if(com.equals("/write.sw")){
			action=new boardWriteAction();
			action.execute(request,response);
			viewPage="/board1/write.jsp";
		}else if(com.equals("/write_input.sw")){			
			action=new boardWriteInputAction();
			action.execute(request,response);
			viewPage="/listboard.sw";
		}else if(com.equals("/write_output.sw")){
			boolean write=new boardWriteOutputAction().execute1(request, response);
			if(write){
				action=new boardWriteOutputAction();
				action.execute(request,response);
				viewPage="/board1/write_idEqualoutput.jsp";
			}else{
				action=new boardWriteOutputAction();
				action.execute(request,response);				
				viewPage="/board1/write_output.jsp";
			}
		}else if(com.equals("/modify_pass.sw")){
			action=new boardModifyAction();			
			action.execute(request,response);
			viewPage="/board1/modify.jsp";			
		}else if(com.equals("/modify_output.sw")){
			action=new boardModifyOutputAction();			
			action.execute(request,response);
			viewPage="/listboard.sw";			
		}else if(com.equals("/delete_pass.sw")){
			action=new boardDeleteAction();			
			action.execute(request,response);
			viewPage="/listboard.sw";			
		}else if(com.equals("/reply_input.sw")){
			boolean write=new boardWriteOutputAction().execute1(request, response);
			if(write){
				action=new replyInputAction();				
				action.execute(request,response);
				viewPage="/board1/write_idEqualoutput.jsp";			
			}else{
				action=new replyInputAction();				
				action.execute(request,response);			
				viewPage="/board1/write_output.jsp";
			}
		}else if(com.equals("/listboardSearch.sw")){			
			action=new boardSearchListAction();			
			action.execute(request,response);
			viewPage="/board1/listboardSearch.jsp";			
		}else if(com.equals("/replyDelete.sw")){
			boolean write=new boardWriteOutputAction().execute1(request, response);
			if(write){				
				action=new replyDeleteAction();			
				action.execute(request,response);				
				viewPage="/board1/write_idEqualoutput.jsp";			
			}else{				
				action=new replyDeleteAction();			
				action.execute(request,response);			
				viewPage="/board1/write_output.jsp";
			}
									
		}else if(com.equals("/like.sw")){
			boolean write=new boardWriteOutputAction().execute1(request, response);
			if(write){				
				action=new boardLikeAction();			
				action.execute(request,response);				
				viewPage="/board1/write_idEqualoutput.jsp";			
			}else{				
				action=new boardLikeAction();			
				action.execute(request,response);			
				viewPage="/board1/write_output.jsp";
			}					
		}else if(com.equals("/file_down.sw")){
			boolean write=new boardWriteOutputAction().execute1(request, response);
			if(write){				
				action=new boardFileDownAction();			
				action.execute(request,response);				
				viewPage="/board1/write_idEqualoutput.jsp";			
			}else{				
				action=new boardFileDownAction();			
				action.execute(request,response);			
				viewPage="/board1/write_output.jsp";
			}					
		}
		
		
		
			
		RequestDispatcher dispatcher=request.getRequestDispatcher(viewPage);
		dispatcher.forward(request,response);
	}
	
	
	
	

}
