<%@page import="java.text.SimpleDateFormat"%>
<%@page import="board.BoardDataBean"%>
<%@page import="java.util.ArrayList"%>
<%@page import="board.BoardDBBean"%>
<%@page language="java" contentType="text/html; charset=UTF-8"
   		pageEncoding="UTF-8"%>

<%@ include file="setting.jsp"%>
<script src="<%=project%>script_board.js"></script>
<link rel="stylesheet" type="text/css" href="<%=project%>style_board.css">

<%
int		count		= (Integer)request.getAttribute("count");
String	pageNum		= (String)request.getAttribute("pageNum");
int		currentPage	= (Integer)request.getAttribute("currentPage");
int		number		= (Integer)request.getAttribute("number");
int		pageBlock	= (Integer)request.getAttribute("pageBlock");
int		startPage	= (Integer)request.getAttribute("startPage");
int		endPage		= (Integer)request.getAttribute("endPage");
int		pageCount	= (Integer)request.getAttribute("pageCount");
%>

<h2><%=page_list%>(<%=str_count%> : <%=count%>)</h2>

<table>
	<tr>
		<td colspan="6" style="text-align:right">
		<a href="writeForm.jsp"><%=str_write%></a>&nbsp;&nbsp;&nbsp;
		</td>
	</tr>
	<tr>
		<th style="width: 7%"><%=str_num%></th>
		<th style="width:40%"><%=str_subject%></th>
		<th style="width: 7%"><%=str_readcount%></th>
		<th style="width: 9%"><%=str_writer%></th>
		<th style="width:15%"><%=str_reg_date%></th>
		<th style="width:10%"><%=str_ip%></th>
	</tr>
	
	<%
		if(count == 0) {
			// 글이 없는 경우
			%>
			<tr>
				<td colspan="6" style="text-align:center">
					<%=msg_list_x%>
				</td>
			</tr>
			<%
		} else {
			// 글이 있는 경우
			ArrayList<BoardDataBean> dtos	= (ArrayList<BoardDataBean>)request.getAttribute("dtos");
			
			for(BoardDataBean dto : dtos) {
				%>
				<tr>
					<td style="text-align:center">
						<%--=dto.getNum()--%>
						<%=number--%>
					</td>
					<td>
						<%
						int	level	= dto.getRe_level();
						
						if(level>1) {
							int	width	= (level-1)*10;
							%>
							<img src="images/level.gif" border="0" width="<%=width%>" height="15px">
							<%
						}
						if(level>0) {
							%>
							<img src="images/re.gif" border="0" width="20px" height="15px">
							<%
						}
						%>
						<a href="content.jsp?num=<%=dto.getNum()%>&pageNum=<%=pageNum%>&number=<%=number+1%>">
						<%=dto.getSubject()%>
						</a>
					</td>
					<td style="text-align:center">
						<%=dto.getReadcount()%>
					</td>
					<td style="text-align:center">
						<%=dto.getWriter()%>
					</td>
					<td style="text-align:center">
						<%
						SimpleDateFormat	sdf	= new SimpleDateFormat("yyyy-MM-dd HH:mm");
						%>
						<%=sdf.format(dto.getReg_date())%>
					</td>
					<td style="text-align:center">
						<%=dto.getIp()%>
					</td>
				</tr>
				<%
			}
		}
	%>
</table>
<br>
<center>
	<%
	if(startPage > pageBlock) {
		%>
		<a href="list.jsp">[◀◀]</a>
		<a href="list.jsp?pageNum=<%=startPage - pageBlock%>">[◀]</a>
		<%		
	}

	for(int i=startPage ; i<=endPage ; i++) {
		if(i==currentPage) {
			%>
			<span>[<%=i%>]</span>
			<%
		} else {
			%>
			<a href="list.jsp?pageNum=<%=i%>">[<%=i%>]</a>
			<%
		}
	}
	
	if(pageCount > endPage) {
		%>
		<a href="list.jsp?pageNum=<%=startPage + pageBlock%>">[▶]</a>
		<a href="list.jsp?pageNum=<%=pageCount%>">[▶▶]</a>
		<%		
	}
	%>
</center>
