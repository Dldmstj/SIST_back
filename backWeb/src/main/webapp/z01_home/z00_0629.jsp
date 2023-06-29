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

1. select (Combo box) 모듈 ajax로 list 및 등록 처리
   만들어보기
2. 처리순서
   1) DB 테이블 sql 구성
   2) Dao 생성
   3) 초기 list 화면 구성 : ajax처리
   4) 등록 click시 등록 화면 구성
   5) 클릭시, 상세화면 구성
      - 수정/삭제처리..
   6) Combo Box활용

# 진행 순서
0. 파일
   프런트(a13_ComBoAjax.jsp)
1. backend(z13_comboList.jsp)
   요청값 : title
   import 처리 (dao,Gson,Code)
   Gson으로 json 데이터 로딩
----------------------   
2. frontend(a13_ComBoAjax.jsp)
   1) 화면구성
   2) 이벤트처리
   3) 이벤트 핸들러 처리
      - 검색 DOM
      - ajax 처리
      - 화면 리스트 처리..



 --%>
 <script type = "text/javascript">
function schCode(){
      var titleVal = document.querySelector("#title").value
      var qrStr="title="+titleVal
      var xhr = new XMLHttpRequest()
      xhr.open("post","../b01_ajax/z13_comboList.jsp",true)
      xhr.setRequestHeader("Content-Type",
            "application/x-www-form-urlencoded")
      xhr.send(qrStr)
      xhr.onreadystatechange=function(){
         if(xhr.readyState==4 && xhr.status==200){
            console.log(xhr.responseText)
            var codeList = JSON.parse(xhr.responseText)
            var codeShow = document.querySelector("#codeShow")
            var show = ""
            codeList.forEach(function(code){
               show+="<tr  class='text-center'>"
               show+="<td>"+code.no+"</td>"
               show+="<td>"+code.title+"</td>"
               show+="<td>"+code.refno+"</td>"
               show+="<td>"+code.ordno+"</td>"
               show+="</tr>"
               
            })
            codeShow.innerHTML = show
            
            
         }
      }
      
      
   }
 </script>
<body>
    <div class="container mt-3">
       <h2>Combox list</h2>
       <form action="" method="post">
            <div class="mb-3 mt-3">
            <select id = "title">
            <option value="사과">사과</option>
            <option value="바나나">바나나</option>
            <option value="딸기">딸기</option>
            <option value="오렌지">오렌지</option>
            </select>
            </div>
            
            <button onclick = "schCode()" type="button" class="btn btn-primary">등록</button>
        </form>
      <table class="table table-striped table-hover">
         <thead class="table-success">
               <tr class= "text-center">
                <th>no</th>
                <th>title</th>
                <th>refno</th>
                <th>ordno</th>
              
               </tr>
          </thead>
          <tbody id = "codeShow">
      
          </tbody>
      </table>         
    </div>
</body>
</html>