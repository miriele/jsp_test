<%@page import="board.BoardDBBean"%>
<%@page import="java.sql.Timestamp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="setting.jsp"%>
<script src="script_board.js"></script>

<h2><%=page_write%></h2>

<%
request.setCharacterEncoding("utf-8");
%>

<!-- 입력 받은 데이터     : writer, subject, content, passwd -->
<!-- 강제로 넘긴 데이터   : num, ref, re_step, re_level      -->
<!-- 강제로 넣을 데이터   : reg_date, ip                     -->
<!-- 사용하지 않는 데이터 : readcount                        -->

<jsp:useBean id="dto" class="board.BoardDataBean"/>
	<jsp:setProperty property="*" name="dto"/>

<%
dto.setReg_date(new Timestamp(System.currentTimeMillis()));
%>

<%
dto.setIp(request.getRemoteAddr());
%>

<%
BoardDBBean	dao		= BoardDBBean.getInstance();
int			result	= dao.insertArticle(dto);

if(result == 0) {
	// 글작성 실패
	%>
	<script type="text/javascript">
		// <!--
		alert(inserterror);
		// -->
	</script>
	<meta http-equiv="refresh" content="0; url=list.jsp">
	<%
} else {
	// 글작성 성공
	response.sendRedirect("list.jsp");
}
%>
