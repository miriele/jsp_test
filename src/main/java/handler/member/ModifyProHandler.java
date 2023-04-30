package handler.member;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import handler.CommandHandler;
import member.MemberDBBean;
import member.MemberDataBean;

public class ModifyProHandler implements CommandHandler {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");

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
	
		MemberDataBean	dto		= new MemberDataBean();

		dto.setNick(request.getParameter("nick"));
		dto.setPasswd(request.getParameter("passwd"));
		dto.setTel(tel);
		dto.setEmail(email);
		dto.setId((String)request.getSession().getAttribute("memId"));

		MemberDBBean	dao		= MemberDBBean.getInstance();
		int				result	= dao.modifyMember(dto);
		
		request.setAttribute("result", result);

		return "/member/modifyPro.jsp";
	}
}
