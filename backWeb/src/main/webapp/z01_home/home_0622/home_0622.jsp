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
<script type="text/javascript">
	function ckVal(){
		return true;
	}
</script>
<body>
<%
	int dan = (int)(Math.random()*8+2);
	int num = (int)(Math.random()*9+1);
	int cor = dan * num;
%>
    <div class="container mt-3">
    	<h2><%=dan %> X <%=num %> = ?</h2>
    	<form action="" onSubmit="return ckVal()" method="post">
         	<div class="mb-3 mt-3">
            <label for="my_a">정답을 입력하세요</label>
            <input type="number" class="form-control" 
      	     id="my_a" placeholder="정답 입력" name="my_a">
         	</div>
         	<button type="" class="btn btn-primary">제출</button>
     	</form>
     	<%
     	String my_aS = request.getParameter("my_aS");
        if(my_aS != null) {
     		int my_a = Integer.parseInt(my_aS);
     		if(my_a == cor) {
     	%>
     		<jsp:forward page="cor.jsp"/>
     	<%}else{ %>		
     		<jsp:forward page="home_0622.jsp"/>
     	<%}
     	}%>
    </div>
</body>

</html>