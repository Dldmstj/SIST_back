package backWeb.a01_servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

/**
 * Servlet implementation class Z01_Servlet_html
 */
public class Z01_Servlet_html extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Z01_Servlet_html() {
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
		int cnt=0;
		for(int i=1; i<=4; i++) {
			out.print("<script>"
					+ "function click(ob){}"
					+ "</script>");
			out.print("<table border><tr>");
			for(int j=1; j<=4; j++) {
				cnt++;
				out.print("<td onclick='click(this)'>" + cnt + "</td>");
			}
			out.print("</tr></table>");
		}
		out.print("<br>");
	}

}
