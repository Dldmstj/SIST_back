<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>    
<c:set var="path" 
	value="${pageContext.request.contextPath}"/>
<fmt:requestEncoding value="utf-8"/>
 
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
    <title>Insert title here</title>
   
    <script src = "https://code.jquery.com/jquery-3.7.0.js" type="text/javascript"></script>
    
    <script type="text/javascript">
    	// window.onload와 동일한 메서드
    	$(document).ready( function(){
    		
    		//$("h2").text("jquery 로딩 성공")
    		// h2 클릭시.. /buyProduct.do
    		// 호출해서 문자열을 alert()으로 출력
    		// 요청값
    		$("#regBtn").click(function(){
    			var pnameVal = $("#pname").val()
    			// ex) 물건명 가격 개수 입력 클릭사.
    			//     전달되는 구매물품은 @@ 이고, 총비용은 @@원입니다.
    			//     출력..
    			// buyProduct.do?pname=사과
    			$.ajax({
    				url:"${path}/product.do",
    				data:"pname="+pnameVal, // controller에 요청값을 전송
    				type:"post",
    				dataType:"text",
    				success:function(data){
    					alert(data)
    				},
    				error:function(err){
    					console.log("#에러 발생#")
    					console.log(err)
    				}
    			})
    		})
    	});
    </script>      
    
    
</head>
<body>
    <div class="container mt-3">
    	<h2>구매 물건 정보 로딩</h2>
	  	<nav class="navbar navbar-expand-sm bg-dark navbar-dark">
	  		<div class="container-fluid">    	
	    	<form method="post"  class="d-flex align-items-center" >
	            <input type="text" class="form-control me-2" 
	      	     id="pname" placeholder="물건명 입력"  name="pname"  aria-label="Search">
	         	<button type="button" id="regBtn"
	         	 class="btn btn-primary" style="width:200px;">물건명 로딩</button>
	     	</form>
	 	    </div>
	 	</nav>
		<table class="table table-striped table-hover">
			<thead class="table-success">
		      	<tr  class="text-center">
				    <th>Firstname</th>
				    <th>Lastname</th>
				    <th>Email</th>
		      	</tr>
		    </thead>
		    <tbody>
			   	<tr  class="text-center">
			        <td>John</td>
			        <td>Doe</td>
			        <td>john@example.com</td>
			   	</tr>
		 	</tbody>
		</table>      	
    </div>
</body>
</html>