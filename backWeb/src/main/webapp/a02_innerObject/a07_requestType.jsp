<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	// 요청값은 기본적으로 문자열이다
	// 1. 숫자형을 사용할 때는 형변환을 처리하는데,
	// 		초기값이 없을 때(요청값이 없을 때)에 대한 처리를 해야한다
	// 2. if(요청변수!=null) 일 경우 형변환 처리
	// 3. default 데이터 설정 0
	// PI = 3.14
	String dblStr = request.getParameter("PI");
	double PI = 0;
	if(dblStr!=null){
		PI = Double.parseDouble(dblStr);
	}
	out.println("파이값: +"+PI);
	String boolStr = request.getParameter("bool");
	boolean isTrue = false;
	if(boolStr != null){
		isTrue = Boolean.parseBoolean(boolStr);
	}
	out.print("boolean값: "+ isTrue);
	// ex) 원의 지름의 값을 요청값을 입력 받아서 면적을 구하세요. 실수 표현
	
	String str = request.getParameter("str");
	double rad = 0;
	if(str != null){
		rad = Double.parseDouble(str);
	}
	out.print("<h2>"+rad+"</h2>");
%>
</body>
</html>