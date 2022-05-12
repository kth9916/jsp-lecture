<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import = "java.sql.*" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Update Process</title>
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
		sql = "SELECT eno, ename FROM emp_copy where eno = '" + eno + "'";
		stmt = conn2.createStatement();
		
		rs = stmt.executeQuery(sql);
		
		if(rs.next()){
			String rEno = rs.getString("eno");
			String rEname = rs.getString("ename");
			
			if(eno.equals(rEno) && ename.equals(rEname)){
				sql = "update emp_copy set job = '" + job + "', manager = '" + manager + "', hiredate = '" + hiredate + "', salary = '" + salary + "', commission = '" + "', dno = '" + dno + "' where eno = '" + eno + "'and ename = '" + ename + "'";
				stmt.execute(sql);
				out.println("테이블의 내용이 잘 수정되었습니다.");
			}else {
				out.println("패스워드가 일치 하지 않습니다.");
			}	
		} else{
			out.println(eno + "해당 ENO가 데이타베이스에 존재하지 않습니다.");
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