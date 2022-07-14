<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>day1el1.jsp</title>
	</head>
	<body>
		<h1>EL : Expression Language : $와 중괄호를 사용하여 출력을 표현</h1>
		<h1>${ 1 + 1 } : jsp 출력 태그(&lt;%=출력%&gt;)의 다른 모습</h1>
		<h1>${ "10" + 1 } </h1> <!-- 11 -->
		<h1>${ null + 1 } </h1> <!-- null + 숫자 = 숫자 -->
		<h1>+ : ${ "10" + "10" } </h1> <!-- 20 -->
		<h1>+ - * / : ${ 123 + 4 } ${ 123 - 4 } ${ 123 * 4 } ${ 123 / 4 } ${ 123 % 4 }</h1>
			<!-- 127 119 492 30.75 3 -->
		<h1>div mpd : ${ 123 div 4 } : ${ 123 mod 4 }</h1>
			<!-- div = /(나누기) , mod = % (나머지) -->
		<h1>eq ne : ${ 123 == 4 } : ${ 123 eq 4 } : ${ 123 != 4 } : ${ 123 ne 4 } </h1>
			<!-- == : eq / != : ne -->
		<h1>gt lt : ${ 123 > 4 } : ${ 123 gt 4 } : ${ 123 < 4 } : ${ 123 lt 4 } </h1>
			<!-- > : gt / < : lt -->
		<h1>ge le : ${ 123 >= 4 } : ${ 123 ge 4 } : ${ 123 <= 4 } : ${ 123 le 4 } </h1>
			<!-- >= : ge / <= : le -->
		<h1>and : ${ true and true } : ${ true and false } : ${ false and true } : ${ false and false } </h1>
		<h1>or : ${ true or true } : ${ true or false } : ${ false or true } : ${ false or false } </h1>
		<h1>not : ${ !true } : ${ not true } </h1>
		<h1>3항 연산자 (1 > 3)? : ${ (1 > 3) ? "참" : "거짓" } </h1>
	</body>
</html>