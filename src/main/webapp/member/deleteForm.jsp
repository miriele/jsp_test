<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="setting_member.jsp"%>
<script src="<%=project%>script_member.js"></script>
<link href="<%=project%>style_member.css" rel="stylesheet" type="text/css" >

<h2><%=page_delete%></h2>

<form method="post" action="deletepro.do" name="passwdform" onsubmit="return passwdcheck()">
	<table>
		<tr>
			<th colspan="2"><%=msg_passwd%></th>
		</tr>
		<tr>
			<th><%=str_passwd%></th>
			<td><input class="input" type="password" name="passwd" maxlength="30" autofocus></td>
		</tr>
		<tr>
			<th colspan="2">
				<input class="inputbutton" type="submit" value="<%=btn_del%>">
				<input class="inputbutton" type="button" value="<%=btn_del_cancel%>"
						onclick="location='main.do'">
			</th>
		</tr>
	</table>
</form>