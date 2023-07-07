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
</head>
<script src="https://code.jquery.com/jquery-3.7.0.js" type="text/javascript"></script>
    <script type="text/javascript">
    	$(document).ready(function(){
    		// $("h2").text("jquery 로딩 성공")
    		$("regBtn").click(function(){
    			// $("#frm").serialize();
    			// form 하위에 name/value 를 기준으로, 자동으로 query string을 생성해준다.
    			var pnameVal = $("#pname").val()
    			console.log(pnameVal)
    			$.ajax({
    				url:"${path}/product.do",
    				data:"pname="+pnameVal,	// controller에 요청값을 전송
    				type: "post",
    				dataType: "text",
    				success: function(data){
    					alert(data)
    				},
    				error:function(err){
    					console.log("# 에러발생 #")
    					console.log(err)
    				}
    			})
    		})
    	});
	</script>
<body>
    <div class="container mt-3">
    	<h2>사원정보 등록</h2>
    	<nav class="navbar navbar-expand-sm bg-dark navbar-dark">
           <div class="container-fluid">       
          <form method="post"  class="d-flex align-items-center" id="frm" >
               <input type="text" class="form-control me-2" 
                 id="deptno" placeholder="부서번호 입력"  name="deptno"  aria-label="Search">
               <input type="text" class="form-control me-2" 
                 id="dname" placeholder="부서명 입력"  name="dname"  aria-label="Search">
               <input type="text" class="form-control me-2" 
                 id="loc" placeholder="부서위치 입력"  name="loc"  aria-label="Search">
               <button type="button" class="btn btn-primary" style="width:200px;">등록</button>
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