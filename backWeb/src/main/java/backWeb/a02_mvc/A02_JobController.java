package backWeb.a02_mvc;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import backWeb.a01_dao.A04_PreParedDao;

/**
 * Servlet implementation class A02_JobController
 */
@WebServlet(name = "jobList.do", urlPatterns = { "/jobList.do" })
public class A02_JobController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public A02_JobController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 1. 요청값 처리
		request.setCharacterEncoding("utf-8");
		String title = request.getParameter("title");
		if(title == null) title = "";
		String minSal = request.getParameter("minSal");
		if(minSal == null) minSal = "0";
		String maxSal = request.getParameter("maxSal");
		if(maxSal == null) maxSal = "99999";
		
		Map<String, String> sch = new HashMap<String, String>();
		sch.put("title", title);
		sch.put("minSal", minSal);
		sch.put("maxSal", maxSal);
		
		// 2. 모델 데이터
		A04_PreParedDao dao = new A04_PreParedDao();
		request.setAttribute("jobList", dao.getJobsList(sch));
			
		// 3. view단(jsp) 호출
		String page = "a11_jobListSch.jsp";
		RequestDispatcher rd = request.getRequestDispatcher(page);
		rd.forward(request, response);
	}
}
