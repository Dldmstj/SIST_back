<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%!
	String pname = "감자";
	int price = 2000;
	String str(){
		return pname +"(" + price +")";
	}
%>
<h2>물건명 호출: <%=pname %></h2>
<h2>가격 호출: <%=price %></h2>
<h2>메서드 호출: <%=str() %></h2>
</body>
</html>