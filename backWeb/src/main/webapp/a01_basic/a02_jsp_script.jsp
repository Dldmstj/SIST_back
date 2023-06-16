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
# jsp의 스크립트
1. 동적으로 자바코드가 처리되는 내용을 말하고, 3가지 유형으로 구성된다.
	1) 선언부(declaration)
		<%!
		
		%>
		사이에 들어가는 변수/상수/메서드 선언부를 말한다
		class 바로 밑에 선언 부분
	2) 스크립트릿(scriptlet) - 스크립트 조각,,?
	3) 표현식(expression)
 --%>
 <%!
 // jsp가 java로 변경될 때, class명 밑에서 선언되는 부분
 	String pname="사과";
 	String getName(){
 		return pname;
 	}
 %>
 <h2>변수 호출: <%=pname %></h2>
 <h2>메서드 호출: <%=getName() %></h2>
</body>
</html>