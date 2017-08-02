package willbe.question.action;

import java.io.File;
import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import willbe.question.db.boardDAO;

public class boardWriteInputAction implements boardAction {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		String realFolder="";
		String encType="utf-8";

		String path="C:\\Program Files\\Apache Software Foundation\\Tomcat 7.0\\webapps\\ROOT\\filestorage";
		
		int size=10*1024*1024;
		
		MultipartRequest multi = null;
		try {
			
			multi=new MultipartRequest(request,path,size,encType,new DefaultFileRenamePolicy());
						
			String userFile = multi.getFilesystemName("userFile");
			String originFileName = multi.getOriginalFileName("userFile");
			File file=multi.getFile("userFile");

			String id=multi.getParameter("id");  
			String title=multi.getParameter("title");
			String contents=multi.getParameter("contents");		
			
			boardDAO dao=new boardDAO();
			dao.write(id, title, contents, userFile);
			
		} catch (IOException e) {			
			e.printStackTrace();
		}

	}

}
