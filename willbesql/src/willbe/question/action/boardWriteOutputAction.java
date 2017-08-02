package willbe.question.action;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import willbe.question.db.boardDAO;
import willbe.question.db.boardDTO;
import willbe.question.db.replyDAO;
import willbe.question.db.replyDTO;

public class boardWriteOutputAction implements boardAction {
	
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		String num = request.getParameter("num");
		HttpSession session=request.getSession();
		String id=(String) session.getAttribute("id");
		String board_num=request.getParameter("boardNum");		
		
		
		boardDAO dao = new boardDAO();
		boardDTO dto = dao.writeView(num);	
		
		replyDAO replyDao=new replyDAO();
		ArrayList<replyDTO> replyDto=null;
		int replyCount=0;
		if(board_num==null){		
			replyDto=replyDao.replylist(dto.getBoard_num());
			replyCount=replyDao.replyCount(dto.getBoard_num());
		}else{		
			replyDto=replyDao.replylist(Integer.parseInt(board_num));
			replyCount=replyDao.replyCount(Integer.parseInt(board_num));
		}
				
		request.setAttribute("ConnectId", id);
		request.setAttribute("content_view", dto);
		request.setAttribute("replyDto", replyDto);
		request.setAttribute("replySize", replyCount);
	}
	public boolean execute1(HttpServletRequest request, HttpServletResponse response) {
		boolean write=false;
		
		HttpSession session=request.getSession();		
		String id=(String) session.getAttribute("id");
		String num=request.getParameter("num");
				
		boardDAO dao=new boardDAO();
		write=dao.idCheck(id, num);		
		
		return write;
	}
	public boolean execute2(HttpServletRequest request, HttpServletResponse response) {
		boolean write=false;
		
		HttpSession session=request.getSession();		
		String id=(String) session.getAttribute("id");
		String num=request.getParameter("num");
		
		if(id.equals("admin")){
			write=true;
		}else{
			boardDAO dao=new boardDAO();
			write=dao.idCheck(id, num);						
		}			
		
		return write;
	}

}
