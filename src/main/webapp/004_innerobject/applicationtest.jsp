<%@ page import="java.util.Enumeration"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<h2> inner object - application</h2>

<%

String	info	= application.getServerInfo();
int		major	= application.getMajorVersion();
int		minor	= application.getMinorVersion();
String	path	= application.getRealPath("/");

%>

서버정보 : <%= info %> <br>
서버버전 : <%= major %>.<%= minor %> <br>
실제경로 : <%= path %> <br>

<%
// web.xml에 작성해놓은 설정값을 가져와서 출력
Enumeration<String> e = application.getInitParameterNames();

while(e.hasMoreElements()) {
	String name  = e.nextElement();
	String value = application.getInitParameter(name);
	%>
	<%= name %> : <%= value %>
	<%
}
%>