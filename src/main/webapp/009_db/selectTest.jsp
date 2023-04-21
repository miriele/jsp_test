<%@page import="javax.sql.DataSource"%>
<%@page import="javax.naming.InitialContext"%>
<%@page import="javax.naming.Context"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<h2>JDBC - select - 처리 페이지</h2>

<%
	String	id	= request.getParameter("id");
%>
select information where id : <%=id%><br>
<br>

<%
Connection	con		= null;
Statement	stmt	= null;
ResultSet	rs		= null;

try {
	/*
	// DriverManger 사용할 때 Connection 사용
	Class.forName("oracle.jdbc.driver.OracleDriver");
	
	String	url		= "jdbc:oracle:thin:@localhost:1521:xe";
	String	dbId	= "bit";
	String	dbPass	= "bit";
	
	con	= DriverManager.getConnection(url, dbId, dbPass);
	*/
	
	// DataSourse 사용할 때 Connection 사용
	// META-INF > context.xml 만들어서 정보 저장
	Context		initCtx	= new InitialContext();
	Context		envCtx	= (Context)initCtx.lookup("java:comp:/env");
	DataSource	ds		= (DataSource)envCtx.lookup("jdbc/bit");
	con	= ds.getConnection();
	
	%>

	DB 연결 성공<br>
	<br>

	<%
	//String	sql		= "select * from dbtest";
	String		sql		= null;
	
	if(id == null || id.equals("")) {
		sql = "select * from dbtest";
	} else {
		sql = "select * from dbtest where id='" + id + "'";
	}
	
	stmt	= con.createStatement();

	// excuteQuery  : select 할 때 사용
	// excuteUpdate : insert, update, delete 할 때 사용
	//				: db가 바뀌면 excute
	rs		= stmt.executeQuery(sql);
	
	%>
	<table border="1">
		<tr>
			<th>ID</th>
			<th>PASSWD</th>
			<th>NAME</th>
			<th>TEL</th>
			<th>LOGTIME</th>
		</tr>
	<%
	while(rs.next()) {
		%>
		<tr>
			<td><%=rs.getString("id")%></td>
			<td><%=rs.getString("passwd")%></td>
			<td><%=rs.getString("name")%></td>
			<td><%=rs.getString("tel")%></td>
			<td><%=rs.getTimestamp("logtime")%></td>
		</tr>
		<%
	}
	%>
	</table>
	<%
} catch(SQLException e) {
	e.printStackTrace();
} finally {
	try {
		if(rs   != null)	rs.close();
		if(stmt != null)	stmt.close();
		if(con  != null)	con.close();
	} catch(SQLException e) {
		e.printStackTrace();
	}
}
%>
