<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<h2> =========== Web.xml 세션 정보 출력 ========== </h2>

세션 유지기간 설정 정보 : <%= session.getMaxInactiveInterval() / 60 %> 분

<p><p>

<h2> =========== 세션 설정 정보 변경 ========== </h2>
<%
	
	session.setMaxInactiveInterval(60 * 60);		// 1시간으로 설정
	
	int time = session.getMaxInactiveInterval() / 60 ; 	//분
	
	out.println("세션 유효 시간 " + time + "분");

%>
</body>
</html>