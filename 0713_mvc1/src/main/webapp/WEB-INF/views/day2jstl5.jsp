<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>day2jstl5.jsp</title>
	</head>
	<body>
		<h1>c:url - request.setParameter + 서버 주소 지정을 하는 수단 </h1>
		<h3>var : 변수 이름 </h3>
		<h3>value : 서버 주소 </h3>
		<h3>c:param : request.setParameter</h3>
		<h3>(spring) pageContext.request.contextPath = (jsp) request.getContextPath() </h3>
		
		<c:url var="urlName" value="/jstl6" > <!-- jstl6 : pid -->
			<c:param name="bno" value="112" />   <!-- parameter의 name값과 dto 변수명이 같아야 함. -->
			<c:param name="btitle" value="demian" />
			<c:param name="bwriter" value="heming" />
			<c:param name="bcnts" value="sad" />
			<c:param name="bdate" value="08-15" />
		</c:url>
		<h3> <a href="${urlName}"> Parameter 예제 바로가기 </a></h3>
	</body>
</html>