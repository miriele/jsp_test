<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<h2>액션태그 - useBean - 출력 페이지</h2>
<h4>
 : 다른 페이지에서 생성한 bean 객체의 생성 부를 그대로 가져다 쓰면<br>
 : 새로 만들겠다는 의미가 아니라, 앞에서 만든걸 쓰겠다는 의미<br>
</h4>

<jsp:useBean id="ubean" class="bean.SimpleBean" scope="session" />

이름 : <%=ubean.getName()%> <br>
나이 : <%=ubean.getAge()%> <br>
주소 : <%=ubean.getAddress()%> <br>
전화번호 : <%=ubean.getTel()%> <br>