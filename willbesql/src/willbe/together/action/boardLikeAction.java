package willbe.together.action;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import willbe.together.db.boardDAO;
import willbe.together.db.boardDTO;
import willbe.together.db.replyDAO;
import willbe.together.db.replyDTO;

public class boardLikeAction implements boardAction {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {		
		HttpSession session=request.getSession();		
		String id=(String) session.getAttribute("id");
		
		String num=request.getParameter("num");			
		
		boardDAO dao=new boardDAO();
		dao.likeSearch(id, num);
		
		/*---------------------------------------------------------*/		
		boardDTO dto = dao.writeView(num);	
				
		replyDAO replyDao=new replyDAO();
		ArrayList<replyDTO> replyDto=replyDao.replylist(Integer.parseInt(num));
		int replyCount=replyDao.replyCount(Integer.parseInt(num));
				
		request.setAttribute("ConnectId", id);
		request.setAttribute("content_view", dto);
		request.setAttribute("replyDto", replyDto);
		request.setAttribute("replySize", replyCount);		
		
		
		
	}

}
