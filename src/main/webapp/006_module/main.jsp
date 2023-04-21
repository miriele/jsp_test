<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<h2>메인 페이지</h2>

<form method="post" action="control.jsp">
	<table border="1">
		<tr>
			<th colspan="2">제품을 선택하세요</th>
		</tr>
		<tr>
			<th width="100">제품</th>
			<td width="150" height="100">
				<input type="radio" name="product" value="1">텔레비젼<br>
				<input type="radio" name="product" value="2">컴퓨터<br>
				<input type="radio" name="product" value="3">스마트폰<br>
			</td>
		</tr>
		<tr>
			<th colspan="2">
				<input type="submit" value="선택">
				<input type="reset"  value="취소">
			</th>
		</tr>
	</table>
</form>