package handler.member;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import handler.CommandHandler;
import member.MemberDBBean;

public class LoginProHandler implements CommandHandler {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String		id		= request.getParameter("id");
		String		passwd	= request.getParameter("passwd");
		MemberDBBean	dao		= MemberDBBean.getInstance();
		int			result	= dao.checkPasswd(id, passwd);
		
		request.setAttribute("result", result);
		request.setAttribute("id", id);

		return "/member/loginPro.jsp";
	}

}
