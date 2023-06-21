<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%--
# form형식으로 다중 데이터 전송
1. form하위 요청값은 name을 동일하게 하면, 요청페이지에서
	request.getParameterValues를 통해서 배열로 처리할 수 있다.
2. 단, <input type="checkbox"인 경우 check가 된 것만 배열로 전달한다.
	

 --%>
 	<h2>동일한 name값 여러 데이터 전달</h2>
	<form action="a07_rev.jsp">
		등록회원1:<input type="text" name="member"/><br>
		등록회원2:<input type="text" name="member"/><br>
		등록회원3:<input type="text" name="member"/><br>
		구매할물건1가격:<input type="text" name="price"><br>
		구매할물건2가격:<input type="text" name="price"><br>
		구매할물건3가격:<input type="text" name="price"><br>
		<input type="submit"/>
	</form>

</body>
</html>