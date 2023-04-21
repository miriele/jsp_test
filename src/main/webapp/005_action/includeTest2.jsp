<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<h2>액션태그 - include - 처리 페이지 2</h2>

<%
// includeTest1.jsp에서 한글 처리를 했으므로,
// 연결된 page인 includeTest2.jsp에서는 한글처리를 따로할 필요가 없다. 
//request.setCharacterEncoding("utf-8");
%>

<h4>includeTestForm에서 submit으로 넘어온 값 출력</h4>
<h6>: 이렇게 쓰면 혼동되니 쓰지말자</h6>

<%
String	name	= request.getParameter("name");
int		age		= Integer.parseInt(request.getParameter("age"));
%>

이름 : <%=name%><br>
나이 : <%=age%> <br>

<h4>includeTest1에서 넘어온 값 출력</h4>

<%
String	paramName	= request.getParameter("paramName");
int		paramAge	= Integer.parseInt(request.getParameter("paramAge"));
%>

이름 : <%=paramName%><br>
나이 : <%=paramAge%> <br>
