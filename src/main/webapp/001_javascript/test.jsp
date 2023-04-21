<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<script>
// <!--
function btnclick() {
	for(var i=0 ; i<homework.btn1.length ; i++) {
		document.write(i);
	}
//	document.write(homework.btn1.value + "<br>");
}
// -->
</script>

<form name='homework'>	

<input type='button' name='btn1' value='button1' onclick='btnclick()'>
<input type='button' name='btn1' value='button2' onclick='btnclick()'>


</form>

<!-- 
<form name='homework'>	
	<table border='1' id='table1'>

		<tr>
			<td>
		</tr>
	</table>
	
	
</form>
 -->