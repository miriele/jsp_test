<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<script type="text/javascript">
// <!--
document.write("<h2>함수 funciton</h2>");

////////////////////////////////////////////////////////////////////////////////
// 선언적 함수
////////////////////////////////////////////////////////////////////////////////
function hap(a, b) {
	return a+b;
}

document.write("합 : " + hap(5, 2) + "<br>");
document.write("<br>");


////////////////////////////////////////////////////////////////////////////////
// 익명 함수
////////////////////////////////////////////////////////////////////////////////

//document.write("차 : " + cha(5, 2) + "<br>")	// 구현부 상단에 호출부가 먼저 올 수 없다

var cha = function(a, b) {
	return a-b;
}

document.write("차 : " + cha(5, 2) + "<br>")
document.write("차 : " + cha(5.5, 2.7) + "<br>")
document.write("차 : " + cha("5", "2") + "<br>")
document.write("<br>");

// 매개변수 개수가 달라도 오류가 나지는 않는다
document.write("차 : " + cha(5, 2, 7) + "<br>")	// 넘치는 부분은 무시한다 	
document.write("차 : " + cha(5) + "<br>")		// 모자라면 연산이 안되기 때문에 NaN(Not a Number) 출력
document.write("<br>");

//window.prompt("입력 : ");						// 모자라면 전달된 것만 사용
//window.prompt("입력 : ", "값 : ");


////////////////////////////////////////////////////////////////////////////////
// 익명 함수
////////////////////////////////////////////////////////////////////////////////

// isNaN
document.write("isNaN : " + isNaN("123") + "<br>");
document.write("isNaN : " + isNaN(123) + "<br>");
document.write("isNaN : " + isNaN("ABC") + "<br>");
document.write("<br>");

// parseInt, parseFloat
document.write("parseInt   : " + parseInt(10.5) + "<br>")
document.write("parseFloat : " + parseInt(10) + "<br>")
document.write("parseFloat : " + parseInt("10.3") + "<br>")
document.write("<br>");

// eval
document.write("eval : " +     ("2 + 5") + "<br>");
document.write("eval : " + eval("2 + 5") + "<br>");
document.write("<br>");

// 문자열 함수
var str = "Hello Javascript!!!";
document.write("bold    : " + str.bold()    + "<br>");
document.write("italics : " + str.italics() + "<br>");
document.write("strike  : " + str.strike()  + "<br>");

document.write("sup  : " + str + "r".sup()  + "<br>");
document.write("sub  : " + str + "r".sub()  + "<br>");

document.write("fontcolor : " + str.fontcolor("red")  + "<br>");
document.write("fontsize  : " + str.fontsize(5)       + "<br>");
document.write("<br>");

////////////////////////////////////////////////////////////////////////////////
// Builtin Class : Date
////////////////////////////////////////////////////////////////////////////////

var now = new Date();

document.write(
		now.getFullYear()    + "년 " +
		(now.getMonth() + 1) + "월 " +
		now.getDate()		 + "일 " +
		now.getHours()		 + "시 " +
		now.getMinutes()	 + "분 " +
		now.getSeconds()	 + "초 " +
		now.getDay()		 + "요일"
		);
document.write("<br><br>");


////////////////////////////////////////////////////////////////////////////////
// Builtin Class : Array
////////////////////////////////////////////////////////////////////////////////

var m = new Array(4, 10, 50, 45, 1);

for(var i=0 ; i<m.length ; i++) {
	document.write("m[" + i + "] : " + m[i] + "<br>");
}

document.write("<br>");

m[6] = 60;

for(var i=0 ; i<m.length ; i++) {
	document.write("m[" + i + "] : " + m[i] + "<br>");
}

document.write("<br>");
document.write(m + "<br>");
document.write(m.join() + "<br>");
document.write(m.join("/") + "<br>");
document.write(m.slice(2, 5) + "<br>");		// end - 1

// sort는 데이터 형이 숫자의 경우 문자열로 간주하여 정렬
// 예상 정렬 결과 : 1, 4, 10, 45, 50, 60, 
// 실제 정렬 결과 : 1, 10, 4, 45, 50, 60,
document.write(m.sort() + "<br>");			
document.write("<br>");


////////////////////////////////////////////////////////////////////////////////
// Builtin Class : Math
////////////////////////////////////////////////////////////////////////////////

document.write("random()         : " + Math.random() + "<br>");
document.write("random() [1~100] : " + (parseInt(Math.random() * 100) + 1) + "<br>");
document.write("<br>");

// 1~45 로또
for(var i=0 ; i<6 ; i++) {
	document.write("random() lotto[" + (i+1) + "] : " + (parseInt(Math.random() * 45) + 1) + "<br>");
}


// -->
</script>

<br><br><br><br><br><br><br><br><br><br>
<br><br><br><br><br><br><br><br><br><br>
