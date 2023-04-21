<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<script>
// <!--

document.write("<h2>이벤트</h2>")

function clock() {
	var date = new Date();
	var now  = date.getHours() + " : " + date.getMinutes() + " : " + date.getSeconds();
	
	document.title = now;
	
//	setTimeout("clock()", 1000);	// setInterval을 사용하면 버튼 클릭하지 않아도 시계가 동작한다 
	
	var m = ["red", "blue", "green", "yellow", "pink"];
//	document.bgColor = m[date.getSeconds() % 5];	// 배경색
//	document.fgColor = m[date.getSeconds() % 5];	// 글자색
}

setInterval("clock()", 1000);

function setcolor() {
	document.bgColor = window.document.inputform.color.value;
}

function add() {
	inputform.result.value = eval(inputform.num1.value) + eval(inputform.num2.value);
}

function minus() {
	inputform.result.value = eval(inputform.num1.value) - eval(inputform.num2.value);
}

function multi() {
	inputform.result.value = eval(inputform.num1.value) * eval(inputform.num2.value);
}

function divide() {
	inputform.result.value = eval(inputform.num1.value) / eval(inputform.num2.value);
}

function gosite() {
	//location.href = inputform.site.options[inputform.site.selectedIndex].value;
	location = inputform.site.options[inputform.site.selectedIndex].value;
}

function myhobby() {
	var hobbyresult = document.getElementById("hobbyresult");
	var msg = "취미는 ";
	
	for(var i=0 ; i<inputform.hobby.length; i++) {
		if(inputform.hobby[i].checked) {
			msg += inputform.hobby[i].value + " ";
		}
	}
	
	msg += "입니다.<br>";
	hobbyresult.innerHTML = msg;
}

// -->
</script>

<form name="inputform">

	취미 : <input type="checkbox" name="hobby" value="독서"> 독서
		   <input type="checkbox" name="hobby" value="등산"> 등산
		   <input type="checkbox" name="hobby" value="운동"> 운동
		   <input type="checkbox" name="hobby" value="게임"> 게임
		   <input type="button" value="확인" onclick="myhobby()">
	<br>
	<div id="hobbyresult"></div>
	
	<br>
	목록 : <select name="site">
		<option value="http://www.daum.net">다음</option>
		<option value="http://www.naver.com">네이버</option>
		<option value="http://www.google.com">구글</option>
		<option value="http://www.nate.com">네이트</option>
	</select>
	<input type="button" value="이동" onclick="gosite()">
	<br>
	
	<br>
	사칙연산 : <input type="text" name="num1"> + <input type="text" name="num2">
				= <input type="text" name="result" readonly>

	<input type="button" value="+" onclick="add()">
	<input type="button" value="-" onclick="minus()">
	<input type="button" value="*" onclick="multi()">
	<input type="button" value="/" onclick="divide()">
	<br>


	<br>
	색상 : <input type="text" name="color">
	       <input type="button" value="색상" onclick="setcolor()">
	<br>

	<b onmouseover="document.bgColor='red'"    onmouseout="document.bgColor='white'">빨간색</b><br>
	<b onmouseover="document.bgColor='blue'"   onmouseout="document.bgColor='white'">파란색</b><br>
	<b onmouseover="document.bgColor='green'"  onmouseout="document.bgColor='white'">초록색</b><br>
	<b onmouseover="document.bgColor='yellow'" onmouseout="document.bgColor='white'">노란색</b><br>
	<b onmouseover="document.bgColor='pink'"   onmouseout="document.bgColor='white'">분홍색</b><br>
	<br>
</form>

<br><br>
현재시각 : <input type="button" value="시각" onclick="javascript:clock()"><br>