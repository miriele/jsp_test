<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<%
String	id		= request.getParameter("id");
String	passwd	= request.getParameter("passwd");
String	tel		= request.getParameter("tel");
%>

<%
Connection	con 	= null;
Statement	stmt	= null;
ResultSet	rs		= null;

try {
	Class.forName("oracle.jdbc.driver.OracleDriver");
	
	String	url		= "jdbc:oracle:thin:@localhost:1521:xe";
	String	dbId	= "bit";
	String	dbPass	= "bit";
	String	sql 	= "update dbtest set passwd='"+passwd+"', tel='"+tel+"' where id='"+id+"'";
	
	con		= DriverManager.getConnection(url, dbId, dbPass);
	stmt	= con.createStatement();
	int	result	= stmt.executeUpdate(sql);
	
	if(result == 0) {
		// 업데이트 실패
		%>
		회원 정보 수정에 실패했습니다.<br>
		잠시 후 다시 시도하세요.<br>
		<meta http-equiv="refresh" content="2; url=updateTestForm.jsp">
		<%
	} else {
		// 업데이트 성공
		response.sendRedirect("selectTest.jsp?id="+id);
	}
} catch (SQLException e) {
	e.printStackTrace();
} finally {
	try {
		if(rs   != null)	rs.close();
		if(stmt != null)	stmt.close();
		if(con  != null)	con.close();
	} catch (SQLException e) {
		e.printStackTrace();
	}
}

%>