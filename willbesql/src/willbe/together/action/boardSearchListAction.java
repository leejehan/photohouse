package willbe.together.action;

import java.io.UnsupportedEncodingException;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import willbe.together.db.boardDAO;
import willbe.together.db.boardDTO;

public class boardSearchListAction implements boardAction {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		String currentPage = request.getParameter("currentPage");
		String title = (String) request.getParameter("title");
		try {
			title = new String(title.getBytes("8859_1"), "utf-8");
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		int startList = 1;
		int finalList = 1;

		boardDAO dao = new boardDAO();
		ArrayList<boardDTO> dtoList = dao.boardSearchList(title);
		boardDTO dto = dao.pageSearchList(title);

		if (currentPage == null) {
			startList = 0;
			finalList = (dto.getListSize() - 1);
		} else if (currentPage.equals("1")) {
			startList = 0;
			finalList = (dto.getListSize() - 1);
		} else {
			finalList = Integer.parseInt(currentPage) * dto.getListSize() - 1;
			startList = finalList - (dto.getListSize() - 1);
		}

		int fp,lp;		
		String firstPage=request.getParameter("fp");
		String lastPage=request.getParameter("lp");
		if(firstPage==null&&dto.getPageNum()<dto.getPageSize()){
			fp=1;
			lp=dto.getPageNum();
		}else if(firstPage==null&&dto.getPageNum()>dto.getPageSize()){
			fp=1;
			lp=dto.getPageSize();
		}
		else{
			fp=Integer.parseInt(firstPage);
			lp=Integer.parseInt(lastPage);
		}	
				
		boardDTO pg = new boardDTO(fp, lp);

		// 게시물 옆에 댓글 수 넣기
		/*
		 * replyDAO replyDao=new replyDAO(); ArrayList<replyDTO>
		 * replyDto=replyDao.replyCount(dto.getBoard_num())
		 */
		
		request.setAttribute("title", title);
		request.setAttribute("startNum", startList);
		request.setAttribute("finalNum", finalList);
		request.setAttribute("boardList", dtoList);
		request.setAttribute("page", dto);
		request.setAttribute("pg", pg);
	}

}
