<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<h2>404 에러 페이지</h2>

<%
response.setStatus(HttpServletResponse.SC_OK);
%>

파일 경로 에러입니다. <br>
파일 이름이나 경로를 다시 확인하세요. <br>