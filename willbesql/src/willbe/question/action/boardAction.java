package willbe.question.action;

import java.io.UnsupportedEncodingException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public interface boardAction {
	void execute(HttpServletRequest request, HttpServletResponse response);
}
