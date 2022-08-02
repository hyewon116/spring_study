<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
	<head>
		<meta charset="UTF-8">
		<title> 동코드 조회 연습 </title>
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
		<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
		<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
		<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
	</head>
	<body>
	<%@ include file="/WEB-INF/views/header.jsp" %>
		<hr>
		<h3> 동코드 조회 연습 </h3>
		<hr>
		<table class="table table-hover">
			<tbody>
				<tr>
					<th> 시도 코드 </th>
					<td>
						<select id="sido" name="sido">
							<option value="0">선택하세요</option>
						</select>
					</td>
				</tr>
				<tr>
					<th> 구군 코드 </th>
					<td>
						<select id="gugun" name="gugun">
						</select>
					</td>
				</tr>
				<tr>
					<th> 동 코드 </th>
					<td>
						<select id="dong" name="dong">
						</select>
					</td>
				</tr>
			</tbody>
		</table>
	<%@ include file="/WEB-INF/views/footer.jsp" %>
	<script type="text/javascript">
	$(document).ready(function() {
		$("#gugun").change(function() {
			$.get(
					"${pageContext.request.contextPath}/test/dong"
					, { gugun_code : $("#gugun").val() }
					, function(data, status) { //alert(data);
						$("#dong").empty();
						$("#dong").append("<option value='0'>선택하세요</option>");
						$.each( JSON.parse( data ), function(idx, dto) {
							$("#dong").append("<option value='" + dto.dong_code + "'>" + dto.dong_name + "</option>");
						});//each
					}//call back function
			);//get
		});//change
	});//ready

	$(document).ready(function() {
		$("#sido").change(function() { //alert( $("#sido").val() );
			$.get(
					"${pageContext.request.contextPath}/test/gugun"
					, { sido_code : $("#sido").val() }
					, function(data, status) { //alert(data);
						$("#gugun").empty();
						$("#gugun").append("<option value='0'>선택하세요</option>");
						$.each(JSON.parse(data), function(idx, dto) {
							$("#gugun").append("<option value='" + dto.gugun_code + "'>" + dto.gugun_name + "</option>");
						});//each
					}//call back function
			);//get
		});//change
	});//ready

	$(document).ready(function() {
		$.get(
				"${pageContext.request.contextPath}/test/sido"
				, function(data, status) { //alert(data);
					//data == toJsonString( List<DongCodeDTO> )
					//JSON.parse(data) : string -> object
					$.each(JSON.parse(data), function(idx, dto) { //alert(dto.sido_name);
						$("#sido").append("<option value='" + dto.sido_code + "'>" + dto.sido_name + "</option>");
					});//each
				}//call back function
		);//get
	});//ready
	</script>
	</body>
</html>





