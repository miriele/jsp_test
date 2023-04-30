package handler.member;

import java.sql.Timestamp;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import handler.CommandHandler;
import member.MemberDBBean;
import member.MemberDataBean;

public class InputProHandler implements CommandHandler {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");

		MemberDataBean	dto	= new MemberDataBean();
		
		dto.setId(request.getParameter("id"));
		dto.setNick(request.getParameter("nick"));
//		dto.setDept(Integer.parseInt(request.getParameter("dept")));
		dto.setDept(0);	// 가입시 0, 관리자 메뉴에서 update 함
		dto.setPasswd(request.getParameter("passwd"));
		dto.setName(request.getParameter("name"));

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

		MemberDBBean	dao		= MemberDBBean.getInstance();
		int			result	= dao.insertMember(dto);
		
		request.setAttribute("result", result);

		return "/member/inputPro.jsp";
	}

}
