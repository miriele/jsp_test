<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="setting.jsp"%>
<script src="<%=project%>script_board.js"></script>
<link rel="stylesheet" type="text/css" href="<%=project%>style_board.css">

<h2><%=page_write%></h2>

<%
int	num			= (Integer)request.getAttribute("num");
int ref			= (Integer)request.getAttribute("ref");
int re_step		= (Integer)request.getAttribute("re_step");
int re_level	= (Integer)request.getAttribute("re_level");
%>

<form method="post" action="board_writepro.do" name="writeform" onsubmit="return writecheck()">
	<input type="hidden" name="num"      value="<%=num%>">
	<input type="hidden" name="ref"      value="<%=ref%>">
	<input type="hidden" name="re_step"  value="<%=re_step%>">
	<input type="hidden" name="re_level" value="<%=re_level%>">
	<table>
		<tr>
			<th colspan="2" style="text-align:right">
				<a href="board_list.do"><%=str_list%></a>&nbsp;&nbsp;&nbsp;
			</th>
		</tr>
		<tr>
			<th><%=str_writer%></th>
			<td>
				<input class="input" type="text" name="writer" maxlength="50" autofocus>
			</td>
		</tr>
		<tr>
			<th><%=str_subject%></th>
			<td>
				<input class="input" type="text" name="subject" maxlength="200">
			</td>
		</tr>
		<tr>
			<th><%=str_content%></th>
			<td>
				<textarea name="content" rows="10" cols="40"></textarea>
			</td>
		</tr>
		<tr>
			<th><%=str_passwd%></th>
			<td>
				<input class="input" type="password" name="passwd" maxlength="50">
			</td>
		</tr>
		<tr>
			<th colspan="2">
				<input class="inputbutton" type="submit" value="<%=btn_write%>">
				<input class="inputbutton" type="reset"  value="<%=btn_cancel%>">
				<input class="inputbutton" type="button" value="<%=btn_list%>"
						onclick="location='board_list.do'">
				
			</th>
		</tr>
	</table>
</form>
