<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import = "backWeb.z01_vo.Salgrade"
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
String gradeS =request.getParameter("grade");
 int grade = 0;
 if(gradeS != null) grade = Integer.parseInt(gradeS);
 
String losalS =request.getParameter("losal");
 int losal = 0;
 if(losalS != null) grade = Integer.parseInt(losalS);
String hisalS =request.getParameter("hisal");
 int hisal = 0;
 if(hisalS != null) grade = Integer.parseInt(hisalS);
 
 if(gradeS != null){
	 Salgrade sal = new Salgrade(grade,losal,hisal);
	 // log() : jsp단에서 서버의 log에 나올 출력 처리
	 /* log(sal.getGrade());
	 log(sal.getLosal());
	 log(sal.getHisal()); */
 }
 %>

<body>
    <div class="container mt-3">
    	<h2>등급</h2>
    	<form method="post">
         	<div class="mb-3 mt-3">
            <label for="ans">정답입력:</label>
            <input type="number" class="form-control" 
      	     id="ans" placeholder="정답 입력" name="ans">
         	</div>
         	<div class="mb-3 mt-3">
            <label for="ans">정답입력:</label>
            <input type="number" class="form-control" 
      	     id="ans" placeholder="정답 입력" name="ans">
         	</div>
         	<div class="mb-3 mt-3">
            <label for="ans">정답입력:</label>
            <input type="number" class="form-control" 
      	     id="ans" placeholder="정답 입력" name="ans">
         	</div>
         	<button type="button" onclick="call01()" class="btn btn-primary">정답확인</button>
     	</form>
    </div>
</body>

 </script>
</html>