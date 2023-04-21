<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<h2>session - 생성 페이지</h2>

<%
// session은 내장객체라서 server에 저장된다
session.setAttribute("id", "aaa");
session.setAttribute("passwd", "111");

//session.setMaxInactiveInterval(3);	// 지정된 초 후에 session을 무효화 시켜라
//session.removeAttribute("id");		// 지정된 session을 지워라
//session.invalidate();					// 전체 session을 지원라
%>

확인 : <input type="button" value="확인" onclick="location='sessionView.jsp'">
