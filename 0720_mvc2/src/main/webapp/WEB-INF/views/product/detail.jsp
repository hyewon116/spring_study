<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
	<head>
		<meta charset="UTF-8">
		<title> 상품 상세 보기 </title>
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
		<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
		<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
		<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
		
		<style type="text/css">
		#thumbnail{
			width : 300px;
			height : 300px;
		}
	</style>	
	</head>
	<body>
	<%@ include file="/WEB-INF/views/header.jsp" %>
		<hr>
		<h3> 상품 상세 보기 </h3>
		<hr>
		<table class="table">
			<col class="w-25">
			<tbody>
				<tr>
					<td rowspan="7"><img id="thumbnail" src="${detail_dto.thumbnail_path}"></td>
					<td colspan="4"><h2><em>${detail_dto.prdt_name}</em></h2></td>
				</tr>
				<tr>
					<th> 판 매 가 </th>
					<td colspan="3">
						<del><em>${detail_dto.price} 원</em></del>
						<h3><em>${detail_dto.sale_price} 원</em></h3>
						<h5><em>( ${detail_dto.discount} % 판매자 할인! )</em></h5>
					</td>
				</tr>
				<tr>
					<th> 재 고 수 량 </th>
					<td>${detail_dto.qty}</td>
					<th> 판 매 자 </th>
					<td>${detail_dto.mid}</td>
				</tr>
				<tr>
					<td colspan="4" class="text-right">
						<button type="button" id="jang_btn" class="btn btn-primary btn-lg"> 장 바구니 담기 </button>
						<button type="button" id="buy_btn" class="btn btn-primary btn-lg"> 바로 구매 하기 </button>
					</td>
				</tr>
			</tbody>
		</table>
		<table class="table">
			<tbody>
				<tr>
					<th> 상 품 설 명 </th>
					<td colspan="2">${detail_dto.description}</td>
				</tr>
				<tr>
					<th> 상 품 상 세 이 미 지 </th>
					<td colspan="2"><img src="${detail_dto.prdt_img_path}"></td>
				</tr>
				<tr>
					<th> 상 품 설 명 이 미 지 </th>
					<td colspan="2"><img src="${detail_dto.desc_img_path}"></td>
				</tr>
				<tr>
					<th> 첨 부 문 서 </th>
					<td colspan="2">
						<a href="${pageContext.request.contextPath}/file/download?path=${detail_dto.add_file_path}">
							${detail_dto.add_file_name}
						</a>
					</td>
				</tr>
			</tbody>
		</table>
		<hr>
		<c:if test="${detail_dto.mno == login_info.mno}">
			<div class="text-center">
				<button id="delete_btn" class="btn btn-danger"> 상 품 삭 제 </button>
				<a href="${pageContext.request.contextPath}/product/uform?prdt_no=${detail_dto.prdt_no}">
					<button class="btn btn-primary"> 상 품 수 정 </button>
				</a>
			</div>
			<hr>
		</c:if>
	<%@ include file="/WEB-INF/views/footer.jsp" %>
	<script type="text/javascript">
	$(document).ready(function() {
		$("#delete_btn").click(function() {

			$.get(
					"${pageContext.request.contextPath}/product/delete"
					, {
						prdt_no : ${detail_dto.prdt_no}
					}
					, function(data, status) {
						if( data >= 1 ){
							alert("상품이 삭제 되었습니다.");
							location.href="${pageContext.request.contextPath}/product/list";
						} else if( data <= 0 ) {
							alert("상품 삭제를 실패 하였습니다.");
						} else {
							alert("잠시 후 다시 시도해 주세요.");
						}
					}//call back function
			);//get

		});//click
	});//ready
	</script>
	</body>
</html>














