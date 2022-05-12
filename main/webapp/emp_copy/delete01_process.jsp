<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%@ page import = "java.sql.*" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Delete Process</title>
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

	Statement stmt = null;
	ResultSet rs = null;
	String sql = null;
	
	try {
		sql = "SELECT eno FROM emp_copy where eno = '" + eno + "'";
		stmt = conn2.createStatement();
		rs = stmt.executeQuery(sql);
		
		if(rs.next()){
			String rEno = rs.getString("eno");
			
			if(eno.equals(rEno)){
				sql = "delete emp_copy where eno = '" + eno + "'";
				stmt.executeUpdate(sql);
				
				out.println("테이블에서 해당 사원번호 : " + eno + "가 잘 삭제 되었습니다. ");
			}else {
				out.println("해당 사원번호는 존재하지 않습니다.");
			}
		}else{
			out.println("해당 사원번호는 존재하지 않습니다.");
		}
	}catch(Exception ex){
		out.println(ex.getMessage());
	}finally{
		if(rs != null)
			rs.close();
		if(stmt != null)
			stmt.close();
		if(conn2 != null)
			conn2.close();
	}

%>
</body>
</html>