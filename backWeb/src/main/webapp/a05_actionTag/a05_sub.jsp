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
<%
String stdname = request.getParameter("stdname");
String ks = request.getParameter("kor");
String es = request.getParameter("eng");
String ms = request.getParameter("math");

int kor = Integer.parseInt(ks);
int eng = Integer.parseInt(es);
int math = Integer.parseInt(ms);

int tot = kor + eng + math;
int avg = tot / 3;
%>
<body>
	<div class="container mt-3">
		<table class="table table-striped table-hover">
			<thead class="table-success">
				<tr class="text-center">
					<th>이름</th>
					<th>국어</th>
					<th>영어</th>
					<th>수학</th>
					<th>총점</th>
					<th>평균</th>
				</tr>
			</thead>
			<tbody>
				<tr class="text-center">
					<td><%=stdname%></td>
					<td><%=kor%></td>
					<td><%=eng%></td>
					<td><%=math%></td>
					<td><%=tot%></td>
					<td><%=avg%></td>
				</tr>
			</tbody>
		</table>
	</div>
</body>
</html>