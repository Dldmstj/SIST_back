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
     <%
     String id = request.getParameter("id");
     if(id == null) id ="";
     String isReg = "I";
     
     if(id.equals("himan")){
    	 isReg ="Y";
     }else if(id.equals("")){
    	 isReg ="I";
     }else{
    	 isReg ="N";
     }
     %>
     <script type="text/javascript">
     </script>
</head>
<body>
    <div class="container mt-3">
    	<h2>사원정보 등록</h2>
    	<form action="" method="post">
         	<div class="mb-3 mt-3">
            <label for="id:">id:</label>
            <input type="text" class="form-control" 
      	     id="id:" placeholder="id: 입력" name="id:">
         	</div>
         	<button type="button" id="btn01" class="btn btn-success">아이디 중복 체크</button>
     	</form>
	    <script type="text/javascript">
		var isReg = "<%=isReg%>"
			if(isReg == 'Y') {
				alert("이미 사용중인 아이디 입니다.")
			}
			if(isReg == 'N') {
				alert("사용할 수 있는 아이디 입니다.")
				document.querySelector("#id").value="<%=id%>";
				// id에 대한 유효성이 완료될 때.
					// 회원정보 등록이 가능하도록 할 때 필요
				btnObj.value="유효성 확인 완료";
			}
			
			// # 버튼으로 submit 처리하는 방법
	    	/* var btnObj = document.querySelector("#btn01"); */
	    	btnObj.click=function(){
	    		// 코드로 전송 처리
	    		// 전송 전에 유효성 처리 가능/로직처리 가능
	    		document.querySelector("form").submit();
	    		// submit 버튼 없이 submit 처리하는 방법
	    	}
		</script>
    </div>
</body>
</html>