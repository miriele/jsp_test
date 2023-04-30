package handler.board;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import handler.CommandHandler;

public class BoardDeleteFormHandler implements CommandHandler {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setAttribute("num", Integer.parseInt(request.getParameter("num")));
		request.setAttribute("pageNum", Integer.parseInt(request.getParameter("pageNum")));

//		return "/018_board_model2/deleteForm.jsp";
		return "/022_board_jstl/deleteForm.jsp";
	}

}
