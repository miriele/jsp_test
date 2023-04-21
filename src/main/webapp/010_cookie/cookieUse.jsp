<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<h2>Cookie - 확인 페이지</h2>

<%
Cookie cookies[] = request.getCookies();

for(Cookie cookie : cookies) {
	%>
	<%=cookie.getName()%> : <%=cookie.getValue()%><br>
	<%
}
%>
