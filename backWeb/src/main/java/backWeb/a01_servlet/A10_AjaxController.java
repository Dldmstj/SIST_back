package backWeb.a01_servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import backWeb.z01_vo.Music;

/**
 * Servlet implementation class A09_AjaxController
 */
@WebServlet(name = "music.do", urlPatterns = { "/music.do" })
public class A10_AjaxController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public A10_AjaxController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		String mname = request.getParameter("mname");
		if(mname == null) mname ="";
		String singer = request.getParameter("singer");
		if(singer == null) singer ="";
		int pubyear = 0;
		String pubyearS = request.getParameter("pubyear");
		if(pubyearS != null) pubyear = Integer.parseInt(pubyearS);
		
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/plain;utf-8");
		Music m = new Music(mname, singer, pubyear);
		Gson g = new Gson();
		response.getWriter().print(g.toJson(m));
	}

}
