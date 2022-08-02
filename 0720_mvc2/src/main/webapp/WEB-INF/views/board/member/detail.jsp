<%@page import="kr.co.ictedu.board.free.FreeBoardDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title> 멤버 게시판 상세 보기 </title>
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
		<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
		<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
		<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
	</head>
	<body>
	<%@ include file="/WEB-INF/views/header.jsp" %>
		<hr>
		<h2> 멤버 게시판 상세 보기 </h2>
		<hr>
		
		<table class="table table-hover">
			<tbody>
				<tr>
					<th>글 번호</th> <td> ${detail_dto.board_no}</td> <!-- controller에서 받아온 detail_dto 값 -->
					<th>제목</th> <td colspan="3">${detail_dto.title}</td>
				</tr>
				<tr>
					<th>작성자</th> <td> ${detail_dto.mid}</td>
					<th>작성일</th> <td>${detail_dto.write_date}</td>
					<th>조회수</th> <td>${detail_dto.view_count}</td>
				</tr>
				<tr>
					<th>내용</th> <td colspan="5"> ${detail_dto.contents}</td>
				</tr>
			</tbody>
		</table>
		<hr>
		<c:if test="${login_info.mid == detail_dto.mid}"> <!-- 로그인한 아이디랑 글 작성 아이디가 같을 때만 수정/삭제 가능 -->
				<button id="btn_delete" class="btn btn-danger float-right"> 게시글 삭제 </button>		
			<a href="${pageContext.request.contextPath}/board/member/update_form?board_no=${detail_dto.board_no}">
				<button class="btn btn-primary float-right"> 게시글 수정 </button>
			</a>
		</c:if>
			<a href="${pageContext.request.contextPath}/board/member/list">
				<button class="btn btn-info"> 목록으로 </button>
			</a>
			
	<%@ include file="/WEB-INF/views/footer.jsp" %>
	<script type="text/javascript">
		$(document).ready(function() {
			$("#btn_delete").click(function() {
				
				$.get(
					 	"${pageContext.request.contextPath}/board/member/delete" 
					 	, {
					 		board_no : ${detail_dto.board_no}
					 	}
					 			
					 	, function(data, status) {
					 		//alert(data);
					 		if(data >= 1) {
					 			alert("게시글이 삭제되었습니다.");
					 			location.href = "${pageContext.request.contextPath}/board/member/list";
					 		} else if (data <= 0) {
					 			alert("삭제할 수 없는 게시글입니다.");
					 			return;
					 		} else {
					 			alert("잠시 후 다시 시도해주세요.");
					 			return;
					 		}
						}//call back function
				);//get
			});
		});//ready
	</script>
	</body>
</html>