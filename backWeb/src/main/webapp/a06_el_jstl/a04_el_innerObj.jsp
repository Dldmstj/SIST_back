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
</head>
<%--
# EL에서 지원하는 내장 객체
1. el은 jsp의 여러 내장 객체를 지원하고 있다.
2. 사용법
	${내장객체.속성
3. 기본 객체들
	1) scopte관련 : pageScope, requestScope, sessionScope, applicationScope
	2) pageContext : jsp의 page 기본 객체와 동일
	3) param : 요청 파라미터의 값을 <파라미터이름, 값> 매핑을 저장한 Map객체
		&name=홍길동 ==> ${param.name} 홍길동 가져온다
	4) param.Values: 요청 파라미터의 <파라미터 이름, 값 배열> 매핑을 저장한 Map 객체
		&price=3000&price=2000&price=1000
		${param.Values.price[0]}
		${param.Values.price[1]}
		${param.Values.price[2]}
	5) header : 요청 정의 <헤더이름, 값> 매핑을 저장한 Map객체
	6) headerValues : 요청 정보의 <헤더이름, 값 배열> 매핑을 저장한 Map객체
	7) cookie : 쿠키이름, Cookie 매핑을 저장한 Map 객체
	8) initParam : 초기화 파라미터의 <이름, 값> 매핑을 저장한 Map 객체
	?name=홍길동&price=3000&price=2000&price=1000
 --%>
<body>
    <div class="container mt-3">
    	<h2>요청값 처리 1</h2>
    	<h2>${param.name}</h2>
    	<br>
    	<h2>요청값 처리 2</h2>
    	<h2>${paramValues.price[0]}</h2>
    	<h2>${paramValues.price[1]}</h2>
    	<h2>${paramValues.price[2]}</h2>
    	<br>
    	
    	<%-- 숫자형 자동 형변환 --%>
    	<h2>
    		${paramValues.price[0] +
    		paramValues.price[1] +
    		paramValues.price[2]
    		}
    	</h2>
    	<br>
    	<form method="post">
         	<div class="mb-3 mt-3">
            <label for="stdname">학생명</label>
            <input type="text" class="form-control" 
      	     id="stdname" placeholder="학생명 입력" name="stdname">
         	</div>
         	<div class="mb-3 mt-3">
            <label for="kor">국어점수</label>
            <input type="number" class="form-control" 
      	     id="kor" placeholder="국어점수 입력" name="kor">
         	</div>
         	<div class="mb-3 mt-3">
            <label for="eng">영어점수</label>
            <input type="number" class="form-control" 
      	     id="eng" placeholder="영어점수 입력" name="eng">
         	</div>
         	<div class="mb-3 mt-3">
            <label for="math">수학점수</label>
            <input type="number" class="form-control" 
      	     id="math" placeholder="수학점수 입력" name="math">
         	</div>
         	<button type="submit" class="btn btn-primary">점수입력</button>
     	</form>
		<table class="table table-striped table-hover">
			<thead class="table-success">
		      	<tr  class="text-center">
				    <th>학생명</th>
				    <th>국어점수</th>
				    <th>영어점수</th>
				    <th>수학점수</th>
				    <th>총점</th>
				    <th>평균</th>
		      	</tr>
		    </thead>
		    <tbody>
		    <%-- ?empno=7900&ename=홍길동 --%>
			   	<tr class="text-center">
			        <td>${param.stdname}</td>
			        <td>${param.kor}</td>
			        <td>${param.eng}</td>
			        <td>${param.math}</td>
			        <td>${param.kor + param.eng + param.math}</td>
			        <td>${(param.kor + param.eng + param.math)/3}</td>
			   	</tr>
		 	</tbody>
		</table>
		<%--
		ex) 학생명	국어		영어		수학 	점수를 from에 입력해서 계산 클릿기 아래에 점수, 총점 el로 출력되게
		 --%>	
    </div>
</body>
</html>