<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
	<head>
		<meta charset="UTF-8">
		<title> 파일 업로드 결과 정보 </title>
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
		<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
		<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
		<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
	</head>
	<body>
	<%@ include file="/WEB-INF/views/header.jsp" %>
		<hr>
		<h3> 파일 업로드 결과 정보 </h3>
		<hr>
		<h5>${file_content_type}</h5>
		<h5>${file_name}</h5>
		<h5>${file_size}</h5>
		<h5>${file_original_name}</h5>
		
		<a href="${pageContext.request.contextPath}/">
	 		<img src="${pageContext.request.contextPath}/resources/img/peach.jpg"> 
	 	</a>
		
	<%@ include file="/WEB-INF/views/footer.jsp" %>
	</body>
</html>