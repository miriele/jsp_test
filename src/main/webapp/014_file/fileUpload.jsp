<%@page import="java.net.URLEncoder"%>
<%@page import="java.util.Enumeration"%>
<%@page import="java.io.IOException"%>
<%@page import="javax.servlet.http.HttpServletRequest" %>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="java.io.File"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>



<h2>파일 업로드</h2>

<%
String	path		= application.getRealPath("/save");
int		size		= 5*1024*1024;
String	encoding	= "utf-8";
new File(path).mkdir();

MultipartRequest	multi	= new MultipartRequest(request, path, size, encoding, new DefaultFileRenamePolicy());
%>

경로 : <%=path%><br>

<%
Enumeration<?>	e	= multi.getParameterNames();

while(e.hasMoreElements()) {
	String	name	= (String)e.nextElement();
	%>
	이름 : <%=name%>&nbsp;::::&nbsp;
	값 : <%=multi.getParameter(name)%><br>
	<%
}

String	originName1	= multi.getOriginalFileName("file1");
String	systemName1	= multi.getFilesystemName("file1");

String	originName2	= multi.getOriginalFileName("file2");
String	systemName2	= multi.getFilesystemName("file2");
%>

파일 1 실제 이름 : <%=originName1%>&nbsp;::::&nbsp;
파일 1 저장 이름 : <%=systemName1%><br>

파일 2 실제 이름 : <%=originName2%>&nbsp;::::&nbsp;
파일 2 저장 이름 : <%=systemName2%><br>

<br><br>

<h2>파일 다운로드</h2>

<%--
파일 1 : <a href="/jsp/save/<%=systemName1%>"><%=originName1%></a><br>
파일 2 : <a href="/jsp/save/<%=systemName2%>"><%=originName2%></a><br>
--%>

<%
String	enc				= "utf-8";
String	originName11	= URLEncoder.encode(originName1, enc);
String	systemName11	= URLEncoder.encode(systemName1, enc);
String	originName22	= URLEncoder.encode(originName2, enc);
String	systemName22	= URLEncoder.encode(systemName2, enc);
%>

파일 1 : <a href="fileDownload.jsp?originName=<%=originName11%>&systemName=<%=systemName11%>"><%=originName1%></a><br>
파일 2 : <a href="fileDownload.jsp?originName=<%=originName22%>&systemName=<%=systemName22%>"><%=originName2%></a><br>










