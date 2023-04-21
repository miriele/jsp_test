<%@page import="java.text.SimpleDateFormat"%>
<%@page import="board.BoardDataBean"%>
<%@page import="board.BoardDBBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="setting.jsp"%>
<script src="<%=project%>script_board.js"></script>
<link rel="stylesheet" type="text/css" href="<%=project%>style_board.css">

<h2><%=page_content%></h2>

<%
String			pageNum	= (String)request.getAttribute("pageNum");
int				number	= (Integer)request.getAttribute("number");
BoardDataBean	dto		= (BoardDataBean)request.getAttribute("dto");
%>

<table>
	<tr>
		<th><%=str_num%></th>
		<td style="text-align:center"><%=number%></td>
		<th><%=str_readcount%></th>
		<td style="text-align:center"><%=dto.getReadcount()%></td>
	</tr>
	<tr>
		<th><%=str_writer%></th>
		<td style="text-align:center"><%=dto.getWriter()%></td>
		<th><%=str_reg_date%></th>
		<td style="text-align:center">
			<%
			SimpleDateFormat	sdf	= new SimpleDateFormat("yyyy-MM-dd HH:mm");
			%>
			<%=sdf.format(dto.getReg_date())%>
		</td>
	</tr>
	<tr>
		<th><%=str_subject%></th>
		<td colspan="3">&nbsp;<%=dto.getSubject()%></td>
	</tr>
	<tr>
		<th><%=str_content%></th>
		<td colspan="3"><pre><%=dto.getContent()%></pre></td>
	</tr>
	<tr>
		<th colspan="4">
			<input class="inputbutton" type="button" value="<%=btn_modify%>"
					onclick="location='board_modifyform.do?num=<%=dto.getNum()%>&pageNum=<%=pageNum%>'">
			<input class="inputbutton" type="button" value="<%=btn_delete%>"
					onclick="location='board_deleteform.do?num=<%=dto.getNum()%>&pageNum=<%=pageNum%>'">
			<input class="inputbutton" type="button" value="<%=btn_reply%>"
					onclick="location='board_writeform.do?num=<%=dto.getNum()%>&ref=<%=dto.getRef()%>&re_step=<%=dto.getRe_step()%>&re_level=<%=dto.getRe_level()%>'">
			<input class="inputbutton" type="button" value="<%=btn_list%>"
					onclick="location='board_list.do?pageNum=<%=pageNum%>'">
		</th>
	</tr>
</table>
