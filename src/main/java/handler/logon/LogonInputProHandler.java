package handler.logon;

import java.sql.Timestamp;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import handler.CommandHandler;
import logon.LogonDBBean;
import logon.LogonDataBean;

public class LogonInputProHandler implements CommandHandler {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");

		LogonDataBean	dto	= new LogonDataBean();
		
		dto.setId(request.getParameter("id"));
		dto.setPasswd(request.getParameter("passwd"));
		dto.setName(request.getParameter("name"));
		dto.setJumin1(request.getParameter("jumin1"));
		dto.setJumin2(request.getParameter("jumin2"));

		String	tel1	= request.getParameter("tel1");
		String	tel2	= request.getParameter("tel2");
		String	tel3	= request.getParameter("tel3");
		String	tel		= null;

		if(!tel1.equals("") && !tel2.equals("") && !tel3.equals("")) {
			tel = tel1 + "-" + tel2 + "-" + tel3;
		}

		dto.setTel(tel);

		String	email1	= request.getParameter("email1");
		String	email2	= request.getParameter("email2");
		String	email	= null;

		if(!email1.equals("")) {
			if(email2.equals("0")) {
				// 직접입력
				email	= email1;
			} else {
				// 선택입력
				email	= email1 + "@" + email2;
			}
		}

		dto.setEmail(email);

		dto.setReg_date(new Timestamp(System.currentTimeMillis()));

		LogonDBBean	dao		= LogonDBBean.getInstance();
		int			result	= dao.insertMember(dto);
		
		request.setAttribute("result", result);

		return "/017_member_model2/inputPro.jsp";
	}

}
