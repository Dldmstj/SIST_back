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
<body>
<%
String name = request.getParameter("stdname");
String ks = request.getParameter("kor");
String es = request.getParameter("eng");
String ms = request.getParameter("math");

int kor = 0;
int eng = 0;
int math = 0;

if(ks != null){
	kor = Integer.parseInt(ks);
}
if(es != null){
	eng = Integer.parseInt(es);
}
if(ms != null){
	math = Integer.parseInt(ms);
}
int tot = kor + eng + math;
int avg = tot/3;

%>

    <div class="container mt-3">
       <h2>점수</h2>
       <table class="table table-striped table-hover">
          <thead class="table-success">
               <tr class="text-center">
                 <th>이름</th>
                 <th>국어</th>
                 <th>영어</th>
                 <th>수학</th>
                 <th>전체</th>
                 <th>평균</th>
               </tr>
          </thead>
          <tbody>
               <tr class="text-center">
                 <td><%=name %></td>
                 <td><%=kor %></td>
                 <td><%=eng %></td>
                 <td><%=math %></td>
                 <td><%=tot %></td>
                 <td><%=avg %></td>
               </tr>
          </tbody>
        </table>         
     </div>
</body>
</html>