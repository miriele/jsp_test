<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
request.setCharacterEncoding("utf-8");
%>

<%
String	product	= request.getParameter("product");
String	name	= null;
String	control	= null;

if(product.equals("1")) {
	name	= "텔레비젼";
	control	= "tv";
} else if(product.equals("2")) {
	name	= "컴퓨터";
	control	= "pc";
} else if(product.equals("3")) {
	name	= "스마트폰";
	control	= "hp";
}
%>

<jsp:forward page="template.jsp">
	<jsp:param value="<%=name%>"	name="paramName"/>
	<jsp:param value="<%=control%>"	name="paramControl"/>
</jsp:forward>