<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<h2>템플릿 페이지</h2>

<%
	request.setCharacterEncoding("utf-8");
%>

<%
	String	name	= request.getParameter("paramName");
	String	control	= request.getParameter("paramControl"); 
%>

<table border="1">
	<tr>
		<th colspan="2">
			<!-- 상단 메뉴 -->
			<jsp:include page="top.jsp" flush="false" />
		</th>
	</tr>
	<tr>
		<th width="100" height="300">
			<!-- 좌측 메뉴 -->
			<!-- java 영역의 문자열은 무조건 큰따옴표이므로 html 영역을 작은따옴표로 바꾼다 -->
			<jsp:include page='<%=control + "Left.jsp"%>' flush="false" />
		</th>
		<td width="400" valign="top">
			<!-- 가운데 내용 -->
			<br>
			<b><%=name%></b>
			<br>
			<!-- java 영역의 문자열은 무조건 큰따옴표이므로 html 영역을 작은따옴표로 바꾼다 -->
			<jsp:include page='<%=control + ".jsp"%>' flush="false" />
		</td>
	</tr>
	<tr>
		<th colspan="2" height="50">
			<!-- 하단 메뉴 -->
			<jsp:include page="bottom.jsp" flush="false" />
		</th>
	</tr>
</table>
