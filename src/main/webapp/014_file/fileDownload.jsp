<%@page import="java.net.URLEncoder"%>
<%@page import="java.io.BufferedOutputStream"%>
<%@page import="java.io.BufferedInputStream"%>
<%@page import="java.io.FileInputStream"%>
<%@page import="java.net.URLDecoder"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<h2>파일 다운로드</h2>

<%
String	originName	= request.getParameter("originName");
String	systemName	= request.getParameter("systemName");

originName	= URLDecoder.decode(originName, "utf-8");
systemName	= URLDecoder.decode(systemName, "utf-8");

%>

파일 이름 : <%=originName%> <br>
저장 이름 : <%=systemName%> <br>

<%
out.clear();					// out buffer 내용을 삭제
out	= pageContext.pushBody();	// out buffer 다시 얻어오기

String					path		= application.getRealPath("/save");
String					fileName	= path + "/" + systemName;
BufferedInputStream		bis			= new BufferedInputStream(new FileInputStream(fileName));
BufferedOutputStream	bos			= new BufferedOutputStream(response.getOutputStream());

response.setContentType("text/unknown");
response.setHeader("content-disposition",
		"attachment;filename="+URLEncoder.encode(originName, "utf-8")+";");

byte	buffer[]	= new byte[1024];		// file 잘라서 넣은 buffer : 1KB
int		length		= 0;

while((length = bis.read(buffer, 0, buffer.length)) != -1) {
	bos.write(buffer, 0, length);
}

bis.close();
bos.close();
%>


