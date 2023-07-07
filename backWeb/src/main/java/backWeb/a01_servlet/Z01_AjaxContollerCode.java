package backWeb.a01_servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import backWeb.a01_dao.A04_PreParedDao;
import backWeb.z01_vo.Job;

/**
 * Servlet implementation class Z01_AjaxContollerCode
 */
@WebServlet(name = "codeDel.do", urlPatterns = { "/codeDel.do" })
public class Z01_AjaxContollerCode extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Z01_AjaxContollerCode() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		// 1. 요청
		String noS = request.getParameter("noS");
		int no = 0;
		if(noS!=null) no = Integer.getInteger(noS);
				
		// 2. 모델 Dept
		A04_PreParedDao dao = new A04_PreParedDao();
		dao.deleteCode(no);
		
		// 3. json 뷰호출
		Gson g = new Gson();
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/plain;utf-8");
	}
}
