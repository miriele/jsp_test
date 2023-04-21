<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<h2>Cookie - 생성 페이지</h2>

<%
// cookie는 client에 저장된다
Cookie	name	= new Cookie("name", "홍길동");
Cookie	age		= new Cookie("age", "30");

response.addCookie(name);
response.addCookie(age);
%>

확인 : <input type="button" value="확인" onclick="location='cookieUse.jsp'">
