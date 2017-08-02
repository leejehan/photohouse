package willbe.together.action;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import willbe.together.db.boardDAO;
import willbe.together.db.replyDAO;
import willbe.together.db.replyDTO;

public class boardDeleteAction implements boardAction {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		String num=request.getParameter("num");
		HttpSession session=request.getSession();
		String id=(String) session.getAttribute("id");
				
		replyDAO replyDao=new replyDAO();		
		int replyCount=0;		
			
		replyCount=replyDao.replyCount(Integer.parseInt(num));
		if(replyCount>=1){		
			replyDao.replyAllDelete(num); // 댓글 갯수가 한개 이상 있으면 무결성 제약조건에 걸리므로 댓글부터 다 지우고 게시글 삭제			
		}
		boardDAO dao=new boardDAO();
		int likeCount=dao.likeCount(id, num);
		if(likeCount>=1){
			dao.likeAllDelete(num); //좋아요 무결성 제약조건이 걸리므로 해당 게시판에 좋아요가 걸린 좋아요 테이블 내용 삭제
		}
					
		dao.delete(num);
	}

}
