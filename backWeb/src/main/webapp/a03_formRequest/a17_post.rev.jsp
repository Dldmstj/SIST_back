<%@ page language="java" contentType="text/html; charset=EUC-KR"
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
<body>
    <div class="container mt-3">
       <h2>사원정보 등록</h2>
       <form action="a18_rev.jsp">
            <div class="mb-3 mt-3">
            <label for="stdname">이름</label>
            <input type="text" class="form-control" 
              id="stdname" placeholder="이름 입력" name="stdname">
            <label for="kor">국어</label>
            <input type="number" class="form-control" 
              id="kor" placeholder="국어점수 입력" name="kor">
            <label for="eng">영어</label>
            <input type="number" class="form-control" 
              id="eng" placeholder="영어점수 입력" name="eng">
            <label for="math">수학</label>
            <input type="number" class="form-control" 
              id="math" placeholder="수학점수 입력" name="math">
            </div>
            <button type="submit" class="btn btn-primary">등록</button>
        </form>
       <table class="table">
          <thead class="table-success">
               <tr>
                 <th>사원번호</th>
                 <th>사원명</th>
               </tr>
          </thead>
          <tbody>
               <tr>
                 <td><%=request.getParameter("empno") %></td>
                 <td><%=request.getParameter("ename") %></td>
               </tr>
          </tbody>
        </table>         
     </div>
</body>
</html>
<%--
이름
--%>