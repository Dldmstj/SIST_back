<%@page import="backWeb.a01_servlet.Member"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%-- 
	# 단일 객체를 가져와서 화면에 처리하기
	1. 단일 객체를 필요로 하는 화면 확인
	2. 해당 화면에 필요한 속성들 정의
	3. 속성들을 class객체로 선언. get/set 처리
	4. 상단 directive 부분 <%@에서 외부클래스 import선언
	5. 객체 생성 및 데이터 할당
	6. 객체의 getXXXX()메서드를 통해 화면에 출력
--%>
<%
	Member m = new Member("himan","7777","홍길동","관리자", 9000);
%>

<h2>내 정보</h2>
<table border>
	<col width="40px"><col width="60%">
	<tr><th>아이디</th><th><input type="text" value="<%=m.getId() %>" size="9"/></th></tr>
	<tr><th>비밀번호</th><th><input type="password" value="<%=m.getPw() %>" size="9"/></th></tr>
	<tr><th>이름</th><th><input type="text" value="<%=m.getName() %>" size="9"/></th></tr>
	<tr><th>권한</th><th><input type="text" value="<%=m.getAuth() %>" size="9"/></th></tr>
	<tr><th>포인트</th><th><input type="text" value="<%=m.getPoint() %>" size="9"/></th></tr>
	<tr><th colspan="2">
	포인트</th><input type="text" value="" size="9"/><th><input type="text" value="" size="9"/>
	</th></tr>
</table>
</body>
</html>