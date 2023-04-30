<%@page import="java.text.SimpleDateFormat"%>
<%@page import="member.MemberDataBean"%>
<%@page import="member.MemberDBBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="setting_member.jsp"%>
<script src="<%=project%>script_member.js"></script>
<link href="<%=project%>style_member.css" rel="stylesheet" type="text/css" >

<h2><%=page_modify%></h2>

<%
int result	= (Integer)request.getAttribute("result");

if(result == 0) {
	// 비밀번호가 다르다 : 
	%>
	<script type="text/javascript">
		// <!--
		erroralert(passerror);
		// -->
	</script>
	<%
	} else {
		// 비밀번호가 같다
		MemberDataBean	dto	= (MemberDataBean)request.getAttribute("dto");
	%>
	<form method="post" action="modifypro.do" name="modifyform" onsubmit="return modifycheck()">
		<input type="hidden" name="checknick" value="0">
		<table>
			<tr>
				<th colspan="2"><%=msg_modify%></th>
			</tr>
			<tr>
				<th><%=str_id%></th>
				<td>&nbsp;<%=dto.getId()%></td>
			</tr>
			<tr>
				<th><%=str_nick%></th>
				<td>
					<input class="input" type="text" name="nick" maxLength="30" autofocus
							value="<%=dto.getNick()%>">
					<input class="inputbutton" type="button" value="<%=btn_confirm%>"
							onclick="confirmnick('modifyform')">
				</td>
			</tr>
			<tr>
				<th><%=str_name%></th>
				<td>&nbsp;<%=dto.getName()%></td>
			</tr>
			<tr>
				<th rowspan="2"><%=str_passwd%></th>
				<td>
					<input class="input" type="password" name="passwd" maxlength="30"
							value="<%=dto.getPasswd()%>">
				</td>
			</tr>
			<tr>
				<td>
					<input class="input" type="password" name="repasswd" maxlength="30"
							value="<%=dto.getPasswd()%>">
				</td>
			</tr>
			<tr>
				<th><%=str_tel%></th>
				<td>
				<%
				if(dto.getTel() == null) {
					%>
					  <input class="input" type="text" name="tel1" maxlength="3" style="width:30px">
					- <input class="input" type="text" name="tel2" maxlength="4" style="width:40px">
					- <input class="input" type="text" name="tel3" maxlength="4" style="width:40px">
					<%
				} else {
					String	t[]	= dto.getTel().split("-");
					%>
					  <input class="input" type="text" name="tel1" maxlength="3" style="width:30px"
							value="<%=t[0]%>">
					- <input class="input" type="text" name="tel2" maxlength="4" style="width:40px"
							value="<%=t[1]%>">
					- <input class="input" type="text" name="tel3" maxlength="4" style="width:40px"
							value="<%=t[2]%>">
					<%
				}
				%>
				</td>
			</tr>
			<tr>
				<th><%=str_email%></th>
				<td>
				<%
				if(dto.getEmail() == null) {
					%>
					<input class="input" type="text" name="email1" maxlength="25"
							style="width:100px">
					@
					<input class="input" type="text" name="email2" maxlength="25"
							style="width:100px">
					<%
				} else {
					String	e[] = dto.getEmail().split("@");
					%>
					<input class="input" type="text" name="email1" maxlength="25"
							value="<%=e[0]%>" style="width:100px">
					@
					<input class="input" type="text" name="email2" maxlength="25"
							value="<%=e[1]%>" style="width:100px">
					<%
				}
				%>
				</td>
			</tr>
			<tr>
				<th><%=str_reg_date%></th>
				<td>
					<%
					SimpleDateFormat	sdf	= new SimpleDateFormat("yyyy-MM-dd HH:mm:ss"); 
					%>
					<%=sdf.format(dto.getReg_date())%>
				</td>
			</tr>
			<tr>
				<th colspan="2">
					<input class="inputbutton" type="submit" value="<%=btn_mod%>">
					<input class="inputbutton" type="reset"  value="<%=btn_cancel%>">
					<input class="inputbutton" type="button" value="<%=btn_mod_cancel%>"
							onclick="location='main.do'">
				</th>
			</tr>
		</table>
	</form>
	<%
}
%>