<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import = "java.sql.*" %>    

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>폼에서 넘겨 받은 값을 DB에 저장하는 파일</title>
</head>
<body>

<%@ include file = "dbconn_oracle.jsp" %>

<%

	request.setCharacterEncoding("EUC-KR");

	String eno = request.getParameter("eno");
	String ename = request.getParameter("ename");
	String job = request.getParameter("job");
	String manager = request.getParameter("manager");
	String hiredate = request.getParameter("hiredate");
	String salary = request.getParameter("salary");
	String commission = request.getParameter("commission");
	String dno = request.getParameter("dno");
	
	Statement stmt2 = null;
	
	try{String sql2 =
			String.format("insert into emp_copy(eno,ename,job,manager,hiredate,salary,commission,dno) values('%s','%s','%s','%s','%s','%s','%s','%s')", eno,ename,job,manager,hiredate,salary,commission,dno);
		stmt2 = conn2.createStatement();
		stmt2.executeUpdate(sql2);
	}catch(SQLException ex1){
		out.println ("emp_copy 테이블 삽입을 실패 했습니다. ");
		out.println(ex1.getMessage());
		
	}finally {
		if(stmt2 != null)
			stmt2.close();
		if(conn2 != null)
			conn2.close();
	}	
	
%>

<%= eno %><p>
<%= ename %><p>
<%= job %> <p>
<%= manager %><p>
<%= hiredate %><p>
<%= salary %><p>
<%= commission %><p>
<%= dno %>

</body>
</html>