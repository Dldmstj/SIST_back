<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  <%--
  # Expression Language
  1. jsp에서 사용 가능한 새로운 스크립트 언어
  	jsp프로그램은 그동안 scriptlet, expression, declare형태로 사용했는데,
  	변수 설정과 scope에 따라 처리를 하다보면 예외를 처리해야 하고, scriptlet의 복잡성은
  	많은 에러가 발생할 가능성이 보인다.
  2. 이에, null예외를 보다 줄이고, scope에 따른 변수 설정을 효과적으로 처리하기 위해서 사용하는 
  	언어를 jsp에서 지원하게 되었다.
  3. el의 사용과 기본 코드
  	1) el 코드의 기본 형식
  		el 코드는 scope에 의해 설정된 데이터를 가져올 때,
  		기본의 getAttribute()로 가져오거나, 요청값을 처리할 때,
  		화면단에서 처리해야하는 데이터를 간편하게 S{@@}형식으로 처리할 수 있게 하였다.
  		- 기본 변수 %{변수명}
  		- 객체형 데이터 %{변수명.property} 
  			변수명.get프로퍼티명()과 동일
  			주의) private 접근제어자인 속성이 아니고, getXXX()의 get을 빼고 소문자로 처리된 데이터이다.
  			S{m.name} ==> <%=m.getName()%> 동일
  4. el의 주요기능
  	1) jsp의 4가지 기본 객체의 번위에 따라 영역의 속성과 함께 변수로 지정
  	2) 집합 객체에 대한 접근방법 제공
  	3) 수치 연산, 관계 연산, 논리 연산자 제종
  	4) 자바 클래스의 메서드 호출 기능 제공
  	5) 표현 언어만의 기본 객체 제공
  		==> 간단한 구문 때문에 표현식 대신 사용
  	el과 jstl을 이용하면 script(sciptlet, expression)을 사용하지 않을 수 있다.
  --%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
    <title>Insert title here</title>
</head>
<body>
<%
	request.setAttribute("name","홍길동");
	session.setAttribute("age",25);
	
	// ex) 물건명, 가격, 갯수를 설정하고 el호출하여 아래 출력하세요
	
	request.setAttribute("pname","감자");
	request.setAttribute("price",300);
	request.setAttribute("pcnt",12);
%>
    <div class="container mt-3">
    	<h2>이름: ${name}</h2>
    	<%-- 
    	String name = request.getAttribute("name")
    	<%=name%> 와 동일한 내용
    	--%>
    	<h3 onclick="location.href='a02_el_session.jsp'">session확인</h3>
    	<br>
    	<h2>물건명: ${pname}</h2>
    	<h2>가격: ${price}원</h2>
    	<h2>갯수: ${pcnt}개</h2>
    	<h2>총액: ${price * pcnt}원</h2>
    	<br>
    	<form action="" method="post">
         	<div class="mb-3 mt-3">
            <label for="empno">사원번호:</label>
            <input type="number" class="form-control" 
      	     id="empno" placeholder="사원번호 입력" name="empno">
         	</div>
         	<div class="mb-3 mt-3">
            <label for="ename">사원명:</label>
            <input type="text" class="form-control" 
      	     id="ename" placeholder="사원명 입력" name="ename">
         	</div>
         	<button type="submit" class="btn btn-primary">등록</button>
     	</form>
		<table class="table table-striped table-hover">
			<thead class="table-success">
		      	<tr  class="text-center">
				    <th>Firstname</th>
				    <th>Lastname</th>
				    <th>Email</th>
		      	</tr>
		    </thead>
		    <tbody>
			   	<tr  class="text-center">
			        <td>John</td>
			        <td>Doe</td>
			        <td>john@example.com</td>
			   	</tr>
		 	</tbody>
		</table>      	
    </div>
</body>
</html>