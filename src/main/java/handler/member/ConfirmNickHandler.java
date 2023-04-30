package handler.member;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import handler.CommandHandler;
import member.MemberDBBean;

public class ConfirmNickHandler implements CommandHandler {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");

		String			nick	= request.getParameter("nick");
		String			form	= request.getParameter("form");
		MemberDBBean	dao		= MemberDBBean.getInstance();
		int				result	= dao.checkNick(nick);
		
		request.setAttribute("result", result);
		request.setAttribute("nick", nick);
		request.setAttribute("form", form);

		return "/member/confirmNick.jsp";
	}

}
