<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import = "java.sql.*" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<%

	//변수 초기화
	Connection conn2 = null; 	// DB를 연결하는 객체
	String driver = "com.microsoft.sqlserver.jdbc.SQLServerDriver";		// 
	String url = "jdbc:sqlserver://localhost:1433;DatabaseName=myDB";
	

		Class.forName(driver);			// 오라클 드라이버 로드함.
		conn2 = DriverManager.getConnection(url, "sa", "1234");


%>

</body>
</html>