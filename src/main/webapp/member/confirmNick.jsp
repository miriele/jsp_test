<%@page import="member.MemberDBBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="setting_member.jsp"%>
<script src="<%=project%>script_member.js"></script>
<link href="<%=project%>style_member.css" rel="stylesheet" type="text/css" >

<h2><%=page_confirm%></h2>

<%
int		result		= (Integer)request.getAttribute("result");
String	nick		= (String)request.getAttribute("nick");
String	formName	= (String)request.getAttribute("form");

if(result == 0) {
	%>
	<!-- 닉네임이 없다 -->
	<table>
		<tr>
			<th style="width:300px"><%=nick%><%=msg_confirm_x%></th>
		</tr>
		<tr>
			<th>
				<input class="inputbutton" type="button" value="<%=btn_ok%>"
						 onclick="setnick('<%=formName%>','<%=nick%>')">
			</th>
			
		</tr>
	</table>
	<%
} else {
	%>
	<!-- 닉네임이 있다 -->
	<form method="post" action="confirmnick.do" name="confirmformnick" onsubmit="return confirmnickcheck()">
		<input type="hidden" name="form" value="<%=formName%>">
		<table>
			<tr>
				<th colspan="2"><%=nick%><%=msg_confirm_o%></th>
			</tr>
			<tr>
				<th><%=str_nick%></th>
				<td><input class="input" type="text" name="nick" maxlength="30" autofocus></td>
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

