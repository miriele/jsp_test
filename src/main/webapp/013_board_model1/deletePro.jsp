<%@page import="board.BoardDBBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="setting.jsp"%>
<script src="script_board.js"></script>

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
	result	= dao.deleteArticle(num);
	
	if(result == 0) {
		// 삭제 실패
		%>
		<script type="text/javascript">
			// <!--
			alert(deleteerror);
			// -->
		</script>
		<meta http-equiv="refresh" content="0; url='list.jsp?pageNum=<%=pageNum%>'">
		<%
	} else if(result == -1) {
		// 답글이 있어서 삭제 실패
		%>
		<script type="text/javascript">
			// <!--
			alert(replyexisterror);
			// -->
		</script>
		<meta http-equiv="refresh" content="0; url='list.jsp?pageNum=<%=pageNum%>'">
		<%
	} else {
		// 삭제 성공
		response.sendRedirect("list.jsp?pageNum=" + pageNum);
	}
}
%>