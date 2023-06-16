<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form action="a05_record.jsp">
		이름 <input type="text" name="name"/><br>
		국어 <input type="text" name="kor"/><br>
		영어 <input type="text" name="eng"/><br>
		수학 <input type="text" name="math"/><br>
		<input type="submit" value="전달"/>
	</form>
	<%
	String name = request.getParameter("name");
	String ks = request.getParameter("kor");
	String es = request.getParameter("eng");
	String ms = request.getParameter("math");
	int kor = 0;
	int eng = 0;
	int math = 0;
	
	if(ks != null) kor = Integer.parseInt(ks);
	if(es != null) eng = Integer.parseInt(es);
	if(ms != null) math = Integer.parseInt(ms);
	
	int tot = kor + eng + math;
	int avg = tot/3;
	%>
	이름 <%= name %><br>
	국어 <%= kor %><br>
	영어 <%= eng %><br>
	수학 <%= math %><br>
	총합 <%= tot %><br>
	평균 <%= avg %>
</body>
</html>