package backWeb.a01_servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import backWeb.a01_dao.A04_PreParedDao;
import backWeb.z01_vo.Code;

/**
 * Servlet implementation class A07_CodeDtail
 */
@WebServlet(name = "codeDtail.do", urlPatterns = { "/codeDtail.do" })
public class A07_CodeDtail extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public A07_CodeDtail() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 1. 요청 처리
		String noS = request.getParameter("no");
		int no = 0;
		if(noS != null) no = Integer.parseInt(noS);
		
		// 2. Model 처리
		A04_PreParedDao dao = new A04_PreParedDao();
		Code d = dao.getCode(no);
		
		// 3. view (json)
		Gson g = new Gson();
		response.setCharacterEncoding("utf-8");
		if(d!=null) {
			response.getWriter().print(g.toJson(d));
		}else {
			response.getWriter().print("[]");
		}
	}

}
