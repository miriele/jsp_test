<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="setting.jsp"%>
<script src="script_board.js"></script>
<link rel="stylesheet" type="text/css" href="style_board.css">

<%
int	num		= Integer.parseInt(request.getParameter("num"));
int	pageNum	= Integer.parseInt(request.getParameter("pageNum"));

%>

<h2><%=page_delete%></h2>

<form method="post" action="deletePro.jsp" name="deleteform" onsubmit="return passwdcheck()">
	<input type="hidden" name="num" value="<%=num%>">
	<input type="hidden" name="pageNum" value="<%=pageNum%>">
	<table>
		<tr>
			<th colspan="2"><%=msg_passwd%></th>
		</tr>
		<tr>
			<th><%=str_passwd%></th>
			<td>
				<input class="input" type="password" name="passwd" maxlength="50" autofocus>
			</td>
		</tr>
		<tr>
			<th colspan="2">
				<input class="inputbutton" type="submit" value="<%=btn_del%>">
				<input class="inputbutton" type="button" value="<%=btn_del_cancel%>"
						onclick="location='list.jsp?pageNum=<%=pageNum%>'">
			</th>
		</tr>
	</table>

</form>


