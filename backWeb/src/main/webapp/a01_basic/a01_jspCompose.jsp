<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%-- 
    # jsp는 위 page 지시자에 의해 servlet에서 설정하는 response의 설정부분을 처리하고
    # out.print()를 통해 처리할 내용 코드를 html 화면에서 처리하는 것이다.
    # servlet에서 처리하는 java 코드는 <%%>, <%=%>를 통해서 html 중간중간에 추가해서 최종적으로
    	html+java를 만들어 client에 전달한다. 
     --%>
     <%
     // 자바 코드
     // PrintWriter out = response.getWriter(); 내장되어 있음
     // service(request, response) 메서드로 감싸고 있고, 주요 내장 객체들은 벌써 선언된 상태임
     // out, session, request, response 내장되어 선언된 것을 감싸고 있기에 가능하다.
     out.print("<h2>hello</h2>");
     session.setAttribute("s01","himan");
     String name = request.getParameter("name");
     String name01 ="홍길동";
     int age = 25;
     String loc ="서울";
     // jsp는 java + html을 servlet으로 만든 최종 html을 client 브라우저에 전달하기에,
     // java코드는 보이지 않는다.
     %>
     
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>name: <%=name01 %></h2>
	<%-- <%=변수명%>: java로 선언된 내용을 html코드와 함께 출력할 때, 사용하는 expression형식 처리 --%>
	<h2>age: <%=age %></h2>
	<h2>loc: <%=loc %></h2>
</body>
</html>