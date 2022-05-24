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
		// Get 방식 요청 처리
		// List.jsp (view 페이지) 에서 글쓰기를 클릭했을 때 글쓰기 뷰 페이지(write.jsp)
		
		// 뷰페이지로 이동
		request.getRequestDispatcher("/mvcboard/Write.jsp").forward(request, response);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// Post 방식 요청 처리
		// Write.jsp 페이지에서 전송을 클릭했을 때 form에서 넘어오는 변수의 값을 처리
		
		// Form에서 파일을 전송하므로 cos.jar 라이브러리의 객체 생성 후 변수의 값을 받아야 한다.
		
		// 1. 파일 업로드 처리 ==================================
			// saveDirectory 변수에 업로드할 파일을 저장할 서버의 물리적인 경로를 저장
		
			String saveDirectory = request.getServletContext().getRealPath("/Uploads");
		
			// maxPostSize : 업로드할 최대 용량(web.xml <== 1MB)
		
			ServletContext application = getServletContext();
			int maxPostSize = Integer.parseInt(application.getInitParameter("maxPostSize"));                                
		
			// 파일 업로드 객체 생성
			MultipartRequest mr = FileUtil.uploadFile(request, saveDirectory, maxPostSize);
			
			// 객체 생성 실패시 처리할 내용
			if (mr == null) {	// 객체 생성 실패 (1MB 이상의 용량의 파일 전송시)
				JSFunction.alertLocation(response, "첨부 용량이 초과 되었습니다.", "../mvcboard/write.do");
			}
		
		// 2. 파일 업로드 외 처리(Form의 변수 값 처리)
	}

}
