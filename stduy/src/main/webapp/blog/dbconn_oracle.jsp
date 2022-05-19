<%@ page language="java" contentType="text/html; charset=euc-kr"
    pageEncoding="euc-kr"%>
    
<%@ page import = "java.sql.*" %>

<%

	Connection conn = null;
	String driver = "oracle.jdbc.driver.OracleDriver";
	String url = "jdbc:oracle:thin:@localhost:1521:XE";
	
	Class.forName(driver);
	conn = DriverManager.getConnection (url, "hr2", "1234");

%>