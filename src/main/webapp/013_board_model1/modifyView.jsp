<%@page import="board.BoardDataBean"%>
<%@page import="board.BoardDBBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="setting.jsp"%>
<script src="script_board.js"></script>
<link rel="stylesheet" type="text/css" href="style_board.css">

<h2><%=page_modify %></h2>

<%
int		num		= Integer.parseInt(request.getParameter("num"));
String	pageNum	= request.getParameter("pageNum");
String	passwd	= request.getParameter("passwd");
%>

<%
BoardDBBean	dao		= BoardDBBean.getInstance();
int			result	= dao.checkPasswd(num, passwd);

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
	BoardDataBean	dto	= dao.getArticle(num);
	%>
	<form method="post" action="modifyPro.jsp" name="modifyform" onsubmit="return modifycheck()">
		<input type="hidden" name="num" 	value="<%=num%>">
		<input type="hidden" name="pageNum" value="<%=pageNum%>">
		<table>
			<tr>
				<th colspan="2"><%=msg_modify%></th>
			</tr>
			<tr>
				<th><%=str_writer%></th>
				<td><%=dto.getWriter()%></td>
			</tr>
			<tr>
				<th><%=str_subject%></th>
				<td><input class="input" type="text" name="subject" maxlength="200" value="<%=dto.getSubject()%>"></td>
			</tr>
			<tr>
				<th><%=str_content%></th>
				<td><textarea name="content" rows="10" cols="40"><%=dto.getContent()%></textarea></td>
			</tr>
			<tr>
				<th><%=str_passwd%></th>
				<td><input class="input" type="password" name="passwd" value="<%=dto.getPasswd()%>"></td>
			</tr>
			<tr>
				<th colspan="2">
					<input class="inputbutton" type="submit" value="<%=btn_mod%>">
					<input class="inputbutton" type="reset"  value="<%=btn_cancel%>">
					<input class="inputbutton" type="button" value="<%=btn_mod_cancel%>"
							onclick="location='list.jsp?pageNum=<%=pageNum%>'">
				</th>
			</tr>
		</table>
	</form>
	<%
}
%>
