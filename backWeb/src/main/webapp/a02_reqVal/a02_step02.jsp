<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%--
 ex) 국어, 영어, 수학 점수를 받아서 총점/평균 처리
 --%>
 <h2>숫자형 데이터 요청값 처리</h2>
 <%
	String ks = request.getParameter("kor");
	String es = request.getParameter("eng");
	String ms = request.getParameter("math");
	
	int kor = 0;
	int eng = 0;
	int math = 0;
	
	if(ks != null)  kor = Integer.parseInt(ks);
	if(es != null)  eng = Integer.parseInt(es);
	if(ms != null)  math = Integer.parseInt(ms);
	
	int tot = kor + eng + math;
	int avg = tot/3;
 %>
 <%--
a02_step02.jsp?kor=90&eng=80&math=90
  --%>
 국어 : <%=kor %><br>
 영어 : <%=eng %><br>
 수학 : <%=math %><br>
 총점 : <%=tot %><br>
 평균 : <%=avg %><br>
</body>
</html>