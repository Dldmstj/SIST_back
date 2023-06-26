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
[1단계:코드] 2. java로 임의의 구구단을 만들어 html의 form에 출력하고, [ @@] x [@@   ]  정답입력[  ][정답확인]
              정답입력이 맞을시, 정답 그렇지 않을시 오답이 처리되게 하세요. java+js 연동
 --%>
 <%
 int dan = (int)(Math.random()*8+2);
 int num = (int)(Math.random()*9+1);
 int gop = dan * num;
 %>

<body>
    <div class="container mt-3">
    	<h2><%=dan %> X  <%=num %> = ?</h2>
    	<form method="post">
         	<div class="mb-3 mt-3">
            <label for="ans">정답입력:</label>
            <input type="number" class="form-control" 
      	     id="ans" placeholder="정답 입력" name="ans">
         	</div>
         	<button type="button" onclick="call01()" class="btn btn-primary">정답확인</button>
     	</form>
    </div>
</body>
  <script type="text/javascript">
  	var gop = "<%=gop%>"
  	var ans = document.querySelector("#ans");
 	function call01(){
	 	if(ans.value == gop){
	 		alert("정답")
	 	}else{
	 		alert("오답")
	 	}
 	}
 	/*
 	# front back 연결코드
 	1. jsp로 html이 만들어진 결과로
 	2. 화면단에서 처리된다는 내용
 	*/
 </script>
</html>