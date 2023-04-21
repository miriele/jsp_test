<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>

<h2> Script - expression </h2>

<%
	// 1 + 2 + 3 + 4 + 5 + 6 + 7 + 8 + 9 + 10 = 55
	int sum = 0;

	for(int i=1 ; i<=10 ; i++) {
		if(i<10) {
%>
			<%= i %> +
<%
		} else {
%>
			<%= i %> =
<%
		}
		
		sum += i;
	}
%>	
	<%= sum %> <br>
