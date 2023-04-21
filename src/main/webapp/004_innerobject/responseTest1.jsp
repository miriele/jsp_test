<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<h2>inner object - response - 리다이렉트 이전 페이지</h2>

현재 페이지는 리다이렉트 되기 전 페이지 responseTest1.jsp입니다.<br>

<%
response.sendRedirect("responseTest2.jsp");
%>



