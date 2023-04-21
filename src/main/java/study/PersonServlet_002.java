package study;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class PersonServlet_002 extends HttpServlet{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String	encoding	= req.getCharacterEncoding();
		String	name		= null;
		
		if(encoding.toLowerCase().equals("utf-8")) {
			name	= req.getParameter("name");
		} else {
			name	= new String(req.getParameter("name").getBytes(encoding) , "utf-8");
		}

		int		age		= Integer.parseInt(req.getParameter("age"));
		String	gender	= req.getParameter("gender").equals("1") ? "남자" : "여자";
		
		resp.setContentType("text/html; charset=utf-8");
		PrintWriter out	= resp.getWriter();
		
		out.println("인코딩은 " + encoding + "입니다.<br>");
		out.println("당신의 이름은 " + name + "입니다.<br>");
		out.println("나이는 " + age + "이고<br>");
		out.println("성별은 " + gender + "입니다.<br>");
		
		String hobby[]	= req.getParameterValues("hobby");

		out.println("취미는 ");
		
		for(int i=0 ; i<hobby.length ; i++) {
			switch(hobby[i]) {
			case "1" : out.println("독서"); break;
			case "2" : out.println("등산"); break;
			case "3" : out.println("운동"); break;
			case "4" : out.println("게임"); break;
			}
		}

		out.println("입니다.<br>");
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doGet(req, resp);
	}
}
