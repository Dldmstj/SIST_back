<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	String name=request.getParameter("name");
	String korS = request.getParameter("kor");
	String engS = request.getParameter("eng");
	int kor =0;
	int eng =0;
	int tot = kor + eng;
	
	if(korS != null){
		kor = Integer.parseInt(korS);
	}
	if(engS != null){
		eng = Integer.parseInt(engS);
	}
%>
<h3>이름: <%=name %></h3>
<h3>국어: <%=kor %>점</h3>
<h3>영어: <%=eng %>점</h3>
<h3>합산: <%=tot %>점</h3>
<h3>국어(+10): <%=kor+10 %>점</h3>

<%--
?name=신짱구&kor=60&eng=70
 --%>
</body>
</html>