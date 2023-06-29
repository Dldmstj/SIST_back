<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    // 이 페이지는 ?name=홍길동(key=val) 방식으로 넘겨주면 데이터를 받을 수 있다.
    String name =request.getParameter("name");
    if(name==null) name="";
    %>
<h2>안녕하세요</h2>
<h2>이름<%=name %></h2>
<h2>과일명${param.fruit}</h2>