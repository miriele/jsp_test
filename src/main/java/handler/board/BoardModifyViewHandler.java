package handler.board;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import board.BoardDBBean;
import board.BoardDataBean;
import handler.CommandHandler;

public class BoardModifyViewHandler implements CommandHandler {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {

		int		num		= Integer.parseInt(request.getParameter("num"));
//		String	passwd	= request.getParameter("passwd");

		BoardDBBean	dao		= BoardDBBean.getInstance();
//		int			result	= dao.checkPasswd(num, passwd);
		
//		if(result == 1) {
			String			pageNum	= request.getParameter("pageNum");
			BoardDataBean	dto		= dao.getArticle(num);
			
			request.setAttribute("num", num);
			request.setAttribute("pageNum", pageNum);
			request.setAttribute("dto", dto);
//		}
		
//		request.setAttribute("result", result);

//		return "/018_board_model2/modifyView.jsp";
		return "/022_board_jstl/modifyView.jsp";
	}

}
