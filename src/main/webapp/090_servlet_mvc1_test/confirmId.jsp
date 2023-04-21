<%@page import="logon.LogonDBBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="setting.jsp"%>
<link href="style_member.css" rel="stylesheet" type="text/css" >
<script src="script_member.js"></script>

<h2><%=page_confirm%></h2>

<%
String	id	= request.getParameter("id");
%>

<%
LogonDBBean	dao		= LogonDBBean.getInstance();
int			result	= dao.checkId(id);

if(result == 0) {
	%>
	<!-- 아이디가 없다 -->
	<table>
		<tr>
			<th style="width:300px"><%=id%><%=msg_id_x%></th>
		</tr>
		<tr>
			<th>
				<input class="inputbutton" type="button" value="<%=btn_ok%>"
						 onclick="setid('<%=id%>')">
			</th>
			
		</tr>
	</table>
	<%
} else {
	%>
	<!-- 아이디가 있다 -->
	<form method="post" action="confirmId.jsp" name="confirmform" onsubmit="return confirmcheck()">
		<table>
			<tr>
				<th colspan="2"><%=id%><%=msg_id_o%></th>
			</tr>
			<tr>
				<th><%=str_id%></th>
				<td><input class="input" type="text" name="id" maxlength="30" autofocus></td>
			</tr>
			<tr>
				<th colspan="2">
					<input class="inputbutton" type="submit" value="<%=btn_ok%>">
					<input class="inputbutton" type="button" value="<%=btn_ok_cancel%>"
							onclick="self.close()">
				</th>
			</tr>
		</table>
	</form>
	<%
}
%>

