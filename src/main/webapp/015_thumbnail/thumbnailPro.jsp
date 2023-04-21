<%@page import="javax.imageio.ImageIO"%>
<%@page import="java.awt.Graphics"%>
<%@page import="java.awt.image.BufferedImage"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="java.io.File"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<h2>썸네일 이미지</h2>

<%
String	path	= application.getRealPath("/save");
int		size	= 1024*1024*5;

new File(path).mkdir();

MultipartRequest	multi	= new MultipartRequest(request, path, size, "utf-8",
													new DefaultFileRenamePolicy());

String	title	= multi.getParameter("title");
String	name	= multi.getParameter("name");
String	originName	= multi.getOriginalFileName("img");
String	systemName	= multi.getFilesystemName("img");


%>

제목 : <%=title%><br>
이름 : <%=name%><br>
파일이름 : <%=originName%><br>
저장이름 : <%=systemName%><br>
<br><br>
<h3>원본 이미지</h3>

<img src="/jsp/save/<%=systemName%>">
<br><br>

<%
String	oname	= path + "/" + systemName;		// snow1.jpg
String	tname	= path + "/t" + systemName;		// tsnow1.jpg 
int		size_th	= 5;

// thumbnail 만드는 과정
// : image file > original image buffer > thumbnail image buffer > thumbnail image file

//// 원본 파일을 담아둘 buffer 만들기 : JAVA 11에서는 JAI 못씀
//RenderedOp		op		= JAI.create("fileload", oname);
//BufferedImage	obuffer	= op.getAsBufferedImage();

BufferedImage	obuffer	= ImageIO.read(new File(oname));

//// thumbnail을 담아둘 buffer 만들기
int				width	= obuffer.getWidth()/size_th;
int				height	= obuffer.getHeight()/size_th;
//BufferedImage	tbuffer	= new BufferedImage(width, height, BufferedImage.TYPE_INT_RGB);
BufferedImage	tbuffer	= new BufferedImage(width, height, obuffer.getType());

//// thumbnail 만들기
Graphics		g		= tbuffer.getGraphics();

g.drawImage(obuffer, 0, 0, width, height, null);

ImageIO.write(tbuffer, "jpg", new File(tname));
ImageIO.write(tbuffer, "png", new File(tname));
ImageIO.write(tbuffer, "gif", new File(tname));
%>

<h3>썸네일 이미지</h3>
<img src="/jsp/save/t<%=systemName%>"><br>
<br><br>

<h3>이미지 다운로드</h3>
다운로드 :
<a href="/jsp/014_file/fileDownload.jsp?originName=<%=originName%>&systemName=<%=systemName%>">
	<%=originName%>
</a>
<br><br>