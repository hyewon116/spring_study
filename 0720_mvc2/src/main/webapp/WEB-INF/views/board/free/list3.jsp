<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title> 페이지 연습 </title>
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
		<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
		<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
		<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
	</head>
	<body>
	<%@ include file="/WEB-INF/views/header.jsp" %>
		<hr>
		<h3>페이지 연습</h3>
		<hr>
		<c:forEach var="page_no" begin = "${startPageNum}" end = "${endPageNum}">
			<c:choose>
				<c:when test = "${page_no == userWantPage}">
					${page_no}
				</c:when>
				<c:otherwise>
					<a href="${pageContext.request.contextPath}/board/free/list3?userWantPage=${page_no}">
						${page_no}
					</a>
				</c:otherwise>
			</c:choose>
		</c:forEach>
	<%@ include file="/WEB-INF/views/footer.jsp" %>
	</body>
</html>