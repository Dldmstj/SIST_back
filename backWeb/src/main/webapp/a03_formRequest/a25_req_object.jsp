<%@page import="backWeb.a01_dao.A05_MemberDao"%>
<%@page import="backWeb.a01_dao.A04_PreParedDao"%>
<%@page import="backWeb.z01_vo.ShMember"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
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
# 요청값으로 DB객체 생성
1. 요청값으로 호출된 내용을 여러개의 데이터로 VO객체를 생성하는데까지 처리하여
	다른 모듈의 매개값으로 처리되는 경우가 많다.
2. 이 내용에서 처리한 중점사항
	1) 기본 요청화면 구현
	2) 요청화면에서 form객체에 의해 넘겨지는 데이터가 어떤 유형인지 파악
	3) 요청값의 처리되는 값에 의해 처리되는 type에 따른 VO객체 만들기
	4) 요청값이 null 및 유형이 잘못 전달될 때에 대한 대비
		- 일반적으로 js에 의해 사전에 유효성 처리
	5) 요청값의 null에 대한 처리
	6) type 변환 처리(String => 숫자/boolean형)
	7) VO객체의 생성자 생성 및 해당 생성자에 데이터 처리
	8) DAO연동
	9) 모든 처리가 끝난 후, js로 등록 성공/실패 등에 대한 메시지 처리
 --%>
 <%
 String id = request.getParameter("id");
 String pw = request.getParameter("pw");
 String name = request.getParameter("name");
 String auth = request.getParameter("auth");
 String pointS = request.getParameter("point");
 // 초기값과 비교 처리
 if(id != null){
	 int point = Integer.parseInt(pointS);
	 ShMember m = new ShMember(id,pw,name,point,auth);
	/*  log("# 회원등록 VO로 성공 #");
	 log(m.getId());
	 log(m.getPw());
	 log(m.getName());
	 log(m.getAuth());
	 log(""+ m.getPoint()); */
	 
	 A05_MemberDao dao = new A05_MemberDao();
	 dao.insertMember(m);
 }
 
 %>
 <script type="text/javascript">
 	function checkValid(){
 		// 유효성 check 처리 ..
 		// 1) 필수데이터 입력 처리
 		// 2) 아이디 사전 check
 		// 3) pw 확인
 		// 4) 숫자형/날짜 데이터 확인
 	}
 </script>
<body>
    <div class="container mt-3">
    	<h2>회원 등록</h2>
    	<form onsubmit="return checkValid()" action="" method="post">
         	<div class="mb-3 mt-3">
            <label for="id">아이디:</label>
            <input type="text" class="form-control" 
      	     id="id" placeholder="id 입력" name="id">
         	</div>
         	<%--
         	# 패스워드/패스워드 확인은 등록시 반드시 check해야할 내용
         	 --%>
         	<div class="mb-3 mt-3">
            <label for="pw">패스워드:</label>
            <input type="password" class="form-control" 
      	     id="pw" placeholder="pw 입력" name="pw">
         	</div>
         	<div class="mb-3 mt-3">
            <label for="name">이름:</label>
            <input type="text" class="form-control" 
      	     id="name" placeholder="name 입력" name="name">
         	</div>
         	<div class="mb-3 mt-3">
            <label for="auth">권한:</label>
            <input type="text" class="form-control" 
      	     id="auth" placeholder="권한 입력" name="auth">
         	</div>
         	<div class="mb-3 mt-3">
            <label for="point">포인트:</label>
            <input type="number" class="form-control" 
      	     id="point" placeholder="point 입력" name="point">
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