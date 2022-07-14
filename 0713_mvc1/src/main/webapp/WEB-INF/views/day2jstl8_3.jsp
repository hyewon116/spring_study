<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>day2jstl8_3.jsp</title>
	</head>
	<body>
		<h2>include file을 통해 가져온 파일 : day2jstl8_3</h2>
		<h3>day2jstl8.jsp에서 선언한 변수 iVar는 출력되는가? : ${iVar}</h3>
		<c:set var="iVar3" value="999" />
		<h3>day2jstl8_3.jsp에서 자체 선언한 변수 iVar3는 출력되는가? : ${iVar3}</h3>
	</body>
</html>