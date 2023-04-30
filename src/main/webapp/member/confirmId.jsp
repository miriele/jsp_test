<%@page import="member.MemberDBBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="setting_member.jsp"%>
<script src="<%=project%>script_member.js"></script>
<link href="<%=project%>style_member.css" rel="stylesheet" type="text/css" >

<h2><%=page_confirm%></h2>

<%
int		result	= (Integer)request.getAttribute("result");
String	id		= (String)request.getAttribute("id");

if(result == 0) {
	%>
	<!-- 아이디가 없다 -->
	<table>
		<tr>
			<th style="width:300px"><%=id%><%=msg_confirm_x%></th>
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
	<form method="post" action="confirmid.do" name="confirmform" onsubmit="return confirmidcheck()">
		<table>
			<tr>
				<th colspan="2"><%=id%><%=msg_confirm_o%></th>
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

