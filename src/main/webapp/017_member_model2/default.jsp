<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="setting.jsp"%>
<link href="<%=project%>style_member.css" rel="stylesheet" type="text/css" >

<h2><%=page_default%></h2>

<%
request.setCharacterEncoding("utf-8");
%>

<%=(String)request.getAttribute("result")%> <br>
