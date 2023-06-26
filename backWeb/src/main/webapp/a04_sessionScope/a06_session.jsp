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
<%--
	ex)
	fruit01: 사과 (page)
	fruit02: 바나나 (request)
	fruit03: 딸기 (session)
	fruit04: 수박 (application)
 --%>
    <div class="container mt-3">
    	<h2>fruit</h2>
		<table class="table table-striped table-hover">
			<thead class="text-center">
				<tr>
					<th>page</th>
					<th>request</th>
					<th>session</th>
					<th>application</th>
				</tr>
			</thead>
		    <tbody>
			   	<tr class="text-center">
			        <td onclick="location.href='#'"><%= pageContext.getAttribute("fruit01") %></td>
			        <td onclick="location.href='#'"><%= request.getAttribute("fruit02") %></td>
			        <td onclick="location.href='a06_session.jsp'"><%= session.getAttribute("fruit03") %></td>
			        <td onclick="location.href='#'"><%= application.getAttribute("fruit04") %></td>
			   	</tr>
		 	</tbody>
		</table>       	
    </div>
</body>
</html>