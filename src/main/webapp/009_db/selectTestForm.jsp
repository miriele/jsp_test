<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<h2>JDBC - select - 입력 페이지</h2>

<form method="post" action="selectTest.jsp">
	<table border="1">
		<tr>
			<th colspan="2">
				검색할 아이디를 입력하세요
			</th>
		</tr>
		<tr>
			<th>아이디</th>
			<td><input type="text" name="id"></td>
		</tr>
		<tr>
			<th colspan="2">
				<input type="submit" value="검색">
				<input type="reset"  value="취소">
			</th>
		</tr>
	</table>
</form>