<%@page import="backWeb.z01_vo.Dept"%>
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
 <%
 String deptnoS = request.getParameter("deptno");
 String dname = request.getParameter("dname");
 String loc = request.getParameter("loc");
 int deptno = 0;
 if(deptnoS !=null){
 	deptno = Integer.parseInt(deptnoS);
 }
 // 초기값과 비교 처리
	 Dept d = new Dept(deptno,dname,loc);
/* 	 log("# 회원등록 VO로 성공 #");
	 log(d.getDeptno());
	 log(d.getDname());
	 log(d.getLoc()); */
 
 %>
 <script type="text/javascript">
 	function checkValid(){
 		// 유효성 check 처리 ..
 		// 1) 필수데이터 입력 처리
 		// 2) 아이디 사전 check
 		// 3) pw 확인
 		// 4) 숫자형/날짜 데이터 확인
 	}
 </script>
<body>
    <div class="container mt-3">
    	<h2>사원정보 등록</h2>
    	<form action="" method="post">
         	<div class="mb-3 mt-3">
            <label for="deptno">부서번호:</label>
            <input type="number" class="form-control" 
      	     id="deptno" placeholder="부서번호 입력" name="deptno">
         	</div>
         	<div class="mb-3 mt-3">
            <label for="dname">부서이름:</label>
            <input type="text" class="form-control" 
      	     id="dname" placeholder="부서이름 입력" name="dname">
         	</div>
         	<div class="mb-3 mt-3">
            <label for="loc">주소:</label>
            <input type="text" class="form-control" 
      	     id="loc" placeholder="주소 입력" name="loc">
         	</div>
         	<button type="submit" class="btn btn-primary">등록</button>
     	</form><br>
		<table class="table table-striped table-hover">
			<thead class="table-success">
		      	<tr  class="text-center">
				    <th>부서번호</th>
				    <th>부서이름</th>
				    <th>부서이름</th>
		      	</tr>
		    </thead>
		    <tbody>
			   	<tr  class="text-center">
			        <td><%=d.getDeptno()%></td>
			        <td><%=d.getDname()%></td>
			        <td><%=d.getLoc()%></td>
			   	</tr>
		 	</tbody>
		</table>      	
    </div>
</body>
</html>