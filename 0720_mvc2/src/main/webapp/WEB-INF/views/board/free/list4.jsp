<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>자유 게시판 페이징</title>
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
		<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
		<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
		<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
	</head>
	<body>
	<%@ include file="/WEB-INF/views/header.jsp" %>
		<hr>
		<h3>자유 게시판 페이징</h3>
		<hr>
		<table class="table table-hover">
			<thead>
				<tr>
					<th> 글 번 호 </th>   <th> 제 목 </th>  <th> 작 성 자  </th>  <th> 조 회 수  </th>  <th> 작 성 일 </th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="dto" items="${list}">
					<tr>
						 <td>${dto.board_no}</td>  
						 <td>
						 	<a href="${pageContext.request.contextPath}/board/free/detail?board_no=${dto.board_no}">
						 		${dto.title}
						 	</a>
						 </td>
						 <td>${dto.writer}</td>
						 <td>${dto.view_cnt}</td>
						 <td>${dto.write_date}</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		<hr>
		<hr>
		
	<ul class="pagination"> <!-- 부트스트랩 디자인 적용 -->
		<c:if test="${startPageNum > 10}">
			<li class="page-item">
				<a class="page-link" 
				href="${pageContext.request.contextPath}/board/free/list4?userWantPage=${startPageNum-1}">
					Previous
				</a>
			</li>		
		</c:if>
		<c:forEach var="page_no" begin="${startPageNum}" end="${endPageNum}">
			<c:choose>
				<c:when test="${page_no == userWantPage}">
					<li class="page-item active">
						<a class="page-link">${page_no}</a>
					</li>
				</c:when>
				<c:otherwise>
					<li class="page-item">
						<a class="page-link" 
						href="${pageContext.request.contextPath}/board/free/list4?userWantPage=${page_no}">
							${page_no}
						</a>
					</li>
				</c:otherwise>
			</c:choose>
		</c:forEach>
		<c:if test="${lastPageNum > endPageNum}"> 
			<li class="page-item">
				<a class="page-link" 
				href="${pageContext.request.contextPath}/board/free/list4?userWantPage=${endPageNum+1}">
					Next
				</a>	
			</li>		
		</c:if>
	</ul>
	<%@ include file="/WEB-INF/views/footer.jsp" %>	
	</body>
</html>