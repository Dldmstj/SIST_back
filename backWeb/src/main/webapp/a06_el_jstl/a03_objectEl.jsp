<%@page import="backWeb.z01_vo.Job_history"%>
<%@page import="backWeb.z01_vo.ShMember"%>
<%@page import="backWeb.z01_vo.Person"%>
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
session.setAttribute("p01",new Person("홍길동",25,"서울"));
session.setAttribute("mem",new ShMember("himan","7777","홍길동","관리자",3000));

session.setAttribute("jh01",new Job_history(1,"2021-06-26","2023-06-26","job01",10));
%>
    <div class="container mt-3">
    	<h2>el 활용</h2>
    	<h3>employee_id: ${jh01.employee_id}</h3>
    	<h3>start_dateS: ${jh01.start_dateS}</h3>
    	<h3>end_dateS: ${jh01.end_dateS}</h3>
    	<h3>job_id: ${jh01.job_id}</h3>
    	<h3>department_id: ${jh01.department_id}</h3>
    	
    	<br>
    	<h3>이름: ${p01.name}</h3>
    	<%--
    		p01.getXXX
    		주의) getXXX로 호출되는 property
    	--%>
    	
    	<h3>나이: ${p01.age }</h3>
    	<h3>사는곳: ${p01.loc}</h3>
		<br>
		<h3>회원id: ${mem.getId()}</h3>
		<h3>회원pw: ${mem.getPw()}</h3>
		<h3>회원이름: ${mem.getName()}</h3>
		<h3>회원권한: ${mem.getAuth()}</h3>
		<h3>회원포인트: ${mem.getPoint()}</h3>
		
    	<form action="" method="post">
         	<div class="mb-3 mt-3">
            <label for="empno">사원번호:</label>
            <input type="number" class="form-control" 
      	     id="empno" placeholder="사원번호 입력" name="empno">
         	</div>
         	<div class="mb-3 mt-3">
            <label for="ename">사원명:</label>
            <input type="text" class="form-control" 
      	     id="ename" placeholder="사원명 입력" name="ename">
         	</div>
         	<button type="submit" class="btn btn-primary">등록</button>
     	</form>
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