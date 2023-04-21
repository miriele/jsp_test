<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<h2> Script - scriptlet </h2>

<%
	int a = 3;

	if(a>5) {
		// 연산, 제어는 java에서 하고, 출력은 html에서 하도록 수정한다
		//out.println("크다<br>");
%>
		<% out.println(a); %> 크다 <br>
		<%= a %> 크다 <br>
<%
	} else {
		//out.println("작다<br>");
%>
		html 영역에서 java 변수의 값을 단순히 찍고 싶을 때<br>
		out.println 대신 expression &gt;%=을 사용할 수 있다<br><br>
		<% out.println(a); %> 작다 <br>
		<%= a %> 작다 <br>
<%
	}
%>