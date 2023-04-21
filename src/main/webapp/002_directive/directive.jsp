<%@ page language     = "java"
		 session      = "true"
		 buffer       = "10kb"
		 autoFlush    = "false"
		 isThreadSafe = "true"
		 contentType  = "text/html; charset=UTF-8"
		 pageEncoding = "UTF-8"%>

<h2>Directive - page</h2>

<!-- 스크립트릿 : 여기부터 자바 영역이다 -->
<%
	int a = 5;
	int b = 2;
%>
<!-- 스크립트릿 : 끝 -->

a + b = <% out.println(a+b); %> <br>
a - b = <% out.println(a-b); %> <br>
a * b = <% out.println(a*b); %> <br>
a / b = <% out.println(a/b); %> <br>
