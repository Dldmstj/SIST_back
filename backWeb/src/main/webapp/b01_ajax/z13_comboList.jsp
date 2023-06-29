<%@page import="java.util.List"%>
<%@page import="backWeb.z01_vo.Code"%>
<%@page import="backWeb.a01_dao.A04_PreParedDao"%>
<%@page import="com.google.gson.Gson"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String title = request.getParameter("title");
if(title==null) title="";

Gson gson = new Gson();
A04_PreParedDao dao = new A04_PreParedDao();
List<Code> clist = dao.getCodeList(title);
%>
<%=gson.toJson(clist) %>