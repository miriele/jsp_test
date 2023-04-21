<%@page import="logon.LogonDBBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="setting.jsp"%>
<script src="script_member.js"></script>

<h2><%=page_delete%></h2>

<%
String	id		= (String)session.getAttribute("memId");
String	passwd	= request.getParameter("passwd");
%>

<%
LogonDBBean	dao		= LogonDBBean.getInstance();
int			result	= dao.check(id, passwd);

if(result == 0) {
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
	result	= dao.deleteMember(id);
	
	if(result == 0) {
		// 탈퇴 실패
		%>
		<script type="text/javascript">
			// <!--
			erroralert(deleteerror);
			// -->
		</script>
		<meta http-equiv="refresh" content="0; url=main.jsp">
		<%
	} else {
		// 탈퇴 성공
		session.removeAttribute("memId");
		response.sendRedirect("main.jsp");
	}
}
%>