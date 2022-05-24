package sec03.ex02;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet ("/second0004")		// response.addHead �� ���� ������ �̵�
public class SecondServlet extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		resp.setContentType("text/html;charset=UTF-8");
		PrintWriter out = resp.getWriter();
		

		String address = (String) req.getAttribute("address");
		String email = (String) req.getAttribute("email");
		
		out.print("<html><body>");
		out.print("RequestDispatcher�� �̿��� redirect �ǽ��Դϴ�.(RequestDispatcher)<br><br>");
		out.print("�ּ� : " + address + "<br><br>");
		out.print("email : " + email + "<br><br>");
		out.print("</body></html>");
	}
	
}
