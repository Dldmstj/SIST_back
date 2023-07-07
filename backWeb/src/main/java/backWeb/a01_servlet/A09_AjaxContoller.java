package backWeb.a01_servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import backWeb.z01_vo.Product;

/**
 * Servlet implementation class A09_AjaxContoller
 */
@WebServlet(name = "product.do", urlPatterns = { "/product.do" })
public class A09_AjaxContoller extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public A09_AjaxContoller() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			request.setCharacterEncoding("utf-8");
			String pname = request.getParameter("pname");
			if(pname == null) pname = "물건이 없습니다.";
			String priceS = request.getParameter("price");
			int price = 0;
			if(priceS != null) price = Integer.parseInt(priceS);
			int cnt = 0;
			String cntS = request.getParameter("cnt");
			if(cntS != null) cnt = Integer.parseInt(cntS);
			
			response.setCharacterEncoding("utf-8");
			response.setContentType("text/plain;utf-8");
			Product p = new Product(pname, price, cnt);
			Gson g = new Gson();
			response.getWriter().print(g.toJson(p));
	}

}
