package handler.board;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import board.BoardDBBean;
import board.BoardDataBean;
import handler.CommandHandler;

public class ContentHandler implements CommandHandler {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		int		num		= Integer.parseInt(request.getParameter("num"));
		String	pageNum	= request.getParameter("pageNum");
		int		number	= Integer.parseInt(request.getParameter("number"));

		BoardDBBean		dao	= BoardDBBean.getInstance();

		// 여기서 addCount()를 하면 게시글 읽기 진입할 때 readcount를 올린다

		BoardDataBean	dto	= dao.getArticle(num);

		// 여기서 addCount()를 하면 게시글 읽고 나올 때 readcount를 올린다
		// 지금은 ip를 dto가 가지고 있기 때문에 여기서 readcount를 올리자
		if(!request.getRemoteAddr().equals(dto.getIp())) {
			dao.addCount(num);
		}
		
		request.setAttribute("pageNum", pageNum);
		request.setAttribute("number", number);
		request.setAttribute("dto", dto);

		return "/board/content.jsp";
	}

}
