<%@page import="backWeb.z01_vo.ShMember"%>
<%@page import="backWeb.a01_dao.A05_MemberDao"%>
<%@page import="com.google.gson.Gson"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    
%>
<% // ?id=himan
String id =request.getParameter("id");

if(id==null) id="";
A05_MemberDao dao = new A05_MemberDao();
ShMember m = dao.checkMem(id);
Gson g = new Gson();
if(m!=null){
%>
	<%=g.toJson(m)%>
<%}else{%>
	{"id":""}
<%}%>