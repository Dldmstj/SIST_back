package backWeb.a01_servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.Writer;

/**
 * Servlet implementation class A01_Servlet
 */
public class A01_Servlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public A01_Servlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, 
						HttpServletResponse response) throws ServletException, IOException {
		// jsp는 server()를 둘러싸고 있어서 처리되는 코드이다.
		// response객체는 client에 특정한 코드를 전달할 때 사용된다.
		// Stream객체 중, 쓰기 객체인 Writer객체를 만들어 주어, client에 쓴 내용을 전달한다.
		Writer out = response.getWriter();
		// client에 출력을 전달함
		out.write("hello world");
		
		// A02_Servlet2.java 파일 만들고 Have a nice daty를 브라우저 화면에 출력
	}

}
