<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>day2jstl7_2.jsp</title>
	</head>
	<body>
		<h1>day2jstl7과 day2jstl7_2는 변수 공유를 하지 않는다 : ${myInt}</h1>
		 <!-- myInt는 day2jstl7_2.jsp에서 사용할 수 없는 변수 -->
		<h2>변수 공유를 하지 않는 이유는 day2jstl7 따로 컴파일 + day2jstl7_2 따로 컴파일하여 결과만 합치기 때문!!!</h2>
	</body>
</html>