<%@page import="backWeb.a01_dao.A04_PreParedDao"%>
<%@page import="backWeb.z01_vo.Emp"%>
<%@page import="java.util.List"%>
<%@page import="backWeb.a01_dao.A05_MemberDao"%>
<%@page import="com.google.gson.Gson"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%--
		backend(z12_empList.jsp?ename=A&job=A)
		요청값 : 사원명(ename), 직책(job)
		import: Dao, Vo, Gson
		List<Emp> elist = dao.getEmpList(ename,job)
		<%=gson.toJson(elist)%>
--%>
<%
String ename = request.getParameter("ename");
if(ename == null) ename = "";
String job = request.getParameter("job");
if(job == null) job = "";

A04_PreParedDao dao = new A04_PreParedDao();
List<Emp> elist = dao.getEmpList(ename,job);
Gson gson = new Gson();	// Gson 객체 선언
%>
<%=gson.toJson(elist)%>