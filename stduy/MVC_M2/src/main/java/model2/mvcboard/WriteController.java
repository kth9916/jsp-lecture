package model2.mvcboard;

import java.io.IOException;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;

import fileupload.FileUtil;
import utils.JSFunction;


@WebServlet("/mvcboard/write.do")
public class WriteController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// Get ��� ��û ó��
		// List.jsp (view ������) ���� �۾��⸦ Ŭ������ �� �۾��� �� ������(write.jsp)
		
		// ���������� �̵�
		request.getRequestDispatcher("/mvcboard/Write.jsp").forward(request, response);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// Post ��� ��û ó��
		// Write.jsp ���������� ������ Ŭ������ �� form���� �Ѿ���� ������ ���� ó��
		
		// Form���� ������ �����ϹǷ� cos.jar ���̺귯���� ��ü ���� �� ������ ���� �޾ƾ� �Ѵ�.
		
		// 1. ���� ���ε� ó�� ==================================
			// saveDirectory ������ ���ε��� ������ ������ ������ �������� ��θ� ����
		
			String saveDirectory = request.getServletContext().getRealPath("/Uploads");
		
			// maxPostSize : ���ε��� �ִ� �뷮(web.xml <== 1MB)
		
			ServletContext application = getServletContext();
			int maxPostSize = Integer.parseInt(application.getInitParameter("maxPostSize"));                                
		
			// ���� ���ε� ��ü ����
			MultipartRequest mr = FileUtil.uploadFile(request, saveDirectory, maxPostSize);
			
			// ��ü ���� ���н� ó���� ����
			if (mr == null) {	// ��ü ���� ���� (1MB �̻��� �뷮�� ���� ���۽�)
				JSFunction.alertLocation(response, "÷�� �뷮�� �ʰ� �Ǿ����ϴ�.", "../mvcboard/write.do");
			}
		
		// 2. ���� ���ε� �� ó��(Form�� ���� �� ó��)
	}

}
