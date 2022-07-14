<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %> <!-- 주소 마지막 core 아닌 fmt로 수정 -->

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>day2jstl10.jsp</title>
	</head>
	<body>
		<h1>jstl fmt : formating : 숫자 / 날짜 형식 </h1>
		<hr>
		
		<c:set var="price" value="1000000000"></c:set>
		<fmt:formatNumber type="number" var="priceNum" value="${price}" />
		<h3>priceNum : ${priceNum}</h3>
		<h3>
			<fmt:formatNumber type="currency" currencySymbol="$" value="${price}"/> 
		</h3>
		<h3>
			<fmt:formatNumber type="percent" currencySymbol="$" value="${price}"/> 
		</h3>
		
		<hr>
		
		<c:set var="now" value="<%= new Date() %>" /> <!-- java.util.Date import -->
		<h3>date : ${now}</h3>
		<h3>date full : 
			<fmt:formatDate type="date" dateStyle="full" value="${now}" />  
		</h3>
		<h3>date short : 
			<fmt:formatDate type="date" dateStyle="short" value="${now}" />  
		</h3>
		<h3>time full : <!-- type과 timeStyle 변경 주의!! -->
			<fmt:formatDate type="time" timeStyle="full" value="${now}" />  
		</h3>
		<h3>time short : 
			<fmt:formatDate type="time" timeStyle="short" value="${now}" />  
		</h3>
		<h3>
			both full : 
			<fmt:formatDate type="both" dateStyle="full" timeStyle="full" value="${now}" />
		</h3>
		<h3>
			both short : 
			<fmt:formatDate type="both" dateStyle="short" timeStyle="short" value="${now}" />
		</h3>
		<h3>
			date short time full : 
			<fmt:formatDate type="both" dateStyle="short" timeStyle="full" value="${now}" />
		</h3>
		<h3>
			date full time short : 
			<fmt:formatDate type="both" dateStyle="full" timeStyle="short" value="${now}" />
		</h3>
		<h3>
			YYYY-MM-dd hh:mm:ss   
			<fmt:formatDate value="${now}" pattern="YYYY-MM-dd hh:mm:ss" />
		</h3>
		<h3>
			YY/MM/dd HH:mm:ss   
			<fmt:formatDate value="${now}" pattern="YY/MM/dd HH:mm:ss" />
		</h3>
		<h3>
			YY/MM/dd HH:mm:ss   
			<fmt:formatDate value="${now}" pattern="YY/MM/dd HH:mm:ss" />
		</h3>
		
		<h3></h3>
	</body>
</html>