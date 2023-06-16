<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<%
	String pname = request.getParameter("pname");
	String priceS = request.getParameter("price");
	String pCntS = request.getParameter("pCnt");
	int price = 0;
	int pCnt = 0;
	if(priceS != null){
		price = Integer.parseInt(priceS);
	}
	if(pCntS != null){
		pCnt = Integer.parseInt(pCntS);
	}
	int tot = price * pCnt;
%>
<body>
	<h3>구매물품: <%=pname %></h3>
	<h3>구매가격: <%=price %>원</h3>
	<h3>구매갯수: <%=pCnt %>개</h3>
	<h3>총 금액: <%=tot %>원</h3>
<%--
?pname=감자&price=2000&pCnt=7
 --%>
</body>
</html>