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

	int eno = Integer.parseInt(request.getParameter("eno"));
	String ename = request.getParameter("ename");
	String job = request.getParameter("job");
	int manager = Integer.parseInt(request.getParameter("manager"));
	String hiredate = request.getParameter("hiredate");
	int salary = Integer.parseInt(request.getParameter("salary"));
	int commission = Integer.parseInt(request.getParameter("commission"));
	int dno = Integer.parseInt(request.getParameter("dno"));

	PreparedStatement pstmt2 = null;
	ResultSet rs = null;
	String sql = null;
	
	try {
		sql = "SELECT eno FROM emp_copy where eno = ?";
		pstmt2 = conn2.prepareStatement(sql);
		pstmt2.setInt(1, eno);
		rs = pstmt2.executeQuery();
		
		if(rs.next()){
			int rEno = rs.getInt("eno");
			
			if(eno == rEno){
				sql = "update emp_copy set eno = ?, ename = ?, job = ?, manager = ?, hiredate = ?, salary = ?, commission = ?, dno = ? where eno = ?";
				pstmt2 = conn2.prepareStatement(sql);
				pstmt2.setInt(1, eno);
				pstmt2.setString(2, ename);
				pstmt2.setString(3, job);
				pstmt2.setInt(4, manager);
				pstmt2.setString(5, hiredate);
				pstmt2.setInt(6, salary);
				pstmt2.setInt(7, commission);
				pstmt2.setInt(8, dno);
				pstmt2.setInt(9, eno);
				pstmt2.executeUpdate();
				out.println("테이블의 내용이 잘 수정되었습니다.");
			}else {
				out.println("사원번호가 일치 하지 않습니다.");
			}	
		} else{
			out.println(eno + "해당 ENO가 데이타베이스에 존재하지 않습니다.");
		}
	}catch(Exception ex){
		out.println(ex.getMessage());
	}finally{
		if(rs != null)
			rs.close();
		if(pstmt2 != null)
			pstmt2.close();
		if(conn2 != null)
			conn2.close();
	}

%>

</body>
</html>