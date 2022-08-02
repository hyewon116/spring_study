<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
	<head>
		<meta charset="UTF-8">
		<title> 연관 검색어 조회 연습 </title>
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
		<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
		<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
		<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
	</head>
	<body>
	<%@ include file="/WEB-INF/views/header.jsp" %>
		<hr>
		<h3> 연관 검색어 조회 연습 </h3>
		<hr>
		<input type="text" id="txt_search" name="txt_search" class="form-control">
		<div id="result_div">
		</div>
	<%@ include file="/WEB-INF/views/footer.jsp" %>
	
	<script type="text/javascript">
	$(document).ready(function() {
		
		$("#txt_search").keyup(function() {
			
			if( $.trim( $("#txt_search").val() ) == "" || $.trim( $("#txt_search").val() ).length < 2 ) { //2글자부터만 검색되도록 설정  
				return;
			}
			
			$.get(
					"${pageContext.request.contextPath}/test/dong_name"
					, { key_word : $("#txt_search").val() }
					, function(data, status) { 
						$("#result_div").empty();
						$.each( JSON.parse(data), function(idx, dto) {
							$("#result_div").append("<h6 class='toTxtSearch'>" + dto.dong_name + "<h6>");
						});//each
						$(".toTxtSearch").on("click", function() { //alert( $(this).text() );
							$("#txt_search").val( $(this).text() ); //검색어 클릭하면 text 창에 들어오도록
						});//on (jquery에 이벤트를 발생시키려면 on을 써야 함)
					}//call back function
			);//get
		});//keyup
	});//ready
	</script>
	</body>
</html>