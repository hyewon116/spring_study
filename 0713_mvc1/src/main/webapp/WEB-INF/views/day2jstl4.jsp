<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>day2jstl4.jsp</title>
	</head>
	<body>
		<h1>c:forTokens - 구분자를 기준으로 문자열 자르기</h1>
		<c:set var="fruits" value="apple,banana,cherry,melon,peach" />
		<c:forTokens var="fruit" items="${fruits}" delims="," varStatus="status">
			<h3>${fruit} : ${status.index} : ${status.count}</h3>
		</c:forTokens>
		<h2>var : 변수 이름 선언</h2>
		<h2>items : for문을 돌릴 대상 객체</h2>
		<h2>delims : 내용을 자를 기준이 되는 구분자</h2>
	</body>
</html>