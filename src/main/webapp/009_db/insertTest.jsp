<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<h2>JDBC - insert - 처리 페이지</h2>

<%
request.setCharacterEncoding("utf-8");
%>

<%
String	id		= request.getParameter("id");
String	passwd	= request.getParameter("passwd");
String	name	= request.getParameter("name");
String	tel		= request.getParameter("tel");
%>

<%
Connection	con		= null;
Statement	stmt	= null;

try {
	Class.forName("oracle.jdbc.driver.OracleDriver");
	
	String	url		= "jdbc:oracle:thin:@localhost:1521:xe";
	String	dbId	= "bit";
	String	dbPass	= "bit";
	
	con		= DriverManager.getConnection(url, dbId, dbPass);
	stmt	= con.createStatement();
	
	String	sql		= "insert into dbtest values('"+id+"', '"+passwd+"', '"+name+"', '"+tel+"', sysdate)";
	int		result	= stmt.executeUpdate(sql);
	
	if(result == 0) {
		// 가입 실패
		%>
		회원가입에 실패했습니다.<br>
		잠시 후 다시 시도하세요.<br>
		<%
	} else {
		response.sendRedirect("selectTest.jsp");
	}
} catch(SQLException e) {
	e.printStackTrace();
} finally {
	try {
		if(con  != null)	con.close();
		if(stmt != null)	stmt.close();
	} catch(SQLException e) {
		e.printStackTrace();
	}
}
%>