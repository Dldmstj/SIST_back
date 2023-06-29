<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css"
	rel="stylesheet">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
<title>Insert title here</title>
</head>
<%--
   code(키, 값, 상위키, 정렬순위)
   1000   과일      0
   1001   사과      1000   1
   1002   바나나   1000   2
   1003   딸기      1000   3
   1004   오렌지   1000   4
   select*
   from code
   where 상위키 = 1000;
   order 정렬순위
   
1. select(Combo box) 모듈 ajax로 list 및 등록 처리 만들어보기
2. 처리순서
	1) DB 테이블 sql구성
	2) DAO 생성
	3) 초기 list 화면 구성
	4) 등록 click시 등록 화면 구성
	5) 클릭시 상세화면 구성
		- 수정/삭제 처리
	6) Combo Box 활용
	
	# 진행 순서
	0. 파일
		front (a13_ComBoAjax.jsp)
		
	1. backend(z13_comboList.jsp)
		요청값 :  title
		import 처리(dao, Gson, Code)
		Gson 으로 json 데이터 로딩
		
	2. frontend(a13_ComBoAjax.jsp)
		1) 화면 구성
			제목 [	][검색]
		2) 이벤트 처리
		3) 이벤트 핸들러 처리
			- 검색 DOM
			- ajax 처리
			- 화면 리스트 처리
# 코드 등록 처리 ajax
1. front단
	1) 등록버튼 : 클릭
	2) 등록 pop창 로딩(bootstrap)
		등록항목 text
		제목: [	]
		값: [	]
		상위번호: [	]
		정렬순서: [	]
		[등록]
	3) 이벤트 핸들러
	ajax로 등록 controller 호출 처리
2. back단(servlet)
	1) 요청값 받기
	2) DAO (등록처리-메서드 추가)
		INSERT INTO code values(code_seq.nextval,'오렌지',1001,4);
	3) 등록 결과 리턴 문자열
		
 --%>
<script type="text/javascript">
	function schCode13() {
		if (event.keyCode == 13) {
			schCode();
		}
	}
	function schCode() {
		var titleOb = document.querySelector("#title")
		var xhr = new XMLHttpRequest()
		xhr.open("post", "z13_comboList.jsp", true)
		xhr.setRequestHeader("Content-Type",
				"application/x-www-form-urlencoded")
		xhr.send("title=" + titleOb.value)
		xhr.onreadystatechange = function() {
			if (xhr.readyState == 4 && xhr.status == 200) {
				var codeList = JSON.parse(xhr.responseText)
				var show = ""
				codeList.forEach(function(code) {
					show += "<tr class='text-center'>"
					show += "<td>" + code.no + "</td>"
					show += "<td>" + code.title + "</td>"
					show += "<td>" + code.refno + "</td>"
					show += "<td>" + code.ordno + "</td>"
					show += "</tr>"
				})
				var tBody = document.querySelector("tbody")
				tBody.innerHTML = show;
			}
		}

	}
</script>
<body>
	<div class="container mt-3">
		<h2>Combox list</h2>
		<div class="mb-3 mt-3">
			<label for="title">제목:</label> <input type="text"
				class="form-control" id="title" onkeyup="schCode13()"
				placeholder="타이틀 입력" name="title">
		</div>
		<button onclick="schCode()" type="button" class="btn btn-success">조회</button>
		<table class="table table-striped table-hover">
			<thead class="table-success">
				<tr class="text-center">
					<th>번호</th>
					<th>제목</th>
					<th>상위번호</th>
					<th>정렬</th>
				</tr>
			</thead>
			<tbody>
				<tr class="text-center">
					<td></td>
					<td></td>
					<td></td>
					<td></td>
				</tr>
			</tbody>
		</table>
		<button type="button" class="btn btn-primary" data-bs-toggle="modal"
			data-bs-target="#myModal">코드등록</button>
	</div>
	<!-- Button to Open the Modal -->
	<!-- The Modal -->
	<div class="modal" id="myModal">
		<div class="modal-dialog">
			<div class="modal-content">

				<!-- Modal Header -->
				<div class="modal-header">
					<h4 class="modal-title">Modal Heading</h4>
					<button type="button" class="btn-close" data-bs-dismiss="modal"></button>
				</div>

				<!-- Modal body -->
				<div class="modal-body">
					<div class="mb-3 mt-3">
						<label for="title">제목</label>
						<input type="text"
							class="form-control" id="title"
							placeholder="제목 입력" name="title"/>
					</div>
					<div class="mb-3 mt-3">
						<label for="val">값</label>
						<input type="text"
							class="form-control" id="val"
							placeholder="값 입력" name="val"/>
					</div>
					<div class="mb-3 mt-3">
						<label for="refno">상위번호</label>
						<input type="number"
							class="form-control" id="refno"
							placeholder="상위번호 입력" name="refno"/>
					</div>
					<div class="mb-3 mt-3">
						<label for="ordno">정렬순서</label>
						<input type="number"
							class="form-control" id="ordno"
							placeholder="정렬순서 입력" name="ordno"/>
					</div>
				</div>

				<!-- Modal footer -->
				<div class="modal-footer">
					<button type="button" class="btn btn-success"
						>Save</button>
					<button type="button" class="btn btn-danger"
						data-bs-dismiss="modal">Close</button>
				</div>
			</div>
		</div>
	</div>
</body>
<script type="text/javascript">
	function ajaxSave(){
		var title = document.querySelector("#title").value;
		var val = document.querySelector("#val").value;
		var refno = document.querySelector("#refno").value;
		var ordno = document.querySelector("#ordno").value;
		var qStr = "title="+title+"&refno="+refno+"&ordno="+ordno+"&val="+val
		
		var xhr = new XMLHttpRequest();
		xhr.open("post","/codeInsert",true)
		xhr.setRequestHeader("Content-Type","application/x-www-form-urlencoded")
		xhr.send(qStr)
		xhr.onreadystatechange=function(){
			if(xhr.readyState==4&&xhr.status==200){
				var result = xhr.responseText
				if(result=="Y"){
					alert("등록성공")
				}else{
					alert("등록실패")
				}
			}
		}
		
	}
</script>
</html>