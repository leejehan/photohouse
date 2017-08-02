package willbe.together.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import willbe.together.db.boardDAO;
import willbe.together.db.boardDTO;

public class boardModifyAction implements boardAction {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		String num=request.getParameter("num");
		HttpSession session=request.getSession();
		String id=(String) session.getAttribute("id");
		
		boardDAO dao=new boardDAO();
		boardDTO dto=dao.modifyInput(id, num);
		
		request.setAttribute("modi", dto);
	}	
}
