package mvc;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class NullHandler implements CommandHandler {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// 3-1. 요청을 처리한다
		String	result	= "처리할 명령어가 없습니다";
		
		// 4. 처리 결과를 저장한다
		request.setAttribute("result", result);
		
		return "/016_mvc/null.jsp";
	}

}
