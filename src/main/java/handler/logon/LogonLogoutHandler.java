package handler.logon;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import handler.CommandHandler;

public class LogonLogoutHandler implements CommandHandler {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.getSession().removeAttribute("memId");

		return "/017_member_model2/main.jsp";
	}

}