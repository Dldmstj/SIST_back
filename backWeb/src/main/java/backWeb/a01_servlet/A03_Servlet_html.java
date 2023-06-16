package backWeb.a01_servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

/**
 * Servlet implementation class A03_Servlet_html
 */
public class A03_Servlet_html extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public A03_Servlet_html() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 0. responser: client에 전달하는 객체
		// 1. 한글 코드에 넣기 위해 설정
		//	전달할 때, 한글 encoding 방식 중에 utf-8 방식으로 처리
		response.setContentType("utf-8");
		// 2. html코드를 처리하기 위한 설정
		response.setContentType("text/html;charset=utf-8");
		// 3. Stream으로 출력 처리하는 객체
		PrintWriter out = response.getWriter();
		for(int i=1; i<=10; i++) {
			out.print("<h2>"+i+"번째 안녕하세요</h2>");
		}
		// 4. 생성 후, Stream 객체 해제
		out.close();
	}

}
