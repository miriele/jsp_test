<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<script type="text/javascript">
// <!--
document.write("<h2>구구단</h2>");

document.write("<table border='1'>");

//document.write("<tr align='center'>");
document.write("<tr>");			// <th> 사용하면 자동으로 정렬/볼드 처리해줌
for(var j=2 ; j<10 ; j++) {		// 단
//	document.write("<td>" + j + " 단</td>");
	document.write("<th>" + j + " 단</th>");	// <th> : 테이블 헤더 붙일 때 사용
}
document.write("</tr>");

for(var i=1 ; i<10 ; i++) {			// 곱
	document.write("<tr>");
	for(var j=2 ; j<10 ; j++) {		// 단
		document.write("<td>" + j + " * " + i + " = " + j*i + "</td>");
	}
	document.write("</tr>");
}

document.write("</table>");

//////////

document.write("<h2>마름모 : 해보자</h2>");

// -->
</script>