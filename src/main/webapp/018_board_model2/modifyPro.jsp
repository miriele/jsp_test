<%@page import="board.BoardDBBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="setting.jsp"%>
<script src="<%=project%>script_board.js"></script>

<h2><%=page_modify%></h2>

<%
int		result	= (Integer)request.getAttribute("result");
String	pageNum	= (String)request.getAttribute("pageNum");

if(result == 0) {
	// 수정 실패
	%>
	<script type="text/javascript">
	// <!--
		alert(modifyerror);
	// -->
	</script>
	<meta http-equiv="refresh" content="0; url=board_list.do?pageNum=<%=pageNum%>">
	<%
} else {
	// 수정 성공
	response.sendRedirect("board_list.do?pageNum=" + pageNum);
}
%>

