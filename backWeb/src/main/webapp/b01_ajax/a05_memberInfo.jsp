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
	function call(){
		var xhr = new XMLHttpRequest();
		xhr.open("get","z05_json2.jsp",false);
		xhr.send();
		var data = xhr.responseText;
		var obj = JSON.parse(data);
		var tds = document.querySelectorAll("tbody td");
		tds[0].innerText = obj.name;
		tds[1].innerText = obj.age;
		tds[2].innerText = obj.loc;
	}
</script>
<body>
    <div class="container mt-3">
    	<h2>회원 정보</h2>
    	<form method="post">
         	<button onclick="call()" type="button" class="btn btn-primary">회원정보가져오기</button>
     	</form>
		<table class="table table-striped table-hover">
			<thead class="table-success">
		      	<tr  class="text-center">
				    <th>이름</th>
				    <th>나이</th>
				    <th>사는곳</th>
		      	</tr>
		    </thead>
		    <tbody>
			   	<tr class="text-center">
			        <td></td>
			        <td></td>
			        <td></td>
			   	</tr>
		 	</tbody>
		</table>      	
    </div>
</body>
</html>