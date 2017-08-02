package willbe.together.action;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import willbe.together.db.boardDAO;
import willbe.together.db.boardDTO;
import willbe.together.db.replyDAO;
import willbe.together.db.replyDTO;

public class replyDeleteAction implements boardAction {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		String replyNum=request.getParameter("replyNum");
		String boardNum=request.getParameter("num");
		HttpSession session=request.getSession();
		String id=(String) session.getAttribute("id");
		
		replyDAO rDao=new replyDAO();
		rDao.replyDelete(replyNum, id);
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
