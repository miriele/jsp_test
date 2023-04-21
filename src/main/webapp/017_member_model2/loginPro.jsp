<%@page import="logon.LogonDBBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="setting.jsp"%>
<script src="<%=project%>script_member.js"></script>

<%
int		result	= (Integer)request.getAttribute("result");
String	id		= (String)request.getAttribute("id");


if(result == -1) {
	// 아이디가 없다
	%>
	<script type="text/javascript">
		// <!--
		erroralert(idxerror);
		// -->
	</script>
	<%
} else if(result == 0) {
	// 아이디가 있다 / 비밀번호가 다르다
	%>
	<script type="text/javascript">
		// <!--
		erroralert(passerror);
		// -->
	</script>
	<%
} else if(result == 1) {
	// 아이디가 있다 / 비밀번호가 같다
	session.setAttribute("memId", id);
	response.sendRedirect("logon_main.do");
} 
 
%>
