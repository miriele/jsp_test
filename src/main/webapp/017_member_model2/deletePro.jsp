<%@page import="logon.LogonDBBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="setting.jsp"%>
<script src="<%=project%>script_member.js"></script>

<h2><%=page_delete%></h2>

<%
int	resultCheck	= (Integer)request.getAttribute("resultCheck");

if(resultCheck == 0) {
	// 비밀번호가 다르다
	%>
	<script type="text/javascript">
		// <!--
		erroralert(passerror);
		// -->
	</script>
	<%
} else {
	// 비밀번호가 같다
	int	result	= (Integer)request.getAttribute("result");
	
	if(result == 0) {
		// 탈퇴 실패
		%>
		<script type="text/javascript">
			// <!--
			erroralert(deleteerror);
			// -->
		</script>
		<meta http-equiv="refresh" content="0; url=logon_main.do">
		<%
	} else {
		// 탈퇴 성공
		session.removeAttribute("memId");
		response.sendRedirect("logon_main.do");
	}
}
%>