<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%--
[1단계:개념] 1. ajax처리시 서버단 처리와 프런트 처리의 내용을 순차별 기술하고, 핵심 코드를 정리하세요
	# 백엔드 처리
			1) 요청값 처리
				String id = request.getParameter("id");
			2) Dao, Vo, gson import
				com.google.gson.Gson
			3) Member m = dao.checkMember(id)
			4) if(m!=null)
				<%=gson.toJson(m)%>
			   else{}
			   
	# 프런트처리
			1) 화면 구현
				id [	] [등록여부확인]
			2) 이벤트 핸들러 함수
				function asynAjx(){
					xhr.open("get",page,true)
					xhr.onreadystatechage=function(){		// 비동기식
						if(xhr.status==200&&xhr.readyState==4{
							return xhr.responseText;
						}
					}
				}
[1단계:코드] 2. 부서정보를 ajax로 (부서명,부서위치)키워드 검색하여 리스트 처리하세요.
     --%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
    <title>Insert title here</title>
</head>
<script type="text/javascript">
	function schDept(){
		var dnameVal = document.querySelector("#dname").value;
		var locVal = document.querySelector("#loc").value;
		var qurStr = "dname="+dnameVal+"&loc="+locVal
		var xhr = new XMLHttpRequest();
		xhr.open("post","z07_0628.jsp",true);
		xhr.setRequestHeader("Content-Type",
							"application/x-www-form-urlencoded");
		xhr.send(qurStr)
		xhr.onreadystatechange=function(){
			if(xhr.readyState==4&&xhr.status==200){
				console.log(xhr.responseText)
				var deptList = JSON.parse(xhr.responseText);
				var deptShow = document.querySelector("tbody");
				var show = "";
				deptList.forEach(function(dept){
					show+="<tr class='text-center'>"
					show+="<td>"+dept.deptno+"</td>"
					show+="<td>"+dept.dname+"</td>"
					show+="<td>"+dept.loc+"</td>"
					show+="</tr>"
				});
				deptShow.innerHTML = show
			}
		}
	}
	<%--
	# z07_0628.jsp
		<%
		String dname = request.getParameter("dname");
		if(dname == null) dname = "";
		String loc = request.getParameter("loc");
		if(loc == null) loc = "";
		
		A04_PreParedDao dao = new A04_PreParedDao();
		List<Dept> dlist = dao.getDeptList(dname,loc);
		Gson gson = new Gson();	// Gson 객체 선언
		%>
		<%=gson.toJson(dlist)%>
		
	# DAO
	public List<Dept> getDeptList(String dname, String loc) {
		List<Dept> dlist = new ArrayList<>();
		String sql = "SELECT * FROM dept where dname like ? and loc like ? order by deptno";
		
		try {
			conn = DB2.conn();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, '%'+dname+"%");
			pstmt.setString(2, '%'+loc+"%");
			rs = pstmt.executeQuery();
			
			
			while (rs.next()) {
				dlist.add(new Dept(
						rs.getInt("deptno"),
						rs.getString("dname"),
						rs.getString("loc")
						));
			}
		} catch (SQLException e) {
			System.out.println("DB 관련 오류: " + e.getMessage());
		} catch (Exception e) {
			System.out.println("일반 오류: " + e.getMessage());
		} finally {
			DB2.close(rs, pstmt, conn);
		}
		return dlist;
	}
	--%>
</script>
<body>
    <div class="container mt-3">
    	<h2>부서정보</h2>
    	<form action="" method="post">
         	<div class="mb-3 mt-3">
            <label for="dname">부서명</label>
            <input type="text" class="form-control" 
      	     id="dname" placeholder="부서명 입력" name="dname">
         	</div>
         	<div class="mb-3 mt-3">
            <label for="loc">부서위치</label>
            <input type="text" class="form-control" 
      	     id="loc" placeholder="부서위치 입력" name="loc">
         	</div>
         	<button onclick="schDept()" type="button" class="btn btn-primary">검색</button>
     	</form>
		<table class="table table-striped table-hover">
			<thead class="table-success">
		      	<tr  class="text-center">
				    <th>부서번호</th>
				    <th>부서명</th>
				    <th>부서위치</th>
		      	</tr>
		    </thead>
		    <tbody>
		 	</tbody>
		</table>      	
    </div>
</body>
</html>
