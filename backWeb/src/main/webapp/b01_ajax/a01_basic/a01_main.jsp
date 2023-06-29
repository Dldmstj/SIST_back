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
    # ajax 단계별 처리
    1. 클라이언트 호출 서버 화면 전송
    2. 클라이언트 호출(요청) 서버 요청값 처리 화면 전송
    3. 클라이언트 호출(요청) 서버 요청값 처리 DB처리 화면 전송
    
    # 공통 처리
    1. 특정 대상(DOM)에 이벤트 핸들러 함수 선언
    2. 이벤트 핸들러 함수
    	1) ajax 서버 호출(특정 페이지)
    		xhr.open("get","z01_data.jsp",false);
    	2) 서버의 결과값 받기
    		show.innerHTML = xhr.responseText;
    	3) 서버에서 받은 결과값을 특정 DOM에 할당해서 출력
    --%>
    
    <script type="text/javascript">
    
    	function getSyn(page){
    		var xhr = new XMLHttpRequest();
    		xhr.open("get",page,false);
    		xhr.send()
    		return xhr.responseText;
    	}	
    
    	function callAjax(){
    		var name = document.querySelector("#name").value;
    		var fruit = document.querySelector("#fruit").value;
    		var show = document.querySelector("#show");
    		show.innerHTML = getSyn("z01_data.jsp?name="+name+"&fruit="+fruit);
    	}
    </script>
</head>
<body>
    <div class="container mt-3">
    	<h2>사원정보 등록</h2>
    	<div id="show"></div>
    	<form action="" method="post">
         	<div class="mb-3 mt-3">
            <label for="name">이름</label>
            <input type="text" class="form-control" 
      	     id="name" placeholder="이름 입력" name="name">
         	</div>
         	<div class="mb-3 mt-3">
            <label for="fruit">과일</label>
            <input type="text" class="form-control" 
      	     id="fruit" placeholder="과일 입력" name="fruit">
         	</div>
         	<button type="button" onclick="callAjax()" class="btn btn-primary">ajax호출</button>
     	</form>
		<table class="table table-striped table-hover">
			<thead class="table-success">
		      	<tr class="text-center">
				    <th>Firstname</th>
				    <th>Lastname</th>
				    <th>Email</th>
		      	</tr>
		    </thead>
		    <tbody id="#show">
			   	<tr  class="text-center">
		 	</tbody>
		</table>      	
    </div>
</body>
</html>