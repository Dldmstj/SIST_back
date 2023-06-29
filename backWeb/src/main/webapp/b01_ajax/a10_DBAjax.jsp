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
	<script type="text/javascript">
		function getSyn(page){
			var xhr = new XMLHttpRequest();
			xhr.open("get",page,false);
			xhr.send()
			return xhr.responseText;
		}	// 서버에서 받은 데이터 비동기적으로 처리하는 function
			// XMLHttpRequest 객체 생성, 전달하는 js function
		
		function key13(){	// 입력하다가 enter 입력시에만 검색되는 js
			if(event.keyCode==13)
				callEmpList()
		}
		
		function callAjax(){
			var htmlCode = getSyn("z10_jobDBAll.jsp")
			console.log(htmlCode)
			var tbody= document.querySelector("tbody");
			tbody.innerHTML = htmlCode;
		}
		
		function callJobList(){
	    	var title = document.querySelector("#title").value;
	    	var min_sal1 = document.querySelector("#min_sal1").value;
	    	var min_sal2 = document.querySelector("#min_sal2").value;
	    	var query ="title="+title+"&min_sal1="+min_sal1+"&min_sal2"+min_sal2"
	    	document.querySelector("tbody").innerHTML
	    		=getSyn("z10_jobDBAll.jsp?"+query)
	    }
		
	</script>    
</head>
<body>
    <div class="container mt-3">
    	<h2>직책정보 리스트</h2>
    	<form action="" method="post">
         	<div class="mb-3 mt-3">
            <label for="title">제목:</label>
            <input type="text" class="form-control" 
      	     id="title" placeholder="제목 입력" name="title">
         	</div>
         	<div class="mb-3 mt-3">
            <label for="min_sal1">최소</label>
            <input type="number" class="form-control" 
      	     id="min_sal1" placeholder="최소" name="min_sal1">
         	</div>
         	<div class="mb-3 mt-3">
            <label for="min_sal2">최대</label>
            <input type="number" class="form-control" 
      	     id="min_sal2" placeholder="최대" name="min_sal2">
         	</div>
         	<button type="button" onclick="callJobList()" class="btn btn-primary">직책정보 로딩</button>
     	</form>
		<table class="table table-striped table-hover">
			<thead class="table-success">
		      	<tr  class="text-center">
				    <th>직책아이디</th>
				    <th>직책명</th>
				    <th>최저급여</th>
				    <th>최고급여</th>
		      	</tr>
		    </thead>
		    <tbody id="jobList">
		 	</tbody>
		</table>      	
    </div>
</body>
</html>