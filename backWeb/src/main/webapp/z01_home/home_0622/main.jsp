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
<%
String id = request.getParameter("id");
String pw = request.getParameter("pw");
request.setAttribute("id",id);
request.setAttribute("pw",pw);

%>
<body>
    <div class="container mt-3">
    	<h2>Main</h2>
    	<form action="" method="post">
         	<div class="mb-3 mt-3">
            <label for="id">아이디</label>
            <input type="text" class="form-control" 
      	     id="id" placeholder="아이디 입력" name="id" value="<%=id%>">
         	</div>
         	<div class="mb-3 mt-3">
            <label for="ename">비밀번호</label>
            <input type="password" class="form-control" 
      	     id="pw" placeholder="패스워드 입력" name="pw" value="<%=pw%>">
         	</div>
         	<button type="submit" class="btn btn-primary">등록</button>
     	</form>
		
    </div>
</body>
</html>