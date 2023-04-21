<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<h2>inner object - request - 처리 페이지</h2>

<%
String encoding = request.getCharacterEncoding();
//request.setCharacterEncoding("utf-8");
%>

인코딩 : <%= encoding %><br>

<%
String	name	= request.getParameter("name");
int		age		= Integer.parseInt(request.getParameter("age"));
String	gender	= request.getParameter("gender").equals("1") ? "남자" : "여자";
String	hobby[]	= request.getParameterValues("hobby");

%>
이름 : <%= name   %><br>
나이 : <%= age    %><br>
성별 : <%= gender %><br>
취미 : <%
		for(int i=0 ; i<hobby.length ; i++) {
			switch(hobby[i]) {
			case "1" : %> 독서<%; break; 
			case "2" : %> 등산<%; break; 
			case "3" : %> 운동<%; break; 
			case "4" : %> 게임<%; break; 
			}
			
			if(i != hobby.length-1) {
				%>,<%
			}
		}
		%>
