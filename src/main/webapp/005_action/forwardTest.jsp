<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
request.setCharacterEncoding("utf-8");
%>

<%
String name  = request.getParameter("name");
String color = request.getParameter("color");
%>

<%
String nextPage = null;

switch(color) {
case "1": nextPage = "red.jsp";		break;
case "2": nextPage = "blue.jsp";	break;
case "3": nextPage = "yellow.jsp";	break;
case "4": nextPage = "green.jsp";	break;
}

/*
if(color.equals("1")) {
	nextPage = "red.jsp";
} else if(color.equals("2")) {
	nextPage = "blue.jsp";
} else if(color.equals("2")) {
	nextPage = "yellow.jsp";
} else if(color.equals("2")) {
	nextPage = "green.jsp";
}
*/
%>

<jsp:forward page="<%=nextPage%>">
	<jsp:param value="<%=name%>" name="paramName"/>
</jsp:forward>