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
# 배열 데이터 처리
1. 배열을 이용하면 for문과 if문을 통해 다양한 형식의 웹화면을 처리할 수 있다.
 --%>
 <ol>
 <%
 String []fruits = {"사과","바나나","딸기"};
 for(String fruit:fruits){
%>
	<li><%=fruit %></li>
<%
 }
 %>
 </ol>
 <%-- 
 ex) select의 option에 맞는 부서 정보를 배열로 선언하고 출력하세요
 	select 인사/회계/재무/기획
  --%>
  <select>
  <%
  String []depts = {"인사","재무","회계","기획"};
  int []pcodes = {10,20,30,40};
  for(String dept:depts){
%>
	<option value=""><%=dept %></option>
<%
  }
  %>
  </select>
</body>
</html>