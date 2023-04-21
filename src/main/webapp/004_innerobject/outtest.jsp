<%@ page language="java" contentType="text/html; charset=UTF-8"
	buffer="10kb"
    pageEncoding="UTF-8"%>

<h2>inner object - out</h2>

<%
int a = 10;

int size_buffer = out.getBufferSize();
int size_remain = out.getRemaining();
int size_use    = size_buffer - size_remain;
%>

a : <% out.println(a); %> <br>
a : <%= a %> <br>
<br>
버퍼크기 : <%= size_buffer %><br>
남은크기 : <%= size_remain %><br>
사용크기 : <%= size_use %><br>
