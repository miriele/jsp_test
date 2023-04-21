<%@ page import="bean.SimpleBean"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<h2>액션태그 - useBean - 처리 페이지</h2>

<%
request.setCharacterEncoding("utf-8");
%>

<!-- Java Bean X / useBean X : 이 때까지 했던 방식 -->
<h4>Java Bean X / useBean X : 이 때까지 했던 방식</h4>

<%
String	name	= request.getParameter("name");
int		age		= Integer.parseInt(request.getParameter("age"));
String	address	= request.getParameter("address");
String	tel		= request.getParameter("tel");
%>

이름 : <%=name%> <br>
나이 : <%=age%> <br>
주소 : <%=address%> <br>
전화번호 : <%=tel%> <br>

<hr style="height:3px">

<!-- Java Bean O / useBean X -->
<h4>Java Bean O / useBean X</h4>

<%
SimpleBean bean	= new SimpleBean();

bean.setName(request.getParameter("name"));
bean.setAge(Integer.parseInt(request.getParameter("age")));
bean.setAddress(request.getParameter("address"));
bean.setTel(request.getParameter("tel"));
%>

이름 : <%=bean.getName()%> <br>
나이 : <%=bean.getAge()%> <br>
주소 : <%=bean.getAddress()%> <br>
전화번호 : <%=bean.getTel()%> <br>

<hr style="height:3px">

<!-- Java Bean O / useBean O -->
<h4>Java Bean O / useBean O</h4>

<!-- simpleBeanView 하기 전에는 scope 없이 쓰자 -->
<%-- <jsp:useBean id="ubean" class="bean.SimpleBean" /> --%>
<jsp:useBean id="ubean" class="bean.SimpleBean" scope="session" />
<h6>useBean으로 객체 만들어놓고도 Java Bean처럼 사용 할 수 있다</h6>
<%
ubean.setName(request.getParameter("name"));
ubean.setAge(Integer.parseInt(request.getParameter("age")));
ubean.setAddress(request.getParameter("address"));
ubean.setTel(request.getParameter("tel"));
%>

이름 : <%=ubean.getName()%> <br>
나이 : <%=ubean.getAge()%> <br>
주소 : <%=ubean.getAddress()%> <br>
전화번호 : <%=ubean.getTel()%> <br>
<br>
<br>
<h6>useBean으로 객체만들어서 useBean으로 사용</h6>
<h6>: property에 property를 일일이 작성하지 않고 *을 입력하면</h6>
<h6>: property가 몇개든 알아서 받아준다</h6>
<%--
<jsp:setProperty name="ubean" property="name" />
<jsp:setProperty name="ubean" property="age" />
<jsp:setProperty name="ubean" property="address" />
<jsp:setProperty name="ubean" property="tel" />
--%>
<jsp:setProperty name="ubean" property="*" />

이름 : <jsp:getProperty name="ubean" property="name" /> <br>
나이 : <jsp:getProperty name="ubean" property="age" /> <br>
주소 : <jsp:getProperty name="ubean" property="address" /> <br>
전화번호 : <jsp:getProperty name="ubean" property="tel" /> <br>

<!-- simpleBeanView 에서 출력부만 처리하게 하기 위해 forward -->
<jsp:forward page="simpleBeanView.jsp" />
