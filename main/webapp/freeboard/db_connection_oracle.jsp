<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    
<%@ page import = "java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Oracle DB Connection</title>
</head>
<body>

<%
	// ���� �ʱ�ȭ
	Connection conn = null; 	// DB�� �����ϴ� ��ü
	String driver = "oracle.jdbc.driver.OracleDriver";		// Oracle Driver�� ����
	String url = "jdbc:oracle:thin:@localhost:1521:XE";
	Boolean connect = false;		// ������ �� �Ǵ��� Ȯ���ϴ� ����
	
	try{
		Class.forName(driver);
		conn = DriverManager.getConnection(url, "hr2", "1234");
		
		connect = true;
		conn.close();
		
	}catch(Exception e){
		connect=false;
		e.printStackTrace();
	}
	
	
%>

<%
	if(connect == true){
		out.println("����Ŭ DB�� �� ����Ǿ����ϴ�.");
	}else{
		out.println("����Ŭ DB���ῡ ���� �Ͽ����ϴ�.");
	}
%>


</body>
</html>