package handler.board;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import handler.CommandHandler;

public class BoardModifyFormHandler implements CommandHandler {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {

		int	num		= Integer.parseInt(request.getParameter("num"));
		int	pageNum	= Integer.parseInt(request.getParameter("pageNum"));
		
		request.setAttribute("num", num);
		request.setAttribute("pageNum", pageNum);

		return "/018_board_model2/modifyForm.jsp";
	}

}
