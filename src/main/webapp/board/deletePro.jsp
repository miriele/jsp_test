<%@page import="board.BoardDBBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="setting_board.jsp"%>
<script src="<%=project%>script_board.js"></script>

<%
int	resultCheck	= (Integer)request.getAttribute("resultCheck");

if(resultCheck == 0) {
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
	int		result	= (Integer)request.getAttribute("result");
	String	pageNum	= (String)request.getAttribute("pageNum");
	
	if(result == 0) {
		// 삭제 실패
		%>
		<script type="text/javascript">
			// <!--
			alert(deleteerror);
			// -->
		</script>
		<meta http-equiv="refresh" content="0; url='list.do?pageNum=<%=pageNum%>'">
		<%
	} else if(result == -1) {
		// 답글이 있어서 삭제 실패
		%>
		<script type="text/javascript">
			// <!--
			alert(replyexisterror);
			// -->
		</script>
		<meta http-equiv="refresh" content="0; url='list.do?pageNum=<%=pageNum%>'">
		<%
	} else {
		// 삭제 성공
		response.sendRedirect("list.do?pageNum=" + pageNum);
	}
}
%>