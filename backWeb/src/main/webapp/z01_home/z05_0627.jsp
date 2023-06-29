<%@page import="backWeb.z01_vo.Manager"%>
<%@page import="backWeb.a01_dao.A04_PreParedDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
// [1단계:코드] 2. ajax로 [데이터화면호출]로 
// 서버에 table형식의 화면 호출(DAO - public List<Manager> getManager())
A04_PreParedDao dao = new A04_PreParedDao();
//empno, ename, dname
%>
<%for(Manager mng:dao.getManager()){ %>
<tr class="text-center">
	<td><%=mng.getEmpno() %></td>
	<td><%=mng.getEname() %></td>
	<td><%=mng.getDname()%></td>
</tr>
<%}%>