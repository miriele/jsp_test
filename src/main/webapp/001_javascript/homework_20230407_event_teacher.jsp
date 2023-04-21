<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<h2>구구단 문제</h2>
<br>

<script type="text/javascript">
// <!--

var m    = [];
var SIZE = 10;

for(var i=0 ; i<SIZE ; i++) {
	m[i]    = [];									// 2차원 배열 만들기
	m[i][0] = (parseInt(Math.random() * 8) + 2);
	m[i][1] = (parseInt(Math.random() * 9) + 1);
	m[i][2] = m[i][0] * m[i][1];
}

document.write(	"<form name='inputform'>");
document.write(		"<table border='1'>");

var answers_quz = [];

for(var i=0 ; i<SIZE ; i++) {
	document.write(		"<tr>");
	document.write(			"<th>" + m[i][0] + " * " + m[i][1] + " = </th>");
	document.write(			"<td><input type='text' name='id_" + i + "'></td>");
	document.write(		"</tr>");
}

document.write(			"<tr>");
document.write(				"<th align='center' colspan=2>");
document.write(					"<input type='button' value='제출' onclick='oncalc()'>");
document.write(					"<input type='reset'  value='취소'");
document.write(				"</th>");
document.write(			"</tr>");
document.write(		"</table>");

document.write(		"맞은 개수 : <input type='text' name='result_count' readonly><br>");	
document.write(		"점수      : <input type='text' name='result_score' readonly><br>");	
document.write(		"<br>");	
document.write(	"</form>");

document.write(		"랜덤으로 구구단 문제 출제<br>");	
document.write(		"제출을 누르면 맞은 개수와 점수 출력");	

function oncalc() {
	var corrects = 0;
	var score    = 0;
	
	for(var i=0 ; i<SIZE ; i++) {
		if(m[i][2] == eval("inputform.id_" + i + ".value")) {
			corrects++;
			score += 10;
		}
	}
	
	inputform.result_count.value = corrects;
	inputform.result_score.value = score;
	
	corrects = 0;
	score    = 0;
}

// -->
</script>

