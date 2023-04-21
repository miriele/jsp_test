package handler.logon;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import handler.CommandHandler;
import logon.LogonDBBean;

public class LogonConfirmIdHandler implements CommandHandler {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String		id		= request.getParameter("id");
		LogonDBBean	dao		= LogonDBBean.getInstance();
		int			result	= dao.checkId(id);
		
		request.setAttribute("result", result);
		request.setAttribute("id", id);

		return "/017_member_model2/confirmId.jsp";
	}

}
