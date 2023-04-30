<%@page import="board.BoardDataBean"%>
<%@page import="board.BoardDBBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="setting_board.jsp"%>
<script src="<%=project%>script_board.js"></script>
<link rel="stylesheet" type="text/css" href="<%=project%>style_board.css">

<h2><%=page_modify %></h2>

<%
int	result	= (Integer)request.getAttribute("result");

if(result == 0) {
	// 비밀번호가 다르다
	%>
	<script type="text/javascript">
	// <!--
		erroralert(passerror);
	// -->
	</script>
	<%
} else {
	// 비밀번호가 같다
	int				num		= (Integer)request.getAttribute("num");
	String			pageNum	= (String)request.getAttribute("pageNum");
	BoardDataBean	dto		= (BoardDataBean)request.getAttribute("dto");
	%>
	<form method="post" action="board_modifypro.do" name="modifyform" onsubmit="return modifycheck()">
		<input type="hidden" name="num" 	value="<%=num%>">
		<input type="hidden" name="pageNum" value="<%=pageNum%>">
		<table>

			<tr>
				<th colspan="2"><%=msg_modify%></th>
			</tr>
			<tr>
				<th><%=str_writer%></th>
				<td><%=dto.getNick()%></td>
			</tr>
			<tr>
				<th><%=str_subject%></th>
				<td><input class="input" type="text" name="subject" maxlength="200" value="<%=dto.getSubject()%>"></td>
			</tr>
			<tr>
				<th><%=str_content%></th>
				<td><textarea name="content" rows="10" cols="40"><%=dto.getContent()%></textarea></td>
			</tr>
<%--
			<tr>
				<th><%=str_passwd%></th>
				<td><input class="input" type="password" name="passwd" value="<%=dto.getPasswd()%>"></td>
			</tr>
--%>
			<tr>
				<th colspan="2">
					<input class="inputbutton" type="submit" value="<%=btn_mod%>">
					<input class="inputbutton" type="reset"  value="<%=btn_cancel%>">
					<input class="inputbutton" type="button" value="<%=btn_mod_cancel%>"
							onclick="location='list.do?pageNum=<%=pageNum%>'">
				</th>
			</tr>
		</table>
	</form>
	<%
}
%>
