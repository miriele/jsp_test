package mvc;

import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class DateHandler implements CommandHandler {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// 3-1. 요청을 처리한다
		Date	date	= new Date();
		
		// 4. 처리 결과를 저장한다
		request.setAttribute("result", date);
		
		return "/016_mvc/date.jsp";
	}

}
