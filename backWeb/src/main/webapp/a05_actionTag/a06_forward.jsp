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
<%--
# forward 처리 예제1
1. a06_forward.jsp
	form으로 금액 입력
	금액에 따라서
	 50000 이상 MVP 사이트	a07_mvp.jsp
	 50000 미만 일반 사이트 a08_nor.jsp
 --%>
<body>
    <div class="container mt-3">
    	<h2>구매 금액을 입력하세요</h2>
    	<form action="" method="post">
         	<div class="mb-3 mt-3">
            <label for="pay">구매 금액:</label>
            <input type="number" class="form-control" 
      	     id="pay" placeholder="구매 금액 입력" name="pay">
         	</div>
         	<button type="submit" class="btn btn-primary">입력</button>
     	</form>
     	<%
     	String payS = request.getParameter("pay");
     	if(payS != null) {
     		int pay = Integer.parseInt(payS);
     		if(pay >=5000) {
     	%>
     		<jsp:forward page="a07_mvp.jsp"/>
     	<%}else{ %>		
     		<jsp:forward page="a08_nor.jsp"/>
     	<%}
     	
     	}%>
     	<%--
     		ex) a09_auth.jsp
     			form에 권한이 선택적으로 관리자일 때는 a10_admin.jsp
     			그 외는 a11_user.jsp 으로 이동하게 하세요.
     	 --%>
    </div>
</body>
</html>