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
	<div class="container mt-3">
		<h2>권한</h2>
		<form action="" method="post">
			<div class="mb-3 mt-3">
				<label>권한 선택</label><br>
				<div>
					<input type="radio" id="admin" value="admin" name="auth"> <label
						for="admin">관리자</label>
				</div>
				<div>
					<input type="radio" id="user" value="user" name="auth"> <label
						for="user">유저</label>
				</div>
				<div class="mb-3 mt-3">
					<label for="id">id</label> <input type="text"
						class="form-control" id="id" placeholder="id 입력" name="id" required>
						<%--  required : 기본적인 유효성 검사. 입력되지 않으면 폼이 안 넘어간다. --%>
				</div>
			</div>
			<button type="submit" class="btn btn-primary">페이지 이동</button>
		</form>
		<%
		String auth = request.getParameter("auth");
		if (auth != null) {
			if (auth.equals("admin")) {
		%>
		<jsp:forward page="a10_admin.jsp" />
		<%
		} else {
		%>
		<jsp:forward page="a11_user.jsp" />
		<%
		}
		}
		%>
	</div>
</body>
</html>