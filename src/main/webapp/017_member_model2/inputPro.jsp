<%@page import="logon.LogonDBBean"%>
<%@page import="java.sql.Timestamp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="setting.jsp"%>
<script src="<%=project%>script_member.js"></script>

<h2><%=page_input%></h2>

<%
int	result	= (Integer)request.getAttribute("result");

if(result == 0) {
	// 가입 실패
	%>
	<script type="text/javascript">
	// <!--
	erroralert(inputerror);
	// -->
	</script>
	<%
} else {
	// 가입 성공
	response.sendRedirect("logon_loginform.do");
}
%>
















