package handler.member;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import handler.CommandHandler;
import member.MemberDBBean;

public class ConfirmIdHandler implements CommandHandler {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String			id		= request.getParameter("id");
		MemberDBBean	dao		= MemberDBBean.getInstance();
		int				result	= dao.checkId(id);
		
		request.setAttribute("result", result);
		request.setAttribute("id", id);

		return "/member/confirmId.jsp";
	}

}
