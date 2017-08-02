package willbe.together.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import willbe.together.db.boardDTO;

public class boardWriteAction implements boardAction {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {		
		HttpSession session=request.getSession();
		String id=(String) session.getAttribute("id");
		
		System.out.println("세션에서 받아온="+id);
		
		boardDTO dto=new boardDTO(id);		
		
		request.setAttribute("write_id", dto);
	}

}
