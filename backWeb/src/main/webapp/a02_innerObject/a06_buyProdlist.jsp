<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<%
// ?pname=감자&price=1000&pname=옥수수&price=2000&pname=고구마&price=3000
String pnames[] = request.getParameterValues("pname");
String prices[] = request.getParameterValues("price");
			out.print("<h2>구매내역</h2>");
int tot = 0;
if(pnames != null){
	if(prices != null){
			out.print("<table border>");
			out.print("<tr><th>no</th><th>물건명</th><th>가격</th></tr>");
			out.print("<tr>");
		for(int i=0; i<=prices.length; i++){
			tot += Integer.parseInt(prices[i]);
			out.print("<td>");
			out.print(i+"\t"+pnames[i]+"\t"+prices);
			out.print("</td>");
		}
			out.print("</tr>");
			out.print("<tr><th colspan='2'>총비용</th><td>"+tot+"</td></tr>");
			out.print("</table>");
	}	
	
}
%>
<body>

</body>
</html>