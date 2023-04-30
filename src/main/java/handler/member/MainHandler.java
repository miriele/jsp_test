package handler.member;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import handler.CommandHandler;
import member.MemberDBBean;

public class MainHandler implements CommandHandler {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String			id		= (String)request.getSession().getAttribute("memId");
		MemberDBBean	dao		= null;
		String			nick	= null;
		int				result	= 0;

		if(id == null) {
			// 로그인이 안 된 상태
		} else {
			// 로그인이 된 상태
			dao		= MemberDBBean.getInstance();
			nick	= dao.getNick(id);
			result	= 1;

			request.setAttribute("nick", nick);
		}

		request.setAttribute("result", result);

		return "/member/main.jsp";
	}

}
