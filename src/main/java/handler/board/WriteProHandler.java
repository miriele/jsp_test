package handler.board;

import java.sql.Timestamp;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import board.BoardDBBean;
import board.BoardDataBean;
import handler.CommandHandler;

public class WriteProHandler implements CommandHandler {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");

		/*
		<!-- 입력 받은 데이터     : header, subject, content		-->
		<!-- 강제로 넘긴 데이터   : num, re_num, re_step, re_level	-->
		<!-- 강제로 넣을 데이터   : id, reg_date, ip				-->
		<!-- 사용하지 않는 데이터 : readcount, likeconunt, re_cnt	-->
		*/
		BoardDataBean	dto	= new BoardDataBean();
		
		dto.setHeader	(Integer.parseInt(request.getParameter("header")));
		dto.setSubject	(request.getParameter("subject"));
		dto.setContent	(request.getParameter("content"));

		dto.setNum		(Integer.parseInt(request.getParameter("num")));
		dto.setRe_num	(Integer.parseInt(request.getParameter("re_num")));
		dto.setRe_step	(Integer.parseInt(request.getParameter("re_step")));
		dto.setRe_level	(Integer.parseInt(request.getParameter("re_level")));

		dto.setId		((String)request.getSession().getAttribute("memId"));
		dto.setReg_date	(new Timestamp(System.currentTimeMillis()));
		dto.setIp		(request.getRemoteAddr());

		BoardDBBean	dao		= BoardDBBean.getInstance();
		int			result	= dao.insertArticle(dto);
		
		request.setAttribute("result", result);

		return "/board/writePro.jsp";
	}

}
