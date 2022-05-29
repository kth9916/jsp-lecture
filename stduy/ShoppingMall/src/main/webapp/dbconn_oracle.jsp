  <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import = "java.sql.*" %>

<%

	Connection conn = null;
	String driver = "oracle.jdbc.driver.OracleDriver";
	String urll = "jdbc:oracle:thin:@localhost:1521:XE";                    
	
	Class.forName(driver);
	conn = DriverManager.getConnection (urll, "hr", "hr");

%>