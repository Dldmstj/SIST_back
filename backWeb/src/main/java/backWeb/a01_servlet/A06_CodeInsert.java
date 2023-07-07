package backWeb.a01_servlet;

import java.io.IOException;
import java.io.Writer;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import backWeb.a01_dao.A04_PreParedDao;
import backWeb.z01_vo.Code;

/**
 * Servlet implementation class A06_CodeInsert
 */
public class A06_CodeInsert extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public A06_CodeInsert() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		String title = request.getParameter("title");
		String refno = request.getParameter("refno");
		String ordno = request.getParameter("ordno");
		String val = request.getParameter("val");
		System.out.println(title);
		System.out.println(refno);
		System.out.println(ordno);
		System.out.println(val);
		String prn="N";
		if(title!=null) {
			Code ins = new Code(
					0,
					title,
					val,
					Integer.parseInt(refno),
					Integer.parseInt(ordno));
			A04_PreParedDao dao = new A04_PreParedDao();
			dao.insertCode(ins);
			prn="Y";
		}
		response.getWriter().print(prn);
	}

}
