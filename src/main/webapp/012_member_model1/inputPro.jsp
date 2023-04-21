<%@page import="logon.LogonDBBean"%>
<%@page import="java.sql.Timestamp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="setting.jsp"%>
<script src="script_member.js"></script>

<h2><%=page_input%></h2>
<%
request.setCharacterEncoding("utf-8");
%>

<jsp:useBean id="dto" class="logon.LogonDataBean" />
	<jsp:setProperty name="dto" property="*"/>
	<!-- id / passwd / name / jumin1 / jumin2 -->

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
%>

<%
dto.setReg_date(new Timestamp(System.currentTimeMillis()));
%>

<%
LogonDBBean	dao	= LogonDBBean.getInstance();

int	result	= dao.insertMember(dto);

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
	response.sendRedirect("loginForm.jsp");
}
%>
















