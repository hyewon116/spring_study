<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
		<div class="container">
			<div class="text-right">
				<c:choose>
					<c:when test="${login_info != null && login_info.mid != null}">
					${login_info.mid}
						<a href="${pageContext.request.contextPath}/logout"> LOGOUT </a>
					</c:when>
					<c:otherwise>
						<a href="${pageContext.request.contextPath}/login_form"> LOGIN </a>
						<a href="${pageContext.request.contextPath}/join/form"> JOIN </a>
					</c:otherwise>
				</c:choose>
			</div>
			<nav class="navbar navbar-expand-sm bg-dark navbar-dark">
				<!-- Brand -->
				<a class="navbar-brand" href="${pageContext.request.contextPath}/">HOME</a>
				
				<!-- Links -->
				<ul class="navbar-nav">

					<li class="nav-item">
						<a class="nav-link" href="${pageContext.request.contextPath}/board/member/list">
							멤버 게시판</a>
					</li>

					<!-- Dropdown -->
					<li class="nav-item dropdown">
						<a class="nav-link dropdown-toggle" href="#" id="navbardrop" data-toggle="dropdown">
							자유 게시판
						</a>
						<div class="dropdown-menu">
							<a class="dropdown-item" href="${pageContext.request.contextPath}/board/free/final_list">
								자유 게시판 : Searching + Paging + List</a>
							<a class="dropdown-item" href="${pageContext.request.contextPath}/board/free/list">
								list : only list</a>
							<a class="dropdown-item" href="${pageContext.request.contextPath}/board/free/list2">
								list2 : only paging</a>
							<a class="dropdown-item" href="${pageContext.request.contextPath}/board/free/list3">
								list3 : paging + link</a>
							<a class="dropdown-item" href="${pageContext.request.contextPath}/board/free/list4">
								list4 : paging + link + list</a>
							<a class="dropdown-item" href="${pageContext.request.contextPath}/board/free/search1">
								search1 : search + list</a>
						</div>
					</li>

					<!-- Dropdown -->
					<li class="nav-item dropdown">
						<a class="nav-link dropdown-toggle" href="#" id="navbardrop" data-toggle="dropdown">
							상품
						</a>
						<div class="dropdown-menu">
							<a class="dropdown-item" href="${pageContext.request.contextPath}/product/list">
								상품 목록</a>
							<a class="dropdown-item" href="${pageContext.request.contextPath}/product/form">
								판매자 상품 등록</a>
						</div>
					</li>

					<!-- Dropdown -->
					<li class="nav-item dropdown">
						<a class="nav-link dropdown-toggle" href="#" id="navbardrop" data-toggle="dropdown">
							조회 연습
						</a>
						<div class="dropdown-menu">
							<a class="dropdown-item" href="${pageContext.request.contextPath}/test/dong_code">
								동 코드 조회 연습</a>
							<a class="dropdown-item" href="${pageContext.request.contextPath}/test/dong_search">
								연관 검색어 조회 연습</a>
						</div>
					</li>

					<!-- Dropdown -->
					<li class="nav-item dropdown">
						<a class="nav-link dropdown-toggle" href="#" id="navbardrop" data-toggle="dropdown">
							파일 업로드
						</a>
						<div class="dropdown-menu">
							<a class="dropdown-item" href="${pageContext.request.contextPath}/file1/form">
								파일 업로드 연습</a>
							<a class="dropdown-item" href="${pageContext.request.contextPath}/file2/form">
								AJAX 파일 업로드 연습</a>
						</div>
					</li>

				</ul>
			</nav>
			<main>
