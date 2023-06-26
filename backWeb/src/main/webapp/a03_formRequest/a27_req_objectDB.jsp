<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="backWeb.a01_dao.A05_MemberDao"
    %>
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
	// backendWeb.z01_vo.Member
	// Member(String id, String pass, String name, String auth, int point) 

# 요청값으로 VO 객체 생성.
1. 요청값으로 호출된 내용을 여러개의 데이터로, VO 객체를 생성하는데
	까지 처리하여, 다른 모듈에 매개값으로 처리되는 경우가 많다.
2. 이 내용에서 처리한 중점사항.
	1) 기본 요청화면 구현
	2) 요청화면에서 form객체에 의해 넘겨지는 데이터가 어떤 유형인지 파악
		주의사항
		- number 형변환
		- data(DB): 문자열로 받아서 db sql에서 to_date(문자열,'형식')
	3) 요청값에 의해 처리되는 값에 의해 type에 따른 VO객체 만들기
	4) 요청값이 null 및 유형이 잘 못 전달될 때에 대한 대비
		- 일반적으로 js에 의해 사전에 유효성 처리
	5) 요청값의 null에 대한 처리 
	6) type 변환 처리(String ==> 숫자/boolean형)
	7) VO객체의 생성자 생성 및 해당 생성자에 데이터 처리.
	8) DAO연동??
	9) 모든 처리가 끝나 후, js로 등록성공/실패 등에 대한 메시지 처리.
	

 --%>
<body>
    <div class="container mt-3">
    	<h2>사원정보 등록</h2>
    	<form action="" method="post">
         	<div class="mb-3 mt-3">
            <label for="empno">이름:</label>
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