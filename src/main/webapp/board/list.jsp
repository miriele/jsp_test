<%@page import="board.BoardDataBean"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.ArrayList"%>
<%@page language="java" contentType="text/html; charset=UTF-8"
   		pageEncoding="UTF-8"%>

<%@ include file="setting_board.jsp"%>
<script src="<%=project%>script_board.js"></script>
<link href="<%=project%>style_board.css" rel="stylesheet" type="text/css">

<%
int		count		= (Integer)request.getAttribute("count");
int		countNoti	= (Integer)request.getAttribute("countNoti");
int		countRec	= (Integer)request.getAttribute("countRec");
String	pageNum		= (String)request.getAttribute("pageNum");
int		currentPage	= (Integer)request.getAttribute("currentPage");
int		number		= (Integer)request.getAttribute("number");
int		pageBlock	= (Integer)request.getAttribute("pageBlock");
int		startPage	= (Integer)request.getAttribute("startPage");
int		endPage		= (Integer)request.getAttribute("endPage");
int		pageCount	= (Integer)request.getAttribute("pageCount");
%>

<%
if(session.getAttribute("memId") == null) {
	// 로그인이 안 된 상태
} else {
	// 로그인이 된 상태
}
%>

<h2><%=page_list%></h2>

<table>
	<tr>
		<th style="width: 7%"><%=str_header%></th>
		<th style="width:40%"><%=str_subject%></th>
		<th style="width: 9%"><%=str_writer%></th>
		<th style="width:15%"><%=str_reg_date%></th>
		<th style="width: 7%"><%=str_readcount%></th>
		<th style="width:10%"><%=str_like%></th>
	</tr>
	
	<%
		if(countNoti != 0) {
			// 공지 글이 있는 경우
			ArrayList<BoardDataBean> dtos	= (ArrayList<BoardDataBean>)request.getAttribute("dtosNoti");
			
			for(BoardDataBean dto : dtos) {
				%>
				<tr>
					<td style="text-align:center">
						<!-- header -->
						<%=str_noti%>
					</td>
					<td>
						<!-- subject -->
						<%
						int	level	= dto.getRe_level();
						
						if(level>1) {
							int	width	= (level-1)*10;
							%>
							<img src="<%=project%>images/level.gif" border="0" width="<%=width%>" height="15px">
							<%
						}
						if(level>0) {
							%>
							<img src="<%=project%>images/re.gif" border="0" width="20px" height="15px">
							<%
						}
						%>
						<a href="content.do?num=<%=dto.getNum()%>&pageNum=<%=pageNum%>&number=<%=number+1%>">
						<%=dto.getSubject()%>
						</a>
					</td>
					<td style="text-align:center">
						<!-- writer -->
						<%=dto.getNick()%>
					</td>
					<td style="text-align:center">
						<!-- reg_date -->
						<%
						SimpleDateFormat	sdf	= new SimpleDateFormat("yyyy-MM-dd HH:mm");
						%>
						<%=sdf.format(dto.getReg_date())%>
					</td>
					<td style="text-align:center">
						<!-- read count -->
						<%=dto.getReadcount()%>
					</td>
					<td style="text-align:center">
						<!-- like count -->
						<%=dto.getLikecount()%>
					</td>
				</tr>
				<%
			}
		}
	
		if(countRec != 0) {
			// 추천 글이 있는 경우
			ArrayList<BoardDataBean> dtos	= (ArrayList<BoardDataBean>)request.getAttribute("dtosRec");
			
			for(BoardDataBean dto : dtos) {
				%>
				<tr>
					<td style="text-align:center">
						<!-- header -->
						<%=str_rec%>
					</td>
					<td>
						<!-- subject -->
						<%
						int	level	= dto.getRe_level();
						
						if(level>1) {
							int	width	= (level-1)*10;
							%>
							<img src="<%=project%>images/level.gif" border="0" width="<%=width%>" height="15px">
							<%
						}
						if(level>0) {
							%>
							<img src="<%=project%>images/re.gif" border="0" width="20px" height="15px">
							<%
						}
						%>
						<a href="content.do?num=<%=dto.getNum()%>&pageNum=<%=pageNum%>&number=<%=number+1%>">
						<%=dto.getSubject()%>
						</a>
					</td>
					<td style="text-align:center">
						<!-- writer -->
						<%=dto.getNick()%>
					</td>
					<td style="text-align:center">
						<!-- reg_date -->
						<%
						SimpleDateFormat	sdf	= new SimpleDateFormat("yyyy-MM-dd HH:mm");
						%>
						<%=sdf.format(dto.getReg_date())%>
					</td>
					<td style="text-align:center">
						<!-- read count -->
						<%=dto.getReadcount()%>
					</td>
					<td style="text-align:center">
						<!-- like count -->
						<%=dto.getLikecount()%>
					</td>
				</tr>
				<%
			}
		}
		
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
						<!-- header -->
						<%--=dto.getNum()--%>
						<%=number--%>
					</td>
					<td>
						<!-- subject -->
						<%
						int	level	= dto.getRe_level();
						
						if(level>1) {
							int	width	= (level-1)*10;
							%>
							<img src="<%=project%>images/level.gif" border="0" width="<%=width%>" height="15px">
							<%
						}
						if(level>0) {
							%>
							<img src="<%=project%>images/re.gif" border="0" width="20px" height="15px">
							<%
						}
						%>
						<a href="content.do?num=<%=dto.getNum()%>&pageNum=<%=pageNum%>&number=<%=number+1%>">
						<%=dto.getSubject()%>
						</a>
					</td>
					<td style="text-align:center">
						<!-- writer -->
						<%=dto.getNick()%>
					</td>
					<td style="text-align:center">
						<!-- reg_date -->
						<%
						SimpleDateFormat	sdf	= new SimpleDateFormat("yyyy-MM-dd HH:mm");
						%>
						<%=sdf.format(dto.getReg_date())%>
					</td>
					<td style="text-align:center">
						<!-- read count -->
						<%=dto.getReadcount()%>
					</td>
					<td style="text-align:center">
						<!-- like count -->
						<%=dto.getLikecount()%>
					</td>
				</tr>
				<%
			}
		}
	%>

	<%
	if(session.getAttribute("memId") != null) {
	%>
	<tr>
		<td colspan="6" style="text-align:right">
			<input class="inputbutton" type="button" value="<%=btn_write%>"
				onclick="location='writeform.do'">
		</td>
	</tr>
	<%
	}
	%>
</table>

<br>

<!-- 페이지 번호 : START -->
<center>
	<%
	if(startPage > pageBlock) {
		%>
		<a href="list.do">[◀◀]</a>
		<a href="list.do?pageNum=<%=startPage - pageBlock%>">[◀]</a>
		<%		
	}

	for(int i=startPage ; i<=endPage ; i++) {
		if(i==currentPage) {
			%>
			<span>[<%=i%>]</span>
			<%
		} else {
			%>
			<a href="list.do?pageNum=<%=i%>">[<%=i%>]</a>
			<%
		}
	}
	
	if(pageCount > endPage) {
		%>
		<a href="list.do?pageNum=<%=startPage + pageBlock%>">[▶]</a>
		<a href="list.do?pageNum=<%=pageCount%>">[▶▶]</a>
		<%		
	}
	%>
</center>
<!-- 페이지 번호 : END -->


<!-- 게시판 검색 : START -->
<center>
</center>
<!-- 게시판 검색 : END -->
