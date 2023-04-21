<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<script type="text/javascript">
// <!--

var answers_quz = [];

function oncalc() {
//	var answers_sub = document.getElementsByName("answer");		// answer_sub[i].value 하면 error
	var answers_sub = homework["answer"];
	var corrects = 0;
	var score = 0;
	
	for(var i=0 ; i<answers_sub.length ; i++) {
//		document.write("answers_quz[" + i + "] : " + answers_quz[i]       + " :: ");
//		document.write("answers_sub[" + i + "] : " + answers_sub[i].value + "<br>");
		if(answers_quz[i] == answers_sub[i].value) {
			corrects++;
		}
	}
	
	score = corrects * 10;
	
//	document.write("corrects : " + corrects);
//	document.write("score : " + score);
	homework.result_count.value = corrects;
	homework.result_score.value = score;

	corrects = 0;
	score    = 0;
}

// -->
</script>

<h2>구구단 문제</h2>
<br>

<form name='homework'>	
	<table border='1'>

<script type="text/javascript">
// <!--
for(var i=0 ; i<10 ; i++) {
	var num1 = (parseInt(Math.random() * 8) + 2);
	var num2 = (parseInt(Math.random() * 9) + 1);
	answers_quz[i] = num1 * num2;
	
	document.write(		"<tr>");
	document.write(			"<th>" + num1 + " * " + num2 + " = </th>");
	document.write(			"<td><input type='text' name='answer'></td>");
	document.write(		"</tr>");
}
// -->
</script>

		<tr>
			<td align='center' colspan=2>
				<input type='button' value='제출' onclick='oncalc()'>
				<input type='reset'  value='취소'>
			</td>
		</tr>
	</table>
	<table>
		<tr>
			<th>맞은 개수 :</th>
			<td><input type='text' name='result_count' readonly></td>
		</tr>
		<tr>
			<th>점수 :</th>
			<td><input type='text' name='result_score' readonly></td>
		</tr>
		<tr>
			<td>
				랜덤으로 구구단 문제 출제<br>
				제출을 누르면 맞은 개수와 점수 출력
			</td>
		</tr>
	</table>
</form>
