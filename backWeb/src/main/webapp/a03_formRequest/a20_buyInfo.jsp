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
<%
	String pname = request.getParameter("pname");
	String prices = request.getParameter("price");
	String cnts = request.getParameter("cnt");
	if(pname == null) pname = "";
	int price = 0;
	int cnt = 0;
	int tot = 0;
	
	if(prices != null) price = Integer.parseInt(prices);
	if(cnts != null) cnt = Integer.parseInt(cnts);
	tot = price * cnt;
%>
    <div class="container mt-3">
    	<h2>구매물품 등록</h2>
    	<form method="post">
         	<div class="mb-3 mt-3">
            <label for="pname">물건명:</label>
            <input type="text" class="form-control" 
      	     id="pname" placeholder="물건명 입력" name="pname">
            <label for="price">가격:</label>
            <input type="number" class="form-control" 
      	     id="price" placeholder="가격 입력" name="price">
            <label for="cnt">갯수:</label>
            <input type="text" class="form-control" 
      	     id="cnt" placeholder="갯수 입력" name="cnt">
         	</div>
         	
         	<button type="submit" class="btn btn-primary">등록</button>
     	</form>
		<h2>구매물품</h2>
		<table class="table table-striped table-hover">
			<thead class="table-success">
		      	<tr  class="text-center">
				    <th>물건명</th>
				    <th>가격</th>
				    <th>갯수</th>
				    <th>총액</th>
		      	</tr>
		    </thead>
		    <tbody>
			   	<tr  class="text-center">
			        <td><%=pname %></td>
			        <td><%=price %></td>
			        <td><%=cnt %></td>
			        <td><%=tot %></td>
			   	</tr>
		 	</tbody>
		</table>      	
    </div>
</body>
</html>