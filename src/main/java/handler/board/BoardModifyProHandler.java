package handler.board;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import board.BoardDBBean;
import board.BoardDataBean;
import handler.CommandHandler;

public class BoardModifyProHandler implements CommandHandler {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
/*
		<!-- num subject content passwd -->
*/
		BoardDataBean	dto	= new BoardDataBean();
		BoardDBBean	dao		= BoardDBBean.getInstance();
		
		dto.setNum(Integer.parseInt(request.getParameter("num")));
		dto.setSubject(request.getParameter("subject"));
		dto.setContent(request.getParameter("content"));
//		dto.setPasswd (request.getParameter("passwd"));

		int		result	= dao.modifyArticle(dto);
		String	pageNum	= request.getParameter("pageNum");
		
		request.setAttribute("result", result);
		request.setAttribute("pageNum", pageNum);

//		return "/018_board_model2/modifyPro.jsp";
		return "/022_board_jstl/modifyPro.jsp";
	}

}
