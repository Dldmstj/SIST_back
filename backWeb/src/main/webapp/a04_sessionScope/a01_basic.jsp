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
# session scope
1. jsp는 session의 범위를 총 4가지로 유지할 수 있게 한다.
	기본 유형 => object => Array
	jsp에서는
	기본 변수 + scope(어디까지 이 변수가 유지되느냐)

2. 범위 내용
	1) page 영역: 하나의 jsp페이지를 처리할 때 사용되는 영역
		실제 객체 : pageContext
		jsp script에서 저장되는 영역
		
		현재 페이지에서 변수선언 => 이 페이지에서만 사용하고, 다른 페이지에서 사용 불가(기본 변수)
		a.jsp						b.jsp
		<%
		String name = "홍길동"		이름: <%=name%> 		==> X
		
		pageContext.setAttribute("name","홍길동")
		
		%>
		<%=pageContext.getAttribute("name")%>
		
	2) request 영역: 하나의 http요청을 처리할 때 사용되는 영역
	3) session 영역 : 하나의 웹브라우저와 관련된 영역
	4) application 영역 : 하나의 웹 어플리케이션과 관련된 영역
3. 설정 방법
	0) 저장 데이터는 기본 데이터 유형, 배열, 객체, ...
	1) 저장
		범위객체.setAttribute("저장할 키", 저장할 데이터)
	2) 저장된 내용 호출
		할당할 변수 = 범위객체.getAttribute("저장된 키")
	3) 삭제
		범위객체.removeAttribute("저장된 키")
4. 각 범위에 따른 처리
	1) pageContext(page)
		페이지 범위까지만 처리됨
	2) request
		request.getRequestDispatcher(이동할페이지).forward(request,response)
		특정 내용을 호출하여 이동할 페이지까지 전송이 된다.
		A.jsp						B.jsp				C.jsp
		<form>						B.jsp?name=홍길동
			<input name="name">
			submit()처리 ==>	request.getParameter("name")
							if(name.equals("himan")){
								request.setAttribute("auth","admin")
								<jsp:forward page="C.jsp"/>
							}else{
								location.href="A.jsp"
							}
		
	3) session
		서버와 브라우저 간 연결 상태가 있을 때까지 지속되는 범위를 말한다.
		동일한 브라우저로 연결이 있는 상태에서는 a href, location.href로 호출하더라도
		계속 연결이 되어있기 때문에 session값을 가져올 수 있다.
		당연히, forward를 포함해서
		A.jsp										B.jsp
		session.setAttribute("name", "himan")		request범위는 사라진다
		<a href="B.jsp"								session.getAttribute("name")
		location.href="B.jsp"						사용 가능.
		response.sendRedirect("B.jsp");
		주의) request범위로 설정한 데이터는 위 코드로는 사라진다.
		
		# 브라우저상 범위
		1. 브라우저를 닫지 않고, B.jsp의 주소를 복사해서 붙여도 살아있다.
		2. 모든 브라우저를 닫고, B.jsp의 주소를 복사해서 붙여 넣으면 session은 사라진 것을 볼 수 있다.
		3. 다른 브라우저를 열어서 B.jsp의 주소를 복사해도 사라진 것을 볼 수 있다.
		
			2. 게시판 작성자 입력
				1) session에 의해 작성자가 등록되는 경우
					# 효과1: 자동 등록된다.
					<input type="text" value="<%=mem.getName()%>
					
					# 효과2: 식별할 수 있는 코드로 등록이 된다.
					실제 등록되는 내용을 id로 등록한다.
					<input type="hidden" name="writer" value="<%=mem.getId%> />"
					
					# 효과3
					수정/삭제시 등록한 사람만 비밀번호를 입력하지 않더라도 수정/삭제할 수 있다.
					
					function chValid(){
						var sesId = "<%mem.getId()%>"
						var writeVal = document.querySelector("[name=write]").value
						if(seeId != writeVal){
							alert("수정/삭제는 작성자만 가능합니다/")
						}
					}
				2) 그렇지 않은 경우
	4) application
		서버가 살아있는 한 데이터를 지속적으로 저장하는 것
 --%>
<body>
    <div class="container mt-3">
    	<h2>session scope에 따른 데이터</h2>
    	<%
    	pageContext.setAttribute("page01","페이지 범위입니다");
    	request.setAttribute("request01","request 범위입니다");
    	session.setAttribute("session01","session 범위입니다");
    	application.setAttribute("application01","application 범위입니다");
    	
    	%>
		<table class="table table-striped table-hover">
		    <tbody>
			   	<tr class="text-center">
			        <td><%= pageContext.getAttribute("page01") %></td>
			   	</tr>
			   	<tr class="text-center">
			        <td onclick="location.href='a02_request.jsp'"><%= request.getAttribute("page01") %></td>
			   	</tr>
			   	<tr class="text-center">
			        <td><%= session.getAttribute("session01") %></td>
			   	</tr>
			   	<tr class="text-center">
			        <td><%= application.getAttribute("application01") %></td>
			   	</tr>
		 	</tbody>
		</table>      	
    </div>
</body>
</html>