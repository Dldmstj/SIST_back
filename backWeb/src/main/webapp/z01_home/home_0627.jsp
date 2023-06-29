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
<%
/* # 실습과제
[1단계:개념] 1. ajax처리 순서를 기술하세요(h01_show.jsp vs z11_data.jsp 두 페이지간 기준)
	1) h01_show.jsp에서 z11_data.jsp(서버) 호출
		xhr.open("get","z11_data.jsp",false);
	2) 서버의 결과값 받기
		show.innerHTML = xhr.responseText;
	3) 서버에서 받은 결과값을 특정 DOM에 할당해서 출력
*/
%>
<script type="text/javascript">
	function getSyn(page){
		var xhr = new XMLHttpRequest();
		xhr.open("get",page,false);
		xhr.send()
		return xhr.responseText;
	}
	
	// [1단계:코드] 2. ajax로 [화면호출]로 서버에 있는 <h3>반가워요</h3> 처리
	function callZ03(){
		var show01 = document.querySelector("#show01");
		show01.innerHTML = getSyn("z03_0627.jsp");
	}
	<%--
		z03_0627.jsp
		<h3>반가워요</h3>
	--%>
	
	// [1단계:코드] 2. ajax로 물건명[  ]가격[   ][전송 및 화면호출]로 서버에 있는 <h3>@@는 @@@원입니다.</h3>
	function callZ04(){
		var pname = document.querySelector("#pname").value;
		var price = document.querySelector("#price").value;
		var show02 = document.querySelector("#show02");
		show02.innerHTML = getSyn("z04_0627.jsp?pname="+pname+"&price="+price);
	}
	<%--
		z04_0627.jsp
		<%
		String pname = request.getParameter("pname");
		if(pname ==null) pname="";
		String price = request.getParameter("price");    
		if(price ==null) price="";
		%>
		<h3><%=pname %>는 <%=price %>원입니다.</h3>
	--%>
	
	// [1단계:코드] 2. ajax로 [데이터화면호출]로 서버에 table형식의 화면 호출(DAO - public List<Manager> getManager())
	function callZ05(){
		var show02 = document.querySelector("#tbody01");
		show02.innerHTML = getSyn("z05_0627.jsp");
	}
	<%--
		z05_0627.jsp
		<%
		// [1단계:코드] 2. ajax로 [데이터화면호출]로 
		// 서버에 table형식의 화면 호출(DAO - public List<Manager> getManager())
		A04_PreParedDao dao = new A04_PreParedDao();
		//empno, ename, dname
		%>
		<%for(Manager mng:dao.getManager()){ %>
		<tr class="text-center">
			<td><%=mng.getEmpno() %></td>
			<td><%=mng.getEname() %></td>
			<td><%=mng.getDname()%></td>
		</tr>
		<%}%>
	--%>
	
	// [1단계:코드] 3. ajax로 id[  ]pass[  ] [로그인]  table형식으로 회원이 없던지 table로 출력
	function callZ06(){
		var id = document.querySelector("#id").value;
		var pw = document.querySelector("#pw").value;
		var show03 = document.querySelector("#tbody02");
		show03.innerHTML = getSyn("z06_0627.jsp?id="+id+"&pw="+pw);
	}
	<%--
		z06_0627.jsp
		<%
		// [1단계:코드] 3. ajax로 id[  ]pass[  ] [로그인]  
		// table형식으로 회원이 없던지 table로 출력
		String id = request.getParameter("id");
		if(id==null) id="";
		String pw = request.getParameter("pw");
		if(pw==null) pw="";
		A04_PreParedDao dao = new A04_PreParedDao();
		ShMember m = dao.getMemberLogin(id, pw);
		
		if(m != null){
		%>
		<tr class="text-center">
			<td><%=m.getName() %></td>
			<td><%=m.getId() %></td>
		</tr>
		<%}else{%>
			<h2>가입된 회원이 없습니다.</h2>
		<%} %>
	--%>
	
</script>
<body>
    <div class="container mt-3">
    	<div id="show01"></div>
        <button onclick="callZ03()" type="button" class="btn btn-primary">화면호출</button>
    	<br><br>
    	<h2>물건 / 가격</h2>
    	<form method="post">
         	<div class="mb-3 mt-3">
            <label for="pname">물건명</label>
            <input type="text" class="form-control" 
      	     id="pname" placeholder="물건명 입력" name="pname">
         	</div>
         	<div class="mb-3 mt-3">
            <label for="price">가격</label>
            <input type="number" class="form-control" 
      	     id="price" placeholder="가격 입력" name="price">
         	</div>
         	<button onclick="callZ04()" type="button" class="btn btn-primary">전송 및 화면호출</button>
         	<div id="show02"></div>
     	</form>
     	<br><br>
     	<h2>getManager</h2>
     	<button onclick="callZ05()" type="button" class="btn btn-primary">DAO</button>
		<table class="table table-striped table-hover">
			<thead class="table-success">
		      	<tr  class="text-center">
				    <th>부서번호</th>
				    <th>사원명</th>
				    <th>부서이름</th>
		      	</tr>
		    </thead>
		    <tbody id="tbody01">
		 	</tbody>
		</table><br>
     	<h2>회원 유무</h2>
     	<form method="post">
         	<div class="mb-3 mt-3">
            <label for="id">아이디</label>
            <input type="text" class="form-control" 
      	     id="id" placeholder="아이디 입력" name="id">
         	</div>
         	<div class="mb-3 mt-3">
            <label for="pw">비밀번호</label>
            <input type="password" class="form-control" 
      	     id="pw" placeholder="비밀번호 입력" name="pw">
         	</div>
         	<button onclick="callZ06()" type="button" class="btn btn-primary">로그인</button>
         	<div id="show03"></div>
     	</form>
		<table class="table table-striped table-hover">
			<thead class="table-success">
		      	<tr  class="text-center">
				    <th>이름</th>
				    <th>아이디</th>
		      	</tr>
		    </thead>
		    <tbody id="tbody02">
		 	</tbody>
		</table><br>
    </div>
</body>
</html>