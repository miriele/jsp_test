<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="setting.jsp"%>
<link href="style_member.css" rel="stylesheet" type="text/css" >
<script src="script_member.js"></script>

<h2><%=page_input%></h2>

<form method="post" action="inputPro.jsp" name="inputform" onsubmit="return inputcheck()">
	<input type="hidden" name="check" value="0">
	<table>
		<tr>
			<th colspan="2"><%=msg_input%></th>
		</tr>
		<tr>
			<th><%=str_id%></th>
			<td>
				<input class="input" type="text" name="id" maxLength="50" autofocus>
				<input class="inputbutton" type="button" value="<%=btn_confirm%>"
						onclick="confirmid()">
			</td>
		</tr>
		<tr>
			<th rowspan="2"><%=str_passwd%></th>
			<td><input class="input" type="password" name="passwd" maxLength="30"></td>
		</tr>
		<tr>
			<td><input class="input" type="password" name="repasswd" maxLength="30"></td>
		</tr>
		<tr>
			<th><%=str_name%></th>
			<td><input class="input" type="text" name="name" maxLength="50"></td>
		</tr>
		<tr>
			<th><%=str_jumin%></th>
			<td>
				<input class="input" type="text" name="jumin1" maxLength="6" style="width:57px"
						onkeyup="nextjumin2()">
				-
				<input class="input" type="text" name="jumin2" maxLength="7" style="width:67px"
						onkeyup="nexttel1()">
			</td>
		</tr>
		<tr>
			<th><%=str_tel%></th>
			<td>
				<input class="input" type="text" name="tel1" maxLength="3" style="width:29px"
						onkeyup="nexttel2()">
				-
				<input class="input" type="text" name="tel2" maxLength="4" style="width:38px"
						onkeyup="nexttel3()">
				-
				<input class="input" type="text" name="tel3" maxLength="4" style="width:38px"
						onkeyup="nextemail1()">
			</td>
		</tr>
		<tr>
			<th><%=str_email%></th>
			<td>
				<input class="input" type="text" name="email1" maxLength="50" style="width:100px">
				@
				<select name="email2">
					<option value="0">직접입력</option>
					<option value="daum.net">다음</option>
					<option value="naver.com">네이버</option>
					<option value="gmail.com">구글</option>
					<option value="nate.com">네이트</option>
				</select>
			</td>
		</tr>
		<tr>
			<th colspan="2">
				<input class="inputbutton" type="submit" value="<%=btn_input%>">
				<input class="inputbutton" type="reset" value="<%=btn_cancel%>">
				<input class="inputbutton" type="button" value="<%=btn_input_cancel%>"
						onclick="location='main.jsp'">
			</th>
		</tr>
	</table>
</form>