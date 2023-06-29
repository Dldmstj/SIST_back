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
# emplist 키를 입력시, post로 ajax처리
1. 내용
	emp의 사원명과 직책 입력시, 키 입력과 동시에 post 방식으로 요청을 처리하여,
	비동기적으로 json데이터를 가져와서, 테이블에 body를 출력처리하는 내용
	1) post방식
		ajax로 post방식을 처리하는 것을 url로 요청값을 처리하는 것이 아니라,
		요청 body에 따로 요청값을 처리하기 때문에
		xhr.open("post",page,true)
		xhr.setRequestHeader("Content-type", "application/x-www.form-urlencoded"
		클라이언트 => 서버
			1) form데이터(query string)을 전송할 때 사용하는 option
		기타 옵션
			1) multipart/form-data : 파일 업로드할 때 사용하는 옵션(binary)
			2) application/json : json데이터로 전송시 사용
			3) text/plain : 일반 데이터를 인코딩하지 않고 전송
		
		xhr.send("key=val&...")
		으로 코드를 변경하여야 한다.
		
2. 개발 순서
	1) 파일정리
		프론트단(a12_Gson_Sch_Post.jsp)
		백엔드단(z12_empList.jsp)
		
	2) backend(z12_empList.jsp?ename=A&job=A)
		요청값 : 사원명(ename), 직책(job)
		import: Dao, Vo, Gson
		List<Emp> elist = dao.getEmpList(ename,job)
		<%=gson.toJson(elist)%>
		
	3) frontend 
		대상 객체 지정	
			<input onkeyup="schEmp()"/>
			<button type="button" onclick="schEmp"/>
		
		이벤트 핸들러함수 schEmp()
			- 입력 DOM객체
			var enameVal = document.querySelector("#ename").value;
			var jobVal = document.querySelector("#job").value;
			var qurStr = "ename="+enameVal+"&job="+jobVal
			var xhr = new XMLHttpRequest()
			xhr.open("post","z12_empList.jsp",true)
			xhr.setRequestHeader("Content-Type",
								"application/x-www-form-urlencoded");
			xhr.send(qurStr)
			xhr.onreadystatechange=funcrion(){
				if(xhr.readyState==4&&xhr.status==200){
					var empList = JSON.parse(xhr.responseText)
					console.log(empList)
				}
			}
--%>
 <script type="text/javascript">

 
 	function shcEmp13(){
 		var enameOb = document.querySelector("#ename");
 		var jobOb = document.querySelector("#job");
 		enameOb.value = enameOb.value.toUppercase();
 		jobOb.value = jobOb.value.toUppercase();
 		
 		if(event.keyCode==13){
 			schEmp();
 		}
 	}
 	
 	function shcEmp(){
 		var enameVal = document.querySelector("#ename").value;
		var jobVal = document.querySelector("#job").value;
		var qurStr = "ename="+enameVal+"&job="+jobVal
		var xhr = new XMLHttpRequest();
		xhr.open("post","z12_empList.jsp",true);
		xhr.setRequestHeader("Content-Type",
							"application/x-www-form-urlencoded");
		xhr.send(qurStr)
		xhr.onreadystatechange=function(){
			if(xhr.readyState==4&&xhr.status==200){
				console.log(xhr.responseText)
				var empList = JSON.parse(xhr.responseText);
				var empShow = document.querySelector("#empShow");
				var show = "";
				empList.forEach(function(emp){
					show+="<tr class='text-center'>"
					show+="<td>"+emp.empno+"</td>"
					show+="<td>"+emp.ename+"</td>"
					show+="<td>"+emp.job+"</td>"
					show+="<td>"+emp.mgr+"</td>"
					show+="<td>"+emp.sal+"</td>"
					show+="<td>"+emp.comm+"</td>"
					show+="<td>"+emp.deptno+"</td>"
					show+="</tr>"
				});
				empShow.innerHTML = show
			}
		}
 	}
 </script>
<body>
    <div class="container mt-3">
    	<h2>사원정보</h2>
    	<form action="" method="post">
         	<div class="mb-3 mt-3">
            <label for="ename">사원명:</label>
            <input onkeyup="schEmp13()" type="text" class="form-control" 
      	     id="ename" placeholder="사원명 입력" name="ename"/>
         	</div>
         	<div class="mb-3 mt-3">
            <label for="job">직책명:</label>
            <input onkeyup="schEmp13()" type="text" class="form-control" 
      	     id="job" placeholder="직책명 입력" name="job"/>
         	</div>
         	<button onclick="shcEmp()" type="button" class="btn btn-primary">검색</button>
     	</form>
		<table class="table table-striped table-hover">
			<thead class="table-success">
		      	<tr  class="text-center">
				    <th>사원번호</th>
				    <th>사원명</th>
				    <th>직책명</th>
				    <th>관리자번호</th>
				    <th>급여</th>
				    <th>보너스</th>
				    <th>부서명</th>
		      	</tr>
		    </thead>
		    <tbody id="empShow">
		 	</tbody>
		</table>      	
    </div>
</body>
</html>