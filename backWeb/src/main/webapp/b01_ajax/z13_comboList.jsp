<%@page import="java.util.List"%>
<%@page import="backWeb.z01_vo.Code"%>
<%@page import="backWeb.a01_dao.A04_PreParedDao"%>
<%@page import="com.google.gson.Gson"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String title = request.getParameter("title");
if(title==null) title="";
String refnoS = request.getParameter("refno");
int refno=0;
if(refnoS != null&&!refnoS.equals(""))
	refno=Integer.parseInt(refnoS);

Gson gson = new Gson();
A04_PreParedDao dao = new A04_PreParedDao();
%>
<%=gson.toJson(dao.getCodeList(title,refno)) %>