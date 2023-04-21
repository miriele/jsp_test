<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<script type="text/javascript">
// <!--
document.write("<h2>클래스</h2>");

// object 객체
// java       : 모든 객체의 조상 객체
// javascript : 비어있는 객체

// 클래스 만들기 - 
function Member(name, age, tel) {
	this.name = name;
	this.age  = age;
	this.tel  = tel;
	
	this.getName = getName;
	this.getAge  = getAge;
	this.getTel  = getTel;
}

function getName() {
	return this.name;
}

function getAge() {
	return this.age;
}

function getTel() {
	return this.tel;
}

var kim = new Member("김유신", 30, "1111-2222");

document.write("이름     : " + kim.getName() + "<br>");
document.write("나이     : " + kim.getAge()  + "<br>");
document.write("전화번호 : " + kim.getTel()  + "<br>");
document.write("<br>");

//
function User(name, age, tel) {
	this.name = name;
	this.age = age;
	this.tel = tel;
	
	this.getName = function() {
		return this.name;
	}
	
	this.getAge = function() {
		return this.age;
	}
	
	this.getTel = function() {
		return this.tel;
	}
}


var lee = new User("이순신", 30, "2222-1111");

document.write("이름     : " + lee.getName() + "<br>");
document.write("나이     : " + lee.getAge()  + "<br>");
document.write("전화번호 : " + lee.getTel()  + "<br>");
document.write("<br>");

//
function Customer(name, age, tel) {
	this.name = name;
	this.age = age;
	this.tel = tel;
}

Customer.prototype.getName = function() {
	return this.name;
}

Customer.prototype.getAge = function() {
	return this.age;
}

Customer.prototype.getTel = function() {
	return this.tel;
}

var hong = new Customer("홍길동", 20, "2222-1111");

document.write("이름     : " + hong.getName() + "<br>");
document.write("나이     : " + hong.getAge()  + "<br>");
document.write("전화번호 : " + hong.getTel()  + "<br>");
document.write("<br>");

//
var kang = new Object();

kang.name = "강감찬";
kang.age  = 30;
kang.tel  = "3333-1111";

kang.getName = function() {
	return this.name;
}

kang.getAge = function() {
	return this.age;
}

kang.getTel = function() {
	return this.tel;
}

document.write("이름     : " + kang.getName() + "<br>");
document.write("나이     : " + kang.getAge()  + "<br>");
document.write("전화번호 : " + kang.getTel()  + "<br>");
document.write("<br>");

















// -->
</script>