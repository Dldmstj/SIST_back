<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
    <title>Insert title here</title>
</head>
<body>
    <div class="container mt-3">
    <h2>Top</h2>
    	<%
     	String id = request.getParameter("id");
     	String pw = request.getParameter("pw");
     	if(id != null) {
     		if(id.equals("himan")&&pw.equals("7777")) {
     	%>
     		<h3><%=id %> 로그인 중</h3>
     	<%}else{ %>		
     		<h3>login 하세요</h3>
     	<%}
     	
     	}%>
    </div>
</body>
</html>