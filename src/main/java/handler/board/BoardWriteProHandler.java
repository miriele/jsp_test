package handler.board;

import java.sql.Timestamp;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import board.BoardDBBean;
import board.BoardDataBean;
import handler.CommandHandler;

public class BoardWriteProHandler implements CommandHandler {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");

		/*
		<!-- 입력 받은 데이터     : writer, subject, content, passwd -->
		<!-- 강제로 넘긴 데이터   : num, ref, re_step, re_level      -->
		<!-- 강제로 넣을 데이터   : reg_date, ip                     -->
		<!-- 사용하지 않는 데이터 : readcount                        -->
		*/
		BoardDataBean	dto	= new BoardDataBean();
		
		dto.setWriter	(request.getParameter("writer"));
		dto.setSubject	(request.getParameter("subject"));
		dto.setContent	(request.getParameter("content"));
		dto.setPasswd	(request.getParameter("passwd"));
		dto.setNum		(Integer.parseInt(request.getParameter("num")));
		dto.setRef		(Integer.parseInt(request.getParameter("ref")));
		dto.setRe_step	(Integer.parseInt(request.getParameter("re_step")));
		dto.setRe_level	(Integer.parseInt(request.getParameter("re_level")));

		dto.setReg_date(new Timestamp(System.currentTimeMillis()));
		dto.setIp(request.getRemoteAddr());

		BoardDBBean	dao		= BoardDBBean.getInstance();
		int			result	= dao.insertArticle(dto);
		
		request.setAttribute("result", result);

		return "/018_board_model2/writePro.jsp";
	}

}
