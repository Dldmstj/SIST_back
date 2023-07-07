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
    
	<script src="https://code.jquery.com/jquery-3.7.0.js" type="text/javascript"></script>
	
    <script type="text/javascript">
    	$(document).ready(function(){
    	// $("h2").text("jquery 로딩 성공")
	    	$("#btn").click(function(){
	    		var mnameVal = $("#mname").val()
	    		var singerVal = $("#singer").val()
	    		var pubyearVal = $("#pubyear").val()
	    		$.ajax({
	    			url:"${path}/music.do",
					type:"post",
					data: $("#frm").serialize(),
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
    	<h2>노래 정보 등록</h2>
    	<nav class="navbar navbar-expand-sm bg-dark navbar-dark">
           <div class="container-fluid">       
          <form method="post" id="frm" class="d-flex align-items-center" >
               <input type="text" class="form-control me-2" 
                 id="mname" placeholder="노래제목 입력"  name="mname"  aria-label="Search">
               <input type="text" class="form-control me-2" 
                 id="singer" placeholder="가수 입력"  name="singer"  aria-label="Search">
               <input type="text" class="form-control me-2" 
                 id="pubyear" placeholder="연도 입력"  name="pubyear"  aria-label="Search">
               <button type="button" id="btn" class="btn btn-primary" style="width:200px;">등록</button>
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