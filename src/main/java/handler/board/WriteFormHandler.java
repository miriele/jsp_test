package handler.board;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import handler.CommandHandler;

public class WriteFormHandler implements CommandHandler {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {

		int	num			= 0;	// 임시로 사용하는 중 : 0 - 제목글 / != 0 - 답변글
		int re_num		= 1;
		int re_step		= 0;
		int re_level	= 0;

		if(request.getParameter("num") != null) {
			// 답변글
			num			= Integer.parseInt(request.getParameter("num"));
			re_num		= Integer.parseInt(request.getParameter("re_num"));
			re_step		= Integer.parseInt(request.getParameter("re_step"));
			re_level	= Integer.parseInt(request.getParameter("re_level"));
		}

		request.setAttribute("num", num);
		request.setAttribute("re_num", re_num);
		request.setAttribute("re_step", re_step);
		request.setAttribute("re_level", re_level);

		return "/board/writeForm.jsp";
	}

}
