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
	function callAjax(){
		var xhr = new XMLHttpRequest()
		xhr.open("get","z03_data.jsp",false);
		xhr.send()
		var data = xhr.responseText
		var arry = data.split(",")
		var inputVal = document.querySelector("#data").value
		var hasData = false;
		arry.forEach(function(data,idx){
			if(inputVal == data){
				hasData = true;		
			}
		})
		if(hasData = true){
			alert("등록된 데이터")
		}else{
			alert("등록되지 않은 데이터")
		}
		
	}
</script>
<body>
    <div class="container mt-3">
    	<h2>등록 여부 확인</h2>
    	<form method="post">
         	<div class="mb-3 mt-3">
            <label for="data">데이터 등록 여부 확인</label>
            <input type="text" class="form-control" 
      	     id="data" placeholder="데이터 입력" name="data">
         	</div>
         	<button onclick="callAjax()" class="btn btn-primary">등록여부확인</button>
     	</form>
		
    </div>
</body>
</html>