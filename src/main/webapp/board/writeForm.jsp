<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="setting_board.jsp"%>
<script src="<%=project%>script_board.js"></script>
<link rel="stylesheet" type="text/css" href="<%=project%>style_board.css">

<h2><%=page_write%></h2>

<%
int	num			= (Integer)request.getAttribute("num");
int re_num		= (Integer)request.getAttribute("re_num");
int re_step		= (Integer)request.getAttribute("re_step");
int re_level	= (Integer)request.getAttribute("re_level");
%>

<!-- 입력 받은 데이터     : header, subject, content		-->
<!-- 강제로 넘긴 데이터   : num, re_num, re_step, re_level	-->


<form method="post" action="writepro.do" name="writeform" onsubmit="return writecheck()">
	<input type="hidden" name="num"      value="<%=num%>">
	<input type="hidden" name="re_num"	 value="<%=re_num%>">
	<input type="hidden" name="re_step"  value="<%=re_step%>">
	<input type="hidden" name="re_level" value="<%=re_level%>">
	<table>
		<tr>
			<th colspan="2" style="text-align:right">
				<a href="list.do"><%=str_list%></a>&nbsp;&nbsp;&nbsp;
			</th>
		</tr>
		<tr>
			<th><%=str_header%></th>
			<td>
				<select class="input" name="header">
					<option value="0">일반</option>
					<option value="1">공지</option>
					<option value="2">추천</option>
				</select>
			</td>
		</tr>
		<tr>
			<th><%=str_subject%></th>
			<td>
				<input class="input" type="text" name="subject" maxlength="200" autofocus>
			</td>
		</tr>
		<tr>
			<th><%=str_content%></th>
			<td>
				<textarea name="content" rows="10" cols="40"></textarea>
			</td>
		</tr>
		<tr>
			<th rowspan="2"><%=str_file%></th>
			<td><input class="inputfile" type="file" name="file1"></td>
		</tr>
		<tr>
			<td><input class="inputfile" type="file" name="file2"></td>
		</tr>
		<tr>
			<th colspan="2">
				<input class="inputbutton" type="submit" value="<%=btn_write%>">
				<input class="inputbutton" type="reset"  value="<%=btn_cancel%>">
				<input class="inputbutton" type="button" value="<%=btn_list%>"
						onclick="location='list.do'">
				
			</th>
		</tr>
	</table>
</form>
