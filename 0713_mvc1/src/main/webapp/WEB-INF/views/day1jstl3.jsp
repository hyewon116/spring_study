<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>day1jstl3.jsp</title>
	</head>
	<body>
		mylist : ${mylist}
		<hr>
		
		<c:forEach var="str" items="${mylist}" varStatus="status"> <!-- 하나씩 꺼내 str에 담는다 -->
			<b>${str} : ${status.index} : ${status.count}</b><br>
		</c:forEach>
		<h2>items : forEach문의 대상 객체</h2>
		<h2>for(String str : mylist) : str = mylist.get(i)</h2>
		<h2>varStatus : 반복문의 반복 횟수를 기억하는 변수</h2>
		<h2>varStatus.index : 0에서부터 시작하는 반복문의 반복 횟수</h2>
		<h2>varStatus.count : 1에서부터 시작하는 반복문의 반복 횟수</h2>
		
		<hr>
		
		<h2>구구단</h2>
		<c:forEach var="dan" begin="2" end="9">
			<h3>${dan}단</h3>
			<c:forEach var="gop" begin="1" end="9">
				${dan} * ${gop} = ${dan * gop}<br>
			</c:forEach>
		</c:forEach>
		
		<hr>
		
		<h2>step : 건너 뛰는 값의 크기 </h2>
		<c:forEach var="i" begin="0" end="100" step="5"> <!-- step : 건너뛰기 -->
			<b> ${ i } </b>
		</c:forEach>
		<hr>
		<h2>for(int i = 1; i &lt;= 10; i++) - begin:시작값, end:종료값 </h2>
		<c:forEach var="i" begin="1" end="10">
			<h3>숫자 : ${ i }</h3>
		</c:forEach>	
	</body>
</html>







