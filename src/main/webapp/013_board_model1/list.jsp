<%@page import="java.text.SimpleDateFormat"%>
<%@page import="board.BoardDataBean"%>
<%@page import="java.util.ArrayList"%>
<%@page import="board.BoardDBBean"%>
<%@page language="java" contentType="text/html; charset=UTF-8"
   		pageEncoding="UTF-8"%>

<%@ include file="setting.jsp"%>
<script src="script_board.js"></script>
<link rel="stylesheet" type="text/css" href="style_board.css">

<%
int		pageSize	= 5;		// 한 페잉지에 출력할 글의 개수
int		start		= 0;		// 페이지의 첫 글
int		end			= 0;		// 페이지의 마지막 글
String	pageNum		= null;		// 현재 페이지
int		currentPage	= 0;		// 계산용 현재 페이지 - 임시
int		number		= 0;		// 출력용 글번호 - 게시판에 표시되는 번호
int		pageBlock	= 3;		// 한 번에 출력할 페이지 번호 개수
int		startPage	= 0;		// 출력할 페이지 시작 번호
int		endPage		= 0;		// 출력할 페이지 끝 번호
int		pageCount	= 0;		// 전체 페이지 개수 - 페이지 블록에서
%>

<%
BoardDBBean	dao		= BoardDBBean.getInstance();
int			count	= dao.getCount();
%>

<%
pageNum		= request.getParameter("pageNum");

if(pageNum==null) {
	pageNum	= "1";
}

currentPage	= Integer.parseInt(pageNum);
start		= (currentPage - 1) * pageSize + 1;		// (5 - 1) * 10 + 1		= 41
end			= start + pageSize - 1;					// 40 + 10 - 1			= 49

if(count < end) {
	end = count;
}

number	= count - (currentPage - 1) * pageSize;		// 50 - (2 - 1) * 10	= 40

// 페이지 처리
pageCount	= (count / pageSize) + (count % pageSize > 0 ? 1 : 0);
startPage	= (currentPage / pageBlock) * pageBlock + 1;			// ( 5 / 10) * 10 + 1	= 1
																	// (15 / 10) * 10 + 1	= 11

if(currentPage % pageBlock == 0) {
	startPage -= pageBlock;
}

endPage		= startPage + pageBlock - 1;							// 11 + 10 - 1			= 20

if(pageCount < endPage) {
	endPage	= pageCount;
}
%>

<%
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
			ArrayList<BoardDataBean> dtos	= dao.getArticles(start, end);
			
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
