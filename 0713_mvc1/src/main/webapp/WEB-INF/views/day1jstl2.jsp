<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>day1jstl2.jsp</title>
	</head>
	<body>
		<h1>prefix="c" : jstl을 사용하겠다는 선언(표현)</h1>
		<hr>
		<h1>c:if - 단일 if문(else if 또는 else 표현이 없다.)</h1>
		<h2>c:if test="&#36;{ testBool == false }" : if(testBool == false)</h2> <!-- test : 키워드. 바꿀 수 없음. -->
		<c:set var="testBool" value="true" />
		<!-- testBool의 값을 true/false로 바꾸면서 테스트 해보세요. -->
		<c:if test="${ testBool == false }">
			<h2><font color="red">거짓말</font></h2>
		</c:if>
		<c:if test="${ testBool == true }">
			<h2><font color="blue">참말</font></h2>
		</c:if>
		<hr>
		<h1>c:choose - 다중 if문(else if 또는 else 표현이 있다.)</h1>
		<h1>c:when - else if</h1>
		<h1>c:otherwise - else</h1>
		<c:set var="jumsu" value="77" /> <!-- jumsu의 값을 바꾸며 테스트해보세요. -->
		<c:choose>
			<c:when test="${ jumsu > 90 }"> A GRADE </c:when>
			<c:when test="${ jumsu > 80 }"> B GRADE </c:when>
			<c:when test="${ jumsu > 70 }"> C GRADE </c:when>
			<c:when test="${ jumsu > 60 }"> D GRADE </c:when>
			<c:otherwise> F GRADE </c:otherwise>
		</c:choose>
		<!-- c:when :else if(jumsu > 90) -->
		<!-- c:otherwise : else -->
	</body>
</html>






