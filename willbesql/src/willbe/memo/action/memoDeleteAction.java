package willbe.memo.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import willbe.memo.db.memoDAO;

public class memoDeleteAction implements memoAction {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		String num=request.getParameter("memoNum");
		System.out.println("삭제하려는 메모번호="+num);
		
		
		memoDAO dao=new memoDAO();
		dao.deleteMemo(num);

	}

}
