<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="setting.jsp"%>
<script src="<%=project%>script_member.js"></script>
<link href="<%=project%>style_member.css" rel="stylesheet" type="text/css" >

<h2><%=page_main%></h2>

<%
if(session.getAttribute("memId") == null) {
	// 로그인이 안 된 상태
	%>
	<form method="post" action="logon_loginpro.do" name="mainform" onsubmit="return maincheck()">
		<table>
			<tr>
				<th colspan="2"><%=msg_main%></th>
			</tr>
			<tr>
				<th><%=str_id%></th>
				<td><input class="input" type="text" name="id" maxLength="30" autofocus></td>
			</tr>
			<tr>
				<th><%=str_passwd%></th>
				<td><input class="input" type="password" name="passwd" maxLength="30"></td>
			</tr>
			<tr>
				<th colspan="2">
					<input class="inputbutton" type="submit" value="<%=btn_login%>">
					<input class="inputbutton" type="reset"  value="<%=btn_cancel%>">
					<input class="inputbutton" type="button" value="<%=btn_input%>"
							onclick="location='logon_inputform.do'">
				</th>
			</tr>
		</table>
	</form>
	<%
} else {
	// 로그인이 된 상태
	%>
	<table>
		<tr>
			<th style="width:400px">
				<span><%=session.getAttribute("memId")%></span> <%=msg_greeting%>
			</th>
		</tr>
		<tr>
			<td align="center">
				<input class="inputbutton" type="button" value="<%=btn_modify%>"
						onclick="location='logon_modifyform.do'">
				<input class="inputbutton" type="button" value="<%=btn_delete%>"
						onclick="location='logon_deleteform.do'">
				<input class="inputbutton" type="button" value="<%=btn_logout%>"
						onclick="location='logon_logout.do'">
			</td>
		</tr>
	</table>
	<%
}
%>