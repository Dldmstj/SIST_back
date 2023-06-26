<%@page import="backWeb.z01_vo.Emp"%>
<%@page import="backWeb.a01_dao.A04_PreParedDao"%>
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
String empnoS = request.getParameter("empno");
String ename = request.getParameter("ename");
String job = request.getParameter("job");
String mgrS = request.getParameter("mgr");
String hiredate = request.getParameter("hiredate");
String salS = request.getParameter("sal");
String commS = request.getParameter("comm");
String deptnoS = request.getParameter("deptno");

int empno = 0;
if (empnoS != null) empno = Integer.parseInt(empnoS);
int mgr = 0;
if (mgrS != null) mgr = Integer.parseInt(mgrS);
double sal = 0;
if (salS != null) sal = Integer.parseInt(salS);
double comm = 0;
if (commS != null) comm = Integer.parseInt(commS);
int deptno = 0;
if (deptnoS != null) deptno = Integer.parseInt(deptnoS);

Emp emp = new Emp(empno,ename,job,mgr,hiredate,sal,comm,deptno);
A04_PreParedDao dao = new A04_PreParedDao();
dao.insertEmp(emp);

%>
<body>
    <div class="container mt-3">
    	<h2>사원정보 등록</h2>
    	<%--
    		사원정보를 등록하고, 등록된 내용을 출력
    	 --%>
    	<form method="post">
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
         	<div class="mb-3 mt-3">
            <label for="job">직책:</label>
            <input type="text" class="form-control" 
      	     id="job" placeholder="직책 입력" name="job">
         	</div>
         	<div class="mb-3 mt-3">
            <label for="mgr">권한:</label>
            <input type="number" class="form-control" 
      	     id="mgr" placeholder="권한 입력" name="mgr">
         	</div>
         	<div class="mb-3 mt-3">
            <label for="hiredate">입사일:</label>
            <input type="text" class="form-control" 
      	     id="hiredate" placeholder="입사일 입력" name="hiredate">
         	</div>
         	<div class="mb-3 mt-3">
            <label for="sal">급여:</label>
            <input type="number" class="form-control" 
      	     id="sal" placeholder="급여 입력" name="sal">
         	</div>
         	<div class="mb-3 mt-3">
            <label for="comm">보너스:</label>
            <input type="number" class="form-control" 
      	     id="comm" placeholder="보너스 입력" name="comm">
         	</div>
         	<div class="mb-3 mt-3">
            <label for="deptno">부서번호:</label>
            <input type="number" class="form-control" 
      	     id="deptno" placeholder="부서번호 입력" name="deptno">
         	</div>
         	<button type="submit" class="btn btn-primary">등록</button>
     	</form>
		<table class="table table-striped table-hover">
			<thead class="table-success">
		      	<tr  class="text-center">
				    <th>사원번호</th>
				    <th>사원명</th>
				    <th>직책</th>
				    <th>권한</th>
				    <th>입사일</th>
				    <th>급여</th>
				    <th>보너스</th>
				    <th>부서번호</th>
		      	</tr>
		    </thead>
		    <tbody>
		    <%
		    for(Emp e: dao.getEmp()) {
		    %>
				<tr>
			        <td><%=e.getEmpno() %></td>
			        <td><%=e.getEname() %></td>
			        <td><%=e.getJob() %></td>
			        <td><%=e.getMgr() %></td>
			        <td><%=e.getHiredate() %></td>
			        <td><%=e.getSal() %></td>
			        <td><%=e.getComm() %></td>
			        <td><%=e.getDeptno() %></td>
			   	</tr>
		    <%}%>
		 	</tbody>
		</table>      	
    </div>
</body>
</html>