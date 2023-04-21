<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<h2>expression homework</h2>

<table border="1">
	<%
	int SIZE = Integer.parseInt(request.getParameter("num"));
	for(int i=0 ; i<SIZE ; i++) {
		%>
		<tr>
		<%
		
		for(int j=SIZE-1 ; j>i ; j--) {
			%>
			<td></td>
			<%
		}
		
		for(int j=0 ; j<=i ; j++) {
			%>
			<td>*</td>
			<%
		}
		
		for(int j=1 ; j<=i ; j++) {
			%>
			<td>*</td>
			<%
		}
		
		%>
		</tr>
		<%
	}
	
	for(int i=SIZE-1 ; i>0 ; i--) {
		%>
		<tr>
		<%
		
		for(int j=0 ; j<SIZE-i ; j++) {
			%>
			<td></td>
			<%
		}
		
		for(int j=0 ; j<i ; j++) {
			%>
			<td>*</td>
			<%
		}
		
		for(int j=1 ; j<i ; j++) {
			%>
			<td>*</td>
			<%
		}
		
		%>
		</tr>
		<%
	}
	%>
</table>