<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Logout</title>
</head>
<body>
<%
	// 방법 1 : 회원 인증 정보 속성 삭제
	session.removeAttribute("UserId");
	session.removeAttribute("UserName");
	session.removeAttribute("UserGrade");
	
	// 방법 2. : 모든 속성 한꺼번에 삭제
	session.invalidate();
	
	response.sendRedirect("LoginForm.jsp");

%>
</body>
</html>