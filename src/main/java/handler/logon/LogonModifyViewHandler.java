package handler.logon;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import handler.CommandHandler;
import logon.LogonDBBean;
import logon.LogonDataBean;

public class LogonModifyViewHandler implements CommandHandler {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String		id		= (String)request.getSession().getAttribute("memId");
		String		passwd	= request.getParameter("passwd");
		LogonDBBean	dao		= LogonDBBean.getInstance();
		int			result	= dao.check(id, passwd);
		
		request.setAttribute("result", result);
		
		if(result == 1) {
			// 비밀번호가 같다
			LogonDataBean	dto	= dao.getMember(id);
			
			request.setAttribute("dto", dto);
		}

		return "/017_member_model2/modifyView.jsp";
	}

}
