<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>fbwrite_form.jsp</title>
		<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
		<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
		<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
		<script src="//cdn.ckeditor.com/4.19.0/full/ckeditor.js"></script>
		<style type="text/css">
		
		.write_label {
			font-size: 0.7em; 
			color: red;
		}
		</style>
	</head>
	<body>
	<%@ include file="/WEB-INF/views/header.jsp" %>
	
	<h2> 자유 게시판 글쓰기_test </h2>
	<table class="table table-hover">
		<tbody>
			<tr>
				<th> 제 목 </th>
				<td>
					<input type="text" id="title" name="title" maxlength="50" class="form-control">
					<label id="title_label" for="title" class="write_label"></label>
				</td>
			</tr>
			<tr>
				<th> 작 성 자</th>
				<td>
					<input type="text" id="writer" name="writer" maxlength="20" class="form-control">
					<label id="writer_label" for="writer" class="write_label"></label>
				</td>
			</tr>
			<tr>
				<th> 비 밀 번 호 </th>
				<td>
					<input type="password" id="pwd" name="pwd" maxlength="20" class="form-control">	
					<label id="pwd_label" for="pwd" class="write_label"></label>
				</td>
			</tr>
			<tr>
				<th> 내 용 </th>
				<td>
					<textarea rows="5" id="contents" name="contents"
							class="form-control"></textarea>
					<script type="text/javascript">
					CKEDITOR.replace('contents');
					</script>
					<label id="contents_label" for="contents" class="write_label"></label>
				</td>
			</tr>
		</tbody>		
	</table>
	<button type="button" id="write_btn"
						class="btn btn-success float-right"> 글 저 장 </button>
						
	<a href="${pageContext.request.contextPath}/board/free/final_list">
		<button class="btn btn-warning"> 글 작성 취소 </button>
	</a>	
	<%@ include file="/WEB-INF/views/footer.jsp" %>	
	
	<script type="text/javascript">
		$(document).ready(function() {
			$("#write_btn").click(function() {
				if( $.trim( $("#title").val() ) == "" ) {
					$("#title_label").text("제목을 입력하세요.");   
					return;
			} else { $("#title_label").text(""); }
				
				if( $.trim( $("#writer").val() ) == "") {
					$("#writer_label").text("작성자를 입력하세요.");
					return;
			} else { $("#writer_label").text(""); }
				
				if( $.trim( $("#pwd").val() ) == "") {
					$("#pwd_label").text("비밀번호를 입력하세요.");
					return;
			} else { $("#pwd_label").text(""); }
		
			if ( CKEDITOR.instances.contents.getData() == "" ) {
				$("contents_label").text("내용을 입력하세요.");
				return;
			} else { $("#contents_label").text(""); }
		
			$.post(
					"${pageContext.request.contextPath}/board/free/fbwrite"
					, {
						title : $("#title").val()
						, writer : $("#writer").val()
						, pwd : $("#pwd").val()
						, contents : CKEDITOR.instances.contents.getData()
					}
					, function(data, status) { 
						if(data >= 1) {
							alert("게시글이 성공적으로 업로드되었습니다.");
							location.href="${pageContext.request.contextPath}/board/free/final_list";
						} else if(data <= 0) {
							alert("게시글 작성을 실패하였습니다.");
						} else {
							alert("잠시 후 다시 시도해주세요.");
						}
					}//call back function 
			);//post
		});//click
	});//ready
	</script>
	</body>
</html>