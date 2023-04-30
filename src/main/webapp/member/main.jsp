<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="setting_member.jsp"%>
<script src="<%=project%>script_member.js"></script>
<link href="<%=project%>style_member.css" rel="stylesheet" type="text/css" >

<h2><%=page_main%></h2>

<%
int	result	= (Integer)request.getAttribute("result");
%>

<%
if(result == 0) {
	// 로그인이 안 된 상태
	%>
	<form method="post" action="loginpro.do" name="mainform" onsubmit="return maincheck()">
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
							onclick="location='inputform.do'">
					<input class="inputbutton" type="button" value="<%=btn_board%>"
							onclick="location='list.do'">
				</th>
			</tr>
		</table>
	</form>
	<%
} else {
	// 로그인이 된 상태
	String	nick	= (String)request.getAttribute("nick");
	%>
	<table>
		<tr>
			<th style="width:400px">
			<%-- 
				<span><%=session.getAttribute("memId")%></span> <%=msg_greeting%>
			--%>
				<span><%=nick%></span> <%=msg_greeting%>
			</th>
		</tr>
		<tr>
			<td align="center">
				<input class="inputbutton" type="button" value="<%=btn_modify%>"
						onclick="location='modifyform.do'">
				<input class="inputbutton" type="button" value="<%=btn_delete%>"
						onclick="location='deleteform.do'">
				<input class="inputbutton" type="button" value="<%=btn_logout%>"
						onclick="location='logout.do'">
				<input class="inputbutton" type="button" value="<%=btn_board%>"
						onclick="location='list.do'">
			</td>
		</tr>
	</table>
	<%
}
%>