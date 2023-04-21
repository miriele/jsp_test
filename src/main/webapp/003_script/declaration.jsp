<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<h2>Script - Declaration</h2>

<%
String name = "지역변수";
%>

<%!
String name = "전역변수";
// method를 구현할 때는 스크립트릿으로 구현할 수 없다
// 다른 함수 내부에 함수를 구현하는 것이 되기 때문이다
// 확인 경로
// : 탐색기 >
// : ~\eclipse-workspace\.metadata\.plugins\org.eclipse.wst.server.core\tmp0\work\Catalina\localhost\jsp\org\apache\jsp
// declaration으로 사용하면 구현한 함수가 class 밑으로 들어간다
public int hap(int a, int b) {
	return a+b;
}

public int gop(int a, int b) {
	return a*b;
}
%>

합 : <%= hap(5, 2) %> <br>
합 : <%= gop(5, 2) %> <br>