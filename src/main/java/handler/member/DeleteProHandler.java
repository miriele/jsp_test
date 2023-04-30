package handler.member;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import handler.CommandHandler;
import member.MemberDBBean;

public class DeleteProHandler implements CommandHandler {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String		id			= (String)request.getSession().getAttribute("memId");
		String		passwd		= request.getParameter("passwd");
		MemberDBBean	dao			= MemberDBBean.getInstance();
		int			resultCheck	= dao.checkPasswd(id, passwd);
		
		request.setAttribute("resultCheck", resultCheck);
		
		if(resultCheck == 1) {
			// 비밀번호가 같다
			int	result	= dao.deleteMember(id);
			
			request.setAttribute("result", result);
		}

		return "/member/deletePro.jsp";
	}
}
