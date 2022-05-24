package sec02.ex04;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet ("/second004")		// response.addHead 를 통한 페이지 이동
public class SecondServlet extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		resp.setContentType("text/html;charset=UTF-8");
		PrintWriter out = resp.getWriter();
		
		String name = req.getParameter("name");
		String pwd = req.getParameter("pwd");
		
		out.print("<html><body>");
		out.print("RequestDispatcher를 이용한 redirect 실습입니다.(RequestDispatcher)");
		out.print("이름 : " + name + "<br><br>");
		out.print("패스워드 : " + pwd + "<br><br>");
		out.print("</body></html>");
	}
	
}
