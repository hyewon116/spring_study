<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>day2jstl8.jsp</title>
	</head>
	<body>
		<c:set var="iVar" value="777" />
		<hr>
		<c:import url="./day2jstl8_2.jsp" />
		<hr>
		<h2>본체 : day2jstl8.jsp</h2>
		<h3>day2jstl8_2.jsp에서 선언한 iVar2를 참조할 수 있는가? : ${iVar2}</h3>
		
		<hr>
		<%@ include file="./day2jstl8_3.jsp" %> <!-- include는 변수가 서로 공유 됨 -->
		<hr>
		<h2>본체 : day2jstl8.jsp</h2>
		<h3>day2jstl8_3.jsp에서 선언한 iVar3를 참조할 수 있는가? : ${iVar3}</h3>
		<hr>
		<h4>결론 </h4>
		<h4>c:import 관계의 파일들은 서로 별개의 파일 -> 변수 공유 안 됨 </h4>
		<h4>include file 관계의 파일들은 하나의 파일 -> 변수 공유가 됨 </h4>
	</body>
</html>