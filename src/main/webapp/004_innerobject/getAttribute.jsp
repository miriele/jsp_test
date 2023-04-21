<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<h2>inner object - 내장 객체 영역 - 확인 페이지 : getAttribute - 속성 읽어오기</h2>

request     : <%=request.getAttribute("id")%>    <br>
session     : <%=session.getAttribute("id")%>    <br>
application : <%=application.getAttribute("id")%><br>