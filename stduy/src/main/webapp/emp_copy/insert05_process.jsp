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

	request.setCharacterEncoding("UTF-8");

	String eno = request.getParameter("eno");
	String ename = request.getParameter("ename");
	String job = request.getParameter("job");
	String manager = request.getParameter("manager");
	String hiredate = request.getParameter("hiredate");
	String salary = request.getParameter("salary");
	String commission = request.getParameter("commission");
	String dno = request.getParameter("dno");
	
	PreparedStatement pstmt2 = null;
	String sql = null;
	
	try{
		sql = "insert into emp_copy(eno,ename,job,manager,hiredate,salary,commission,dno) values(?,?,?,?,?,?,?,?)";
		pstmt2 = conn2.prepareStatement(sql);
		pstmt2.setString(1, eno);
		pstmt2.setString(2, ename);
		pstmt2.setString(3, job);
		pstmt2.setString(4, manager);
		pstmt2.setString(5, hiredate);
		pstmt2.setString(6, salary);
		pstmt2.setString(7, commission);
		pstmt2.setString(8, dno);
		pstmt2.executeUpdate();
		
		out.println("테이블 삽입에 성공했습니다.");
		out.println("<P><P>");
		
	}catch(Exception ex){
		out.println ("emp_copy 테이블 삽입을 실패 했습니다. ");
		out.println(ex.getMessage());
		out.println("<br><p>");
	}finally {
		if(pstmt2 != null)
			pstmt2.close();
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