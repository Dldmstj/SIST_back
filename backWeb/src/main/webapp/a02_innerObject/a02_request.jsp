<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%-- 
# request
1. jsp에서 client단에 있는 정보를 서버단에 전송해서, 서버단에서 받을 때, 사용하는 객체를 말한다.
2. 기능 내용
	1) 요청값 처리(*)
	2) 쿠키 정보 전달
	3) request 범위 데이터 저장
	4) 기타 클라이언트에서 전달되어 서버단에 처리하는 기능메서드
	
# 요청값 처리 단계별 학습내용
1. query string이란 무엇인지
	서버에 있는 jsp/서버의 servlet 등에 client가 데이터를 전송하는 방식
	페이지?key=value&key2=value2&key3=value3
	==> 주의: query string을 client단 프로그램이 처리한다.
	
2. 서버단에서 받는 request의 메서드
	request.getParameter("key") : value
	String val = request.getParameter("key");
	result.jsp?id=himan
	
	String reqId = request.getParameter("id");
	// key인 id에 요청값으로 himan으로 query string전송하면
	// 위 코드에 의해서 reqId에는 "himan" 할당되어 있다.
	// 이렇게 데이터를 서버에서 받아서 db/로직을 처리한다.
	
2. form 요소객체와 query string 과의 관계
3. form 있는 속성
	요소 객체의 속성을 통한 데이터 처리
4. 단일 데이터 전송과 다중 데이터 전송
5. form 요소객체, dao와 연동하여
	1) 조회
	2) 등록
	3) 수정
	4) 삭제 처리
6. 단일데이터 전송과 다중데이터 전송
	String arry[] = request.getParameterValues("")
	1) 순수 query string으로 처리
	2) form 요소객체
		<input type="text" name="req01"
		<input type="text" name="req01"
		<input type="text" name="req01"
		
		<input type="checkbox" name="ck01" checked가 된 다중
		<input type="checkbox" name="ck01"
		<input type="checkbox" name="ck01"
		<input type="checkbox" name="ck01"
		
		<select name="req2" multiple> ctrl로 선택된 다중
			<option>사과</option>
			<option>바나나</option>
			<option>딸기</option>
			<option>포도</option>
7. form요소객체, dao와 연동하여
	1) 조회
	2) 등록
	3) 수정
	4) 삭제

# query string에 의해 데이터 받기
a02_request.jsp?name=홍길동
--%>

<h2>query string을 통해서 데이터 받기</h2>
<h3>이름:<%=request.getParameter("name") %></h3>
<h3>나이:<%=request.getParameter("age") %></h3>
<h3>사는곳:<%=request.getParameter("loc") %></h3>

</body>
</html>