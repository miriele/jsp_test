package handler.logon;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import handler.CommandHandler;
import logon.LogonDBBean;
import logon.LogonDataBean;

public class LogonModifyProHandler implements CommandHandler {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String	tel1	= request.getParameter("tel1");
		String	tel2	= request.getParameter("tel2");
		String	tel3	= request.getParameter("tel3");
		String	tel		= null;

		String	email1	= request.getParameter("email1");
		String	email2	= request.getParameter("email2");
		String	email	= null;

		if(!tel1.equals("") && !tel2.equals("") && !tel3.equals("")) {
			tel = tel1 + "-" + tel2 + "-" + tel3;
		}

		if(!email1.equals("") && !email2.equals("")) {
			email = email1 + "@" + email2;
		}
	
		LogonDataBean	dto		= new LogonDataBean();

		dto.setPasswd(request.getParameter("passwd"));
		dto.setTel(tel);
		dto.setEmail(email);
		dto.setId((String)request.getSession().getAttribute("memId"));

		LogonDBBean		dao		= LogonDBBean.getInstance();
		int				result	= dao.modifyMember(dto);
		
		request.setAttribute("result", result);

		return "/017_member_model2/modifyPro.jsp";
	}
}
