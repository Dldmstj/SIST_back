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
    <div class="container mt-3">
    	<h2> 저장된 session 객체 가져오기</h2>
    	<%
    	Person p01 = (Person)session.getAttribute("p01"); 
    	%>
    	
		<table class="table table-striped table-hover">
			<thead class="table-success">
		      	<tr  class="text-center">
				    <th>이름</th>
				    <th>나이</th>
				    <th>사는곳</th>
		      	</tr>
		    </thead>
		    <tbody>
			   	<tr  class="text-center">
			   		<%if(p01!=null){ %> 
			   		<%-- 객체에 값이 있어야 객체 내 데이터 출력 --%>
			        <td><%=p01.getName() %></td>
			        <td><%=p01.getAge() %></td>
			        <td><%=p01.getLoc() %></td>
			        <%}else{ %>
			   		<%-- 값이 없으면 범위없음 출력 (에러발생 방지) --%>
			        <td colspan="3">session범위데이터 없음</td>
			        <%} %>
			   	</tr>
		 	</tbody>
		</table>      	
    </div>
</body>
</html>