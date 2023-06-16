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
# 반복문과 조건문 활용
1. 여러가지 유형의 script를 통한 java/html코드를 처리할 수 있다.
2. 반복문과 조건문을 활용하면, 로직에 의한 여러가지 형태의 화면을 구현할 수 있다.
3. 주로 사용되는 연산식
	1) 비교연산자
	2) 논리연산자
	3) 사칙연산자(나머지연산자)
		%: 반복문에서 주로 특정한 index의 구분코드를 반복적으로 처리하여 화면을 구현할 때 사용된다.
		<tr>을 특정 조건에 따라 사용
		if(cnt%4==1)
		
	4) 문자열 비교
		equals(), indexOf()
	5) 숫자 비교
4. 처리 유형 형태
	1) 기본 로직을 이요한 반복/조건문 처리
	2) 반복문 밖에 전역변수를 활용하여 처리하는 형태
 --%>
 <%--
 1~10까지 출력하되, 총 합산을 마지막에 출력하세요
 출력형태 1+2+3+4+...+ 총합: ..
  --%>
  <h2>
 <%
 int tot = 0;
 for(int i=1; i<=10; i++){
	 tot += i;
%>
	<%=i %>
<%
	if(i == 10){
%>
	=
<%
	}else{
%>
	 + 
<%
	}
 }
 %>
 <%=tot %>
 </h2>
 
 <%--
 반복문을 활용하여 임의의 구구단을 설정, 테이블로 출력
  --%>
  <%
  int ranDan = (int)(Math.random()*8+2);
  %>
	  <h2><%=ranDan %>단</h2>
<%
  for(int i=1; i<=9; i++){
	  int gop = ranDan * i;
	  %>
	  <table border style="width:150px;">
	  <tr>
	  <td>
	  	<%=ranDan%> * <%=i%> = <%=gop%>
	  </td>
	  </table>
<%}%>

<%--
 홀수/짝수 표시
 --%>
<br>
<table border style="width:150px;">
<tr><th>no</th><th>구분</th></tr>
 <%
 for(int i=1; i<=10; i++){
	 %>
	 <tr><td><%=i %></td>
	 <%
	 if(i%2 == 1){
%>
		 <td>홀수</td></tr>
		 <%
	 }else{
	 %>
		 <td>짝수</td></tr>
	 <%}
 }
 %>
 </table>
 
 <%--
 form 화면에서 테이블로 학번 국어 영어 수학 평균
 					1	70	80	90	avg
 점수부분은 input형식을 value값에  점수가 입력되어 출력되게 하고, 반복문을 통해 학생 5명 출력,
 점수는 임의로 0~100
  --%>
  
  <form>
  <table border style="width:100px;">
  <tr><th>학번</th><th>국어</th><th>영어</th><th>수학</th><th>평균</th></tr>
  <%
  for(int i=1; i<=5; i++){
	  int kor = (int)(Math.random()*101);
	  int eng = (int)(Math.random()*101);
	  int math = (int)(Math.random()*101);
	  int avg = (kor + eng + math)/3;
  %>
  <tr>
  	<td><%=i %></td><td><input type="text" value="<%=kor %>"/></td><td><input type="text" value="<%=eng %>"/></td><td><input type="text" value="<%=math %>"/></td><td><input type="text" value="<%=avg %>"/></td>
  </tr>
 <% }%>
  </table>
  </form>
  
</body>
</html>