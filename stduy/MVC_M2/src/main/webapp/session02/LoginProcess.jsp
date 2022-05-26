<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import = "membership.MemberDTO" %>
<%@ page import = "membership.MemberDAO" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	//form에서 넘겨주는 변수의 값 받기
	String userId = request.getParameter("user_id");
	String userPwd = request.getParameter("user_pw");
	
	// DAO 객체 호출 회원정보에 대한 값을 DTO로 넘겨 받는다.
	MemberDAO dao = new MemberDAO();
	MemberDTO dto = dao.getMemberDTO(userId, userPwd);
	dao.close();
	
	if(dto.getName() == null || dto.equals("")){
		out.println("로그인 실패");
		request.setAttribute("LoginErrMsg", "로그인 오류 입니다");
		request.getRequestDispatcher("LoginForm.jsp").forward(request, response);
		// 이건 반드시 getRequestDispatcher로 보내야 함. 로그인이 실패되는 모든 사용자에게 전달되어야 하기 때문에 사용자가 특정되어 있지 않다.
		// request.~은 사용자 전체에게
		
	}else{
		out.println("로그인 성공");
		session.setAttribute("UserId", dto.getId());
		session.setAttribute("UserName", dto.getName());
		response.sendRedirect("LoginForm.jsp");
		// 로그인이 성공한 그 사용자만 전달하면 되기 때문에 sendredierect도 괜찮다.
		// session.~은 그 사용자에게만
	}




%>

</body>
</html>