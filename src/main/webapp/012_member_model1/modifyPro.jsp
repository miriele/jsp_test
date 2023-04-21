<%@page import="logon.LogonDBBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="setting.jsp"%>
<script src="script_member.js"></script>

<h2><%=page_modify%></h2>

<jsp:useBean id="dto" class="logon.LogonDataBean" />
	<jsp:setProperty name="dto" property="*" />
	<!-- passwd -->

<%
String	tel1	= request.getParameter("tel1");
String	tel2	= request.getParameter("tel2");
String	tel3	= request.getParameter("tel3");
String	tel		= null;

if(!tel1.equals("") && !tel2.equals("") && !tel3.equals("")) {
	tel = tel1 + "-" + tel2 + "-" + tel3;
}

dto.setTel(tel);
%>

<%
String	email1	= request.getParameter("email1");
String	email2	= request.getParameter("email2");
String	email	= null;

if(!email1.equals("") && !email2.equals("")) {
	email = email1 + "@" + email2;
}

dto.setEmail(email);
%>

<%
dto.setId((String)session.getAttribute("memId"));
%>

<%
LogonDBBean	dao		= LogonDBBean.getInstance();
int			result	= dao.modifyMember(dto);

if(result == 0) {
	// 수정 실패
	%>
	<script type="text/javascript">
		// <!--
		alert(modifyerror);
		// -->
	</script>
	<meta http-equiv="refresh" content="0; url=main.jsp">
	<%
} else {
	// 수정 성공
	response.sendRedirect("main.jsp");
}

%>
