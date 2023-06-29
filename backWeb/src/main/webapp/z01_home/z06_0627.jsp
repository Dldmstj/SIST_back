<%@page import="backWeb.z01_vo.ShMember"%>
<%@page import="backWeb.a01_dao.A04_PreParedDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
// [1단계:코드] 3. ajax로 id[  ]pass[  ] [로그인]  
// table형식으로 회원이 없던지 table로 출력
String id = request.getParameter("id");
if(id==null) id="";
String pw = request.getParameter("pw");
if(pw==null) pw="";
A04_PreParedDao dao = new A04_PreParedDao();
ShMember m = dao.getMemberLogin(id, pw);

if(m != null){
%>
<tr class="text-center">
	<td><%=m.getName() %></td>
	<td><%=m.getId() %></td>
</tr>
<%}else{%>
	<h2>가입된 회원이 없습니다.</h2>
<%} %>

