package backWeb.a01_servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

/**
 * Servlet implementation class A04_Servlet_html
 */
public class A04_Servlet_html extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public A04_Servlet_html() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charst=utf-8");
		PrintWriter out = response.getWriter();
		// 1x3 테이블, 3x1테이블, 3x3테이블에 번호가 들어간 화면을 출력
		for(int i=1; i<=3; i++) {
			out.print("<table border><tr><td>" + i + "</td></tr></table>");
		}
		
		out.print("<br>");
		
		out.print("<table border><tr>");
		for(int i=1; i<=3; i++) {
			out.print("<td>" + i + "</td>");
		}
		out.print("</tr></table><br>");
		
		int cnt=0;
		for(int i=1; i<=3; i++) {
			out.print("<table border><tr>");
			for(int j=1; j<=3; j++) {
				cnt++;
				out.print("<td>" + cnt + "</td>");
			}
			out.print("</tr></table>");
		}
		out.print("<br>");
		
		out.print("<table border>");
		for(int i=1; i<=9; i++) {
			if(i%3==1) out.print("<tr>");
			out.print("<td>"+i+"</td>");
			if(i%3==0) out.print("</tr>");
		}
		out.print("</table>");
		out.close();
		
	}

}
