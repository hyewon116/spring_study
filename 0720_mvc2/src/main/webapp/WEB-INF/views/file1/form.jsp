<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
	<head>
		<meta charset="UTF-8">
		<title> 파일 업로드 연습 1 </title>
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
		<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
		<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
		<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
	</head>
	<body>
	<%@ include file="/WEB-INF/views/header.jsp" %>
		<hr>
		<h3> 파일 업로드 연습 4 (폼 전송 통한 파일 업로드 최종 형태) </h3>
		<hr>
		<form id="upload_form4" method="post" enctype="multipart/form-data"
			action="${pageContext.request.contextPath}/file1/upload4">
			
			<input type="text" name="file_memo" class="form-control">
			
			<div class="form-inline">
				<input type="file" name="upload_file" class="form-control">
				<button type="submit" class="btn btn-primary"> 파일 업로드 실행 </button>
			</div>
		</form>	
		
		<hr>
		<h3> 파일 업로드 연습 1 </h3>
		<hr>
		
		<form id="upload_form" method="post" enctype="multipart/form-data"
			action="${pageContext.request.contextPath}/file1/upload1">
			
			<div class="form-inline">
				<input type="file" name="upload_file_1" class="form-control">
				<button type="submit" class="btn btn-primary"> 파일 업로드 실행 </button>
			</div>
			
		</form>
		
		<hr>
		<h3> 파일 업로드 연습 2 </h3>
		<hr>
		
		<form id="upload_form2" method="post" enctype="multipart/form-data"
			action="${pageContext.request.contextPath}/file1/upload2">
			
			<div class="form-inline">
				<input type="file" name="file" class="form-control">
				<button type="submit" class="btn btn-primary"> 파일 업로드 실행 </button>
			</div>
			
		</form>
			
		<hr>
		<h3> 파일 업로드 연습 3 </h3>
		<hr>
		<form id="upload_form3" method="post" enctype="multipart/form-data"
			action="${pageContext.request.contextPath}/file1/upload3">
			
			<div class="form-inline">
				<input type="file" name="file" class="form-control">
				<button type="submit" class="btn btn-primary"> 파일 업로드 실행 </button>
			</div>
			
		</form>	
		

	<%@ include file="/WEB-INF/views/footer.jsp" %>
	</body>
</html>