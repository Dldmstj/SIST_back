<%@page import="backWeb.a01_servlet.Product"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%--
	ex) 구매물품 상세 정보로 테이블과 form요소 객체를 이용하여 물건명, 가격, 갯수, 상품정보
	등을 table안에 표현하되, vo객체를 만들어 value값에 할당하세요.
 --%>
 <%
Product prd = new Product("감자",2000,5,"감자info");
 %>
 <form>
	 <table border>
	 	<tr><th>물건명</th><th>가격</th><th>갯수</th><th>상품정보</th></tr>
	 	<tr>
	 		<td><input type="text" value="<%=prd.getPname() %>" size="5"/></td>
	 		<td><input type="text" value="<%=prd.getPrice() %>" size="5"/></td>
	 		<td><input type="text" value="<%=prd.getPcnt() %>" size="5"/></td>
	 		<td><input type="text" value="<%=prd.getPinfo() %>" size="5"/></td>
	 	</tr>
	 </table>
 </form>
</body>
</html>