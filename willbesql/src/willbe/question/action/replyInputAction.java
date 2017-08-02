package willbe.question.action;

import java.io.UnsupportedEncodingException;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import willbe.question.db.boardDAO;
import willbe.question.db.boardDTO;
import willbe.question.db.replyDAO;
import willbe.question.db.replyDTO;

public class replyInputAction implements boardAction {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response){
		
		String replyContents=request.getParameter("replyContents");
				
		HttpSession session=request.getSession();		
		String id=(String) session.getAttribute("id");		
		String boardNum=request.getParameter("num");
							
		replyDAO rDao=new replyDAO();
		rDao.inputReply(replyContents, id, boardNum);
		
		/*---------------------------------------------------------------------------------*/
				
		boardDAO dao = new boardDAO();
		boardDTO dto = dao.writeView(boardNum);	
				
		replyDAO replyDao=new replyDAO();
		ArrayList<replyDTO> replyDto=replyDao.replylist(Integer.parseInt(boardNum));
		int replyCount=replyDao.replyCount(Integer.parseInt(boardNum));
				
		request.setAttribute("ConnectId", id);
		request.setAttribute("content_view", dto);
		request.setAttribute("replyDto", replyDto);
		request.setAttribute("replySize", replyCount);			
	}

}
