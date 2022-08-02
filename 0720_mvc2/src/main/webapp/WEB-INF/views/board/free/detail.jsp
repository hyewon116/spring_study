<%@page import="kr.co.ictedu.board.free.FreeBoardDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title> 자유 게시판 상세 보기 </title>
		<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
		<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
		<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
	</head>
	<body>
	<%@ include file="/WEB-INF/views/header.jsp" %>
		<hr>
		<h2> 자유 게시판 상세 보기 </h2>
		<hr>
		
		<table class="table table-hover">
			<tbody>
				<tr>
					<th>글 번호</th> <td> ${detail_dto.board_no}</td> <!-- controller에서 받아온 detail_dto 값 -->
					<th>제목</th> <td>${detail_dto.title}</td>
				</tr>
				<tr>
					<th>작성자</th> <td> ${detail_dto.writer}</td>
					<th>작성일</th> <td>${detail_dto.write_date}</td>
				</tr>
				<tr>
					<th>내용</th> <td colspan="3"> ${detail_dto.contents}</td>
				</tr>
			</tbody>
		</table>
		<hr>
		<div class="input-group">
			<!-- 비밀번호 입력란  -->
			<input type="text" id="pwd" name="pwd" maxlength="20" class="form-control"> 
			<div class="input-group-append">
				<button id="btn_delete" class="btn btn-danger"> 게시글 삭제 </button>		
			</div>
		</div>
		<a href="${pageContext.request.contextPath}/board/free/update_form?board_no=${detail_dto.board_no}">
			<button class="btn btn-primary"> 게시글 수정하기 </button>
		</a>
		<a href="${pageContext.request.contextPath}/board/free/final_list">
			<button class="btn btn-info"> 목록으로 </button>
		</a>
	<%@ include file="/WEB-INF/views/footer.jsp" %>
	<script type="text/javascript">
		$(document).ready(function() {
			$("#btn_delete").click(function() {
				
				if( $("#pwd").val() == "" ) { //비밀번호 입력 안하면 return
					alert("삭제 비밀번호를 입력해주세요.");
					return;
				}
				
				$.get( //버튼을 클릭하면 controller의 /delete로 가라 (board_no 정보를 안고)
					 	"${pageContext.request.contextPath}/board/free/delete" 
					 	, {
					 		board_no : ${detail_dto.board_no}
					 		, pwd : $("#pwd").val() 
					 		//board_no와 pwd란 이름의 데이터를 전달 (DTO 네임과 같아야 하고, controller에서도 같은 이름 써야 함.)
					 	}
					 			
					 	, function(data, status) {
					 		//alert(data);
					 		if(data >= 1) {
					 			alert("게시글이 삭제되었습니다.");
					 			location.href = "${pageContext.request.contextPath}/board/free/final_list";
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