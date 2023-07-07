package backWeb.a01_servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class A08_AjaxContoller01
 */
@WebServlet(name = "prodCalc.do", urlPatterns = { "/prodCalc.do" })
public class A08_AjaxContoller01 extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public A08_AjaxContoller01() {
        super();
    }

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 1. 요청값
		String price = request.getParameter("price");
		
		if(price == null) price = "0";
		// 2. 모델데이터
		
		// 3. 화면호출(jsp/json출력)
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/plain;utf-8");
		response.getWriter().print("hello world\n데이터출력: "+price);
	}

}
