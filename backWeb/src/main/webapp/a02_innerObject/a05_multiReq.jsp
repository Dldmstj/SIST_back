<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%--

# 여러 유형 데이터 받기 정리
1. default 문자열 받기
2. 숫자형(정수형/실수형)
3. boolean형 받기
 --%>
</head>
<body>
	<h1>구매한 과일!</h1>
	<%
	// ?fruits=사과&fruits=바나나&fruits=포도
	String fruits[] = request.getParameterValues("fruits");
	if(fruits!=null){
		for(String fruit:fruits){
			out.print("<h2>"+fruit+"</h2>");
		}
	}
	
	//?members=짱구&members=맹구&members=훈이
	// ex) 가입할 회원의 id들을 반복문을 통해
/* 		1)
		2)
		3) @@@ 넘버링되어 출력하게 하세요 */
	String members[] = request.getParameterValues("members");
	out.println("<h1>가입한 회원 id</h1>");
	if(members!=null){
	out.println("<ol>");
		for(String member: members){
			out.println("<li>"+member+"</li>");
		}
	out.println("<ol>");
	}
	%>
<%--
	장바구니에서 최종 결제할 내용을 check후, 결제 내역을 출력해서 화면에 표시할 때
 --%>
	<h2>구매한 물건들의 가격과 총계</h2>
	<%
	//?price=3000&price=2000&price=1000
	String pricesS[] = request.getParameterValues("price");
	int tot=0;
	if(pricesS != null){
		for(int idx=0; idx<=pricesS.length;idx++){
			int price = Integer.parseInt(pricesS[idx]);
			out.print("<h2>"+(idx+1)+") "+price+"</h2>");
			tot += price;
		}
	}
	%>
	총계: <%=tot %>
</body>
</html>