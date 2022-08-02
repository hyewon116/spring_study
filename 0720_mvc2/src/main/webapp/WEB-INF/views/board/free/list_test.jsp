<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>  
	<head>
		<meta charset="UTF-8">
		<title> 자유 게시판 목록 </title>
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
		<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
		<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
		<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
	</head>
	<body>
	<%@ include file="/WEB-INF/views/header.jsp" %>
		<hr>
		<a href="${pageContext.request.contextPath}/board/free/fbwrite_form" class="clearfix">
			<button type="button" class="btn btn-primary"> 글 쓰러 가기 </button>
		</a>
		<hr>
		<table class="table table-hover">
			<thead>
				<tr>
					<th>글 번 호 </th> <th> 제목 </th> <th> 작 성 자 </th> <th>작 성 일 </th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="dto" items ="${list}">
					<tr>
						<td>${dto.board_no}</td> 
						<td>${dto.title}</td>
						<td>${dto.writer}</td>    
						<td>${dto.write_date}</td>
					</tr> 
				</c:forEach>
			</tbody>
		</table>
	<%@ include file="/WEB-INF/views/footer.jsp" %>
	</body>
</html>