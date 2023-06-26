<%@page import="backWeb.z01_vo.Emp"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css"
	rel="stylesheet">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
<title>Insert title here</title>
</head>
<body>
	<table class="table table-striped table-hover">
		<thead class="table-success">
			<tr class="text-center">
				<th>사원번호</th>
				<th>사원명</th>
				<th>직책</th>
			</tr>
		</thead>
		<%
		List<Emp> empList = (List) request.getAttribute("empList");
		for (Emp e : empList) {
		%>
		<tr class="text-center">
			<td><%=e.getEmpno()%></td>
			<td><%=e.getEname()%></td>
			<td><%=e.getJob()%></td>
		</tr>
		<%
		}
		%>
		</tbody>
	</table>
</body>
</html>