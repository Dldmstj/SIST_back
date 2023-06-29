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
            
[1단계:코드] 2. el 태그를 이용하여 4가지 session scope의 범위를 기본 변수로 설정하여 호출해보자.
[1단계:코드] 3. el을 이용하여 클래스 Person을 객체로 session scope로 설정하고 호출해 보자.
[1단계:코드] 4. el을 이용하여 form으로 물품명과 가격과 갯수을 입력해서 해당 내용을 출력처리하자.
[1단계:코드] 5. ajax처리 순서를 기술하고, 서버에 선언된 데이터(하나데이터,배열데이터, json 데이터)를 동기적으로 가져오는 처리를 하여 화면에 할당하세요.    
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
    <div class="container mt-3">
    	<h2>session scope</h2>
    	<h3>page 영역: ${str01} </h3>
    	<h3 onclick="location.href='z_0626.jsp'">request 영역 : ${str02}</h3>
    	<h3 onclick="location.href='z_0626.jsp'">session 영역 : ${str03}</h3>
    	<h3 onclick="location.href='z_0626.jsp'">application 영역 : ${str04}</h3>
    	<br>
    	<h2>session scope로 Person 객체 선언하고 호출</h2>
    	<h3>이름: ${p01.name}</h3>
    	<h3>나이: ${p01.age}</h3>
    	<h3>사는곳: ${p01.loc}</h3>
    </div>
</body>
</html>