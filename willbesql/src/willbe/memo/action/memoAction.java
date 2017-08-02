package willbe.memo.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public interface memoAction {
	void execute(HttpServletRequest request, HttpServletResponse response);
}
