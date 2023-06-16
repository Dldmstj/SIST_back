<%@page import="backWeb.a01_dao.A05_MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import ="backWeb.a01_servlet.Member"
    %>
  <%
  A05_MemberDao dao = new A05_MemberDao();
  Member m = dao.login("himan","7777");
  %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>로그인 정보</h2>
	<h3><%=m.getId() %></h3>
	<h3><%=m.getName() %></h3>
	<h3><%=m.getAuth() %></h3>
</body>
</html>