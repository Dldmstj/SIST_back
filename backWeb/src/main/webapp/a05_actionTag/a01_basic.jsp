<%@page import="backWeb.a01_dao.A04_PreParedDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
    <title>Insert title here</title>
</head>
<%--
# action 태그
1. jsp에서는 script 형식으로 데이터 변수를 처리하는 경우도 있지만,
	<jsp:@@@> 형식으로 내장된 액션 태그를 이용해서 효율적으로 프로그램을 처리하는 경우도 많다.
	이번 장에서, action태그의 기능과 각각 화면에서 처리하는 내용을 확인하고, 실무적으로 어떤 식으로
	이용되는지 파악해보자.
2. action 태그의 종류
	1) 페이지 모듈화를 처리할 때 사용
		<jsp:include page="">
		주의) 단독객체로 class를 만들어서 클래스 안에 클래스가 된다는 점 명시.
			참고로 <%@ include file="">가 포함된 jsp는 하나의 class라는 차이점이 있다. 
	2) 요청 흐름 처리 : request 범위 안에 데이터를 가지고 처리하고자 할 때 사용
		<jsp:forward page="">
		ex) 아이디 패스워드를 받아서 인증이 되었을 때는 메인페이지로 이동
			그렇지 않을 때는 다시 로그인 페이지 이동
	3) 객체를 action태그로 useBean을 사용하면, session scope 범위를 설정하고,
		보다 효율적으로 객체를 생성하고 요청값 전달 등의 여러 기능으로 사용할 수 있다.
		<jsp:useBean id="" scope="">
		
# jsp:include action 태그
1. 다른 jsp페이지의 실행 결과를 현재 위치에 삽입
2. 기본형식
	1) <jsp:include page="포함할 페이지" flush="true">
	2) page 속성: 포함될 외부 jsp페이지
	3) flush 속성: 지정한 jsp 페이지를 실행하기 전에 출력 버퍼를 플러시할지의 여부를 지정
				true는 출력 버퍼를 flush하고, false는 하지 않는다.
	ps) 버퍼개념: 화면을 구현하는데 어느 정도 데이터가 있는 패킷(데이터단위)가 있어야 표현이 되는데,
				네트워크 속도가 좋지 않을 때, 현재 화면을 조금씩 로딩하는 것보다 모든 내용을 다 받아서
				로딩하는 것이 효율적이다. 이 때 사용하는 개념이 버퍼인데, 버퍼 메모리를 써서 한꺼번에 화면을
				구성하는 개념을 말한다.
			ex) 비유 - 1t의 물을 이용해서 우물을 완성할 때, 조금씩 양동이를 가지고 나르다가 다 차면 한 번에
					활용하는 개념이다.
	4) 하위 속성 <jsp:param> action 태그
		- <jsp:include의 하위 태그로
			<jp:param name="매개변수명" value="매개변수값"/> 으로 데이터를 해당 페이지에 전달할 때 사용된다.
		- 포함된 페이지에서 데이터는 
			request.getParameter("매개변수명")으로 사용할 수 있다.
 --%>
<%
String ename = request.getParameter("ename"); if(ename==null) ename="";
String job = request.getParameter("job"); if(job==null) job="";
A04_PreParedDao dao = new A04_PreParedDao();
request.setAttribute("empList", dao.getEmpList(ename, job));

%>
<body>
    <div class="container mt-3">
    	<h2>사원정보 검색</h2>
    	<%--
    	# 주의: include 지시자와 다르게, 따로 class구성이 처리되기에 공통된 데이터는
    		전달형식으로 넘겨야한다.
    	 --%>
    	<jsp:include page="a02_schForm.jsp">
			<jsp:param name="ename" value="<%=ename%>"/>
			<jsp:param name="job" value="<%=job%>"/>
		</jsp:include>
		<jsp:include page="a03_list.jsp"/>
   	</div>
</body>
</html>