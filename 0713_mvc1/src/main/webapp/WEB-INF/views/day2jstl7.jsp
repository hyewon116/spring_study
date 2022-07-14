<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>day2jstl7.jsp</title>
	</head>
	<body>
		<h1> c:import - 다른 페이지를 컴파일 후, 결과만 가져 온다.(변수 공유 안 됨) </h1>
		<h2> include file = "./header.jsp" - 다른 페이지를 복사해 온 후, 컴파일을 함께 한다.(변수 공유 됨) </h2>
		<hr>
		<h2>url="./day2jstl16.jsp" : day2jstl6.jsp의 실행 결과를 가져오는 표현</h2>
		<h2>c:import 내부의 c:param은 day2jstl6.jsp로 보내는 data들을 정의한 것이다.</h2>
		<hr>
		<c:set var="myInt" value="12345"></c:set>
		<c:import url="day2jstl6.jsp"> <!-- 6번 파일을 import 하면서, param 데이터를 가지고 가서 컴파일 함 -->
			<c:param name="bno" value="115" />
			<c:param name="btitle" value="holiday" />
			<c:param name="bwriter" value="ro" />
			<c:param name="bcnts" value="i want holiday" />
			<c:param name="bdate" value="08-15" />
			<!-- day2jstl6.jsp를 컴파일 한 결과를 가져오는데, 
			c:param에 정의된 값들을 day2jstl6.jsp로 가져가서,
			컴파일 및 수행하고 결과만을 가져온다. -->
		</c:import>
		<hr>
		<c:import url="./day2jstl7_2.jsp" /> 
		<hr>
		<c:import url="day2jstl4.jsp" /> <!-- 해당 파일에서 정의된 변수와 값은 가져옴. -->
	</body>
</html>