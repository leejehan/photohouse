package willbe.question.action;

import java.io.*;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import willbe.question.db.boardDAO;
import willbe.question.db.boardDTO;
import willbe.question.db.replyDAO;
import willbe.question.db.replyDTO;

public class boardFileDownAction implements boardAction {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		String num = request.getParameter("num"); 
		
		boardDAO dao=new boardDAO();		
		String filename=dao.fileDown(num);
		System.out.println("다운받을 파일명="+filename);
		File file = new File("C:\\Program Files\\Apache Software Foundation\\Tomcat 7.0\\webapps\\ROOT\\filestorage\\"+filename);
		
		byte b[] = new byte[(int)file.length()];
		
		response.setHeader("Content-Disposition", "attachment;filename=" + filename + ";"); 
        
		if (file.isFile())
		{
			BufferedInputStream fin = null;
			try {
				fin = new BufferedInputStream(new FileInputStream(file));
			} catch (FileNotFoundException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
			
			BufferedOutputStream outs = null;
			try {
				outs = new BufferedOutputStream(response.getOutputStream());
			} catch (IOException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}

			int read = 0;
			try {
				while ((read = fin.read(b)) != -1){
					outs.write(b,0,read);
				}
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			try {
				outs.close();
				fin.close();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} // 출력 스트림을 닫아 스트림에 관련된 모든 시스템 리소스를 해제한다.
					
		}
		
		//----------------------------------------------------------------
		HttpSession session=request.getSession();		
		String id=(String) session.getAttribute("id");
		
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
