package willbe.question.action;

import java.io.File;
import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import willbe.question.db.boardDAO;

public class boardModifyOutputAction implements boardAction {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {		
		String realFolder="";
		String encType="utf-8";

		String path="C:\\Program Files\\Apache Software Foundation\\Tomcat 7.0\\webapps\\ROOT\\filestorage";
		
		int size=10*1024*1024;		
		
		MultipartRequest multi = null;
		try {
			
			multi=new MultipartRequest(request,path,size,encType,new DefaultFileRenamePolicy());
						
			String userFile = multi.getFilesystemName("file");			
			String originFileName = multi.getOriginalFileName("userFile");			
			File file=multi.getFile("userFile");		
			
			String num=multi.getParameter("num");
			System.out.println("수정할 테이블 번호="+num);
			String title=multi.getParameter("title");			
			String contents=multi.getParameter("contents");			
			
			boardDAO dao=new boardDAO();
			dao.modify(num, title, contents, userFile);
			
		} catch (IOException e) {
			e.printStackTrace();
		}

	}

}
