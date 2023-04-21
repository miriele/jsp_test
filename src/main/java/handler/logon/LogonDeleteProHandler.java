package handler.logon;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import handler.CommandHandler;
import logon.LogonDBBean;

public class LogonDeleteProHandler implements CommandHandler {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String		id			= (String)request.getSession().getAttribute("memId");
		String		passwd		= request.getParameter("passwd");
		LogonDBBean	dao			= LogonDBBean.getInstance();
		int			resultCheck	= dao.check(id, passwd);
		
		request.setAttribute("resultCheck", resultCheck);
		
		if(resultCheck == 1) {
			// 비밀번호가 같다
			int	result	= dao.deleteMember(id);
			
			request.setAttribute("result", result);
		}

		return "/017_member_model2/deletePro.jsp";
	}
}
