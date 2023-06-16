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
# form request의 관계
1. form 의 하위 객체는 client가 서버에 query string으로 데이터를 전송하게 해주는 UI(user interface)가
	있는 태그 및 객체이다.
2. 화면단에서 입력을 해서, 전송 이벤트로 처리시 query string을 만들어주는 태그가 form과 form하위 요소객체들이다.
3. query string과 form요소 객체의 속성 비교
	1) a02_formReceive.jsp?name=홍길동
	2) <form action="a02_formReceive.jsp">
			이름 <input name="name" value="홍길동"/>
			<input type ="submit">
	3) 위 내용 전달하는 대상
		a02_formReceive.jsp? ==> action="a02_formReceive.jsp"
		name=홍길동 => name 속성값과, value 속성값 동일
		submit 버튼 클릭 시, 위 querystring을 만들어주어 요청처리한다.
 --%>
 <h2>전송 준비</h2>
 <form action ="a02_formReceive.jsp" >
 	전송할 이름 <input type="text" name="name"/>
 	<input type="submit"/>
 </form>
 
 <form action ="a03_formRev.jsp" >
 	pname <input type="text" name="pname"/>
 	price <input type="text" name="price"/>
 	<input type="submit"/>
 </form>
</body>
</html>