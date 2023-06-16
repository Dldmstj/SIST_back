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
# 요청값 중에 동일한 key로 여러 개의 데이터를 전송하는 경우
1. query string:
	페이지?key1=value1&key2=value2&key3=value3
2. 이런 요청 처리
	1) 구매 물건을 여러 개 전송
	2) 등록할 회원 정보를 여러 개 전송
	3) checkbox에 의해 선택된 정보가 여러 개일 경우
3. 기능 메서드
	String arry[] = request.getParameterValues("다중key");
	for(String str:arry){
		out.print(str)			
	}
	for(String str:arry){
		int num = Integer.parseInt(str)
		out.print(num)
		tot += num;
	}
	a03_step03.jsp?fruit=사과&fruit=바나나&fruit=딸기&cnt=2&cnt=3&cnt=5
	a03_step03.jsp?cnt=2&cnt=3&cnt=5
 --%>
 <%
	String fruits [] = request.getParameterValues("fruit");
 	if(fruits != null)
 		for(String fruit:fruits){
 			out.print("<h2>구매할 과일: "+fruit+"</h2>");
 		}
	String cnts [] = request.getParameterValues("cnt");
	if(cnts != null){
		int tot = 0;
 		for(String cnt:cnts){
 			int cntI = Integer.parseInt(cnt);
 			tot += cntI;
 			out.print("<h2>구매할 갯수: "+cntI+"</h2>");
 		}
	out.print("총 구매 갯수: " + tot);
	}
 %>
</body>
</html>