<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="setting.jsp"%>
<script src="<%=project%>script_member.js"></script>
<link href="<%=project%>style_member.css" rel="stylesheet" type="text/css" >

<h2><%=page_login%></h2>

<form method="post" action="logon_loginpro.do" name="mainform" onsubmit="return maincheck()">
	<table>
		<tr>
			<th colspan="2"><%=msg_login%></th>
		</tr>
		<tr>
			<th><%=str_id%></th>
			<td><input class="input" type="text" name="id" maxlength="30" autofocus></td>
		</tr>
		<tr>
			<th><%=str_passwd%></th>
			<td><input class="input" type="password" name="passwd" maxlength="30"></td>
		</tr>
		<tr>
			<th colspan="2">
				<input class="inputbutton" type="submit" value="<%=btn_login%>">
				<input class="inputbutton" type="reset"  value="<%=btn_cancel%>">
			</th>
		</tr>
	</table>
</form>