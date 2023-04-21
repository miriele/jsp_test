<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<h2>javascript - simple</h2>

<script type="text/javascript">
	// <!--
	// document.write()
	document.write("우리나라" + "<br>");
	document.write(10+20+"<br>");
	
	// window functions
	//window.alert("경고창");
	//window.prompt("입력 : ");
	//window.confirm("할거야 말거야?");
	//window.open();
	//window.close();
	//window.print();
	
	// data types
	// boolean
	document.write(true+"<br>");
	
	// typeof()
	document.write(typeof("ABC")+"<br>");
	document.write(typeof(10.5)+"<br>");
	document.write(typeof(true)+"<br>");

	// variable
	var a	= 18;
	var b	= "ABC";
	document.write("a : " + a + "<br>");
	document.write("b : " + b + "<br>");
	
	// type casting
	document.write(typeof(10) + "<br>");
	document.write(typeof("123")+"<br>");
	document.write(typeof(String(10)) + "<br>");
	document.write(typeof(Number("123"))+"<br>");
	
	// calc : +
	document.write("5  + 2"  + "<br>");	// String
	document.write("5" + "2" + "<br>");	// String + String
	document.write("5" + 2   + "<br>");	// String + Number -> String + String
	document.write(5   + "2" + "<br>");	// Number + String -> String + String
	document.write(5   + 2   + "<br>");	// Number + Number

	// calc : -
	document.write("5  - 2"  + "<br>");	// String
	document.write("5" - "2" + "<br>");	// String - String -> Number - Number
	document.write("5" - 2   + "<br>");	// String - Number -> Number - Number
	document.write(5   - "2" + "<br>");	// Number - String -> Number - Number
	document.write(5   - 2   + "<br>");	// Number - Number

	// calc : /
	document.write("5  / 2"  + "<br>");	// String
	document.write("5" / "2" + "<br>");	// String / String -> Number / Number
	document.write("5" / 2   + "<br>");	// String / Number -> Number / Number
	document.write(5   / "2" + "<br>");	// Number / String -> Number / Number
	document.write(5   / 2   + "<br>");	// Number / Number

	// ==, !=   (비교연산자) : 0 false '' "" 같은 값으로 취급
	if(0 == false)	document.write("같다<br>");
	if(0 == "")		document.write("같다<br>");
	if("" == false)	document.write("같다<br>");
	if("10" == 10)	document.write("같다<br>");
	
	// ===, !== (일치연산자) : 0 false '' "" 다른 값으로 취급
	if(0 === false)		document.write("같다<br>")
	else				document.write("다르다<br>");
	if(0 === "")		document.write("같다<br>");
	else				document.write("다르다<br>");
	if("" === false)	document.write("같다<br>");
	else				document.write("다르다<br>");
	if("10" === 10)		document.write("같다<br>");
	else				document.write("다르다<br>");
	
	// array
	/*
	c		int m[3];
			int m[3] = {10, 20, 30};
	java	int m[]	 = new int[3];
			int m[]	 = {10, 20, 30};
	*/
	// javascript는 중괄호 {, }를 json에서 사용하기 때문에
	// 배열은 대괄호 [, ]를 사용한다
	var m = [];
	var m = [10, 20, 30]; 
	
	for(var i=0 ; i<m.length ; i++) {
		document.write("m[" + i + "] : " + m[i] + "<br>");
	}
	
	// javascript는 runtime에 배열의 크기를 조정할 수 있어서
	// 초기화한 크기보다 큰 index에 접근하는 것도 가능
	m[3] = 40;
	
	// for(in) : 배열에서 index에 해당하는 값이 아니라, index 자체가 리턴됨 
	for(var i in m) {
		document.write(i + "<br>");
	}
	
	// switch ~ case
	/*
	// 일반적인 switch ~ case 사용법
	var a = window.prompt("정수 : ");
	switch(a) {
	case "1" : document.write("하나" + "<br>"); break;
	case "2" : document.write("둘" + "<br>"); break;
	case "3" : document.write("셋" + "<br>"); break;
	default : document.write("숫자" + "<br>"); break;
	}
	switch(Number(a)) {
	case 1 : document.write("하나" + "<br>"); break;
	case 2 : document.write("둘" + "<br>"); break;
	case 3 : document.write("셋" + "<br>"); break;
	default : document.write("숫자" + "<br>"); break;
	}
	*/

	/*
	// javascript에서만 가능한 특이한 switch ~ case 사용법
	var score = Number(window.prompt("점수 : "));
	switch(true) {
	case score >= 90 : document.write("A학점<br>"); break;
	case score >= 80 : document.write("B학점<br>"); break;
	case score >= 70 : document.write("C학점<br>"); break;
	case score >= 60 : document.write("D학점<br>"); break;
	default			 : document.write("F학점<br>"); break;
	}
	*/
	
	// 짧은 조건문
	// &&
	// : 앞쪽이 true  면 && 뒤 조건을 실행
	// : 앞쪽이 false 면 조건문 자체가 false가 되므로 && 뒤 조건은 실행하지 않음
	// 
	// ||
	// : 앞쪽이 false 면 || 뒤 조건을 실행
	// : 앞쪽이 true  면 조건문 자체가 false가 되므로 || 뒤 조건은 실행하지 않음
	true  && document.write("true  && 실행<br>");
	false && document.write("false && 실행<br>");
	true  || document.write("true  || 실행<br>");
	false || document.write("false || 실행<br>");
	// -->
</script>