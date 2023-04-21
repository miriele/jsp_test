<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<h2>Directive - include</h2>

<%@ include file="top.jsp" %>

<hr size="3" color="red">
현재 페이지는 포함하는 페이지 include.jsp 입니다.

top.jsp에 선언한 name 변수를 include.jsp에서 사용할 수 있다.
<% out.println(name); %> 님 안녕하세요.

<hr size="3" color="red">

<%@ include file="bottom.jsp" %>
