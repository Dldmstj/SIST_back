<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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
    		$("h2").text("jquery 로딩 성공")
    	});
    </script>
  <%--
  # jquery ajax 처리
  1. ${}
  2. 기본 속성
  	1) url : 호출하는 backend단 주소
  	2) type : "get/post"
  	3) data : 요청 query string
  				json 객체 형식
  				$("form").serialize() : form 하위 내용을 name과 value값 기준으로 쿼리 스트링을 만들어준다.
  				 key=value 형식으로 전환하여 처리
  	4) dataType : 서버에서 받는 데이터 유형
  		문자열(text, xml)을 받지만, "json" 객체로 변환해준다. JSON.parse() 를 처리하지 않아도 된다.
  	5) success:function(data){}
  		성공 시 받는 데이터 함수
  	6) error:function(err){}
  		실패 시 받는 데이터 함수
   --%>
<body>
    <div class="container mt-3">
    	<h2>사원정보 등록</h2>
    	<nav class="navbar navbar-expand-sm bg-dark navbar-dark">
           <div class="container-fluid">       
          <form method="post"  class="d-flex align-items-center" >
               <input type="text" class="form-control me-2" 
                 id="deptno" placeholder="부서번호 입력"  name="deptno"  aria-label="Search">
               <input type="text" class="form-control me-2" 
                 id="dname" placeholder="부서명 입력"  name="dname"  aria-label="Search">
               <input type="text" class="form-control me-2" 
                 id="loc" placeholder="부서위치 입력"  name="loc"  aria-label="Search">
               <button type="submit" class="btn btn-primary" style="width:200px;">등록</button>
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