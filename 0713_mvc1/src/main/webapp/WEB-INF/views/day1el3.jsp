<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>day1el3.jsp</title>
	</head>
	<body>
		<h1>model에서 map 받기</h1> <!-- map은 통째로 불러오면 복잡.. -->
		<h1>${ mymap.get("반장") } : ${ mymap.get("부반장") } : ${ mymap.get("부장") }</h1>
		
		<hr>
	
		<h1>model에서 list 받기</h1>
		<h1>${ mylist }</h1>
		<h1>${ mylist.get(0) } : ${ mylist.get(1) } : ${ mylist.get(2) }</h1>
		
	</body>
</html>