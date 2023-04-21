<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<h2>액션태그 - forward - blue</h2>

<%
request.setCharacterEncoding("utf-8");
%>

<%
String name = request.getParameter("paramName");
%>

<body bgcolor="blue">
	<%=name%>님 안녕하세요.
</body>
