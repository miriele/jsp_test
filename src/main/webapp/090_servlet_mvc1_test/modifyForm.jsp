<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="setting.jsp"%>
<link href="style_member.css" rel="stylesheet" type="text/css" >
<script src="script_member.js"></script>

<h2><%=page_modify%></h2>

<form method="post" action="modifyView.jsp" name="passwdform" onsubmit="return passwdcheck()">
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
				<input class="inputbutton" type="submit" value="<%=btn_mod%>">
				<input class="inputbutton" type="button" value="<%=btn_mod_cancel%>"
						onclick="location='main.jsp'">
			</th>
		</tr>
	</table>
</form>