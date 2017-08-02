package willbe.question.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import willbe.question.db.boardDTO;

public class boardWriteAction implements boardAction {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {		
		HttpSession session=request.getSession();
		String id=(String) session.getAttribute("id");
		
		boardDTO dto=new boardDTO(id);		
		
		request.setAttribute("write_id", dto);
	}

}
