<%@page import="java.text.SimpleDateFormat"%>
<%@page import="board.BoardDataBean"%>
<%@page import="board.BoardDBBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="setting.jsp"%>
<script src="script_board.js"></script>
<link rel="stylesheet" type="text/css" href="style_board.css">

<h2><%=page_content%></h2>

<%
int		num		= Integer.parseInt(request.getParameter("num"));
String	pageNum	= request.getParameter("pageNum");
int		number	= Integer.parseInt(request.getParameter("number"));
%>

<%
BoardDBBean		dao	= BoardDBBean.getInstance();

// 여기서 addCount()를 하면 게시글 읽기 진입할 때 readcount를 올린다

BoardDataBean	dto	= dao.getArticle(num);

// 여기서 addCount()를 하면 게시글 읽고 나올 때 readcount를 올린다
// 지금은 ip를 dto가 가지고 있기 때문에 여기서 readcount를 올리자
if(!request.getRemoteAddr().equals(dto.getIp())) {
	dao.addCount(num);
}
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
					onclick="location='modifyForm.jsp?num=<%=dto.getNum()%>&pageNum=<%=pageNum%>'">
			<input class="inputbutton" type="button" value="<%=btn_delete%>"
					onclick="location='deleteForm.jsp?num=<%=dto.getNum()%>&pageNum=<%=pageNum%>'">
			<input class="inputbutton" type="button" value="<%=btn_reply%>"
					onclick="location='writeForm.jsp?num=<%=dto.getNum()%>&ref=<%=dto.getRef()%>&re_step=<%=dto.getRe_step()%>&re_level=<%=dto.getRe_level()%>'">
			<input class="inputbutton" type="button" value="<%=btn_list%>"
					onclick="location='list.jsp?pageNum=<%=pageNum%>'">
		</th>
	</tr>
</table>
