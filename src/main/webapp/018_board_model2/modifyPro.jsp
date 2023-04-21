<%@page import="board.BoardDBBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="setting.jsp"%>
<script src="<%=project%>script_board.js"></script>

<h2><%=page_modify%></h2>

<%
request.setCharacterEncoding("utf-8");
%>

<jsp:useBean id="dto" class="board.BoardDataBean"/>
	<jsp:setProperty name="dto" property="*"/>
	<!-- num subject content passwd -->
	
<%
String	pageNum	= request.getParameter("pageNum");
%>

<%
BoardDBBean	dao		= BoardDBBean.getInstance();
int			result	= dao.modifyArticle(dto);

if(result == 0) {
	// 수정 실패
	%>
	<script type="text/javascript">
	// <!--
		alert(modifyerror);
	// -->
	</script>
	<meta http-equiv="refresh" content="0; url=list.jsp?pageNum=<%=pageNum%>">
	<%
} else {
	// 수정 성공
	response.sendRedirect("list.jsp?pageNum=" + pageNum);
}
%>

