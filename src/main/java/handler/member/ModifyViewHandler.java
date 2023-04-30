package handler.member;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import handler.CommandHandler;
import member.MemberDBBean;
import member.MemberDataBean;

public class ModifyViewHandler implements CommandHandler {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String			id		= (String)request.getSession().getAttribute("memId");
		String			passwd	= request.getParameter("passwd");
		MemberDBBean	dao		= MemberDBBean.getInstance();
		int				result	= dao.checkPasswd(id, passwd);
		
		request.setAttribute("result", result);
		
		if(result == 1) {
			// 비밀번호가 같다
			MemberDataBean	dto	= dao.getMember(id);
			
			request.setAttribute("dto", dto);
		}

		return "/member/modifyView.jsp";
	}

}
