<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>day2jstl8_2.jsp</title>
	</head>
	<body>
		<h2>c:import를 통해 가져온 파일 : day2jstl8_2</h2>
		<h3>day2jstl8.jsp에서 선언한 변수 iVar는 출력되는가? : ${iVar}</h3>
		<c:set var="iVar2" value="888" />
		<h3>day2jstl8_2.jsp에서 자체 선언한 변수 iVar2는 출력되는가? : ${iVar2}</h3>
	</body>
</html>