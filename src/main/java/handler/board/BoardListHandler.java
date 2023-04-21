package handler.board;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import board.BoardDBBean;
import board.BoardDataBean;
import handler.CommandHandler;

public class BoardListHandler implements CommandHandler {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		int		pageSize	= 5;		// 한 페잉지에 출력할 글의 개수
		int		start		= 0;		// 페이지의 첫 글
		int		end			= 0;		// 페이지의 마지막 글
		String	pageNum		= null;		// 현재 페이지
		int		currentPage	= 0;		// 계산용 현재 페이지 - 임시
		int		number		= 0;		// 출력용 글번호 - 게시판에 표시되는 번호
		int		pageBlock	= 3;		// 한 번에 출력할 페이지 번호 개수
		int		startPage	= 0;		// 출력할 페이지 시작 번호
		int		endPage		= 0;		// 출력할 페이지 끝 번호
		int		pageCount	= 0;		// 전체 페이지 개수 - 페이지 블록에서

		BoardDBBean	dao		= BoardDBBean.getInstance();
		int			count	= dao.getCount();

		pageNum		= request.getParameter("pageNum");

		if(pageNum==null) {
			pageNum	= "1";
		}

		currentPage	= Integer.parseInt(pageNum);
		start		= (currentPage - 1) * pageSize + 1;		// (5 - 1) * 10 + 1		= 41
		end			= start + pageSize - 1;					// 40 + 10 - 1			= 49

		if(count < end) {
			end = count;
		}

		number	= count - (currentPage - 1) * pageSize;		// 50 - (2 - 1) * 10	= 40

		// 페이지 처리
		pageCount	= (count / pageSize) + (count % pageSize > 0 ? 1 : 0);
		startPage	= (currentPage / pageBlock) * pageBlock + 1;			// ( 5 / 10) * 10 + 1	= 1
																			// (15 / 10) * 10 + 1	= 11

		if(currentPage % pageBlock == 0) {
			startPage -= pageBlock;
		}

		endPage		= startPage + pageBlock - 1;							// 11 + 10 - 1			= 20

		if(pageCount < endPage) {
			endPage	= pageCount;
		}

		if(count != 0) {
			// 글이 있는 경우
			ArrayList<BoardDataBean> dtos	= dao.getArticles(start, end);
			request.setAttribute("dtos", dtos);
		}

		request.setAttribute("count", count);
		request.setAttribute("pageNum", pageNum);
		request.setAttribute("currentPage", currentPage);
		request.setAttribute("number", number);
		request.setAttribute("pageBlock", pageBlock);
		request.setAttribute("startPage", startPage);
		request.setAttribute("endPage", endPage);
		request.setAttribute("pageCount",pageCount);

		return "/018_board_model2/list.jsp";
	}

}
