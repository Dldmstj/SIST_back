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
    <%--
    # 요청값을 전달해서 서버단 데이터를 처리 후, front프로그램에 넘겨서
    	front에 나타나는 내용을 처리
    1. id/pw 입력 => 서버단에서 인증 확인 => 인증되면 로그인 성공/특정 main이동(front단 전달)
    	미인증시 로그인 실패/로그인 페이지 재처리
    
     --%>
     <%
     String id = request.getParameter("id");
     String pw = request.getParameter("pw");
     if(id == null) id ="";
     if(pw == null) pw ="";
     
     String isValid=""; // 초기 화면
     // 초기화면 제외
     if(id.equals("")&&pw.equals("")){
  	 isValid="I"; // 초기 화면
     }else if(id.equals("himan")&&pw.equals("7777")){
    	 isValid ="Y";	// 인증
     }else{
    	 isValid ="N";	// 미인증
     }
     %>
     <script type="text/javascript">
		var isValid = "<%=isValid%>"
		if(isValid == 'Y') {
			alert("로그인 성공\n메인으로 이동합니다.")
			// location.href="a24_main.jsp";
		}
		if(isValid == 'N') {
			alert("로그인 실패\n다시 시도하세요.")
			
		}
		
     </script>
</head>
<body>
    <div class="container mt-3">
    	<h2>로그인</h2>
    	<form action="" method="post">
         	<div class="mb-3 mt-3">
            <label for="id">id 입력:</label>
            <input type="text" class="form-control" 
      	     id="id" placeholder="id 입력" name="id">
         	</div>
         	<div class="mb-3 mt-3">
            <label for="pw">패스워드:</label>
            <input type="password" class="form-control" 
      	     id="pw" placeholder="pw 입력" name="pw">
         	</div>
         	<button type="submit" class="btn btn-primary">로그인</button>
         	
     	</form>
    </div>
</body>
</html>