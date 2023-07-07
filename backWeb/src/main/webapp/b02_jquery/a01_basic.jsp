<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<%--
pageContext.request.contextPath
:웹서버와 연동된 프로젝트명으로 default webapp위치를 잡아준다.
:프로젝트명이 다를지라도 webapp 하위의 여러 자원들을 
절대경로로 접근이 가능하다.
 --%>

<fmt:requestEncoding value="utf-8"/>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
    <title>Insert title here</title>
	<script src="${path}/a00_com/jquery-3.7.0.js" type="text/javascript"></script>
	    <script type="text/javascript">
	    	$(document).ready(function(){
	    		$("h2").text("jquery 로딩 성공")
	    		// 모든 2가 클릭이 되면
	    		$("p").click(function(){
	    			// $(this) : 클릭한 html의 레이블이 클릭되었습니다. 로 출력
	    			$(this).text("클릭되었습니다.")
	    		})
	    		/*
	    		# jquery 선택자
	    		1. $("선택자")
	    			단일 선택으로 처리할 수 있고, 동일한 태그에 모든 기능을 처리할 때도 for문 없이 가능하다.
	    			$("h1").text("일괄변경")
	    			h1이 여러개 있더라도 일괄적으로 label을 변경할 수 있다.
	    			$("선택자").eq(index번호).text("특정 내용 변경")
	    			$("h1").eq(0).text("첫 번째 내용 변경")
	    		# 레이블 변경
	    		1. innerText
	    			$("선택자").text("변경할 데이터")
	    			$("선택자").text()
	    		2. innerHTML
	    			$("선택자").html("<h2>안녕</h2>")
	    			$("선택자").html()
	    		2. value
	    			$("[name=name]").val("할당")
	    			$("[name=name").val()
	    		2. 기본 속성
	    			1) align="center" img="a01_img.jpg"
	    			$("[선택자]").attr("align","center")
	    			$("[선택자]").attr("img","a01_img.jpg")
	    		5. style 속성
	    			1) style="background:red; color:blue;"
	    			$("선택자").css("background","red")
	    			$("선택자").css("color","blue")
	    			$("선택자").css({
	    				background:"red",
	    				color:"blue"
	    			})
	    		# 이벤트
	    		$("선택자").이벤트명(익명함수);
	    			$("h1").click(function(){
	    				// this. h1 중에 클릭한 대상객체
	    				$(this).css(background)
	    			})
	    		*/
	    	});
	</script>
</head>
<body>
    <div class="container mt-3">
    	<h2>사원정보 등록</h2>
    	<h3>기본 경로:${path}</h3>
    	<p>클릭</p>
    	<p>클릭</p>
    	<p>클릭</p>
    	<p>클릭</p>
    	<p>클릭</p>
    	<p>클릭</p>
    	<p>클릭</p>
    	<nav class="navbar navbar-expand-sm bg-dark navbar-dark">
           <div class="container-fluid">       
          <form method="post"  class="d-flex align-items-center" >
               <input type="text" class="form-control me-2" 
                 id="deptno" placeholder="부서번호 입력"  name="deptno"  aria-label="Search">
               <input type="text" class="form-control me-2" 
                 id="dname" placeholder="부서명 입력"  name="dname"  aria-label="Search">
               <input type="text" class="form-control me-2" 
                 id="loc" placeholder="부서위치 입력"  name="loc"  aria-label="Search">
               <button type="submit" class="btn btn-primary" style="width:200px;">등록</button>
           </form>
           </div>
       </nav>
		<table class="table table-striped table-hover">
			<thead class="table-success">
		      	<tr  class="text-center">
				    <th>Firstname</th>
				    <th>Lastname</th>
				    <th>Email</th>
		      	</tr>
		    </thead>
		    <tbody>
			   	<tr  class="text-center">
			        <td>John</td>
			        <td>Doe</td>
			        <td>john@example.com</td>
			   	</tr>
		 	</tbody>
		</table>      	
    </div>
</body>
</html>