package willbe.memo.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import willbe.memo.db.memoDAO;

public class memoModifyAction implements memoAction {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		HttpSession session = request.getSession();
		String id=(String) session.getAttribute("id");		
		String contents=request.getParameter("memo");
		String num=request.getParameter("memoNum");
		
		
		memoDAO dao=new memoDAO();
		dao.memoModify(id, contents, num);	

	}

}
