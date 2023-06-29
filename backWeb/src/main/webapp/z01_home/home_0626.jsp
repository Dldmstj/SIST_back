<%@page import="backWeb.z01_vo.Person"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%--
# 조별 토론 및 실습과제
[1단계:개념확인] 1. 조별로 el 태를 활용한 session scope범위와 실제 코드에 대하여 알고 있는지 확인
            ajax를 처리하기 위해 필요한 기본 형식과 기본 데이터와 json데이터 가져오는 처리형식을 아는지 확인
            
            var xhr = new XMLHttpRequest();		// XMLHttpRequest 객체 선언
            xhr.open("get/post방식","서버자원(jsp)",true/false(동기/비동기))	// 옵션 설정
            xhr.send()	// 전송
            xhr.responseText	// 서버에서 보내온 자원 받기
            
            json 데이터 처리형식
	            {"key",value}
	            key는 ""(따옴표 안에), value는 문자열이면 ""안에 기재, 숫자형이면 따옴표 없이 기재.
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
<%
// [1단계:코드] 2. el 태그를 이용하여 4가지 session scope의 범위를 기본 변수로 설정하여 호출해보자.
	pageContext.setAttribute("str01","el 태그로 page범위 호출");
	request.setAttribute("str02","el 태그로 request범위 호출");
	session.setAttribute("str03","el 태그로 session범위 호출");
	application.setAttribute("str04","el 태그로 application범위 호출");
	
// [1단계:코드] 3. el을 이용하여 클래스 Person을 객체로 session scope로 설정하고 호출해 보자.
// Person p01 = new Person("짱구",5,"떡잎마을");
session.setAttribute("p01",new Person("짱구",5,"떡잎마을"));

// [1단계:코드] 4. el을 이용하여 form으로 물품명과 가격과 갯수을 입력해서 해당 내용을 출력처리하자.
// [1단계:코드] 5. ajax처리 순서를 기술하고, 서버에 선언된 데이터(하나데이터,배열데이터, json 데이터)를 동기적으로 가져오는 처리를 하여 화면에 할당하세요.
		/*
			# ajax 처리순서
			XMLHttpRequest 객체 생성
				=> 옵션설정(get/post방식, 서버자원, 동기/비동기여부 boolean)
				=> 전송처리
				=> 서버에서 전송하는 데이터 받기
		*/
%>
<script type="text/javascript">
// 서버에 선언된 데이터(하나데이터,배열데이터, json 데이터)를 동기적으로 가져오는 처리를 하여 화면에 할당하세요.
	function callAjax01(){
		var xhr = new XMLHttpRequest();
		xhr.open("get","z00_0626.jsp",false)
		xhr.send();
		document.querySelector("#str").innerText = xhr.responseText;
	}
	
	function callAjax02(){
		var xhr = new XMLHttpRequest();
		xhr.open("get","z01_0626.jsp",false)
		xhr.send();
		var data = xhr.responseText
 		var arry = data.split(",")
 		var prds = document.querySelectorAll("#prd")
		arry.forEach(function(prod,idx){
			prds[idx].innerText = prod
		})
	}
	
	function callAjax03(){
		var xhr = new XMLHttpRequest();
		xhr.open("get","z02_0626.jsp",false)
		xhr.send();
		var data = xhr.responseText;
 		var obj = JSON.parse(data);
 		var jsons = document.querySelectorAll("#json")
 		jsons[0].innerText = obj.id
 		jsons[1].innerText = obj.auth
 		jsons[2].innerText = obj.point
	}
	
</script>
<body>
    <div class="container mt-3">
    	<h2>session scope</h2>
    	<h3>page 영역: ${str01} </h3>
    	<h3 onclick="location.href='z_0626.jsp'">request 영역 : ${str02}</h3>
    	<h3 onclick="location.href='z_0626.jsp'">session 영역 : ${str03}</h3>
    	<h3 onclick="location.href='z_0626.jsp'">application 영역 : ${str04}</h3>
    	<br>
    	<h2 onclick="location.href='z_0626.jsp'">session scope로 Person 객체 선언하고 호출</h2>
    	<h3>이름: ${p01.name}</h3>
    	<h3>나이: ${p01.age}</h3>
    	<h3>사는곳: ${p01.loc}</h3>
    </div>
    <br>
    <h2>물품명/가격/갯수 입력받고 el태그로 출력하기</h2>
    <div class="container mt-3">
    	<form method="post">
         	<div class="mb-3 mt-3">
            <label for="pname">물품명</label>
            <input type="text" class="form-control" 
      	     id="pname" placeholder="물품명 입력" name="pname">
         	</div>
         	<div class="mb-3 mt-3">
            <label for="price">가격</label>
            <input type="number" class="form-control" 
      	     id="price" placeholder="가격 입력" name="price">
         	</div>
         	<div class="mb-3 mt-3">
            <label for="cnt">갯수</label>
            <input type="number" class="form-control" 
      	     id="cnt" placeholder="갯수 입력" name="cnt">
         	</div>
         	<button type="submit" class="btn btn-primary">등록</button>
     	</form>
		<table class="table table-striped table-hover">
			<thead class="table-success">
		      	<tr  class="text-center">
				    <th>물품명</th>
				    <th>가격(원)</th>
				    <th>갯수(개)</th>
		      	</tr>
		    </thead>
		    <tbody>
			   	<tr  class="text-center">
			        <td>${param.pname}</td>
			        <td>${param.price}</td>
			        <td>${param.cnt}</td>
			   	</tr>
		 	</tbody>
		</table><br>
		<h2 onclick="callAjax01()" id="str">단일데이터 호출</h2>
		<h2 onclick="callAjax02()">배열데이터 호출</h2>
		<table class="table table-striped table-hover">
			<thead class="table-success">
		      	<tr class="text-center">
				    <th>물품명</th>
				    <th>가격(원)</th>
				    <th>갯수(개)</th>
		      	</tr>
		    </thead>
		    <tbody>
			   	<tr  class="text-center">
			        <td id="prd"></td>
			        <td id="prd"></td>
			        <td id="prd"></td>
			   	</tr>
		 	</tbody>
		</table>     
		<h2 onclick="callAjax03()">json데이터 호출</h2>
		<table class="table table-striped table-hover">
			<thead class="table-success">
		      	<tr class="text-center">
				    <th>id</th>
				    <th>권한</th>
				    <th>포인트</th>
		      	</tr>
		    </thead>
		    <tbody>
			   	<tr  class="text-center">
			        <td id="json"></td>
			        <td id="json"></td>
			        <td id="json"></td>
			   	</tr>
		 	</tbody>
		</table>     
    </div>
</body>
</html>