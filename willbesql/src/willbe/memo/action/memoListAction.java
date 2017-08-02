package willbe.memo.action;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import willbe.memo.db.memoDAO;
import willbe.memo.db.memoDTO;

public class memoListAction implements memoAction {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		HttpSession session = request.getSession();
		String id=(String) session.getAttribute("id");
			
		memoDAO dao=new memoDAO();
		ArrayList<memoDTO> dtoList=dao.memoList(id);
		int Count=(dao.countList(id))+1;		
		
		
		
		request.setAttribute("memoList", dtoList);
		request.setAttribute("cnt", Count);
	}

}
