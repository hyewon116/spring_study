<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %> <!-- functions 수정!! -->
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>day2jstl11.jsp</title>
	</head>
	<body>
		<h1>jstl 문자열 function</h1>
		<c:set var="str" value="Nice To Meet You, Too." />
		<h3>str : ${str}</h3>
		<hr>
		<c:set var="strArr" value='${ fn:split(str, " ") }'/> <!-- 쌍따옴표 오류로 value ''로 묶음 -->
		                                                      <!-- 공백 기준으로 잘라라 -->
		<h3>
		<c:forEach var="let" items="${ strArr }">
			${let} <br>
		</c:forEach>
		</h3>
		<hr>
		<h3>fn:replace(str, "You", "U~~") : ${ fn:replace(str, "You", "U~~") }</h3> <!-- You를 U~~로 바꿔라 -->
		<h3>fn:substring(str, 3, 11) : ${ fn:substring(str, 3, 11) }</h3> <!-- 3번지에서 11번지까지 잘라라 -->
		<hr>
		<h3>fn:indexOf(str, "To") : ${ fn:indexOf(str, "To") }</h3> <!-- To가 몇번 인덱스에 있는지 -->
		<h3>fn:startsWith(str, "N") : ${ fn:startsWith(str, "N") }</h3> <!-- 시작 문자가 N이 맞는지 검사 -->
		<h3>fn:endsWith(str, "o.") : ${ fn:endsWith(str, "o.") }</h3> <!-- 마지막 문자가 o.이 맞는지 검사 -->
		<hr>
		<h3>fn:length(str) : ${fn:length(str)}</h3> <!-- functions는 <> 없이 사용 가능 -->
		<h3>fn:contains(str, "meet") : ${ fn:contains(str, "meet") }</h3> <!-- 해당 문자가 포함되어 있는지 검사 -->
		<h3>fn:containsIgnoreCase(str, "meet") : ${ fn:containsIgnoreCase(str, "meet") }</h3> <!-- 위 기능 + 대소문자 무시 -->
		<h3>fn:toLowerCase(str) : ${ fn:toLowerCase(str) }</h3>
		<h3>fn:toUpperCase(str) : ${ fn:toUpperCase(str) }</h3>
	</body>
</html>










