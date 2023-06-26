<%@page import="backWeb.a01_dao.A04_PreParedDao"%>
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
	if(id==null) id ="";
		// id 공백검사
	A04_PreParedDao dao = new A04_PreParedDao();
	int isExist = dao.getMemberid(id);
%>

<body>
    <div class="container mt-3">
    	<h2>id 중복검사</h2>
    	<form method="post">
         	<div class="mb-3 mt-3">
            <label for="id">id</label>
            <input type="text" class="form-control" 
      	     id="id" placeholder="id 입력" name="id">
         	</div>
         	<button type="submit" class="btn btn-primary">확인</button>
     	</form>
		 	
    </div>
</body>
<script type="text/javascript">
		var id = "<%=id%>"
		var isExist = "<%= isExist%>"
		<%-- id 공백검사 --%>
		if(id != ""){
			if(isExist == 1){
				alert("사용중인 id입니다.")
			}else if(isExist == 0){
				alert("사용할 수 있는 id입니다.")
				document.querySelector("#id").value(id);
			}else{
				alert("error")
			}
		}
		
		
</script>
</html>