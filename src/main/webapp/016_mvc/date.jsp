<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<h2>MVC - date 처리</h2>

<%
request.setCharacterEncoding("utf-8");
%>

<%
Date	result	= (Date)request.getAttribute("result");
%>

결과 : <%=result%>