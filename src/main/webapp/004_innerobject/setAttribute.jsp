<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<h2>inner object - 내장 객체 영역 - 확인 페이지 : setAttribute - 속성 저장하기</h2>

<%
	// page	는 현재 페이지에서만 사용하고 공유하지 않으므로 setAttribute 메소드가 없다
	request.setAttribute("id", "request");			// 요청을 처리하는 페이지 모두 공유
	session.setAttribute("id", "session");			// 웹브라우저를 종료하기 전 페이지 모두 공유
	application.setAttribute("id", "application");	// 현재 프로젝트 모두 공유
%>

확인 : <input type="button" value="확인" onclick="javascript:window.location.href='getAttribute.jsp'">