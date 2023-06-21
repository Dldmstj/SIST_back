<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="backWeb.z01_vo.Dept"
    %>
<!DOCTYPE html>
<%
int deptno = 0;
String deptnoS =request.getParameter("deptno");
if(deptnoS!=null) deptno = Integer.parseInt(deptnoS);
String dname = request.getParameter("dname");
if(dname==null) dname = "";
String loc = request.getParameter("loc");
if(loc==null) loc = "";
Dept d = new Dept(deptno,dname, loc);
%>
<%--
1. 요청값 처리
2. VO 객체 확인/생성
3. xxx.getXXX() 출력..

 --%>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
    <title>Insert title here</title>
</head>
	<style>
		.input-group-text{width:100pt;}
	</style>
<body>
    <div class="container mt-3">
    	<h2>부서 정보</h2>
		<div class="input-group mb-3">
		  <span class="input-group-text">부서번호</span>
		  <input type="text" class="form-control" 
		  	value="<%=d.getDeptno()%>">
		</div>
		<div class="input-group mb-3">
		  <span class="input-group-text">부 서 명</span>
		  <input type="text" class="form-control" value="<%=d.getDname()%>">
		</div>
		<div class="input-group mb-3">
		  <span class="input-group-text">부서위치</span>
		  <input type="text" class="form-control" value="<%=d.getLoc()%>">
		</div>				
     </div>
</body>
</html>