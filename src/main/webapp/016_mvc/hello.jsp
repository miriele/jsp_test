<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<h2>MVC - hello 처리</h2>

<%
request.setCharacterEncoding("utf-8");
%>

<%
String	result	= (String)request.getAttribute("result");
%>

결과 : <%=result%>