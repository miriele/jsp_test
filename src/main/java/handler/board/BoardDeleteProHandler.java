package handler.board;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import board.BoardDBBean;
import handler.CommandHandler;

public class BoardDeleteProHandler implements CommandHandler {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		int		num		= Integer.parseInt(request.getParameter("num"));
//		String	passwd	= request.getParameter("passwd");

		BoardDBBean	dao			= BoardDBBean.getInstance();
//		int			resultCheck	= dao.checkPasswd(num, passwd);

//		if(resultCheck == 1) {
			String	pageNum	= request.getParameter("pageNum");
			int		result	= dao.deleteArticle(num);

			request.setAttribute("result", result);
			request.setAttribute("pageNum", pageNum);
//		}
		
//		request.setAttribute("resultCheck", resultCheck);

		return "/board/deletePro.jsp";
	}

}
